#include <stdio.h>



main()
{
  int first = 0;
  int second = 1;
  int sum;
  int input =1;
  while(input!=0){
  	printf("%s", "Number [1-1000]: ?\n");
  	scanf("%d", &input);
	if(input ==0)
	{
		printf("%s", "Done\n");
		return;
	}
	int next = first + second;
        int after = next + second;
	int finish =1;
  	while(after<1001)
		{ 
		 if(first == input || second == input || next == input || after == input)
			{
			 printf("%s", "Fibonacci number\n");
			 finish =0;
			 break;
			}
	 	 sum = next + after;
		 if(sum == input)
			{
			 printf("%s", "Fibonacci number\n");
			 finish =0;
			 break;
			}
		 next = after + sum;
		 if(next == input)
			{
			 printf("%s", "Fibonacci number\n");
			 finish=0;
			 break;
			} 
		after= next + sum;
		 if(after == input)
			{
			 printf("%s", "Fibonacci number\n");
			 finish =0;
			 break;
			}
  		}
	if(finish == 1)
	{
	 printf("%s", "Not a Fibonacci number\n");
	}
	}
	return;
}
