#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <time.h>
#include <unistd.h>

/*
 * receive process ID and send SIGUSR1 signal to that PID
 *
 * 
 */
 //#Terry and Jishen drove here
int main(int argc, char **argv)
{
  kill(atoi(argv[1]), SIGUSR1);
  return 0;
}
