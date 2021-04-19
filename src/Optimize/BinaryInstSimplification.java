package Optimize;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.IRInstruction;
import IR.Instruction.binaryOpInstruction;
import IR.Operand.IntegerConstant;
import IR.Operand.Register;
import IR.TypeSystem.IntegerType;

public class BinaryInstSimplification extends Pass {

    public IRFunction curFunc;

    public BinaryInstSimplification(IRModule tmpModule) {
        super(tmpModule);
    }

    @Override
    public boolean run() {
        boolean modified = false;
        for (var tmpFunc : curIRModule.IRFunctionTable.values())
            if (!tmpFunc.IsBuiltIn) {
                curFunc = tmpFunc;
              //  System.out.println("-------"+curFunc.thisFunctionName+"--------");
                modified |= BinaryInstSimpInFunc();
            }
        return modified;
    }

    public boolean BinaryInstSimpInFunc() {
        boolean modified = false;
//        System.out.println(curFunc.thisFunctionName);
        for (IRBasicBlock tmpBlock = curFunc.thisEntranceBlock;
             tmpBlock != null; tmpBlock = tmpBlock.nextBasicBlocks) {
            for (IRInstruction tmpInst = tmpBlock.HeadInst;
                 tmpInst != null; tmpInst = tmpInst.nextIRInstruction) {
                if (tmpInst instanceof binaryOpInstruction) {
                    int Type = CanPropagate((binaryOpInstruction) tmpInst);
                    if (Type != 0) {
                        Register src11;
                        long src12;
                        if (Type == 1) {// Register binaryop constint
                            src11 = (Register) ((binaryOpInstruction) tmpInst).BinaryOp1;
                            src12 = ((IntegerConstant) ((binaryOpInstruction) tmpInst).BinaryOp2).value;
                        } else {
                            src11 = (Register) ((binaryOpInstruction) tmpInst).BinaryOp2;
                            src12 = ((IntegerConstant) ((binaryOpInstruction) tmpInst).BinaryOp1).value;
                        }
                   //     System.out.println(tmpInst);
                     //   System.out.println(src11.use);
                       // System.out.println(src11.Defs);

                        if (src11.use.size() == 1 && src11.Defs.size() == 1 &&
                                src11.Defs.iterator().next() instanceof binaryOpInstruction) {
                          //  System.out.println("1");
                            binaryOpInstruction tmpInst2 = (binaryOpInstruction) src11.Defs.iterator().next();
                            int Type2 = CanPropagate(tmpInst2);
                            if (Type2 != 0) {
                                Register src21;
                                long src22;
                                if (Type2 == 1) {
                                    src21 = (Register) tmpInst2.BinaryOp1;
                                    src22 = ((IntegerConstant) tmpInst2.BinaryOp2).value;
                                } else {
                                    src21 = (Register) tmpInst2.BinaryOp2;
                                    src22 = ((IntegerConstant) tmpInst2.BinaryOp1).value;
                                }

                                boolean canComb = false;
                                long src3 = 0;
                                binaryOpInstruction.BinaryOperandENUM op1 =
                                        ((binaryOpInstruction) tmpInst).BinaryOperandType;
                                binaryOpInstruction.BinaryOperandENUM op2 = tmpInst2.BinaryOperandType;
                                if(op1 == binaryOpInstruction.BinaryOperandENUM.add){
                                    if(op2 == binaryOpInstruction.BinaryOperandENUM.add){
                                        src3 = src12 + src22;
                                        canComb = true;
                                    } else if(op2 == binaryOpInstruction.BinaryOperandENUM.sub){
                                        src3 = src12-src22;
                                        canComb = true;
                                    }
                                } else if(op1 == binaryOpInstruction.BinaryOperandENUM.sub){
                                    if(op2 == binaryOpInstruction.BinaryOperandENUM.add){
                                        src3 = src12 - src22;
                                        canComb = true;
                                    } else if(op2 == binaryOpInstruction.BinaryOperandENUM.sub) {
                                        src3 =src12 + src22;
                                        canComb = true;
                                    }
                                } else if(op1 == binaryOpInstruction.BinaryOperandENUM.mul){
                                    if(op2 == binaryOpInstruction.BinaryOperandENUM.mul){
                                        src3 = src12*src22;
                                        canComb = true;
                                    }
                                }

                                if(canComb){//-> src21 op1 src3
                                    ((binaryOpInstruction) tmpInst).replaceBinaryInst(src21,
                                            new IntegerConstant(IntegerType.IRBitWidth.i32,src3));
                                    tmpInst2.removeInst();
                                    modified = true;
                                }
                            }
                        }

                    }
                }
            }
        }
        return modified;
    }

    public int CanPropagate(binaryOpInstruction curInst) {
        if (curInst.BinaryOp2 instanceof IntegerConstant &&
                curInst.BinaryOp1 instanceof Register) return 1;
        if (curInst.BinaryOp1 instanceof IntegerConstant &&
                curInst.BinaryOp2 instanceof Register) return 2;
        return 0;
    }
}