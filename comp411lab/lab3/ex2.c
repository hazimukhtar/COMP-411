#include <stdio.h>
#include <string.h>
#define MAX 1000 /* The maximum number of characters in a line of input */

main()
{
  char text[MAX], c, temp;
  int i, length, count = 0;
  puts("Type some text (then ENTER):");
  
  /* Save typed characters in text[]: */
    
  fgets(text, MAX, stdin); 
  length = strlen(text)-1;
  char reversetext[length];
  /* Analyse contents of text[]: */
  reversetext[length]='\0';  
  for (i = 0; i < length; i++)
  {

c = text[i];
    temp = c;
    reversetext[length-i-1] = temp;
        }
  for(i = 0; i < length; i++)
  { 
   if(reversetext[i]== text[i])
    {count++;}
 }
  printf("Your input in reverse is:\n%s\n", reversetext);
if(count==length) {
  printf("Found a palindrome!\n");
}
}
