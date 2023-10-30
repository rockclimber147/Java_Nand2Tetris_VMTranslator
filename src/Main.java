import java.io.*;

public class Main {
    /** Uses VMReader to read an input *.vm file line by line and passes the valid vm code to
     * the AssemblyWriter, which translates the code to Hack Assembly Language and writes it to an *.asm file.
     *
     */
    public static void main(String[] args) throws IOException {

        File[] filesList;
        File toTranslate = new File(args[0]); //Set up file
        if (!toTranslate.exists()){
            throw new FileNotFoundException("File not found");
        }

        if (toTranslate.isDirectory()){
            // If it's a directory, translate all *.vm files within
            FileFilter validVMFiles = (file) -> (file.getName().endsWith(".vm"));
            filesList = toTranslate.listFiles(validVMFiles);
        } else {
            // If it's just a single *.vm file
            filesList = new File[]{toTranslate};
        }

        CodeWriter assemblyCodeWriter = new CodeWriter(args[0].replace(".vm", ""));

        if (filesList == null){
            throw new NullPointerException("No files were found");
        }

        assemblyCodeWriter.writeInit(); // Start by writing bootstrap code

        for (File f:filesList) {
            // For each file in the file list, make a new parser
            VMParser vmCodeParser = new VMParser(f);
            vmCodeParser.advance();

            // Parse each file and translate
            while (vmCodeParser.hasMoreLines()) {

                boolean currentLineIsACommand = false;

                // Write each line as a comment, break loop when a command is found.
                while (!currentLineIsACommand) {
                    String currentLine = vmCodeParser.getCurrentLine();
                    assemblyCodeWriter.writeAsComment(currentLine);
                    if (vmCodeParser.isValidCommand(currentLine)){
                        currentLineIsACommand = true;
                    } else {
                        vmCodeParser.advance();
                    }
                }

//                vmCodeParser.advance();
//                assemblyCodeWriter.writeAsComment(vmCodeParser.getCurrentLine());

                // Handle writing commands
                VMParser.command currentCommand = vmCodeParser.commandType();
                if (currentCommand == VMParser.command.C_PUSH) {
                    assemblyCodeWriter.writePushPop("push", vmCodeParser.arg1(), vmCodeParser.arg2());
                } else if (currentCommand == VMParser.command.C_POP) {
                    assemblyCodeWriter.writePushPop("pop", vmCodeParser.arg1(), vmCodeParser.arg2());
                } else if (currentCommand == VMParser.command.C_LABEL) {
                    assemblyCodeWriter.writeLabel(vmCodeParser.arg1());
                } else if (currentCommand == VMParser.command.C_GOTO) {
                    assemblyCodeWriter.writeGoTo(vmCodeParser.arg1());
                } else if (currentCommand == VMParser.command.C_IF_GOTO) {
                    assemblyCodeWriter.writeIf(vmCodeParser.arg1());
                } else if (currentCommand == VMParser.command.C_FUNCTION) {
                    assemblyCodeWriter.writeFunction(vmCodeParser.arg1(), vmCodeParser.arg2());
                }else if (currentCommand == VMParser.command.C_CALL) {
                    assemblyCodeWriter.writeCall(vmCodeParser.arg1(), vmCodeParser.arg2());
                }else if (currentCommand == VMParser.command.C_RETURN) {
                    assemblyCodeWriter.writeReturn();
                }else {
                    assemblyCodeWriter.writeArithmetic(vmCodeParser.arg1());
                }
                // Advance when command is written
                vmCodeParser.advance();
            }
            //At the end of the file write some blank space
            assemblyCodeWriter.writeBlankSpace();
        }

        assemblyCodeWriter.close();
        System.out.println("DONE");
    }
}
