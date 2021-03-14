import AST.RootNode;
import Backend.IRBuilder;
import Backend.IRPrinter;
import Frontend.ASTBuilder;
import Frontend.SemanticChecker;
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


public class Main {
    public static void main(String[] args) throws Exception{

//        InputStream input = System.in;

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
            new SemanticChecker().visit(ASTRoot);

            IRBuilder tmpIRBuilder = new IRBuilder(gScope);
            tmpIRBuilder.visit(ASTRoot);
            new IRPrinter("IRPrinter_test").run(tmpIRBuilder.currentModule);

        } catch (error er) {
            System.err.println(er.toString());
            throw new RuntimeException();
        }
    }
}