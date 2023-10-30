import java.io.*;
import java.util.*;

public class VMParser {
    /**
     * Parses the input *.vm file for valid commands, identifying and breaking them up into their components.
     * C_ARITHMETIC, String arg1 = [add,sub,neg,and,or,not,eq,gt,lt]
     * C_PUSH, String arg1 = [local,arg,this,that,constant,static,temp,pointer], int arg2 = [index]
     * C_POP, String arg1 = [local,arg,this,that,static,temp,pointer], int arg2 = [index]
     * C_LABEL
     * C_GOTO
     * C_IF_GOTO
     */

    public enum command{
        C_ARITHMETIC,
        C_PUSH,
        C_POP,
        C_LABEL,    //
        C_GOTO,     //
        C_IF_GOTO,  // Added in Project 8
        C_CALL,     //
        C_FUNCTION, //
        C_RETURN    //
    }
    private static String currentFile;
    private command currentCommand;
    private final Scanner parser;
    private String currentLine;
    private final String[] validCommands = {
            "push",
            "pop",
            "add",
            "sub",
            "neg",
            "and",
            "or",
            "not",
            "eq",
            "gt",
            "lt",
            "label",   //
            "goto",    //
            "if-goto", //
            "call",    //
            "function",//
            "return"   // Added in Project 8
    };
    private final int validCommandsLength = validCommands.length; // Length to use with for loop

    public VMParser(File fileName) throws FileNotFoundException {
        parser = new Scanner(fileName);
        currentFile = fileName.getName().replace(".vm","");
    }

    public static String getCurrentFile(){
        return currentFile;
    }

    public boolean hasMoreLines(){
        return parser.hasNextLine();
    } // Check for EOF

    public void advance(){

        // System.out.println("Searching for commands");

//        boolean continueSearch = true; // Set flag for when valid command is found
//        while (this.hasMoreLines() && continueSearch){
//            currentLine = parser.nextLine().trim(); // Load in next line, removing whitespace
//            if (this.isValidCommand(currentLine)){
//                continueSearch = false; // Stop searching when valid command found
//            }
//        }
        currentLine = parser.nextLine().strip();
    }

    public boolean isValidCommand(String line){
        System.out.println("\n\nValidating:" + currentLine);
        for (int i = 0; i < validCommandsLength; i++){
            if (line.startsWith(validCommands[i])){ // Check through valid command strings for a match
                System.out.println("Valid");
                return true;
            }
        }
        System.out.println("Invalid");
        return false;
    }

    public command commandType() { // Returns the enum command type
        System.out.print("Command found: ");
        if (currentLine.startsWith("push")){
            currentCommand = command.C_PUSH;
            System.out.println("Push");
            return command.C_PUSH;
        } else if (currentLine.startsWith("pop")){
            currentCommand = command.C_POP;
            System.out.println("Pop");
            return command.C_POP;
        } else if (currentLine.startsWith("label")){
            currentCommand = command.C_LABEL;
            System.out.println("label");
            return command.C_LABEL;
        } else if (currentLine.startsWith("goto")){
            currentCommand = command.C_GOTO;
            System.out.println("goto");
            return command.C_GOTO;
        } else if (currentLine.startsWith("if-goto")){
            currentCommand = command.C_IF_GOTO;
            System.out.println("if-goto");
            return command.C_IF_GOTO;
        } else if (currentLine.startsWith("function")){
            currentCommand = command.C_FUNCTION;
            System.out.println("function");
            return command.C_FUNCTION;
        } else if (currentLine.startsWith("call")){
            currentCommand = command.C_CALL;
            System.out.println("call");
            return command.C_CALL;
        } else if (currentLine.startsWith("return")){
            currentCommand = command.C_RETURN;
            System.out.println("return");
            return command.C_RETURN;
        } else {
            currentCommand = command.C_ARITHMETIC;
            System.out.println("Arithmetic");
            return command.C_ARITHMETIC;
        }
    }

    public String arg1(){
        System.out.print("arg1: ");
        String[] args = this.currentLine.split(" ");
        if (currentCommand == command.C_POP
                || currentCommand == command.C_PUSH
                || currentCommand == command.C_CALL
                || currentCommand == command.C_FUNCTION){
            System.out.println(args[1]);
            return args[1];

            // Returns the memory segment location to push/pop to

        } else if (currentCommand == command.C_ARITHMETIC){
            System.out.println(args[0]);
            return args[0];

            // Returns the operation to perform

        } else if (currentCommand == command.C_GOTO||
        currentCommand == command.C_IF_GOTO||
        currentCommand == command.C_LABEL){
            System.out.println(args[1]);
            return args[1];

            // Returns the label to create/jump to

        }
        System.out.println("Command not recognized");
        return "oops";
    }

    public int arg2(){
        System.out.print("arg2: ");
        String[] args = this.currentLine.split("[ \t]");
        System.out.println(args[2]);
        if (currentCommand == command.C_PUSH || currentCommand == command.C_POP
        || currentCommand == command.C_FUNCTION || currentCommand == command.C_CALL) {
            return Integer.parseInt(args[2]);
        } else {
            System.out.println("Command not recognized");
            return 404;
        }
    }

    public String getCurrentLine(){
        return currentLine;
    }
}


