#include <stdio.h>


main()
{
	
	int x1, x2, y1, y2;
  	int i, j, num, col, row, max;

	scanf("%d%d%d%d%d%d%d", &x1, &x2, &y1, &y2, &col, &row, &max);
	int xSum, ySum;
	xSum = x2-x1+1;
	ySum = y2-y1+1; 	
//	char format;
//	scanf("%s", &format);
	printf("P2\n");
	printf("%d\n%d\n%d\n", xSum, ySum, max);
	for (i = 0; i < row; i++){
		for(j=0; j<col; j++)
		{
			scanf("%d", &num);
			if(i>=y1 && i<=y2)
			if(j>=x1 && j<=x2)
			printf("%d\n", num);
				
		}
	}
			
}
