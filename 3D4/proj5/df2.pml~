#define NUM 4
bool forks[NUM]
bool eating[NUM]

active [NUM] proctype philosophers()
{
L1:
	if
	::(_pid%2==0)->
		atomic{
			(forks[_pid]==0);
			forks[_pid]=1;
		}
		atomic{
			(forks[(_pid+1)%NUM]==0);
			forks[(_pid+1)%NUM]=1;
		}
	::(_pid%2 == 1)->
		atomic{
			(forks[(_pid+1)%NUM]==0);
			forks[(_pid+1)%NUM] =1;
		}
		atomic{
			(forks[_pid]==0);
			forks[_pid]=1;
		}
	fi;
	eating[_pid]=1;
	printf(" %d eating \n", _pid);
	
	if
	:: (_pid ==0) -> progress0: skip;
	:: (_pid ==1) -> progress1: skip;
	:: (_pid ==2) -> progress2: skip;
	:: (_pid ==3) -> progress3: skip;
	:: (_pid ==4) -> progress4: skip;
	fi;
	
	eating[_pid] =0;
	forks[_pid] =0;
	forks[(_pid+1)%NUM] =0;
	
	goto L1;
}
active [NUM] proctype monitor ()
{
	assert ((!eating[_pid-NUM])|| (eating[_pid-NUM] && forks[_pid-NUM] && forks[(_pid-NUM+1)%NUM] && !eating[(_pid-NUM+1)%NUM] && !eating[(_pid-NUM-1+NUM)%NUM]));

}
