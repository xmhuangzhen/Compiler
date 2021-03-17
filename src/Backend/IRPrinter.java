package Backend;

import IR.IRBasicBlock;
import IR.IRFunction;
import IR.IRModule;
import IR.Instruction.*;

import java.io.*;

public class IRPrinter implements IRVisitor {
    public File outputFile;
    public OutputStream outStream;
    public PrintWriter outPrintWriter;

    public IRPrinter(String FileName) throws FileNotFoundException {
        outputFile = new File(FileName);
        outStream = new FileOutputStream(FileName,false);
        outPrintWriter = new PrintWriter(outStream);
    }

    public void run(IRModule tmpIRModule) throws IOException {
        tmpIRModule.accept(this);
        outPrintWriter.close();
        outStream.close();
    }

    @Override
    public void visit(IRModule it) {
        for(var tmpClassName : it.IRClassTable.keySet())
            outPrintWriter.println(it.IRClassTable.get(tmpClassName).toString());
        outPrintWriter.println("");

        for(var tmpGlobalVarName : it.IRGlobalVarTable.keySet())
            outPrintWriter.println(it.IRGlobalVarTable.get(tmpGlobalVarName).toString());
        outPrintWriter.println("");

        for(var tmpFuncName : it.IRFunctionTable.keySet())
            outPrintWriter.println(it.IRFunctionTable.get(tmpFuncName).toString());
        outPrintWriter.println("");

        for(var tmpFuncName : it.IRFunctionTable.keySet()) {
            it.IRFunctionTable.get(tmpFuncName).accept(this);
            outPrintWriter.println("");
        }
    }

    @Override
    public void visit(IRFunction it) {
        outPrintWriter.print(it.toString());
        outPrintWriter.println("{");

        IRBasicBlock curBasicBlock = it.thisEntranceBlock;
        while(curBasicBlock != null){
            curBasicBlock.accept(this);
            outPrintWriter.println("");
            curBasicBlock = curBasicBlock.nextBasicBlocks;
        }

        outPrintWriter.println("}");
    }

    @Override
    public void visit(IRBasicBlock it) {
        outPrintWriter.println(it.BasicBlockName);

        if (it.prevBasicBlocks != null) {
            outPrintWriter.print(" ".repeat(50 - it.BasicBlockName.length() + 1));
            outPrintWriter.print("; preds = ");
            for (IRBasicBlock tmpPre = it.prevBasicBlocks; tmpPre != null; tmpPre = tmpPre.prevBasicBlocks) {
                if (tmpPre != it.prevBasicBlocks) {
                    outPrintWriter.print(", ");
                }
                outPrintWriter.print(tmpPre.toString());
            }
        }
        outPrintWriter.println("");

        for (IRInstruction curInst = it.HeadInst; curInst != null && curInst != it.TailInst;
             curInst = curInst.nextIRInstruction)
            curInst.accept(this);
    }

    @Override
    public void visit(IRInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(retInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(brInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(binaryOpInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(bitwiseBinaryInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(allocaInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(loadInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(storeInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(getElementPtrInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(icmpInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(phiInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(callInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }

    @Override
    public void visit(bitcastInstruction it) {
        outPrintWriter.println("    "+it.toString());
    }
}