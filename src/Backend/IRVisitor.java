package Backend;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;
import IR.Operand.GlobalVariables;

public interface IRVisitor {
    void visit(IRModule it);
    void visit(IRFunction it);
    void visit(IRBasicBlock it);

    void visit(retInstruction it);
    void visit(brInstruction it);
    void visit(binaryOpInstruction it);
    void visit(bitwiseBinaryInstruction it);
    void visit(allocaInstruction it);
    void visit(loadInstruction it);
    void visit(storeInstruction it);
    void visit(getElementPtrInstruction it);
    void visit(icmpInstruction it);
    void visit(phiInstruction it);
    void visit(callInstruction it);
    void visit(bitcastInstruction it);
    void visit(moveInstruction it);
}
