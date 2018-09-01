#include <stdio.h>

main()
{
  int input;
  int count =1;

  printf ("%s\n",  "Please enter a number from 1 to 5:");
  scanf("%i", &input);
  if(input>5 || input <1)
	{
		printf("%s", "Number is not in the range from 1 to 5\n");
		return;
	}
  while(count<=input)
  {
    printf("%i %s", count, "Hello World\n");
    count++;
  }
  return;
}
