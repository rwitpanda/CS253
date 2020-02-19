%{
    #include<iostream>
    #include "y.tab.h"
    #include<cstring>
    #include<stdlib.h>
    void yyerror (char *s);
    //typedef YYSTYPE yylval;
    extern int unary_fl;
%}

digit    [0-9]
float	 {digit}+(\.){digit}+ 	
alpha    [a-zA-Z_]
alphanum ({alpha}|{digit})
ws       [ \t\n]
%%
#.*$			;
"calculate"		{ return print; }
"print"			{ return print; }
"exit"			{ return exit_command; }
{digit}+		{ yylval.num = atof(yytext); return number; }
{float}+		{ yylval.num = atof(yytext); return number; }
cos|COS			{ return COS; }
sin|SIN			{ return SIN; }
tan|TAN			{ return TAN; }
log|LOG			{ return LOG; }
pow|POW			{ return POW; }
{alpha}{alphanum}*	{ yylval.id = strdup(yytext); return identifier;}
{ws}                	;
[-+\(\)=/*;,]            { return yytext[0]; }
.                      	{ ECHO;  yyerror("Unexpected Character"); }
%%
int yywrap (void) 	{ return 1; }
