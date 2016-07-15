#define NUM 5
bool spoon[NUM]
bool eat[NUM]

active [NUM] proctype P()
{
TOP:
	/*pick up right fork*/
	if
	::(_pid%2==1)->
		atomic{
			/*_pid is a predefined local read-only variable of type pid, whish stores an instantiation number*/
			(spoon[_pid]==0);
			spoon[_pid]=1;
		}
		/*usign atomic for spoon*/
		atomic{
			(spoon[(_pid+1)%NUM]==0);
			spoon[(_pid+1)%NUM]=1;
		}
	/*pick up left fork*/
	::(_pid%2 == 0)->
		atomic{
			(spoon[(_pid+1)%NUM]==0);
			spoon[(_pid+1)%NUM] =1;
		}
		atomic{
			(spoon[_pid]==0);
			spoon[_pid]=1;
		}
	fi;
	eat[_pid]=1;
	printf(" %d eat \n", _pid);
	/*release spoon*/
	eat[_pid] =0;
	spoon[_pid] =0;
	spoon[(_pid+1)%NUM] =0;
	printf(" %d put down f \n", _pid);
	/*go back to top*/
	goto TOP;
}
active [NUM] proctype main ()
{
	/*example noteat(2-1=1) or eat( 2-1 =1) and left fork and right fork and not left left fork and not right right fork*/
	assert ((!eat[_pid-NUM])|| (eat[_pid-NUM] && spoon[_pid-NUM] && spoon[(_pid-NUM+1)%NUM] && !eat[(_pid-NUM+1)%NUM] && !eat[(_pid-NUM-1+NUM)%NUM]));

}

