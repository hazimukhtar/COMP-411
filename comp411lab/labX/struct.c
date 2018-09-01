#include <stdio.h>

  typedef struct {
  char Name[20];
  int ID;
} record;

main()
{
	int numberOfRecords;
	int count =0;
	scanf("%d", &numberOfRecords);
	record data[numberOfRecords];
	
	for(count; count<numberOfRecords; count++)
	{
		
		scanf("%s", &data[count].Name[0]);
		scanf("%d", &data[count].ID);
	}
}

