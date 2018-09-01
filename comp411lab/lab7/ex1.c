#include <stdio.h>
#include <string.h>
#include <stdlib.h>
main()
{
  int start =0;
  char* input;
  int out = 0;
   for(start; start<10000; start++)
   {
	input = malloc(21);
	fgets(input, 20, stdin);
	out = a_to_i(input);
	printf("%d\n", out);
 
	if( out == 0)
	break; 
   }
//	printf("%d\n", a_to_i(a));

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


