import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;

public class CodeWriter {

    private final FileWriter codeWriter;
    private int jumpTarget;
    private int returnTarget;
    private final HashMap<String, String> arithmeticNegNotOperators;
    private final HashMap<String, String> arithmeticAddSubAndOrOperators;
    private final HashMap<String, String> arithmeticEqGtLtOperators;
    private final HashMap<String, Integer> segmentPointerAddresses;

    public CodeWriter(String fileName) throws IOException {
        // Create file for writing
        codeWriter = new FileWriter(fileName + ".asm");
        // Reset jump targets
        jumpTarget = 0;
        returnTarget = 0;
        // Associate segments with pointer addresses
        segmentPointerAddresses = new HashMap<>();
        segmentPointerAddresses.put("local", 1);
        segmentPointerAddresses.put("argument", 2);
        segmentPointerAddresses.put("this", 3);
        segmentPointerAddresses.put("that", 4);
        // Associate unary stack operations with symbols
        arithmeticNegNotOperators = new HashMap<>();
        arithmeticNegNotOperators.put("neg", "-");
        arithmeticNegNotOperators.put("not", "!");
        // associate binary stack operations with symbols
        arithmeticAddSubAndOrOperators = new HashMap<>();
        arithmeticAddSubAndOrOperators.put("add", "+");
        arithmeticAddSubAndOrOperators.put("sub", "-");
        arithmeticAddSubAndOrOperators.put("and", "&");
        arithmeticAddSubAndOrOperators.put("or", "|");
        // associate binary stack operations with jump designations
        arithmeticEqGtLtOperators = new HashMap<>();
        arithmeticEqGtLtOperators.put("eq", "JEQ");
        arithmeticEqGtLtOperators.put("gt", "JGT");
        arithmeticEqGtLtOperators.put("lt", "JLT");
    }

    public void writeInit() throws IOException {
        String initString = """
                @256
                D=A
                @0
                M=D
                @1
                MD=-1
                @2
                MD=D-1
                @3
                MD=D-1
                @4
                MD=D-1
                """;
        codeWriter.write(initString);
        this.writeCall("Sys.init",0);
    }

    public void writeAsComment(String command) throws IOException {
        codeWriter.write("      // " + command + "\n");
    }

    public void writePushPop(String command, String arg1, int arg2) throws IOException {
        if (arg1 == null){
            throw new NullPointerException("null argument");
        }

        if (command.equals("push")){                // set command as appropriate
            String startPushCommand = "";

            // Store generic push ending, adding the value to and incrementing the Stack
            String finishPushCommand = """
                    @0
                    A=M
                    M=D
                    @0
                    M=M+1
                    """;
            if (segmentPointerAddresses.containsKey(arg1)){ // If the address is a dynamic memory segment
                startPushCommand =
                                "@" + arg2 + "\n" +
                                "D=A\n" +
                                "@" + segmentPointerAddresses.get(arg1) + "\n" +
                                "A=M\n" +
                                "A=A+D\n" +
                                "D=M\n";
            } else if (arg1.equals("temp")){
                startPushCommand =
                                "@" + arg2 + "\n" +
                                "D=A\n" +
                                "@5\n" +
                                "A=A+D\n" +
                                "D=M\n";

            } else if (arg1.equals("constant")){
                startPushCommand =
                                "@" + arg2 + "\n" +
                                "D=A\n";
            } else if (arg1.equals("pointer")){
                startPushCommand =
                                "@" + (arg2 + 3) + "\n" +
                                "D=M\n";
            } else if (arg1.equals("static")){
                startPushCommand =
                        "@" + VMParser.getCurrentFile() + "." + arg2 + "\n" + // Generate unique label for static variable
                        "D=M\n";
            }else{
                System.out.println("Invalid Push");
            }
            codeWriter.write(startPushCommand + finishPushCommand);
        } else if (command.equals("pop")) {
            String addressOrMemory;
            String addressNumber;
            if (segmentPointerAddresses.containsKey(arg1)){
                addressOrMemory = "D=D+M\n";
                addressNumber = "@" + segmentPointerAddresses.get(arg1) + "\n";
            } else if (arg1.equals("temp")){
                addressOrMemory = "D=D+A\n";
                addressNumber = "@5\n";
            } else if (arg1.equals("pointer")){
                codeWriter.write("@0\n" +
                                "AM=M-1\n" +
                                "D=M\n" +
                                "@" + (arg2 + 3) + "\n" +
                                "M=D\n");
                return;
            } else if (arg1.equals("static")){
                // Stores value on top of stack in D register and writes to static address
                codeWriter.write("@0\n" +
                        "AM=M-1\n" +
                        "D=M\n" +
                        "@" + VMParser.getCurrentFile() + "." + arg2 + "\n" +
                        "M=D\n");
                return;

            } else {
                System.out.println("invalid pop command");
                return;
            }
            String popCommand = "@" + arg2 + "\n" +
                    "D=A\n" +
                    addressNumber +
                    addressOrMemory +
                    "@R13\n" +
                    "M=D\n" +
                    "@0\n" +
                    "AM=M-1\n" +
                    "D=M\n" +
                    "@R13\n" +
                    "A=M\n" +
                    "M=D\n";
            codeWriter.write(popCommand);
        } else {
            System.out.println("PUSH/POP NOT RECOGNIZED");
        }
    }

    public void writeArithmetic(String command) throws IOException {
        if (arithmeticNegNotOperators.containsKey(command)){
            String arithmeticNegNot = """
                    @0
                    A=M-1
                    M=_M
                    """;
            codeWriter.write(arithmeticNegNot.replace("_" ,arithmeticNegNotOperators.get(command)));
        } else if (arithmeticAddSubAndOrOperators.containsKey(command)){
            String arithmeticAddSubAndOr = """
                    @0
                    AM=M-1
                    D=M
                    A=A-1
                    M=M_D
                    """;
            codeWriter.write(arithmeticAddSubAndOr.replace("_" ,arithmeticAddSubAndOrOperators.get(command)));
        } else if (arithmeticEqGtLtOperators.containsKey(command)){
            String arithmeticEqGtLt = """
                    @0
                    AM=M-1
                    D=M
                    A=A-1
                    D=M-D
                    M=-1
                    @Tn
                    D;_
                    @0
                    A=M-1
                    M=0
                    (Tn)
                    """;
            codeWriter.write(arithmeticEqGtLt.replace("_" ,arithmeticEqGtLtOperators.get(command)).replace("n", "" +jumpTarget));
            jumpTarget++;
        } else {
            System.out.println("Something went wrong");
        }
    }

    public void writeLabel(String label) throws IOException {
        codeWriter.write("(" + label + ")\n");
    }

    public void writeGoTo(String label) throws IOException {
        codeWriter.write("@" + label + "\n" +
                             "0;JMP\n");
    }

    public void writeIf(String label) throws IOException {
        String ifAssemblyCode = "" +
                "@0\n" +
                "AM=M-1\n" +
                "D=M\n" +
                "@" + label + "\n" +
                "D;JNE\n";
        codeWriter.write(ifAssemblyCode);
    }

    public void writeFunction(String functionName, int nVars) throws IOException {
        // Generate label
        codeWriter.write("(" + functionName + ")\n"); // Labels should be upper case

        // Set LCL to SP
        codeWriter.write("""
                @0
                D=M
                @1
                M=D
                """);

        // Initialize each local variable to 0 and adjust SP
        for (int i = 0; i < nVars; i++){
            // push 0
            codeWriter.write("""
                    @0
                    A=M
                    M=0
                    @0
                    M=M+1
                    """);
        }

    }

    public void writeCall (String functionName, int nArgs) throws IOException {
        String push = """
                @0
                A=M
                M=D
                @0
                M=M+1
                """;

        // push return address
        codeWriter.write("@" + functionName + "$ret." + returnTarget + "\n" + "D=A\n");
        codeWriter.write(push);

        // push registers 1-4
        for (int i = 1; i <= 4; i++){
            codeWriter.write("@" + i + "\nD=M\n");
            codeWriter.write(push);
        }

        // Set up ARG
        codeWriter.write("@0\n" +
                        "D=M\n" +
                        "@2\n" +
                        "M=D\n" +
                        "@" + (5 + nArgs) + "\n" +
                        "D=A\n" +
                        "@2\n" +
                        "M=M-D\n");

        // Set up function LCL
        codeWriter.write(("""
                @0
                D=M
                @1
                M=D
                """));

        // goto function
        codeWriter.write("@" + functionName + "\n" +
                "0;JMP\n" +
                "(" + functionName + "$ret." + returnTarget + ")" + "\n");
        returnTarget++; // Increment return target to keep return addresses unique
    }

    public void writeReturn() throws IOException {
        //Store LCL as endFrame
        codeWriter.write("""
                @1
                D=M
                @13
                M=D
                """);
        // get retAddr
        codeWriter.write("""
                @5
                D=A
                @13
                D=M-D
                A=D
                D=M
                @14
                M=D
                """);
        // pop top of Stack to ARG[0]
        codeWriter.write("""
                @0
                AM=M-1
                D=M
                @2
                A=M
                M=D
                """);
        // Set Stack pointer to ARG + 1
        codeWriter.write("""
                @2
                D=M+1
                @0
                M=D
                """);

        //Reset segments
        for (int i = 4; i >= 1; i--){
            codeWriter.write("@13\n" +
                    "M=M-1\n" +
                    "A=M\n" +
                    "D=M\n" +
                    "@" + i + "\n" +
                    "M=D\n");
            }
        // Go to return address
        codeWriter.write("""
                @14
                A=M
                0;JMP
                """);

    }

    public void writeBlankSpace() throws IOException {
        codeWriter.write("\n\n\n\n\n");
    }

    public void close() throws IOException {
        codeWriter.close();
    }
}
