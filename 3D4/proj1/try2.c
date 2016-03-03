#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>
#include <float.h>
#include <stdint.h>
/*function to genereate pi*/
double pi=1;

void* sum_runner(void* arg)
{
	double n, i, j; /* N FOR ITERATTIONS , I AND J IN FOR LOOP*/
   	double f; 

	double *limit_ptr = (double* )arg;
	double limit = *limit_ptr;           // factor that repeats
   	//double pi = 1;
      
   	/*printf("Approximation of the number PI through the Viete's series\n");*/
   	printf("\nEnter the number of iterations: ");
   	scanf("%lf",&limit);
   	printf("\nProgrm calculationg......\n");   
    	/*Viete's algorythm*/
   	for(i = limit; i > 1; i--) 
   	{
   		f = 2;
      		for(j = 1; j < i; j++)
      		{
        		f = 2 + sqrt(f);
      		}
      		f = sqrt(f);
      		pi = pi * f / 2;
   	}
   	pi *= sqrt(2) / 2;
   	pi = 2 / pi;
   
   	//printf("\nAproximated value of PI = %1.16lf\n", pi); 
	 
	pthread_exit(0);
	
}



int main(int argc, char **argv)
{
	if(argc<2)
	{
		printf("To use: %s <num>\n", argv[0]);
		exit(-1);
	}
	int num_args= argc-1;
	
	/*Thread id*/
	pthread_t tids[num_args];
	int i;
	/*creates a different thread for all the
	number of arguments inputted*/
	for(i=0;i<num_args;i++)
	{
		double limit = atoll(argv[i+1]);
		/*Creating the thread attributes*/
		pthread_attr_t attr;
		pthread_attr_init(&attr);
		pthread_create(&tids[i],&attr,sum_runner,&limit);
	}
	
	for(i=0;i<num_args;i++)
	{
		pthread_join(tids[i],NULL);
	}
	
	printf("Approximation of pi  is %F \n",pi);
	//printf("\nAproximated value of PI = %1.16lf\n", pi); 
}

