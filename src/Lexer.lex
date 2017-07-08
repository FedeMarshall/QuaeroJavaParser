package java_quaero.parser;

import java_cup.runtime.Symbol;

%%

%public 
%class Lexer
%cupsym Tokens
%cup
%implements Tokens

%{ 
	/* Embedded lexer class code */  
%}

%% 
// Tokens.
 
"("	  { return new Symbol(PARI); }
")"	  { return new Symbol(PARD); }
":"	  { return new Symbol(COLON); }
","   { return new Symbol(COMMA); }
"~"	  { return new Symbol(NEG, yyline, yycolumn, yytext()); }
"/\\" { return new Symbol(CONJ, yyline, yycolumn, yytext()); }
"\\/" { return new Symbol(DISY, yyline, yycolumn, yytext()); }
"->"  { return new Symbol(COND, yyline, yycolumn, yytext()); }
"<->" { return new Symbol(BICOND, yyline, yycolumn, yytext()); }
";"   { return new Symbol(PUNTOCOMA); }
"="   { return new Symbol(IGUAL); }

[a-zA-Z_]\w* { return new Symbol(ID, yyline, yycolumn, yytext()); }
\"[^\n\"]*\" { return new Symbol(STRING, yyline, yycolumn, yytext()); }
(\d*\.)?\d+([eE][+-]?\d+)? { return new Symbol(NUM, yyline, yycolumn, Double.parseDouble(yytext()); }
true|false {return new Symbol(BOOL, yyline, yycolumn, Boolean.valueOf(yytext()); }
\/\*([^\*]|\*+[^\/])*\*+\/  { return new Symbol(COM, yyline, yycolumn, yytext()); }
[ \t\r\n\f\v]+

[ \t\r\n\f\v]+
	{ /* Ignore */ }

.	{ /* Fallback */
		return new Symbol(error, "Unexpected input <"+ yytext() +">!"); 
	}