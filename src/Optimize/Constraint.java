package Optimize;

import IR.Instruction.IRInstruction;
import IR.Operand.IROperand;

import java.util.ArrayList;

public class Constraint {
    public ArrayList<IROperand> ConsVar;
    public ArrayList<Integer> ConsCoeff;
    public int constant;
    //\sum {ConsCoeff*ConsVar} + constant <= 0;

    public Constraint(){
        ConsVar = new ArrayList<>();
        ConsCoeff = new ArrayList<>();
        constant = 0;
    }
}
