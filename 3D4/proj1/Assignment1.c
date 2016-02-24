#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <signal.h>

union params {
    unsigned long long idx;
    double sum;
};

#define module (1299709L)
#define num_steps_per_check (10)

unsigned long long *CntIter = NULL;
unsigned long long max_iter = 0;
int num_threads = 0;
int is_interrupted = 0;
pthread_rwlock_t rwlock = PTHREAD_RWLOCK_INITIALIZER;

void* partial_sum(void *ptr);

void handlesgint(int sig);

int main(int argc, char* argv[])
{
    double pi = 0;
    unsigned long long i;
    int opt;
    pthread_t* ids;
    union params* params;
    int ret_code = 0;

    // parse command line
    if (1 == argc) {
        fprintf(stderr, "Usage: %s -n num_threads\n", argv[0]);
        exit (EXIT_FAILURE);
    }

    while ((opt = getopt(argc, argv, "n:")) != -1)
    {
        switch (opt)
        {
            case 'n':
                num_threads = atoi(optarg);
                if (num_threads <= 0 /*|| num_threads >= _POSIX_THREAD_THREADS_MAX*/) {
                    fprintf(stderr, "quantity of threads invalid\n");
                    exit(EXIT_FAILURE);
                }
                break;
            default:
                fprintf(stderr, "Usage: %s -n num_threads\n", argv[0]);
                exit(EXIT_FAILURE);
        }
    }

    // setting handler
    if (SIG_ERR == signal(SIGINT, handlesgint)) {
        perror("fail signal");
        exit(EXIT_FAILURE);
    }

    // init memory
    params = (union params *)malloc(num_threads * sizeof(union params));
    CntIter = (unsigned long long *)calloc(num_threads, sizeof(long long));
    ids = (pthread_t *)malloc(num_threads * sizeof(pthread_t));

    // operation distribution
    for (i = 0; i < num_threads; ++i) {
        params[i].idx = i;
        ret_code = pthread_create(ids + i, NULL, partial_sum, (void*)(params + i));
        if (0 != ret_code) {
            perror("pthread create");
            exit (EXIT_FAILURE);
        }
    }

    // joining
    for (i = 0; i < num_threads; ++i) {
        union params* res;
        ret_code = pthread_join(ids[i], (void **)&res);
        if (0 != ret_code) {
            perror("pthread join");
            exit (EXIT_FAILURE);
        }
        pi += res->sum;
    }

    pi *= 4.0;
    printf ("\npi = %.16f\n", pi);

    // free resources
    free(params);
    free(ids);
    free(CntIter);

    return (EXIT_SUCCESS);
}

void* partial_sum(void *ptr) {
    double sum = 0;
    int idx = ((union params *)ptr)->idx;
    unsigned long long i = 0;
    unsigned long long index = 0;
    int ret_code = 0;
    int terminating = 0;
    int sign = 0;
    sigset_t set;

    // Block SIGINT
    sigemptyset(&set);
    sigaddset(&set, SIGINT);
    ret_code = pthread_sigmask(SIG_BLOCK, &set, NULL);
    if (0 != ret_code) {
        perror("fail sigmask");
        exit(EXIT_FAILURE);
    }

    i = 0;
    while (0 == terminating) {
        index = num_threads * i + idx;
        sign = (0 == index % 2 ? 1 : -1);
        sum += sign * (1.0 / (2 * index + 1));


        //fprintf(stderr, "thread : %d iterate - %lld index : %lld\n", idx, i, index);

        CntIter[idx] = (CntIter[idx] + 1) % module;

        // if (i == 1000000L) {
        //  break;
        // }

        // check flag
        if (0 == (i % num_steps_per_check)) {
            pthread_rwlock_rdlock(&rwlock);
            if (1 == is_interrupted) {
                terminating = 1;
            }
            pthread_rwlock_unlock(&rwlock);
        }
        ++i;
    }

    // complete iterations
    for (; i < max_iter; ++i) {
        index = num_threads * i + idx;
        sign = (0 == index % 2 ? 1 : -1);
        sum += sign * (1.0 / (2 * index + 1));
    }

    //fprintf(stderr, "FINISH : thread : %d iterate - %lld\n", idx, i);

    ((union params *)ptr)->sum = sum;
    return ptr;
}

void handlesgint(int sig) {
    unsigned long long i;

    max_iter = 0;
    pthread_rwlock_wrlock(&rwlock);

    // find max iterations
    for (i = 0; i < num_threads; ++i) {
        if (CntIter[i] > max_iter) {
            max_iter = CntIter[i];
        }
    }

    is_interrupted = 1;
    pthread_rwlock_unlock(&rwlock);
}
