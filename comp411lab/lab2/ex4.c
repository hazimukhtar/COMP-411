#include <stdio.h>

main ()
{
int n1,n2,n3,n4,n5,n6;

  printf("%s", "Enter six integers:\n");
  scanf("%d %d %d %d %d %d", &n1,&n2,&n3,&n4,&n5,&n6);
  printf("%s\n", "1234567890bb1234567890");
  printf("%*d  %*d\n%*d  %*d\n%*d  %*d\n", 10,n1, 10, n2,10,n3, 10, n4, 10, n5,10, n6); 
  return;
}
