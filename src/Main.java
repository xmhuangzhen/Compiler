import AST.RootNode;
import Backend.*;
import Frontend.ASTBuilder;
import Frontend.SemanticChecker;
import IR.IRModule;
import Optimize.*;
import Parser.MxStarLexer;
import Parser.MxStarParser;
import Util.MxStarErrorListener;
import Util.error.error;
import Util.globalScope;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


public class Main {
    public static void main(String[] args) throws Exception {
//        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        //      System.out.println("start building: " + dtf.format(LocalDateTime.now()));

        InputStream input = null;
       //     if(args.length != 0)
     //   input = new FileInputStream("test.mx");
        //  else
              input = System.in;

        try {
            RootNode ASTRoot;

            globalScope gScope = new globalScope(null);

            MxStarLexer lexer = new MxStarLexer(CharStreams.fromStream(input));
            lexer.removeErrorListeners();
            lexer.addErrorListener(new MxStarErrorListener());
            MxStarParser parser = new MxStarParser(new CommonTokenStream(lexer));
            parser.removeErrorListeners();
            parser.addErrorListener(new MxStarErrorListener());
            ParseTree parseTreeRoot = parser.program();
            ASTBuilder astBuilder = new ASTBuilder(gScope);
            ASTRoot = (RootNode) astBuilder.visit(parseTreeRoot);
            SemanticChecker semanticCheck = new SemanticChecker();
            semanticCheck.visit(ASTRoot);

            if (args.length == 0) return;

            IRBuilder tmpIRBuilder = new IRBuilder(semanticCheck.gScope);
            tmpIRBuilder.visit(ASTRoot);
            //     new IRPrinter("output.ll").run(tmpIRBuilder.currentModule);

            //--------Opt Start------
            //(1) Construct SSA (CFG -> Dominator Tree -> Dominance Frontier -> SSA)
            CFGConstructor tmpCFGConstructor = new CFGConstructor(tmpIRBuilder.currentModule);
            tmpCFGConstructor.run();
            IRModule currentModule = tmpCFGConstructor.curIRModule;
            CFGSimplification tmpCFGSimp = new CFGSimplification(currentModule);
            tmpCFGSimp.run();

            DominatorTreeConstructor tmpDominatorTreeConstructor =
                    new DominatorTreeConstructor(currentModule);
            tmpDominatorTreeConstructor.run();
           DominanceFrontierConstructor tmpDominanceFrontierConstructor =
                    new DominanceFrontierConstructor(tmpDominatorTreeConstructor.curIRModule);
            tmpDominanceFrontierConstructor.run();

            currentModule = tmpDominanceFrontierConstructor.curIRModule;

            SSAConstructor tmpSSAConstructor =
                    new SSAConstructor(currentModule);
            tmpSSAConstructor.run();

            currentModule = tmpSSAConstructor.curIRModule;
//            new IRPrinter("output.ll").run(currentModule);


        //    System.out.println("1");
            int cnt = 12;
            while (true) {
                cnt--;
                if(cnt == 0) break;
            //    System.out.println("10");
                boolean modified = false;
                tmpCFGSimp = new CFGSimplification(currentModule);
                modified |= tmpCFGSimp.run();
            //    System.out.println(11);
                SparseConditionalConstantPropagation tmpSCCP =
                        new SparseConditionalConstantPropagation(currentModule);
                modified |= tmpSCCP.run();
                tmpCFGSimp = new CFGSimplification(currentModule);
                modified |= tmpCFGSimp.run();

                AggressiveDeadCodeElimination tmpADCE =
                        new AggressiveDeadCodeElimination(currentModule);
                modified |= tmpADCE.run();
                tmpCFGSimp = new CFGSimplification(currentModule);
                modified |= tmpCFGSimp.run();

                InlineExpander tmpInline = new InlineExpander(currentModule);
                modified |= tmpInline.run();
                if (!modified) break;
            }
       //     System.out.println("2");
            new IRPrinter("output.ll").run(currentModule);


            //(n) Destruct SSA
            SSADestructor tmpSSADestructor =
                    new SSADestructor(currentModule);
            tmpSSADestructor.run();
            //--------Opt End------
//            new IRPrinter("output.ll").run(currentModule);



            InstSelector instSelector = new InstSelector(tmpIRBuilder.currentModule);
            instSelector.visit(instSelector.curIRModule);

            //Register Allocate
            //  NaiveRegAllocator regAlloc = new NaiveRegAllocator(instSelector.curRISCVModule);
            //regAlloc.run();
   //         PrintStream printStream1 = new PrintStream("output.ll");
     //       ASMPrinter asmPrinter1 = new ASMPrinter(instSelector.curRISCVModule,printStream1);
       //     asmPrinter1.run();


            GraphColoringRegAllocator regAlloc =
                    new GraphColoringRegAllocator(instSelector.curRISCVModule);
            regAlloc.run();


            // ASM Print
//            PrintStream printStream = System.out;
            PrintStream printStream = new PrintStream("output.s");
            ASMPrinter asmPrinter = new ASMPrinter(regAlloc.curRISCVModule, printStream);
            asmPrinter.run();


        } catch (error er) {
            System.err.println(er.toString());
            throw new RuntimeException();
        }

        //   System.out.println("Finish building: " + dtf.format(LocalDateTime.now()));
    }
}