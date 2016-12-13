mtype = { P, Q , N};
mtype turn = P;
pid who;
int n=0;

	
inline request(x,y,z)
{
	atomic{x == y -> x = z; who = _pid}
}
inline release(x,y)
{
	atomic{x = y ; who = 0}
}


	
active [2] proctype producer()
{
	if
	:: (n<121) ->
		do
		:: request(turn, P, Q) ->
			printf("Produce: %d", _pid);
			assert(who == _pid);
			
			printf("%u",n);
			printf("\n");
			n++;
			release(turn,Q)
			
		od
	fi
}	
active [2] proctype consumer()
{
	if
	:: (n<121) ->
		do
		:: request(turn, Q,P) ->
			printf("Consume: %d", _pid);
			assert(who == _pid);
			
			printf("%u",n);
			printf("\n");
			n++;
			release(turn,P)
		
		od
	fi
}

