
#include <stdio.h>

main()
{
  int first=0;
  int second = 0;
  int sum =1;
  while(sum !=0)
  {
 	 printf("Enter two integers (for n and k) separated by space:\n");
	 scanf("%d%d", &first, &second);
	 printf("%d\n", NchooseK(first,second));
	 if(first ==0 && second ==0)
	{
	  sum =0;
	}  
  }   
}

int NchooseK(int x, int y)
{
   if(y==0 || x==y)
	{
	  return 1;
	}
   return (NchooseK(x-1 , y-1) + NchooseK(x-1, y));

}
