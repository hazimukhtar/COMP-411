#include <stdio.h>
#include <string.h>
#include <stdlib.h>
main()
{
  int start =0;
  char* input;
  int out = 0;
  int fac =0;
   for(start; start<10000; start++)
   {
	input = malloc(21);
	fgets(input, 20, stdin);
	out = a_to_i(input);
	fac = factorial(out);
	printf("%d\n", fac);
 
	if( out == 0)
	break; 
   }

}


int a_to_i(char* str)
{
  int x =0;
  int sum =0;
  int length = 0;
  length = strlen(str)-1;
  for(x; x<length; x++)
	{
		if((int) str[x] == 0){
		return sum;
		break;
		}
		sum = sum*10 + ((int) str[x]-48);	
	}
	return sum;
}


int factorial(int n)
{
  int i;
  int product=1;
  if(n ==0)
    return 1;
  for (i=n; i>0; i--) 
  {
    product *=i;
  }
	return product;
}
