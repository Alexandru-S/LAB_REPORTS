#include <stdio.h> 
#include <pthread.h>
#include <stdlib.h>
#include <unistd.h>
/* specify phil number*/
#define NP 5
/* number of threads */
pthread_t dinners[NP];
/*number of mutex's*/
pthread_mutex_t mutex_spoon = PTHREAD_MUTEX_INITIALIZER;; 
int spoon[NP];



void dinner(int i)
{
	/*define right*/
    int right = i;
    /*define left*/
    int left = (i - 1 == -1) ? NP - 1 : (i - 1);
    /*initialize int locked*/
    int locked;
     /*while loop*/
    while(1)
    {
    		/*define spoons as unlocked*/
            locked = 0;
            /*thus, while unlocked*/
            while(!locked)
            {
                pthread_mutex_lock(&mutex_spoon);
                /*if spoon on left or right is feee*/
                if(spoon[right] || spoon[left])
                {
                	/*unlock spoon your not using*/
                    pthread_mutex_unlock(&mutex_spoon);     
                    printf("**waiting ->phil %d \n",i); 
                    usleep(25);
                    continue;
                }
                /*this is assuming the spoon on left or right was
                not taken*/
                /*take both*/
                spoon[right] = 1; // take spoon.
                spoon[left] = 1;

                pthread_mutex_unlock(&mutex_spoon);
                /*lockk spoons*/
                locked = 1; 
            }
	/*eat for 25*/
        printf("++eating ->phil %d \n",i);
        usleep(25);
        printf("--finished eating -> phil %d \n",i);
        /*unlock spoons*/
        pthread_mutex_lock(&mutex_spoon); 
        /*on right and left*/
        spoon[right] = 0;
        spoon[left] = 0;
        pthread_mutex_unlock(&mutex_spoon);
        /*go to sleep for 50*/
        usleep(50);
    }

}

int main()
{
	int j;
    for(j=0; j<NP; j++)
    {
        spoon[j] = 0;
    }
    int i;
    /*for each dinner create a pthread*/
    for(i=0; i<NP; i++)
        pthread_create( &dinners[i], NULL, dinner, (void*)i);
        /*for each dinner , attempt to eat*/
    for(i=0; i<NP; i++)
        pthread_join(dinners[i],NULL);
    return 0;
} 
