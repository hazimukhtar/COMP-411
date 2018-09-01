#include <stdio.h>



main()
{
  int input = -2;
  while(input!=0){
  	printf("%s", "Number [1-100]: ?\n");
  	scanf("%d", &input);
	int divisor = 10;
	int small = -1;
  	while(divisor>1)
		{ 
	 	 if(input % divisor == 0 && input!=2 && input!=3 && input != 5 && input != 7)
 			{
		 	 small = divisor;
	 		}
	 	 divisor--;
  		}
	if(input == 0)
		{
		 printf("%s", "Done\n");
		 return;
		}
  	if(input == 1)
		{
	 	 printf("%s", "Non-prime (special case)\n");
		}
 	 else if(small == -1)
  		{
  	 	 printf("%s", "Prime\n");
		}  
  	else
		{
  	     	 printf("%s %d\n" , "Non-prime, divisible by", small);
  		}
	}
	return;
}
