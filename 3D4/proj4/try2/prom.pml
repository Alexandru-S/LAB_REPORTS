/* global variable n */
show int n = 0;
show int ptemp = 0;
show int qtemp = 0;
        
proctype p()
{
	do
	::(ptemp<10)->
		if
		:: 
			ptemp = n;
			ptemp++;
			n = ptemp;
			printf("this is p->n");
			printf("%u",n);
			
		fi;
	od
}
proctype q()
{
	do
	::(qtemp<10)->
		if
		:: 
			qtemp =n;
			qtemp++;
			n = qtemp;
			printf("this is q->n");
			printf("%u",n);
			
		fi;
	od
}

init
{

	do
	::(ptemp < 10) || (qtemp < 10)
		if
		::run p();
		::run q();

			do
			::(ptemp == qtemp)
			if
			::printf("conflict");
			fi;
			od;
			
			do
			::((ptemp || qtemp) >11)
			if
			::printf("end");
			break;
			fi;
			od;
			
		fi;
	od;	
}
