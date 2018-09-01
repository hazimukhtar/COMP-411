#include <stdio.h>

typedef struct {
     char Name[20];
     int ID;
   } record;

main()
{
  int number ;
  int count =0;
  int j,i;
  scanf("%d", &number);
  record data[50];
  for(count =0; count < number; count++){
  scanf("%s", &data[count].Name[0] );
  scanf("%d", &data[count].ID);
  }

     for ( i = 0; i < number; i++) {
      for ( j = i+1; j < number; j++)
         if (strcmp(data[i].Name, data[j].Name) > 0) {
            record temp = data[i]; 
            data[i] = data[j]; 
            data[j] = temp; 
         }
      }

     for ( i = 0; i < number; i++) {
      for ( j = i+1; j < number; j++)
         if (strcmp(data[i].Name, data[j].Name) == 0)
	 {
	    if(data[i].ID> data[j].ID)
           {
            record temp = data[i]; 
            data[i] = data[j]; 
            data[j] = temp; 
          }
         }
      }

      for(count =0; count < number; count++){
  printf("%s\n", data[count].Name );
  printf("%d\n", data[count].ID);

  }

}


