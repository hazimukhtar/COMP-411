#include <stdio.h>


main()
{
  float sum, mean, product, n1,n2,n3,n4,n5;

  printf("%s\n" , "Enter five floating-point numbers:");
  scanf("%f %f %f %f %f/n", &n1, &n2, &n3, &n4, &n5);
  sum = n1+n2+n3+n4+n5;
  product = n1*n2*n3*n4*n5;
  mean = sum/5;

  printf("%s %.4f\n", "Sum is", sum);
  printf("%s %.4f\n" ,"Mean is", mean);
  printf("%s %.4f\n" ,"Product is", product);





  return;
}
