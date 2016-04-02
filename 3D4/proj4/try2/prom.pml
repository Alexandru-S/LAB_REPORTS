/* global variable n */
int n = 0;
int pc = 0;
proctype p()
{
int ptemp = 0;
	do
	::(ptemp<9)->
		if
		:: 
			ptemp = n;
			ptemp++;
			n = ptemp;
			printf("this is p->n");
			printf("%u",n);			
		fi;
		::else -> goto end;	
	od
	end:
	pc++;
	
}
proctype q()
{
int qtemp = 0;
	do
	::(qtemp<9)->
		if
		:: 
			qtemp =n;
			qtemp++;
			n = qtemp;
			printf("this is q->n");
			printf("%u",n);	
					
		fi;	
		::else -> goto end2;	
	od
	end2:
	pc++;
	
}
init
{
		run p();
		run q();
		pc==2;
		assert(n!=2);				
}
