package Backend;

import RISCV.Inst.RISCVInstruction;
import RISCV.Operand.RISCVGlobalReg;
import RISCV.RISCVBasicBlock;
import RISCV.RISCVFunction;
import RISCV.RISCVModule;

import java.io.PrintStream;

public class ASMPrinter {

    public RISCVModule curRISCVModule;
    public PrintStream ASMPrintStream;

    public ASMPrinter(RISCVModule tmpModule, PrintStream tmpPrintStream) {
        curRISCVModule = tmpModule;
        ASMPrintStream = tmpPrintStream;
    }

    public void run() {
        ASMPrintStream.println("\t.text");
        for (var tmpFunc : curRISCVModule.RISCVFuncMap.values())
            if (!tmpFunc.IsBuiltIn)
                runRISCVFunction(tmpFunc);
        for (var tmpGlobalVar : curRISCVModule.GlobalRegMap.values())
            runGlobalVar(tmpGlobalVar);
    }

    public void runRISCVFunction(RISCVFunction thisFunc) {
        ASMPrintStream.println("\t.global\t" + thisFunc.FunctionName+"\t\t\t\t\t# start function : "+thisFunc.FunctionName);
        ASMPrintStream.println("\t.p2align\t2");
        ASMPrintStream.println(thisFunc.FunctionName + ":");
        for(RISCVBasicBlock tmpBlock = thisFunc.EntranceBlock; tmpBlock != null; tmpBlock = tmpBlock.nextBlock)
            runRISCVBasicBlock(tmpBlock);
        ASMPrintStream.println("# end function : "+thisFunc.FunctionName);
    }

    public void runRISCVBasicBlock(RISCVBasicBlock thisBasicBlock) {
        if(thisBasicBlock.HeadInst != null) {
            ASMPrintStream.println(thisBasicBlock.BlockName + ":");
            for (RISCVInstruction tmpInst = thisBasicBlock.HeadInst; tmpInst != null; tmpInst = tmpInst.nextInst) {
                ASMPrintStream.println("\t" + tmpInst.toString());
            }
        } //else{
            //ASMPrintStream.println("HERE--NO--"+thisBasicBlock.BlockName);
        //}
    }

    public void runGlobalVar(RISCVGlobalReg thisGlobalReg) {
        ASMPrintStream.println("\t.globl\t" + thisGlobalReg.RegisterName);
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
