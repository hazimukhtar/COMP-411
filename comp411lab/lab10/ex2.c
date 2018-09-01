#include <stdio.h>

int main() {

  int R, start, B;

  scanf("%d", &start);
  R = start;

  do {
    printf("%d\n", R);
    B = ((R >> 4) & 0x01) ^ ((R >> 2) & 0x01);
    R = ((R & 0x0F) << 1) | B;
  } while(R != start);

}
