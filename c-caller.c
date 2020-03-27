#include <stdio.h>

#include "callee.h"

int main(void) {
  struct Callee c = {};
  _ZN6CalleeC1Ei(&c, 10);
  int result = _ZN6Callee9PlusValueEi(&c, 10);
  printf("%d\n", result);
}
