#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>

const int MAX = 13;

static void doFib(int n, int doPrint);


/*
 * unix_error - unix-style error routine.
 */
inline static void 
unix_error(char *msg)
{
    fprintf(stdout, "%s: %s\n", msg, strerror(errno));
    exit(1);
}


int main(int argc, char **argv)
{
  int arg;
  int print;

  if(argc != 2){
    fprintf(stderr, "Usage: fib <num>\n");
    exit(-1);
  }

  if(argc >= 3){
    print = 1;
  }

  arg = atoi(argv[1]);
  if(arg < 0 || arg > MAX){
    fprintf(stderr, "number must be between 0 and %d\n", MAX);
    exit(-1);
  }

  doFib(arg, 1);

  return 0;
}

/* 
 * Recursively compute the specified number. If print is
 * true, print it. Otherwise, provide it to my parent process.
 *
 * NOTE: The solution must be recursive and it must fork
 * a new child for each call. Each process should call
 * doFib() exactly once.
 */
static void 
doFib(int n, int doPrint)
{
  int status_1,status_2;
  pid_t pid_1, pid_2;
  int sum = 0;

  //base case
  if(n == 0){
    if(doPrint){
      printf("%d\n", 0);
    }
    exit(0);
  }
  else if(n == 1 || n==2){
    if(doPrint){
      printf("%d\n",1);
    }
    exit(1);
  }
  //recursive call with child process
  else{
    pid_1 = fork();
    if(pid_1 == 0){
      doFib(n-1,0);
    }
      pid_2 = fork();
      if(pid_2 ==0)
        doFib(n-2, 0);
      else if(pid_2 != 0){
        wait(&status_1);
        status_1 = WEXITSTATUS(status_1);
        // printf("status_1: %d\n", status_1);

        wait(&status_2);
        status_2 = WEXITSTATUS(status_2);
        if(doPrint == 1){
          printf("%d\n", status_1+status_2);
        }
        exit(status_1+status_2);
      }
  }
}


