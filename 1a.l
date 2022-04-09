%{
int a[]={0,0}, i, v=1, o=0;
void ex();
%}
%x O
%%
[a-zA-Z0-9]+ 	{ BEGIN O; o++;}
<O>"+" 		{ if(v) { v=0;i=0; } else ex(); }
<O>"*" 		{ if(v) { v=0;i=1; } else ex(); }
<O>[a-zA-Z0-9]+ 	{ o++;
				if(v==0)
				{
					v=1;a[i]++;
				}
				else
					ex();
			}
<O>"\n" 		{ if(v==0) 
				ex();
			  else
			  	return 0;
			}
.|\n			ex();
%%
void ex()
{
	printf("invalid expression\n");
	exit(0);
}
void main()
{
	printf("enter\n");
	yylex();
	if(v==0)
		printf("not valid expression");
	else
	{
		printf("valid expression\n");
		printf("no of operand : %d \n",o);
		printf("no of addition : %d \n",a[0]);
		printf("no of multiply : %d \n",a[1]);
	}
}
