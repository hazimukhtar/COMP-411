#include <stdio.h>

main()
{
int binaryNumber=1;
int input;
int condition =1;
int i;
char binary[] = "00000000"; 
	
	while(condition !=0)
	{
		scanf("%d", &input);
		if(input ==0)
		condition =0;
		for(i=7; i>-1; i--)
		{
			binary[i] = (input & 1) + '0';
			input >>= 1;
		}
		for(i=0; i<8; i++)
		{
			printf("%c", binary[i]);
		}
		puts("");		
	}
	
}
