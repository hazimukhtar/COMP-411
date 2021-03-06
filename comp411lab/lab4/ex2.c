/* Example: bubble sort strings in array */

#include <stdio.h>  /* Need for standard I/O functions */
#include <string.h> /* Need for strlen() */


#define NUM 25   /* number of strings */
#define LEN 1000  /* max length of each string */

main()
{
  char Strings[NUM][LEN];

  printf("Please enter %d strings, one per line:\n", NUM);

int count =0;
  /* Write a for loop here to read NUM strings.

     Use fgets(), with LEN as an argument to ensure that an input line that is too
     long does not exceed the bounds imposed by the string's length.  Note that the
     newline and NULL characters will be included in LEN.
  */

  for(count; count<NUM; count++)
  	{
	  fgets(Strings[count], LEN-2,stdin);
	}
		
	
  puts("\nHere are the strings in the order you entered:");

  /* Write a for loop here to print all the strings. */
  count =0;
  for(count; count<NUM; count++)
  {
    printf("%s", Strings[count]);
  }

  
  /* Bubble sort */
  /* Write code here to bubble sort the strings in ascending alphabetical order

     Your code must meet the following requirements:
        (i) The comparison of two strings must be done by checking them one
            character at a time, without using any C string library functions.
            That is, write your own while/for loop to do this.
       (ii) The swap of two strings must be done by copying them 
            (using a temp variable of your choice) one character at a time,
            without using any C string library functions.
            That is, write your own while/for loop to do this.
      (iii) You are allowed to use strlen() to calculate string lengths.
  */


  int inner =0;
  int amount =0;
  count=0;
		

for(amount = 0; amount < NUM; amount++)
   {
        for(count = 0; count < NUM-1; count++) 
     {                  
                if(strcmp(Strings[count],Strings[count+1])>0) 
               {
		//	int a = (strlen(Strings[count+1])-1);
		        char temp[1][LEN];
                        strcpy(temp[0],Strings[count]);
                        strcpy(Strings[count], Strings[count+1]);
                        strcpy(Strings[count+1], temp[0]);
		//	memset(temp,0,a);
               
                }
      }
    }
 
  
  /* Output sorted list */
  
  puts("\nIn alphabetical order, the strings are:");     
  /* Write a for loop here to print all the strings. Feel free to use puts/printf
     etc. for printing each string.
  */
  count =0;
  for(count; count<NUM; count++)
  {
    printf("%s", Strings[count]);
  }

  return 0;
}
