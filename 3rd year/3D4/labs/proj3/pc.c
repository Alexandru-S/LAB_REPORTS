#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#define MAX 50		/* Numbers to produce */
pthread_mutex_t the_mutex;
pthread_cond_t condc, condp;
int buffer = 0;


void* producer(void *ptr)
{
	int i;
	for (i = 1; i <= MAX; i++) 
	{
		/* lock mutex */
		pthread_mutex_lock(&the_mutex);
		/* wait if buffer not 0*/
		while (buffer != 0)	
		{	       
  			pthread_cond_wait(&condp, &the_mutex);
  			printf("\nproducer buffer not 0, waiting...\n");
  			printf("\nNumber in producer buffer: ");
  			printf("%i",buffer);
      		}
    		buffer = i;
    		printf("\nNumber made by producer: ");
    		printf("%i", i);
    		/* wake up consumer */
    		pthread_cond_signal(&condc);	
    		/* unlock mutex */
    		pthread_mutex_unlock(&the_mutex);	
    		sleep(2);
  	}
  	pthread_exit(0);
  	/*otherwise deadlock*/
}

void* consumer(void *ptr)
{
  	int i;

	for (i = 1; i <= MAX; i++)
	{
  		/* lock mutex */
    		pthread_mutex_lock(&the_mutex);	
    		/* If there is nothing in the buffer then wait */
    		while (buffer == 0)
    		{		
  			pthread_cond_wait(&condc, &the_mutex);
  			printf("\n---consumer buffer 0, waiting...\n");
  			
    		}
    		printf("\nNumber in consumer buffer: ");
    		printf("%i", i);
    		buffer = 0;
    		/* wake up consumer */
    		pthread_cond_signal(&condp);	
    		/* unlock mutex */
   	 	pthread_mutex_unlock(&the_mutex);
   	 	sleep(2);	
  	}
  	pthread_exit(0);
  	/*otherwise deadlock*/
}

int main(int argc, char **argv) {
  pthread_t pro, con;

  /*initialize the mutex and condition variables*/
  pthread_mutex_init(&the_mutex, NULL);	
  /* initialize consumer and producer conditional*/
  pthread_cond_init(&condc, NULL);	
  pthread_cond_init(&condp, NULL);		

  /*create producer and consumer thread*/
  pthread_create(&con, NULL, consumer, NULL);
  pthread_create(&pro, NULL, producer, NULL);

  // Wait for the threads to finish*/
  // Otherwise main might run to the end*/
  // and kill the entire process when it exits.*/
  pthread_join(&con, NULL);
  pthread_join(&pro, NULL);

  /*buffer wiped at end of process*/
  /* destroy mutex */
  pthread_mutex_destroy(&the_mutex);
  /* destroy consumer thread*/	
  pthread_cond_destroy(&condc);	
  /* destroy producer thread*/	
  pthread_cond_destroy(&condp);		
}
