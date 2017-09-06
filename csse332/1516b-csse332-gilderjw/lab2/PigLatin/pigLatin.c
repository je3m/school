/* This is the shell you must fill in or replace in order to complete
   lab 2.  Do not forget to include your name in the initial
   comments of this file.
   Jim Gildersleeve and brian suchy 12-9-15
*/
#include <stdio.h>
#include <string.h>


int main(int argc, char const *argv[]) {
  char input[128];
  printf("Enter a phrase:");

  scanf("%[a-zA-Z ]", input);
  char* ptr = strtok(input, " ");

  while (ptr != NULL) {
    printf("%s%cay ", &ptr[1], ptr[0]);
    ptr = strtok(NULL, " ");
  }

  printf("\n");
  return 0;
}
