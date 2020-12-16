// Generated from D:/compiler_v1/src/Parser\MxStar.g4 by ANTLR 4.9
package Parser;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxStarLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.9", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, Int=4, If=5, Else=6, While=7, Return=8, Continue=9, 
		Break=10, LeftParen=11, RightParen=12, LeftBracket=13, RightBracket=14, 
		LeftBrace=15, RightBrace=16, Less=17, LessEqual=18, Greater=19, GreaterEqual=20, 
		LeftShift=21, RightShift=22, Plus=23, Minus=24, And=25, Or=26, AndAnd=27, 
		OrOr=28, Caret=29, Not=30, Tilde=31, Question=32, Colon=33, Semi=34, Comma=35, 
		Assign=36, Equal=37, NotEqual=38, Identifier=39, DecimalInteger=40, Whitespace=41, 
		Newline=42, BlockComment=43, LineComment=44;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "Int", "If", "Else", "While", "Return", "Continue", 
			"Break", "LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", 
			"RightBrace", "Less", "LessEqual", "Greater", "GreaterEqual", "LeftShift", 
			"RightShift", "Plus", "Minus", "And", "Or", "AndAnd", "OrOr", "Caret", 
			"Not", "Tilde", "Question", "Colon", "Semi", "Comma", "Assign", "Equal", 
			"NotEqual", "Identifier", "DecimalInteger", "Whitespace", "Newline", 
			"BlockComment", "LineComment"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'int main()'", "'++'", "'--'", "'int'", "'if'", "'else'", "'while'", 
			"'return'", "'continue'", "'break'", "'('", "')'", "'['", "']'", "'{'", 
			"'}'", "'<'", "'<='", "'>'", "'>='", "'<<'", "'>>'", "'+'", "'-'", "'&'", 
			"'|'", "'&&'", "'||'", "'^'", "'!'", "'~'", "'?'", "':'", "';'", "','", 
			"'='", "'=='", "'!='"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, "Int", "If", "Else", "While", "Return", "Continue", 
			"Break", "LeftParen", "RightParen", "LeftBracket", "RightBracket", "LeftBrace", 
			"RightBrace", "Less", "LessEqual", "Greater", "GreaterEqual", "LeftShift", 
			"RightShift", "Plus", "Minus", "And", "Or", "AndAnd", "OrOr", "Caret", 
			"Not", "Tilde", "Question", "Colon", "Semi", "Comma", "Assign", "Equal", 
			"NotEqual", "Identifier", "DecimalInteger", "Whitespace", "Newline", 
			"BlockComment", "LineComment"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public MxStarLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "MxStar.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2.\u010e\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\3\3\3\3\3\3\4"+
		"\3\4\3\4\3\5\3\5\3\5\3\5\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3\7\3\b\3\b\3\b\3"+
		"\b\3\b\3\b\3\t\3\t\3\t\3\t\3\t\3\t\3\t\3\n\3\n\3\n\3\n\3\n\3\n\3\n\3\n"+
		"\3\n\3\13\3\13\3\13\3\13\3\13\3\13\3\f\3\f\3\r\3\r\3\16\3\16\3\17\3\17"+
		"\3\20\3\20\3\21\3\21\3\22\3\22\3\23\3\23\3\23\3\24\3\24\3\25\3\25\3\25"+
		"\3\26\3\26\3\26\3\27\3\27\3\27\3\30\3\30\3\31\3\31\3\32\3\32\3\33\3\33"+
		"\3\34\3\34\3\34\3\35\3\35\3\35\3\36\3\36\3\37\3\37\3 \3 \3!\3!\3\"\3\""+
		"\3#\3#\3$\3$\3%\3%\3&\3&\3&\3\'\3\'\3\'\3(\3(\7(\u00d7\n(\f(\16(\u00da"+
		"\13(\3)\3)\7)\u00de\n)\f)\16)\u00e1\13)\3)\5)\u00e4\n)\3*\6*\u00e7\n*"+
		"\r*\16*\u00e8\3*\3*\3+\3+\5+\u00ef\n+\3+\5+\u00f2\n+\3+\3+\3,\3,\3,\3"+
		",\7,\u00fa\n,\f,\16,\u00fd\13,\3,\3,\3,\3,\3,\3-\3-\3-\3-\7-\u0108\n-"+
		"\f-\16-\u010b\13-\3-\3-\3\u00fb\2.\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n"+
		"\23\13\25\f\27\r\31\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\30"+
		"/\31\61\32\63\33\65\34\67\359\36;\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.\3"+
		"\2\b\4\2C\\c|\6\2\62;C\\aac|\3\2\63;\3\2\62;\4\2\13\13\"\"\4\2\f\f\17"+
		"\17\2\u0115\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2"+
		"\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27"+
		"\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2"+
		"\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3\2\2\2\2-\3\2\2\2"+
		"\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\2\67\3\2\2\2\29\3\2"+
		"\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2\2\2A\3\2\2\2\2C\3\2\2\2\2E\3\2\2\2"+
		"\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2M\3\2\2\2\2O\3\2\2\2\2Q\3\2\2\2\2S"+
		"\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3\2\2\2\3[\3\2\2\2\5f\3\2\2\2\7i\3\2"+
		"\2\2\tl\3\2\2\2\13p\3\2\2\2\rs\3\2\2\2\17x\3\2\2\2\21~\3\2\2\2\23\u0085"+
		"\3\2\2\2\25\u008e\3\2\2\2\27\u0094\3\2\2\2\31\u0096\3\2\2\2\33\u0098\3"+
		"\2\2\2\35\u009a\3\2\2\2\37\u009c\3\2\2\2!\u009e\3\2\2\2#\u00a0\3\2\2\2"+
		"%\u00a2\3\2\2\2\'\u00a5\3\2\2\2)\u00a7\3\2\2\2+\u00aa\3\2\2\2-\u00ad\3"+
		"\2\2\2/\u00b0\3\2\2\2\61\u00b2\3\2\2\2\63\u00b4\3\2\2\2\65\u00b6\3\2\2"+
		"\2\67\u00b8\3\2\2\29\u00bb\3\2\2\2;\u00be\3\2\2\2=\u00c0\3\2\2\2?\u00c2"+
		"\3\2\2\2A\u00c4\3\2\2\2C\u00c6\3\2\2\2E\u00c8\3\2\2\2G\u00ca\3\2\2\2I"+
		"\u00cc\3\2\2\2K\u00ce\3\2\2\2M\u00d1\3\2\2\2O\u00d4\3\2\2\2Q\u00e3\3\2"+
		"\2\2S\u00e6\3\2\2\2U\u00f1\3\2\2\2W\u00f5\3\2\2\2Y\u0103\3\2\2\2[\\\7"+
		"k\2\2\\]\7p\2\2]^\7v\2\2^_\7\"\2\2_`\7o\2\2`a\7c\2\2ab\7k\2\2bc\7p\2\2"+
		"cd\7*\2\2de\7+\2\2e\4\3\2\2\2fg\7-\2\2gh\7-\2\2h\6\3\2\2\2ij\7/\2\2jk"+
		"\7/\2\2k\b\3\2\2\2lm\7k\2\2mn\7p\2\2no\7v\2\2o\n\3\2\2\2pq\7k\2\2qr\7"+
		"h\2\2r\f\3\2\2\2st\7g\2\2tu\7n\2\2uv\7u\2\2vw\7g\2\2w\16\3\2\2\2xy\7y"+
		"\2\2yz\7j\2\2z{\7k\2\2{|\7n\2\2|}\7g\2\2}\20\3\2\2\2~\177\7t\2\2\177\u0080"+
		"\7g\2\2\u0080\u0081\7v\2\2\u0081\u0082\7w\2\2\u0082\u0083\7t\2\2\u0083"+
		"\u0084\7p\2\2\u0084\22\3\2\2\2\u0085\u0086\7e\2\2\u0086\u0087\7q\2\2\u0087"+
		"\u0088\7p\2\2\u0088\u0089\7v\2\2\u0089\u008a\7k\2\2\u008a\u008b\7p\2\2"+
		"\u008b\u008c\7w\2\2\u008c\u008d\7g\2\2\u008d\24\3\2\2\2\u008e\u008f\7"+
		"d\2\2\u008f\u0090\7t\2\2\u0090\u0091\7g\2\2\u0091\u0092\7c\2\2\u0092\u0093"+
		"\7m\2\2\u0093\26\3\2\2\2\u0094\u0095\7*\2\2\u0095\30\3\2\2\2\u0096\u0097"+
		"\7+\2\2\u0097\32\3\2\2\2\u0098\u0099\7]\2\2\u0099\34\3\2\2\2\u009a\u009b"+
		"\7_\2\2\u009b\36\3\2\2\2\u009c\u009d\7}\2\2\u009d \3\2\2\2\u009e\u009f"+
		"\7\177\2\2\u009f\"\3\2\2\2\u00a0\u00a1\7>\2\2\u00a1$\3\2\2\2\u00a2\u00a3"+
		"\7>\2\2\u00a3\u00a4\7?\2\2\u00a4&\3\2\2\2\u00a5\u00a6\7@\2\2\u00a6(\3"+
		"\2\2\2\u00a7\u00a8\7@\2\2\u00a8\u00a9\7?\2\2\u00a9*\3\2\2\2\u00aa\u00ab"+
		"\7>\2\2\u00ab\u00ac\7>\2\2\u00ac,\3\2\2\2\u00ad\u00ae\7@\2\2\u00ae\u00af"+
		"\7@\2\2\u00af.\3\2\2\2\u00b0\u00b1\7-\2\2\u00b1\60\3\2\2\2\u00b2\u00b3"+
		"\7/\2\2\u00b3\62\3\2\2\2\u00b4\u00b5\7(\2\2\u00b5\64\3\2\2\2\u00b6\u00b7"+
		"\7~\2\2\u00b7\66\3\2\2\2\u00b8\u00b9\7(\2\2\u00b9\u00ba\7(\2\2\u00ba8"+
		"\3\2\2\2\u00bb\u00bc\7~\2\2\u00bc\u00bd\7~\2\2\u00bd:\3\2\2\2\u00be\u00bf"+
		"\7`\2\2\u00bf<\3\2\2\2\u00c0\u00c1\7#\2\2\u00c1>\3\2\2\2\u00c2\u00c3\7"+
		"\u0080\2\2\u00c3@\3\2\2\2\u00c4\u00c5\7A\2\2\u00c5B\3\2\2\2\u00c6\u00c7"+
		"\7<\2\2\u00c7D\3\2\2\2\u00c8\u00c9\7=\2\2\u00c9F\3\2\2\2\u00ca\u00cb\7"+
		".\2\2\u00cbH\3\2\2\2\u00cc\u00cd\7?\2\2\u00cdJ\3\2\2\2\u00ce\u00cf\7?"+
		"\2\2\u00cf\u00d0\7?\2\2\u00d0L\3\2\2\2\u00d1\u00d2\7#\2\2\u00d2\u00d3"+
		"\7?\2\2\u00d3N\3\2\2\2\u00d4\u00d8\t\2\2\2\u00d5\u00d7\t\3\2\2\u00d6\u00d5"+
		"\3\2\2\2\u00d7\u00da\3\2\2\2\u00d8\u00d6\3\2\2\2\u00d8\u00d9\3\2\2\2\u00d9"+
		"P\3\2\2\2\u00da\u00d8\3\2\2\2\u00db\u00df\t\4\2\2\u00dc\u00de\t\5\2\2"+
		"\u00dd\u00dc\3\2\2\2\u00de\u00e1\3\2\2\2\u00df\u00dd\3\2\2\2\u00df\u00e0"+
		"\3\2\2\2\u00e0\u00e4\3\2\2\2\u00e1\u00df\3\2\2\2\u00e2\u00e4\7\62\2\2"+
		"\u00e3\u00db\3\2\2\2\u00e3\u00e2\3\2\2\2\u00e4R\3\2\2\2\u00e5\u00e7\t"+
		"\6\2\2\u00e6\u00e5\3\2\2\2\u00e7\u00e8\3\2\2\2\u00e8\u00e6\3\2\2\2\u00e8"+
		"\u00e9\3\2\2\2\u00e9\u00ea\3\2\2\2\u00ea\u00eb\b*\2\2\u00ebT\3\2\2\2\u00ec"+
		"\u00ee\7\17\2\2\u00ed\u00ef\7\f\2\2\u00ee\u00ed\3\2\2\2\u00ee\u00ef\3"+
		"\2\2\2\u00ef\u00f2\3\2\2\2\u00f0\u00f2\7\f\2\2\u00f1\u00ec\3\2\2\2\u00f1"+
		"\u00f0\3\2\2\2\u00f2\u00f3\3\2\2\2\u00f3\u00f4\b+\2\2\u00f4V\3\2\2\2\u00f5"+
		"\u00f6\7\61\2\2\u00f6\u00f7\7,\2\2\u00f7\u00fb\3\2\2\2\u00f8\u00fa\13"+
		"\2\2\2\u00f9\u00f8\3\2\2\2\u00fa\u00fd\3\2\2\2\u00fb\u00fc\3\2\2\2\u00fb"+
		"\u00f9\3\2\2\2\u00fc\u00fe\3\2\2\2\u00fd\u00fb\3\2\2\2\u00fe\u00ff\7,"+
		"\2\2\u00ff\u0100\7\61\2\2\u0100\u0101\3\2\2\2\u0101\u0102\b,\2\2\u0102"+
		"X\3\2\2\2\u0103\u0104\7\61\2\2\u0104\u0105\7\61\2\2\u0105\u0109\3\2\2"+
		"\2\u0106\u0108\n\7\2\2\u0107\u0106\3\2\2\2\u0108\u010b\3\2\2\2\u0109\u0107"+
		"\3\2\2\2\u0109\u010a\3\2\2\2\u010a\u010c\3\2\2\2\u010b\u0109\3\2\2\2\u010c"+
		"\u010d\b-\2\2\u010dZ\3\2\2\2\13\2\u00d8\u00df\u00e3\u00e8\u00ee\u00f1"+
		"\u00fb\u0109\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}