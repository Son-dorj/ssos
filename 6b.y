%{
#include<stdio.h>
#include<stdlib.h>
int id=0, dig=0, key=0, op=0;
%}

%token DIGIT OP KEY ID
%%
input:
DIGIT input {dig++;}
|ID input {id++;}
|KEY input {key++;}
|OP input {op++;}
|DIGIT {dig++;}
|ID {id++;}
|KEY {key++;}
|OP {op++;}
;
%%
#include<stdio.h>
extern int yylex();
extern int yyparse();
extern FILE *yyin;
main()
{
	FILE *mf=fopen("f1.c","r");
	if(!mf)
	{	("cant open file");
		return -1;
	}
	yyin=mf;
	do{
	yyparse();
	}while(!feof(yyin));
	printf("numbers=%d\nkeywords=%d\nidentifiers=%d\noperators=%d\n",dig,key,id,op);
}
void yyerror()
{
	printf("error! message: ");
	exit(-1);
}
