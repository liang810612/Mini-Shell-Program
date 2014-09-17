#include <assert.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <time.h>
#include <unistd.h>
#include "util.h"

/*
 * signal handler
 * catch SIGINT and SIGUSR1 and print different messages
 */

void handler(int sig){
	if(sig == SIGINT){
		ssize_t bytes; 
		const int STDOUT = 1; 
		bytes = write(STDOUT, "Nice try.\n", 10); 
		if(bytes != 10) 
	   		exit(-999);
	}
	if(sig == SIGUSR1){
		ssize_t bytes; 
		const int STDOUT = 1; 
		bytes = write(STDOUT, "exiting.\n", 10); 
		if(bytes != 10) 
   			exit(-999);
   		exit(1);
	}
}




/*
 * First, print out the process ID of this process.
 *
 * Then, set up the signal handler so that ^C causes
 * the program to print "Nice try.\n" and continue looping.
 *
 * Finally, loop forever, printing "Still here\n" once every
 * second.
 */
int main(int argc, char **argv)
{
	printf("Process ID: %d\n", (int)getpid());
	signal(SIGINT, handler);
	signal(SIGUSR1, handler);

	struct timespec ts;
	ts.tv_sec = 1;
	while(1){
		nanosleep(&ts, NULL); 
			printf("still here\n");
	}
  return 0;
}


