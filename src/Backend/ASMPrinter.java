package Backend;

import RISCV.Inst.RISCVInstruction;
import RISCV.Inst.RISCVJumpInst;
import RISCV.Operand.RISCVGlobalReg;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVFunction;
import RISCV.RISCVModule;

import java.io.PrintStream;

public class ASMPrinter {

    public RISCVModule curRISCVModule;
    public PrintStream ASMPrintStream;
    public int curNum;

    public ASMPrinter(RISCVModule tmpModule, PrintStream tmpPrintStream) {
        curRISCVModule = tmpModule;
        ASMPrintStream = tmpPrintStream;
    }

    public void run() {
        ASMPrintStream.println("\t.text");
        for (var tmpFunc : curRISCVModule.RISCVFuncMap.values())
            if (!tmpFunc.IsBuiltIn)
                runRISCVFunction(tmpFunc);

        ASMPrintStream.println(".section	.sdata,\"aw\",@progbits");
        for (var tmpGlobalVar : curRISCVModule.GlobalRegMap.values())
            runGlobalVar(tmpGlobalVar);
    }

    public void runRISCVFunction(RISCVFunction thisFunc) {
        ASMPrintStream.println("\t.globl\t" + thisFunc.FunctionName+"\t\t\t\t\t# start function : "+thisFunc.FunctionName);
        ASMPrintStream.println("\t.p2align\t2");
        ASMPrintStream.println(thisFunc.FunctionName + ":");
//        thisFunc.getDFSOrder();

//        for(curNum = 0; curNum < thisFunc.DFSOrder.size();++curNum)
  //          runRISCVBasicBlock(thisFunc.DFSOrder.get(curNum),thisFunc);
        for(RISCVBasicBlock tmpBlock = thisFunc.EntranceBlock; tmpBlock != null; tmpBlock = tmpBlock.nextBlock)
            runRISCVBasicBlock(tmpBlock,thisFunc);
        ASMPrintStream.println("# end function : "+thisFunc.FunctionName);
    }

    public void runRISCVBasicBlock(RISCVBasicBlock thisBasicBlock, RISCVFunction thisFunc) {
        if(thisBasicBlock.HeadInst != null) {
            if(thisFunc.EntranceBlock == thisBasicBlock) ASMPrintStream.print("#");
            ASMPrintStream.println(thisBasicBlock.BlockName + ":");
            for (RISCVInstruction tmpInst = thisBasicBlock.HeadInst; tmpInst != null; tmpInst = tmpInst.nextInst) {
                if(tmpInst instanceof RISCVJumpInst){
//                    if(curNum < thisFunc.DFSOrder.size()-1 &&
  //                          ((RISCVJumpInst) tmpInst).JumpToBlock == thisFunc.DFSOrder.get(curNum+1)) break;
                    if(((RISCVJumpInst) tmpInst).JumpToBlock == thisBasicBlock.nextBlock) break;
                }
                ASMPrintStream.println("\t" + tmpInst.toString());
            }
        } //else{
            //ASMPrintStream.println("HERE--NO--"+thisBasicBlock.BlockName);
        //}
    }

    public void runGlobalVar(RISCVGlobalReg thisGlobalReg) {
//        ASMPrintStream.println("\t.globl\t" + thisGlobalReg.RegisterName);
        if (thisGlobalReg.isInt) ASMPrintStream.println("\t.p2align\t2");

        ASMPrintStream.println(thisGlobalReg.RegisterName + ":");
        if (thisGlobalReg.isBool) {
            ASMPrintStream.println("\t.byte\t" + thisGlobalReg.ValBool);
        } else if (thisGlobalReg.isInt) {
            ASMPrintStream.println("\t.word\t" + thisGlobalReg.ValInt);
        } else if (thisGlobalReg.isString) {
            String resString = thisGlobalReg.ValString;
            resString = resString.replace("\\", "\\\\");
            resString = resString.replace("\n", "\\n");
            resString = resString.replace("\"", "\\\"");
            ASMPrintStream.println("\t.asciz\t\"" + resString + "\"");
        } else throw new RuntimeException();
        ASMPrintStream.println("");
    }
}
