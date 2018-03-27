/**
 *   Name: 	Sigint.c
 *   Author: 	Charles Kann
 *   Date:  	August 22, 2002
 *
 *   Purpose:	This program shows how to override the interrupt handler
 *		for a SIGINT (CTRL-C).
 */

#include <stdio.h>
#include <signal.h>

/** 
 *  Define the method to be called when CTRL-C is pressed.
 */
void programInterrupted(int i) 
{
    printf("In the signal interrupt routine\n");
}

void processAlarm(int i) 
{
    printf("In the signal interrupt routine\n");
}
/**
 *   Main method, shows how to map another function over the CTRL-C
 */
int main() 
{
    int i;
    /*  The sigset sets the interrupt to another vector (method address).
     *  In this case the SIGNT interrupt is set to call the 
     *  programInterrupted function defined above.
     */
    sigset(SIGINT, programInterrupted);
    sigset(SIGALARM, processAlarm);
    /*  Now just go into a loop for a few seconds to show what happens when
     *  CTRL-C is pressed.  Press Control C while this is running and you
     *  will see that the interrpts are turned off and are going to the 
     *  interrup method and printing out an error.
     */
    for (i = 30; i < 45; i++) {
        printf("fib(%d) = %d\n", i, fib(i));
    }
}

int fib(int n) 
{
    if (n <= 1)
	return 1;
    return (fib(n-1) + fib(n-2));
}

public class Fibonacci
{
    private static int counter = 0;
 
    public static void main(String argv[]) {
       for (int i = 3; i < 45; i++) {
           System.out.println("Num = " + i + "  Fib = " +
             fibonacci(i) + "  time = " + counter);
        }
    }
 
    public static int fibonacci(int NI) {
        if (NI <= 1) return 1;
        return fibonacci(NI - 1) + fibonacci(NI - 2);
    }
}