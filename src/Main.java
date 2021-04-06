import AST.RootNode;
import Backend.*;
import Frontend.ASTBuilder;
import Frontend.SemanticChecker;
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


public class Main {
    public static void main(String[] args) throws Exception{

        InputStream input = null;
        if(args.length != 0)
            input = new FileInputStream("test.mx");
        else input = System.in;

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
            ASTRoot = (RootNode)astBuilder.visit(parseTreeRoot);
            SemanticChecker semanticCheck  = new SemanticChecker();
            semanticCheck.visit(ASTRoot);

            IRBuilder tmpIRBuilder = new IRBuilder(semanticCheck.gScope);
            tmpIRBuilder.visit(ASTRoot);
       //     new IRPrinter("output.ll").run(tmpIRBuilder.currentModule);

            //--------Opt Start------
            //(1) Construct SSA (CFG -> Dominator Tree -> Dominance Frontier -> SSA)
            CFGConstructor tmpCFGConstructor = new CFGConstructor(tmpIRBuilder.currentModule);
            tmpCFGConstructor.run();
            DominatorTreeConstructor tmpDominatorTreeConstructor =
                    new DominatorTreeConstructor(tmpCFGConstructor.curIRModule);
            tmpDominatorTreeConstructor.run();
            DominanceFrontierConstructor tmpDominanceFrontierConstructor =
                    new DominanceFrontierConstructor(tmpDominatorTreeConstructor.curIRModule);
            tmpDominanceFrontierConstructor.run();
            SSAConstructor tmpSSAConstructor =
                    new SSAConstructor(tmpDominanceFrontierConstructor.curIRModule);
            tmpSSAConstructor.run();



            //(n) Destruct SSA
            SSADestructor tmpSSADestructor =
                    new SSADestructor(tmpSSAConstructor.curIRModule);
            tmpSSADestructor.run();
            //--------Opt End------

            InstSelector instSelector = new InstSelector(tmpIRBuilder.currentModule);
            instSelector.visit(instSelector.curIRModule);

            //Register Allocate
            NaiveRegAllocator regAlloc = new NaiveRegAllocator(instSelector.curRISCVModule);
            regAlloc.run();

            // ASM Print
//            PrintStream printStream = System.out;
            PrintStream printStream = new PrintStream("output.s");
            ASMPrinter asmPrinter = new ASMPrinter(regAlloc.curRISCVModule,printStream);
            asmPrinter.run();
        } catch (error er) {
            System.err.println(er.toString());
            throw new RuntimeException();
        }
    }
}