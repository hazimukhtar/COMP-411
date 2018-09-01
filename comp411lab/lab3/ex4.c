/* Example: matrices represented by 2-dimensional arrays */

#include <stdio.h>

main()
{
  int in=0;
  int inner=0;
  int one, two, three;
  int A[3][3];
  int B[3][3];

  int C[3][3];

  int i, j, k;
  printf("Please enter the values for A[0..2][0..2], one row per line:\n");
  printf("Please enter the values for B[0..2][0..2], one row per line:\n");
  for(in = 0; in<3; in++)
	{
		scanf("%d%d%d", &one, &two, &three);
		A[in][0]=one;
		A[in][1]=two;
		A[in][2]=three;
	}
  for(in = 0; in<3; in++)
	{
		scanf("%d%d%d", &one, &two, &three);
		B[in][0]=one;
		B[in][1]=two;
		B[in][2]=three;
	}
  printf("A=\n");

  for(in = 0; in<3; in++)
	{
		for(inner=0; inner<3;inner++)
		{
		 printf("%6d", A[in][inner]);		
		}
		printf("\n");
	}
  printf("B=\n");

  for(in = 0; in<3; in++)
	{
		for(inner=0; inner<3;inner++)
		{
		 printf("%6d", B[in][inner]);		
		}
		printf("\n");
	}
  
  
  /* multiply C = A.B: */
  
  for (i = 0; i < 3; i++)
    for (j = 0; j < 3; j++)
    {
      C[i][j] = 0;
      for (k =0; k < 3; k++)
        C[i][j] += A[i][k] * B[k][j];
    }
  
  printf("C=A.B=\n");
  /* multiply C = B.A: */
  for(in = 0; in<3; in++)
	{
		for(inner=0; inner<3;inner++)
		{
		 printf("%6d", C[in][inner]);		
		}
		printf("\n");
	}
  
  for (i = 0; i < 3; i++)
    for (j = 0; j < 3; j++)
    {
      C[i][j] = 0;
      for (k =0; k < 3; k++)
        C[i][j] += B[i][k] * A[k][j];
    }
  printf("C=B.A=\n");
  
  for(in = 0; in<3; in++)
	{
		for(inner=0; inner<3;inner++)
		{
		 printf("%6d", C[in][inner]);		
		}
		printf("\n");
	}
}
