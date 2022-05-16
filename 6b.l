%{
#include<stdio.h>
#include"y.tab.h"
extern yylval;
%}

%%
[\t] ;
[+|-|*|/|+|>|>] {printf("operator is %s\n",yytext);return OP;}
[0-9]+ {yylval=atoi(yytext); printf("numers is %d\n",yylval);return DIGIT;}
int|char|float|void|for|do|while|if|else|return|switch|case {printf("keyword is %s\n",yytext);return KEY;}
[a-zA-Z0-9]+ {printf("identifier is %s\n",yytext);return ID;}
. ;
%%

