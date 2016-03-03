#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>
#include <time.h>
#include <sys/time.h> // for clock_gettime()
#include <unistd.h> // for usleep()

/**********************************************************************/
/* STRUCT REPLACING THE GLOBAL VARIABLE*/
/**********************************************************************/ 
struct sum_runner_struct
{
	long long limit;
	long long answer;
};
/**********************************************************************/

/**********************************************************************/
/*FUNCTION PERORMING THE COMPUTATIONS*/
/**********************************************************************/
void * sum_runner(void* arg)
{
	long double n;	/* N FOR ITERATTION */
	double i, j;	/* I AND J IN FOR LOOP*/
   	double f;       /* factor that repeats*/
   	long double pi = 1;		/* initial value for pi*/


	struct sum_runner_struct  *arg_struct= (struct sum_runner_struct *)arg;
	long long sum =0;
	long long q;
	/*for each itteration*/
	/*compute the respective approximation numbers*/
	for( q=0; q<=arg_struct->limit; q++)
	{
		/*the respective approximation[j]*/
		for(j=n;j>i; j--)
		{
			f=2;
			for(i=1;i<j;i++)
			{
				f = 2 + sqrt(f);
     			}
			f = sqrt(f);
			pi = pi * f / 2;
		}
		pi *= sqrt(2) / 2;
   		pi = 2 / pi;
		sum=pi;
	}
	arg_struct->answer=pi;
	pthread_exit(0);
}
/**********************************************************************/

int main(int argc, char **argv)
{
	/**********************************************************************/
	/* TIME VARIABLES DECLARED*/
	/**********************************************************************/
	struct timeval start, end;
   	 long secs_used,micros_used;
    	gettimeofday(&start, NULL);/* starts at 0*/
    	usleep(1250000); // Do the stuff you want to time here
    	gettimeofday(&end, NULL);
    	/**********************************************************************/

	/**********************************************************************/
	/*WARNING ALARM IF ITERATIONS NOT NPUTTED*/
	/**********************************************************************/
	if(argc<2)
	{
		printf("Usage %s Number of iterations of pi <num 1> <num 2> ... <num-n>\n", argv[0]);
		exit(-1);
	}
	/**********************************************************************/
	int num_args =argc -1;
	struct sum_runner_struct args[num_args];
	
	/**********************************************************************/
	/*pthread id*/
	/**********************************************************************/
	pthread_t tids[num_args];
	int j;
	for(j=0;j<num_args;j++)
	{
		args[j].limit = atoll(argv[j+1]);
		
		pthread_attr_t attr;
		pthread_attr_init(&attr);
		pthread_create(&tids[j], &attr, sum_runner,&args[j]);
	}
	/**********************************************************************/
	
	/**********************************************************************/
	/*wait until thread is done and print the answer*/
	/**********************************************************************/
	int y;
	for(y=0;y<num_args;y++)
	{
		pthread_join(tids[y], NULL);
		printf("Pi approximation %d is %lld \n",y ,args[y].answer);
	}
	/**********************************************************************/
	
	/**********************************************************************/
	/*RECORD AND DISPLAY TIME*/
	/**********************************************************************/
	printf("\nstart: %d secs, %d usecs\n",start.tv_sec,start.tv_usec);
    	printf("end: %d secs, %d usecs\n",end.tv_sec,end.tv_usec);
    	/*avoid overflow by subtracting first*/
    	secs_used=(end.tv_sec - start.tv_sec); 
    	micros_used= ((secs_used*1000000) + end.tv_usec) - (start.tv_usec);
    	printf("microseconds elapsed: %d\n\n",micros_used);
	/**********************************************************************/
}

