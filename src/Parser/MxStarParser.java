// Generated from D:/compiler_v1/src/Parser\MxStar.g4 by ANTLR 4.9
package Parser;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxStarParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.9", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, T__27=28, T__28=29, T__29=30, T__30=31, 
		T__31=32, Class=33, Void=34, This=35, New=36, Int=37, Bool=38, String=39, 
		If=40, Else=41, For=42, While=43, Return=44, Continue=45, Break=46, Identifier=47, 
		DecimalInteger=48, StringConstant=49, BoolConstant=50, NullConstant=51, 
		Whitespace=52, Newline=53, BlockComment=54, LineComment=55;
	public static final int
		RULE_program = 0, RULE_programUnit = 1, RULE_varDef = 2, RULE_singlevarDef = 3, 
		RULE_classDef = 4, RULE_constructorDef = 5, RULE_funcDef = 6, RULE_funcType = 7, 
		RULE_parDefList = 8, RULE_parVarDef = 9, RULE_typedef = 10, RULE_nonarraytypedef = 11, 
		RULE_suite = 12, RULE_statement = 13, RULE_expression = 14, RULE_exprList = 15, 
		RULE_literal = 16, RULE_newType = 17;
	private static String[] makeRuleNames() {
		return new String[] {
			"program", "programUnit", "varDef", "singlevarDef", "classDef", "constructorDef", 
			"funcDef", "funcType", "parDefList", "parVarDef", "typedef", "nonarraytypedef", 
			"suite", "statement", "expression", "exprList", "literal", "newType"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "','", "';'", "'='", "'{'", "'}'", "'('", "')'", "'['", "']'", 
			"'>'", "'<'", "'>='", "'<='", "'=='", "'!='", "'*'", "'/'", "'%'", "'+'", 
			"'-'", "'<<'", "'>>'", "'&&'", "'||'", "'&'", "'|'", "'^'", "'++'", "'--'", 
			"'!'", "'~'", "'.'", "'class'", "'void'", "'this'", "'new'", "'int'", 
			"'bool'", "'string'", "'if'", "'else'", "'for'", "'while'", "'return'", 
			"'continue'", "'break'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, "Class", "Void", 
			"This", "New", "Int", "Bool", "String", "If", "Else", "For", "While", 
			"Return", "Continue", "Break", "Identifier", "DecimalInteger", "StringConstant", 
			"BoolConstant", "NullConstant", "Whitespace", "Newline", "BlockComment", 
			"LineComment"
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

	@Override
	public String getGrammarFileName() { return "MxStar.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public MxStarParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class ProgramContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(MxStarParser.EOF, 0); }
		public List<ProgramUnitContext> programUnit() {
			return getRuleContexts(ProgramUnitContext.class);
		}
		public ProgramUnitContext programUnit(int i) {
			return getRuleContext(ProgramUnitContext.class,i);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterProgram(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitProgram(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitProgram(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(39);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Class) | (1L << Void) | (1L << Int) | (1L << Bool) | (1L << String) | (1L << Identifier))) != 0)) {
				{
				{
				setState(36);
				programUnit();
				}
				}
				setState(41);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(42);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ProgramUnitContext extends ParserRuleContext {
		public VarDefContext varDef() {
			return getRuleContext(VarDefContext.class,0);
		}
		public ClassDefContext classDef() {
			return getRuleContext(ClassDefContext.class,0);
		}
		public FuncDefContext funcDef() {
			return getRuleContext(FuncDefContext.class,0);
		}
		public ProgramUnitContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_programUnit; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterProgramUnit(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitProgramUnit(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitProgramUnit(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ProgramUnitContext programUnit() throws RecognitionException {
		ProgramUnitContext _localctx = new ProgramUnitContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_programUnit);
		try {
			setState(47);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,1,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(44);
				varDef();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(45);
				classDef();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(46);
				funcDef();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VarDefContext extends ParserRuleContext {
		public TypedefContext typedef() {
			return getRuleContext(TypedefContext.class,0);
		}
		public List<SinglevarDefContext> singlevarDef() {
			return getRuleContexts(SinglevarDefContext.class);
		}
		public SinglevarDefContext singlevarDef(int i) {
			return getRuleContext(SinglevarDefContext.class,i);
		}
		public VarDefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_varDef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterVarDef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitVarDef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitVarDef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VarDefContext varDef() throws RecognitionException {
		VarDefContext _localctx = new VarDefContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_varDef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(49);
			typedef(0);
			setState(50);
			singlevarDef();
			setState(55);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__0) {
				{
				{
				setState(51);
				match(T__0);
				setState(52);
				singlevarDef();
				}
				}
				setState(57);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(58);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class SinglevarDefContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public SinglevarDefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_singlevarDef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterSinglevarDef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitSinglevarDef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitSinglevarDef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final SinglevarDefContext singlevarDef() throws RecognitionException {
		SinglevarDefContext _localctx = new SinglevarDefContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_singlevarDef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(60);
			match(Identifier);
			setState(63);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__2) {
				{
				setState(61);
				match(T__2);
				setState(62);
				expression(0);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassDefContext extends ParserRuleContext {
		public TerminalNode Class() { return getToken(MxStarParser.Class, 0); }
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public List<FuncDefContext> funcDef() {
			return getRuleContexts(FuncDefContext.class);
		}
		public FuncDefContext funcDef(int i) {
			return getRuleContext(FuncDefContext.class,i);
		}
		public List<VarDefContext> varDef() {
			return getRuleContexts(VarDefContext.class);
		}
		public VarDefContext varDef(int i) {
			return getRuleContext(VarDefContext.class,i);
		}
		public List<ConstructorDefContext> constructorDef() {
			return getRuleContexts(ConstructorDefContext.class);
		}
		public ConstructorDefContext constructorDef(int i) {
			return getRuleContext(ConstructorDefContext.class,i);
		}
		public ClassDefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classDef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterClassDef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitClassDef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitClassDef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassDefContext classDef() throws RecognitionException {
		ClassDefContext _localctx = new ClassDefContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_classDef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(65);
			match(Class);
			setState(66);
			match(Identifier);
			setState(67);
			match(T__3);
			setState(73);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Void) | (1L << Int) | (1L << Bool) | (1L << String) | (1L << Identifier))) != 0)) {
				{
				setState(71);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,4,_ctx) ) {
				case 1:
					{
					setState(68);
					funcDef();
					}
					break;
				case 2:
					{
					setState(69);
					varDef();
					}
					break;
				case 3:
					{
					setState(70);
					constructorDef();
					}
					break;
				}
				}
				setState(75);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(76);
			match(T__4);
			setState(77);
			match(T__1);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ConstructorDefContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public SuiteContext suite() {
			return getRuleContext(SuiteContext.class,0);
		}
		public ParDefListContext parDefList() {
			return getRuleContext(ParDefListContext.class,0);
		}
		public ConstructorDefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_constructorDef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterConstructorDef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitConstructorDef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitConstructorDef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ConstructorDefContext constructorDef() throws RecognitionException {
		ConstructorDefContext _localctx = new ConstructorDefContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_constructorDef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(79);
			match(Identifier);
			setState(80);
			match(T__5);
			setState(82);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Int) | (1L << Bool) | (1L << String) | (1L << Identifier))) != 0)) {
				{
				setState(81);
				parDefList();
				}
			}

			setState(84);
			match(T__6);
			setState(85);
			suite();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FuncDefContext extends ParserRuleContext {
		public FuncTypeContext funcType() {
			return getRuleContext(FuncTypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public SuiteContext suite() {
			return getRuleContext(SuiteContext.class,0);
		}
		public ParDefListContext parDefList() {
			return getRuleContext(ParDefListContext.class,0);
		}
		public FuncDefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_funcDef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterFuncDef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitFuncDef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitFuncDef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FuncDefContext funcDef() throws RecognitionException {
		FuncDefContext _localctx = new FuncDefContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_funcDef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(87);
			funcType();
			setState(88);
			match(Identifier);
			setState(89);
			match(T__5);
			setState(91);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Int) | (1L << Bool) | (1L << String) | (1L << Identifier))) != 0)) {
				{
				setState(90);
				parDefList();
				}
			}

			setState(93);
			match(T__6);
			setState(94);
			suite();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FuncTypeContext extends ParserRuleContext {
		public TerminalNode Void() { return getToken(MxStarParser.Void, 0); }
		public TypedefContext typedef() {
			return getRuleContext(TypedefContext.class,0);
		}
		public FuncTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_funcType; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterFuncType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitFuncType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitFuncType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FuncTypeContext funcType() throws RecognitionException {
		FuncTypeContext _localctx = new FuncTypeContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_funcType);
		try {
			setState(98);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case Void:
				enterOuterAlt(_localctx, 1);
				{
				setState(96);
				match(Void);
				}
				break;
			case Int:
			case Bool:
			case String:
			case Identifier:
				enterOuterAlt(_localctx, 2);
				{
				setState(97);
				typedef(0);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParDefListContext extends ParserRuleContext {
		public List<ParVarDefContext> parVarDef() {
			return getRuleContexts(ParVarDefContext.class);
		}
		public ParVarDefContext parVarDef(int i) {
			return getRuleContext(ParVarDefContext.class,i);
		}
		public ParDefListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_parDefList; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterParDefList(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitParDefList(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitParDefList(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParDefListContext parDefList() throws RecognitionException {
		ParDefListContext _localctx = new ParDefListContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_parDefList);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(100);
			parVarDef();
			setState(105);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__0) {
				{
				{
				setState(101);
				match(T__0);
				setState(102);
				parVarDef();
				}
				}
				setState(107);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParVarDefContext extends ParserRuleContext {
		public TypedefContext typedef() {
			return getRuleContext(TypedefContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public ParVarDefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_parVarDef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterParVarDef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitParVarDef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitParVarDef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParVarDefContext parVarDef() throws RecognitionException {
		ParVarDefContext _localctx = new ParVarDefContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_parVarDef);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(108);
			typedef(0);
			setState(109);
			match(Identifier);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TypedefContext extends ParserRuleContext {
		public TypedefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_typedef; }
	 
		public TypedefContext() { }
		public void copyFrom(TypedefContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class ArrayTypeContext extends TypedefContext {
		public TypedefContext typedef() {
			return getRuleContext(TypedefContext.class,0);
		}
		public ArrayTypeContext(TypedefContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterArrayType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitArrayType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitArrayType(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class NarrayTypeContext extends TypedefContext {
		public NonarraytypedefContext nonarraytypedef() {
			return getRuleContext(NonarraytypedefContext.class,0);
		}
		public NarrayTypeContext(TypedefContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterNarrayType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitNarrayType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitNarrayType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final TypedefContext typedef() throws RecognitionException {
		return typedef(0);
	}

	private TypedefContext typedef(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		TypedefContext _localctx = new TypedefContext(_ctx, _parentState);
		TypedefContext _prevctx = _localctx;
		int _startState = 20;
		enterRecursionRule(_localctx, 20, RULE_typedef, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			{
			_localctx = new NarrayTypeContext(_localctx);
			_ctx = _localctx;
			_prevctx = _localctx;

			setState(112);
			nonarraytypedef();
			}
			_ctx.stop = _input.LT(-1);
			setState(119);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,10,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new ArrayTypeContext(new TypedefContext(_parentctx, _parentState));
					pushNewRecursionContext(_localctx, _startState, RULE_typedef);
					setState(114);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(115);
					match(T__7);
					setState(116);
					match(T__8);
					}
					} 
				}
				setState(121);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,10,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class NonarraytypedefContext extends ParserRuleContext {
		public TerminalNode Int() { return getToken(MxStarParser.Int, 0); }
		public TerminalNode Bool() { return getToken(MxStarParser.Bool, 0); }
		public TerminalNode String() { return getToken(MxStarParser.String, 0); }
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public NonarraytypedefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_nonarraytypedef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterNonarraytypedef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitNonarraytypedef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitNonarraytypedef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final NonarraytypedefContext nonarraytypedef() throws RecognitionException {
		NonarraytypedefContext _localctx = new NonarraytypedefContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_nonarraytypedef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(122);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Int) | (1L << Bool) | (1L << String) | (1L << Identifier))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class SuiteContext extends ParserRuleContext {
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public SuiteContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_suite; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterSuite(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitSuite(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitSuite(this);
			else return visitor.visitChildren(this);
		}
	}

	public final SuiteContext suite() throws RecognitionException {
		SuiteContext _localctx = new SuiteContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_suite);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(124);
			match(T__3);
			setState(128);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << T__3) | (1L << T__5) | (1L << T__18) | (1L << T__19) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__30) | (1L << This) | (1L << New) | (1L << Int) | (1L << Bool) | (1L << String) | (1L << If) | (1L << For) | (1L << While) | (1L << Return) | (1L << Continue) | (1L << Break) | (1L << Identifier) | (1L << DecimalInteger) | (1L << StringConstant) | (1L << BoolConstant) | (1L << NullConstant))) != 0)) {
				{
				{
				setState(125);
				statement();
				}
				}
				setState(130);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(131);
			match(T__4);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StatementContext extends ParserRuleContext {
		public StatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement; }
	 
		public StatementContext() { }
		public void copyFrom(StatementContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class ForStmtContext extends StatementContext {
		public ExpressionContext initexp;
		public ExpressionContext condexp;
		public ExpressionContext stepexp;
		public TerminalNode For() { return getToken(MxStarParser.For, 0); }
		public StatementContext statement() {
			return getRuleContext(StatementContext.class,0);
		}
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public ForStmtContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterForStmt(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitForStmt(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitForStmt(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class WhileStmtContext extends StatementContext {
		public TerminalNode While() { return getToken(MxStarParser.While, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public StatementContext statement() {
			return getRuleContext(StatementContext.class,0);
		}
		public WhileStmtContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterWhileStmt(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitWhileStmt(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitWhileStmt(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class IfStmtContext extends StatementContext {
		public StatementContext trueStmt;
		public StatementContext falseStmt;
		public TerminalNode If() { return getToken(MxStarParser.If, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public TerminalNode Else() { return getToken(MxStarParser.Else, 0); }
		public IfStmtContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterIfStmt(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitIfStmt(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitIfStmt(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class BreakStmtContext extends StatementContext {
		public TerminalNode Break() { return getToken(MxStarParser.Break, 0); }
		public BreakStmtContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterBreakStmt(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitBreakStmt(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitBreakStmt(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class EmptyStmtContext extends StatementContext {
		public EmptyStmtContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterEmptyStmt(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitEmptyStmt(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitEmptyStmt(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class BlockContext extends StatementContext {
		public SuiteContext suite() {
			return getRuleContext(SuiteContext.class,0);
		}
		public BlockContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterBlock(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitBlock(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitBlock(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class ReturnStmtContext extends StatementContext {
		public TerminalNode Return() { return getToken(MxStarParser.Return, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public ReturnStmtContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterReturnStmt(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitReturnStmt(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitReturnStmt(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class ContinueStmtContext extends StatementContext {
		public TerminalNode Continue() { return getToken(MxStarParser.Continue, 0); }
		public ContinueStmtContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterContinueStmt(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitContinueStmt(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitContinueStmt(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class VardefStmtContext extends StatementContext {
		public VarDefContext varDef() {
			return getRuleContext(VarDefContext.class,0);
		}
		public VardefStmtContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterVardefStmt(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitVardefStmt(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitVardefStmt(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class PureExprStmtContext extends StatementContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public PureExprStmtContext(StatementContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterPureExprStmt(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitPureExprStmt(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitPureExprStmt(this);
			else return visitor.visitChildren(this);
		}
	}

	public final StatementContext statement() throws RecognitionException {
		StatementContext _localctx = new StatementContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_statement);
		int _la;
		try {
			setState(178);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,17,_ctx) ) {
			case 1:
				_localctx = new BlockContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(133);
				suite();
				}
				break;
			case 2:
				_localctx = new VardefStmtContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(134);
				varDef();
				}
				break;
			case 3:
				_localctx = new IfStmtContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(135);
				match(If);
				setState(136);
				match(T__5);
				setState(137);
				expression(0);
				setState(138);
				match(T__6);
				setState(139);
				((IfStmtContext)_localctx).trueStmt = statement();
				setState(142);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,12,_ctx) ) {
				case 1:
					{
					setState(140);
					match(Else);
					setState(141);
					((IfStmtContext)_localctx).falseStmt = statement();
					}
					break;
				}
				}
				break;
			case 4:
				_localctx = new ForStmtContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(144);
				match(For);
				setState(145);
				match(T__5);
				setState(147);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__18) | (1L << T__19) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__30) | (1L << This) | (1L << New) | (1L << Identifier) | (1L << DecimalInteger) | (1L << StringConstant) | (1L << BoolConstant) | (1L << NullConstant))) != 0)) {
					{
					setState(146);
					((ForStmtContext)_localctx).initexp = expression(0);
					}
				}

				setState(149);
				match(T__1);
				setState(151);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__18) | (1L << T__19) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__30) | (1L << This) | (1L << New) | (1L << Identifier) | (1L << DecimalInteger) | (1L << StringConstant) | (1L << BoolConstant) | (1L << NullConstant))) != 0)) {
					{
					setState(150);
					((ForStmtContext)_localctx).condexp = expression(0);
					}
				}

				setState(153);
				match(T__1);
				setState(155);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__18) | (1L << T__19) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__30) | (1L << This) | (1L << New) | (1L << Identifier) | (1L << DecimalInteger) | (1L << StringConstant) | (1L << BoolConstant) | (1L << NullConstant))) != 0)) {
					{
					setState(154);
					((ForStmtContext)_localctx).stepexp = expression(0);
					}
				}

				setState(157);
				match(T__6);
				setState(158);
				statement();
				}
				break;
			case 5:
				_localctx = new WhileStmtContext(_localctx);
				enterOuterAlt(_localctx, 5);
				{
				setState(159);
				match(While);
				setState(160);
				match(T__5);
				setState(161);
				expression(0);
				setState(162);
				match(T__6);
				setState(163);
				statement();
				}
				break;
			case 6:
				_localctx = new ReturnStmtContext(_localctx);
				enterOuterAlt(_localctx, 6);
				{
				setState(165);
				match(Return);
				setState(167);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__18) | (1L << T__19) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__30) | (1L << This) | (1L << New) | (1L << Identifier) | (1L << DecimalInteger) | (1L << StringConstant) | (1L << BoolConstant) | (1L << NullConstant))) != 0)) {
					{
					setState(166);
					expression(0);
					}
				}

				setState(169);
				match(T__1);
				}
				break;
			case 7:
				_localctx = new ContinueStmtContext(_localctx);
				enterOuterAlt(_localctx, 7);
				{
				setState(170);
				match(Continue);
				setState(171);
				match(T__1);
				}
				break;
			case 8:
				_localctx = new BreakStmtContext(_localctx);
				enterOuterAlt(_localctx, 8);
				{
				setState(172);
				match(Break);
				setState(173);
				match(T__1);
				}
				break;
			case 9:
				_localctx = new PureExprStmtContext(_localctx);
				enterOuterAlt(_localctx, 9);
				{
				setState(174);
				expression(0);
				setState(175);
				match(T__1);
				}
				break;
			case 10:
				_localctx = new EmptyStmtContext(_localctx);
				enterOuterAlt(_localctx, 10);
				{
				setState(177);
				match(T__1);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpressionContext extends ParserRuleContext {
		public ExpressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expression; }
	 
		public ExpressionContext() { }
		public void copyFrom(ExpressionContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class NewExprContext extends ExpressionContext {
		public TerminalNode New() { return getToken(MxStarParser.New, 0); }
		public NewTypeContext newType() {
			return getRuleContext(NewTypeContext.class,0);
		}
		public NewExprContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterNewExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitNewExpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitNewExpr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class ThisExprContext extends ExpressionContext {
		public TerminalNode This() { return getToken(MxStarParser.This, 0); }
		public ThisExprContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterThisExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitThisExpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitThisExpr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class UnaryExprContext extends ExpressionContext {
		public Token op;
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public UnaryExprContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterUnaryExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitUnaryExpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitUnaryExpr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class FunccalContext extends ExpressionContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public ExprListContext exprList() {
			return getRuleContext(ExprListContext.class,0);
		}
		public FunccalContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterFunccal(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitFunccal(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitFunccal(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class SelfExprContext extends ExpressionContext {
		public Token op;
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public SelfExprContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterSelfExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitSelfExpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitSelfExpr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class MemberAccContext extends ExpressionContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public MemberAccContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterMemberAcc(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitMemberAcc(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitMemberAcc(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class BinaryExprContext extends ExpressionContext {
		public ExpressionContext exprl;
		public Token op;
		public ExpressionContext exprr;
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public BinaryExprContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterBinaryExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitBinaryExpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitBinaryExpr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class SubExprContext extends ExpressionContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public SubExprContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterSubExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitSubExpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitSubExpr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class AssignExprContext extends ExpressionContext {
		public ExpressionContext exprl;
		public ExpressionContext exprr;
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public AssignExprContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterAssignExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitAssignExpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitAssignExpr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class ArraydefExprContext extends ExpressionContext {
		public ExpressionContext arr;
		public ExpressionContext index;
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public ArraydefExprContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterArraydefExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitArraydefExpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitArraydefExpr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class IdExprContext extends ExpressionContext {
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public IdExprContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterIdExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitIdExpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitIdExpr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class ConstExprContext extends ExpressionContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public ConstExprContext(ExpressionContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterConstExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitConstExpr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitConstExpr(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExpressionContext expression() throws RecognitionException {
		return expression(0);
	}

	private ExpressionContext expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExpressionContext _localctx = new ExpressionContext(_ctx, _parentState);
		ExpressionContext _prevctx = _localctx;
		int _startState = 28;
		enterRecursionRule(_localctx, 28, RULE_expression, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(196);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__5:
				{
				_localctx = new SubExprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;

				setState(181);
				match(T__5);
				setState(182);
				expression(0);
				setState(183);
				match(T__6);
				}
				break;
			case Identifier:
				{
				_localctx = new IdExprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(185);
				match(Identifier);
				}
				break;
			case DecimalInteger:
			case StringConstant:
			case BoolConstant:
			case NullConstant:
				{
				_localctx = new ConstExprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(186);
				literal();
				}
				break;
			case T__27:
			case T__28:
				{
				_localctx = new UnaryExprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(187);
				((UnaryExprContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==T__27 || _la==T__28) ) {
					((UnaryExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(188);
				expression(8);
				}
				break;
			case T__29:
			case T__30:
				{
				_localctx = new UnaryExprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(189);
				((UnaryExprContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==T__29 || _la==T__30) ) {
					((UnaryExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(190);
				expression(7);
				}
				break;
			case T__18:
			case T__19:
				{
				_localctx = new UnaryExprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(191);
				((UnaryExprContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==T__18 || _la==T__19) ) {
					((UnaryExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(192);
				expression(6);
				}
				break;
			case This:
				{
				_localctx = new ThisExprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(193);
				match(This);
				}
				break;
			case New:
				{
				_localctx = new NewExprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(194);
				match(New);
				setState(195);
				newType();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			_ctx.stop = _input.LT(-1);
			setState(246);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,21,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(244);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,20,_ctx) ) {
					case 1:
						{
						_localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExprContext)_localctx).exprl = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(198);
						if (!(precpred(_ctx, 19))) throw new FailedPredicateException(this, "precpred(_ctx, 19)");
						setState(199);
						((BinaryExprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__9) | (1L << T__10) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14))) != 0)) ) {
							((BinaryExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(200);
						((BinaryExprContext)_localctx).exprr = expression(20);
						}
						break;
					case 2:
						{
						_localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExprContext)_localctx).exprl = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(201);
						if (!(precpred(_ctx, 18))) throw new FailedPredicateException(this, "precpred(_ctx, 18)");
						setState(202);
						((BinaryExprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__15) | (1L << T__16) | (1L << T__17))) != 0)) ) {
							((BinaryExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(203);
						((BinaryExprContext)_localctx).exprr = expression(19);
						}
						break;
					case 3:
						{
						_localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExprContext)_localctx).exprl = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(204);
						if (!(precpred(_ctx, 17))) throw new FailedPredicateException(this, "precpred(_ctx, 17)");
						setState(205);
						((BinaryExprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__18 || _la==T__19) ) {
							((BinaryExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(206);
						((BinaryExprContext)_localctx).exprr = expression(18);
						}
						break;
					case 4:
						{
						_localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExprContext)_localctx).exprl = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(207);
						if (!(precpred(_ctx, 16))) throw new FailedPredicateException(this, "precpred(_ctx, 16)");
						setState(208);
						((BinaryExprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__20 || _la==T__21) ) {
							((BinaryExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(209);
						((BinaryExprContext)_localctx).exprr = expression(17);
						}
						break;
					case 5:
						{
						_localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExprContext)_localctx).exprl = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(210);
						if (!(precpred(_ctx, 15))) throw new FailedPredicateException(this, "precpred(_ctx, 15)");
						setState(211);
						((BinaryExprContext)_localctx).op = match(T__22);
						setState(212);
						((BinaryExprContext)_localctx).exprr = expression(16);
						}
						break;
					case 6:
						{
						_localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExprContext)_localctx).exprl = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(213);
						if (!(precpred(_ctx, 14))) throw new FailedPredicateException(this, "precpred(_ctx, 14)");
						setState(214);
						((BinaryExprContext)_localctx).op = match(T__23);
						setState(215);
						((BinaryExprContext)_localctx).exprr = expression(15);
						}
						break;
					case 7:
						{
						_localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExprContext)_localctx).exprl = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(216);
						if (!(precpred(_ctx, 13))) throw new FailedPredicateException(this, "precpred(_ctx, 13)");
						setState(217);
						((BinaryExprContext)_localctx).op = match(T__24);
						setState(218);
						((BinaryExprContext)_localctx).exprr = expression(14);
						}
						break;
					case 8:
						{
						_localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExprContext)_localctx).exprl = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(219);
						if (!(precpred(_ctx, 12))) throw new FailedPredicateException(this, "precpred(_ctx, 12)");
						setState(220);
						((BinaryExprContext)_localctx).op = match(T__25);
						setState(221);
						((BinaryExprContext)_localctx).exprr = expression(13);
						}
						break;
					case 9:
						{
						_localctx = new BinaryExprContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExprContext)_localctx).exprl = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(222);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(223);
						((BinaryExprContext)_localctx).op = match(T__26);
						setState(224);
						((BinaryExprContext)_localctx).exprr = expression(12);
						}
						break;
					case 10:
						{
						_localctx = new AssignExprContext(new ExpressionContext(_parentctx, _parentState));
						((AssignExprContext)_localctx).exprl = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(225);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(226);
						match(T__2);
						setState(227);
						((AssignExprContext)_localctx).exprr = expression(10);
						}
						break;
					case 11:
						{
						_localctx = new SelfExprContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(228);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(229);
						((SelfExprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__27 || _la==T__28) ) {
							((SelfExprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
						break;
					case 12:
						{
						_localctx = new MemberAccContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(230);
						if (!(precpred(_ctx, 3))) throw new FailedPredicateException(this, "precpred(_ctx, 3)");
						setState(231);
						match(T__31);
						setState(232);
						match(Identifier);
						}
						break;
					case 13:
						{
						_localctx = new ArraydefExprContext(new ExpressionContext(_parentctx, _parentState));
						((ArraydefExprContext)_localctx).arr = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(233);
						if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
						setState(234);
						match(T__7);
						setState(235);
						((ArraydefExprContext)_localctx).index = expression(0);
						setState(236);
						match(T__8);
						}
						break;
					case 14:
						{
						_localctx = new FunccalContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(238);
						if (!(precpred(_ctx, 1))) throw new FailedPredicateException(this, "precpred(_ctx, 1)");
						setState(239);
						match(T__5);
						setState(241);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__18) | (1L << T__19) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__30) | (1L << This) | (1L << New) | (1L << Identifier) | (1L << DecimalInteger) | (1L << StringConstant) | (1L << BoolConstant) | (1L << NullConstant))) != 0)) {
							{
							setState(240);
							exprList();
							}
						}

						setState(243);
						match(T__6);
						}
						break;
					}
					} 
				}
				setState(248);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,21,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class ExprListContext extends ParserRuleContext {
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public ExprListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_exprList; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterExprList(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitExprList(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitExprList(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExprListContext exprList() throws RecognitionException {
		ExprListContext _localctx = new ExprListContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_exprList);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(249);
			expression(0);
			setState(254);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__0) {
				{
				{
				setState(250);
				match(T__0);
				setState(251);
				expression(0);
				}
				}
				setState(256);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class LiteralContext extends ParserRuleContext {
		public TerminalNode DecimalInteger() { return getToken(MxStarParser.DecimalInteger, 0); }
		public TerminalNode StringConstant() { return getToken(MxStarParser.StringConstant, 0); }
		public TerminalNode NullConstant() { return getToken(MxStarParser.NullConstant, 0); }
		public TerminalNode BoolConstant() { return getToken(MxStarParser.BoolConstant, 0); }
		public LiteralContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_literal; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterLiteral(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitLiteral(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitLiteral(this);
			else return visitor.visitChildren(this);
		}
	}

	public final LiteralContext literal() throws RecognitionException {
		LiteralContext _localctx = new LiteralContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_literal);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(257);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << DecimalInteger) | (1L << StringConstant) | (1L << BoolConstant) | (1L << NullConstant))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class NewTypeContext extends ParserRuleContext {
		public NewTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_newType; }
	 
		public NewTypeContext() { }
		public void copyFrom(NewTypeContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class NewtypeobjectContext extends NewTypeContext {
		public NonarraytypedefContext nonarraytypedef() {
			return getRuleContext(NonarraytypedefContext.class,0);
		}
		public NewtypeobjectContext(NewTypeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterNewtypeobject(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitNewtypeobject(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitNewtypeobject(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class NewtypeWrongContext extends NewTypeContext {
		public NonarraytypedefContext nonarraytypedef() {
			return getRuleContext(NonarraytypedefContext.class,0);
		}
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public NewtypeWrongContext(NewTypeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterNewtypeWrong(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitNewtypeWrong(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitNewtypeWrong(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class NewtypenonarrayContext extends NewTypeContext {
		public NonarraytypedefContext nonarraytypedef() {
			return getRuleContext(NonarraytypedefContext.class,0);
		}
		public NewtypenonarrayContext(NewTypeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterNewtypenonarray(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitNewtypenonarray(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitNewtypenonarray(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class NewtypearrayContext extends NewTypeContext {
		public NonarraytypedefContext nonarraytypedef() {
			return getRuleContext(NonarraytypedefContext.class,0);
		}
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public NewtypearrayContext(NewTypeContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterNewtypearray(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitNewtypearray(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitNewtypearray(this);
			else return visitor.visitChildren(this);
		}
	}

	public final NewTypeContext newType() throws RecognitionException {
		NewTypeContext _localctx = new NewTypeContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_newType);
		int _la;
		try {
			int _alt;
			setState(308);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,30,_ctx) ) {
			case 1:
				_localctx = new NewtypeWrongContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(259);
				nonarraytypedef();
				setState(266);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,23,_ctx);
				while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(260);
						match(T__7);
						setState(261);
						expression(0);
						setState(262);
						match(T__8);
						}
						} 
					}
					setState(268);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,23,_ctx);
				}
				setState(271); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(269);
						match(T__7);
						setState(270);
						match(T__8);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(273); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,24,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				setState(279); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(275);
						match(T__7);
						setState(276);
						expression(0);
						setState(277);
						match(T__8);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(281); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				setState(290);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,27,_ctx);
				while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(283);
						match(T__7);
						setState(285);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__18) | (1L << T__19) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__30) | (1L << This) | (1L << New) | (1L << Identifier) | (1L << DecimalInteger) | (1L << StringConstant) | (1L << BoolConstant) | (1L << NullConstant))) != 0)) {
							{
							setState(284);
							expression(0);
							}
						}

						setState(287);
						match(T__8);
						}
						} 
					}
					setState(292);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,27,_ctx);
				}
				}
				break;
			case 2:
				_localctx = new NewtypearrayContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(293);
				nonarraytypedef();
				setState(299); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(294);
						match(T__7);
						setState(296);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__18) | (1L << T__19) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__30) | (1L << This) | (1L << New) | (1L << Identifier) | (1L << DecimalInteger) | (1L << StringConstant) | (1L << BoolConstant) | (1L << NullConstant))) != 0)) {
							{
							setState(295);
							expression(0);
							}
						}

						setState(298);
						match(T__8);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(301); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,29,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				}
				break;
			case 3:
				_localctx = new NewtypeobjectContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(303);
				nonarraytypedef();
				setState(304);
				match(T__5);
				setState(305);
				match(T__6);
				}
				break;
			case 4:
				_localctx = new NewtypenonarrayContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(307);
				nonarraytypedef();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 10:
			return typedef_sempred((TypedefContext)_localctx, predIndex);
		case 14:
			return expression_sempred((ExpressionContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean typedef_sempred(TypedefContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 2);
		}
		return true;
	}
	private boolean expression_sempred(ExpressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 1:
			return precpred(_ctx, 19);
		case 2:
			return precpred(_ctx, 18);
		case 3:
			return precpred(_ctx, 17);
		case 4:
			return precpred(_ctx, 16);
		case 5:
			return precpred(_ctx, 15);
		case 6:
			return precpred(_ctx, 14);
		case 7:
			return precpred(_ctx, 13);
		case 8:
			return precpred(_ctx, 12);
		case 9:
			return precpred(_ctx, 11);
		case 10:
			return precpred(_ctx, 10);
		case 11:
			return precpred(_ctx, 9);
		case 12:
			return precpred(_ctx, 3);
		case 13:
			return precpred(_ctx, 2);
		case 14:
			return precpred(_ctx, 1);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\39\u0139\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\3\2\7\2(\n\2\f\2\16\2+\13\2\3\2\3\2\3\3\3\3\3\3\5\3\62\n\3"+
		"\3\4\3\4\3\4\3\4\7\48\n\4\f\4\16\4;\13\4\3\4\3\4\3\5\3\5\3\5\5\5B\n\5"+
		"\3\6\3\6\3\6\3\6\3\6\3\6\7\6J\n\6\f\6\16\6M\13\6\3\6\3\6\3\6\3\7\3\7\3"+
		"\7\5\7U\n\7\3\7\3\7\3\7\3\b\3\b\3\b\3\b\5\b^\n\b\3\b\3\b\3\b\3\t\3\t\5"+
		"\te\n\t\3\n\3\n\3\n\7\nj\n\n\f\n\16\nm\13\n\3\13\3\13\3\13\3\f\3\f\3\f"+
		"\3\f\3\f\3\f\7\fx\n\f\f\f\16\f{\13\f\3\r\3\r\3\16\3\16\7\16\u0081\n\16"+
		"\f\16\16\16\u0084\13\16\3\16\3\16\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3"+
		"\17\3\17\5\17\u0091\n\17\3\17\3\17\3\17\5\17\u0096\n\17\3\17\3\17\5\17"+
		"\u009a\n\17\3\17\3\17\5\17\u009e\n\17\3\17\3\17\3\17\3\17\3\17\3\17\3"+
		"\17\3\17\3\17\3\17\5\17\u00aa\n\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17"+
		"\3\17\3\17\5\17\u00b5\n\17\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\5\20\u00c7\n\20\3\20\3\20\3\20\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\5\20\u00f4\n\20"+
		"\3\20\7\20\u00f7\n\20\f\20\16\20\u00fa\13\20\3\21\3\21\3\21\7\21\u00ff"+
		"\n\21\f\21\16\21\u0102\13\21\3\22\3\22\3\23\3\23\3\23\3\23\3\23\7\23\u010b"+
		"\n\23\f\23\16\23\u010e\13\23\3\23\3\23\6\23\u0112\n\23\r\23\16\23\u0113"+
		"\3\23\3\23\3\23\3\23\6\23\u011a\n\23\r\23\16\23\u011b\3\23\3\23\5\23\u0120"+
		"\n\23\3\23\7\23\u0123\n\23\f\23\16\23\u0126\13\23\3\23\3\23\3\23\5\23"+
		"\u012b\n\23\3\23\6\23\u012e\n\23\r\23\16\23\u012f\3\23\3\23\3\23\3\23"+
		"\3\23\5\23\u0137\n\23\3\23\2\4\26\36\24\2\4\6\b\n\f\16\20\22\24\26\30"+
		"\32\34\36 \"$\2\n\4\2\')\61\61\3\2\36\37\3\2 !\3\2\25\26\3\2\f\21\3\2"+
		"\22\24\3\2\27\30\3\2\62\65\2\u0163\2)\3\2\2\2\4\61\3\2\2\2\6\63\3\2\2"+
		"\2\b>\3\2\2\2\nC\3\2\2\2\fQ\3\2\2\2\16Y\3\2\2\2\20d\3\2\2\2\22f\3\2\2"+
		"\2\24n\3\2\2\2\26q\3\2\2\2\30|\3\2\2\2\32~\3\2\2\2\34\u00b4\3\2\2\2\36"+
		"\u00c6\3\2\2\2 \u00fb\3\2\2\2\"\u0103\3\2\2\2$\u0136\3\2\2\2&(\5\4\3\2"+
		"\'&\3\2\2\2(+\3\2\2\2)\'\3\2\2\2)*\3\2\2\2*,\3\2\2\2+)\3\2\2\2,-\7\2\2"+
		"\3-\3\3\2\2\2.\62\5\6\4\2/\62\5\n\6\2\60\62\5\16\b\2\61.\3\2\2\2\61/\3"+
		"\2\2\2\61\60\3\2\2\2\62\5\3\2\2\2\63\64\5\26\f\2\649\5\b\5\2\65\66\7\3"+
		"\2\2\668\5\b\5\2\67\65\3\2\2\28;\3\2\2\29\67\3\2\2\29:\3\2\2\2:<\3\2\2"+
		"\2;9\3\2\2\2<=\7\4\2\2=\7\3\2\2\2>A\7\61\2\2?@\7\5\2\2@B\5\36\20\2A?\3"+
		"\2\2\2AB\3\2\2\2B\t\3\2\2\2CD\7#\2\2DE\7\61\2\2EK\7\6\2\2FJ\5\16\b\2G"+
		"J\5\6\4\2HJ\5\f\7\2IF\3\2\2\2IG\3\2\2\2IH\3\2\2\2JM\3\2\2\2KI\3\2\2\2"+
		"KL\3\2\2\2LN\3\2\2\2MK\3\2\2\2NO\7\7\2\2OP\7\4\2\2P\13\3\2\2\2QR\7\61"+
		"\2\2RT\7\b\2\2SU\5\22\n\2TS\3\2\2\2TU\3\2\2\2UV\3\2\2\2VW\7\t\2\2WX\5"+
		"\32\16\2X\r\3\2\2\2YZ\5\20\t\2Z[\7\61\2\2[]\7\b\2\2\\^\5\22\n\2]\\\3\2"+
		"\2\2]^\3\2\2\2^_\3\2\2\2_`\7\t\2\2`a\5\32\16\2a\17\3\2\2\2be\7$\2\2ce"+
		"\5\26\f\2db\3\2\2\2dc\3\2\2\2e\21\3\2\2\2fk\5\24\13\2gh\7\3\2\2hj\5\24"+
		"\13\2ig\3\2\2\2jm\3\2\2\2ki\3\2\2\2kl\3\2\2\2l\23\3\2\2\2mk\3\2\2\2no"+
		"\5\26\f\2op\7\61\2\2p\25\3\2\2\2qr\b\f\1\2rs\5\30\r\2sy\3\2\2\2tu\f\4"+
		"\2\2uv\7\n\2\2vx\7\13\2\2wt\3\2\2\2x{\3\2\2\2yw\3\2\2\2yz\3\2\2\2z\27"+
		"\3\2\2\2{y\3\2\2\2|}\t\2\2\2}\31\3\2\2\2~\u0082\7\6\2\2\177\u0081\5\34"+
		"\17\2\u0080\177\3\2\2\2\u0081\u0084\3\2\2\2\u0082\u0080\3\2\2\2\u0082"+
		"\u0083\3\2\2\2\u0083\u0085\3\2\2\2\u0084\u0082\3\2\2\2\u0085\u0086\7\7"+
		"\2\2\u0086\33\3\2\2\2\u0087\u00b5\5\32\16\2\u0088\u00b5\5\6\4\2\u0089"+
		"\u008a\7*\2\2\u008a\u008b\7\b\2\2\u008b\u008c\5\36\20\2\u008c\u008d\7"+
		"\t\2\2\u008d\u0090\5\34\17\2\u008e\u008f\7+\2\2\u008f\u0091\5\34\17\2"+
		"\u0090\u008e\3\2\2\2\u0090\u0091\3\2\2\2\u0091\u00b5\3\2\2\2\u0092\u0093"+
		"\7,\2\2\u0093\u0095\7\b\2\2\u0094\u0096\5\36\20\2\u0095\u0094\3\2\2\2"+
		"\u0095\u0096\3\2\2\2\u0096\u0097\3\2\2\2\u0097\u0099\7\4\2\2\u0098\u009a"+
		"\5\36\20\2\u0099\u0098\3\2\2\2\u0099\u009a\3\2\2\2\u009a\u009b\3\2\2\2"+
		"\u009b\u009d\7\4\2\2\u009c\u009e\5\36\20\2\u009d\u009c\3\2\2\2\u009d\u009e"+
		"\3\2\2\2\u009e\u009f\3\2\2\2\u009f\u00a0\7\t\2\2\u00a0\u00b5\5\34\17\2"+
		"\u00a1\u00a2\7-\2\2\u00a2\u00a3\7\b\2\2\u00a3\u00a4\5\36\20\2\u00a4\u00a5"+
		"\7\t\2\2\u00a5\u00a6\5\34\17\2\u00a6\u00b5\3\2\2\2\u00a7\u00a9\7.\2\2"+
		"\u00a8\u00aa\5\36\20\2\u00a9\u00a8\3\2\2\2\u00a9\u00aa\3\2\2\2\u00aa\u00ab"+
		"\3\2\2\2\u00ab\u00b5\7\4\2\2\u00ac\u00ad\7/\2\2\u00ad\u00b5\7\4\2\2\u00ae"+
		"\u00af\7\60\2\2\u00af\u00b5\7\4\2\2\u00b0\u00b1\5\36\20\2\u00b1\u00b2"+
		"\7\4\2\2\u00b2\u00b5\3\2\2\2\u00b3\u00b5\7\4\2\2\u00b4\u0087\3\2\2\2\u00b4"+
		"\u0088\3\2\2\2\u00b4\u0089\3\2\2\2\u00b4\u0092\3\2\2\2\u00b4\u00a1\3\2"+
		"\2\2\u00b4\u00a7\3\2\2\2\u00b4\u00ac\3\2\2\2\u00b4\u00ae\3\2\2\2\u00b4"+
		"\u00b0\3\2\2\2\u00b4\u00b3\3\2\2\2\u00b5\35\3\2\2\2\u00b6\u00b7\b\20\1"+
		"\2\u00b7\u00b8\7\b\2\2\u00b8\u00b9\5\36\20\2\u00b9\u00ba\7\t\2\2\u00ba"+
		"\u00c7\3\2\2\2\u00bb\u00c7\7\61\2\2\u00bc\u00c7\5\"\22\2\u00bd\u00be\t"+
		"\3\2\2\u00be\u00c7\5\36\20\n\u00bf\u00c0\t\4\2\2\u00c0\u00c7\5\36\20\t"+
		"\u00c1\u00c2\t\5\2\2\u00c2\u00c7\5\36\20\b\u00c3\u00c7\7%\2\2\u00c4\u00c5"+
		"\7&\2\2\u00c5\u00c7\5$\23\2\u00c6\u00b6\3\2\2\2\u00c6\u00bb\3\2\2\2\u00c6"+
		"\u00bc\3\2\2\2\u00c6\u00bd\3\2\2\2\u00c6\u00bf\3\2\2\2\u00c6\u00c1\3\2"+
		"\2\2\u00c6\u00c3\3\2\2\2\u00c6\u00c4\3\2\2\2\u00c7\u00f8\3\2\2\2\u00c8"+
		"\u00c9\f\25\2\2\u00c9\u00ca\t\6\2\2\u00ca\u00f7\5\36\20\26\u00cb\u00cc"+
		"\f\24\2\2\u00cc\u00cd\t\7\2\2\u00cd\u00f7\5\36\20\25\u00ce\u00cf\f\23"+
		"\2\2\u00cf\u00d0\t\5\2\2\u00d0\u00f7\5\36\20\24\u00d1\u00d2\f\22\2\2\u00d2"+
		"\u00d3\t\b\2\2\u00d3\u00f7\5\36\20\23\u00d4\u00d5\f\21\2\2\u00d5\u00d6"+
		"\7\31\2\2\u00d6\u00f7\5\36\20\22\u00d7\u00d8\f\20\2\2\u00d8\u00d9\7\32"+
		"\2\2\u00d9\u00f7\5\36\20\21\u00da\u00db\f\17\2\2\u00db\u00dc\7\33\2\2"+
		"\u00dc\u00f7\5\36\20\20\u00dd\u00de\f\16\2\2\u00de\u00df\7\34\2\2\u00df"+
		"\u00f7\5\36\20\17\u00e0\u00e1\f\r\2\2\u00e1\u00e2\7\35\2\2\u00e2\u00f7"+
		"\5\36\20\16\u00e3\u00e4\f\f\2\2\u00e4\u00e5\7\5\2\2\u00e5\u00f7\5\36\20"+
		"\f\u00e6\u00e7\f\13\2\2\u00e7\u00f7\t\3\2\2\u00e8\u00e9\f\5\2\2\u00e9"+
		"\u00ea\7\"\2\2\u00ea\u00f7\7\61\2\2\u00eb\u00ec\f\4\2\2\u00ec\u00ed\7"+
		"\n\2\2\u00ed\u00ee\5\36\20\2\u00ee\u00ef\7\13\2\2\u00ef\u00f7\3\2\2\2"+
		"\u00f0\u00f1\f\3\2\2\u00f1\u00f3\7\b\2\2\u00f2\u00f4\5 \21\2\u00f3\u00f2"+
		"\3\2\2\2\u00f3\u00f4\3\2\2\2\u00f4\u00f5\3\2\2\2\u00f5\u00f7\7\t\2\2\u00f6"+
		"\u00c8\3\2\2\2\u00f6\u00cb\3\2\2\2\u00f6\u00ce\3\2\2\2\u00f6\u00d1\3\2"+
		"\2\2\u00f6\u00d4\3\2\2\2\u00f6\u00d7\3\2\2\2\u00f6\u00da\3\2\2\2\u00f6"+
		"\u00dd\3\2\2\2\u00f6\u00e0\3\2\2\2\u00f6\u00e3\3\2\2\2\u00f6\u00e6\3\2"+
		"\2\2\u00f6\u00e8\3\2\2\2\u00f6\u00eb\3\2\2\2\u00f6\u00f0\3\2\2\2\u00f7"+
		"\u00fa\3\2\2\2\u00f8\u00f6\3\2\2\2\u00f8\u00f9\3\2\2\2\u00f9\37\3\2\2"+
		"\2\u00fa\u00f8\3\2\2\2\u00fb\u0100\5\36\20\2\u00fc\u00fd\7\3\2\2\u00fd"+
		"\u00ff\5\36\20\2\u00fe\u00fc\3\2\2\2\u00ff\u0102\3\2\2\2\u0100\u00fe\3"+
		"\2\2\2\u0100\u0101\3\2\2\2\u0101!\3\2\2\2\u0102\u0100\3\2\2\2\u0103\u0104"+
		"\t\t\2\2\u0104#\3\2\2\2\u0105\u010c\5\30\r\2\u0106\u0107\7\n\2\2\u0107"+
		"\u0108\5\36\20\2\u0108\u0109\7\13\2\2\u0109\u010b\3\2\2\2\u010a\u0106"+
		"\3\2\2\2\u010b\u010e\3\2\2\2\u010c\u010a\3\2\2\2\u010c\u010d\3\2\2\2\u010d"+
		"\u0111\3\2\2\2\u010e\u010c\3\2\2\2\u010f\u0110\7\n\2\2\u0110\u0112\7\13"+
		"\2\2\u0111\u010f\3\2\2\2\u0112\u0113\3\2\2\2\u0113\u0111\3\2\2\2\u0113"+
		"\u0114\3\2\2\2\u0114\u0119\3\2\2\2\u0115\u0116\7\n\2\2\u0116\u0117\5\36"+
		"\20\2\u0117\u0118\7\13\2\2\u0118\u011a\3\2\2\2\u0119\u0115\3\2\2\2\u011a"+
		"\u011b\3\2\2\2\u011b\u0119\3\2\2\2\u011b\u011c\3\2\2\2\u011c\u0124\3\2"+
		"\2\2\u011d\u011f\7\n\2\2\u011e\u0120\5\36\20\2\u011f\u011e\3\2\2\2\u011f"+
		"\u0120\3\2\2\2\u0120\u0121\3\2\2\2\u0121\u0123\7\13\2\2\u0122\u011d\3"+
		"\2\2\2\u0123\u0126\3\2\2\2\u0124\u0122\3\2\2\2\u0124\u0125\3\2\2\2\u0125"+
		"\u0137\3\2\2\2\u0126\u0124\3\2\2\2\u0127\u012d\5\30\r\2\u0128\u012a\7"+
		"\n\2\2\u0129\u012b\5\36\20\2\u012a\u0129\3\2\2\2\u012a\u012b\3\2\2\2\u012b"+
		"\u012c\3\2\2\2\u012c\u012e\7\13\2\2\u012d\u0128\3\2\2\2\u012e\u012f\3"+
		"\2\2\2\u012f\u012d\3\2\2\2\u012f\u0130\3\2\2\2\u0130\u0137\3\2\2\2\u0131"+
		"\u0132\5\30\r\2\u0132\u0133\7\b\2\2\u0133\u0134\7\t\2\2\u0134\u0137\3"+
		"\2\2\2\u0135\u0137\5\30\r\2\u0136\u0105\3\2\2\2\u0136\u0127\3\2\2\2\u0136"+
		"\u0131\3\2\2\2\u0136\u0135\3\2\2\2\u0137%\3\2\2\2!)\619AIKT]dky\u0082"+
		"\u0090\u0095\u0099\u009d\u00a9\u00b4\u00c6\u00f3\u00f6\u00f8\u0100\u010c"+
		"\u0113\u011b\u011f\u0124\u012a\u012f\u0136";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}