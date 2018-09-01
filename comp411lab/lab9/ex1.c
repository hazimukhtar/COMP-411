#include <stdio.h>
#include <string.h>
#include <stdlib.h>
main()
{
  int start =0;
  int out = 0;
  int output;
  int fib;
  while(fib!=0)
  {
    scanf("%d", &fib);
    output = fibonacci(fib);
    printf("%d\n", output);
  }

}

int fibonacci (int n)
{
  
  if(n==0)
  return 0;
  if(n==1)
  return 1;
  return (fibonacci(n-1) + fibonacci(n-2));	
}
