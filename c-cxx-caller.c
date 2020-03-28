#include <stdio.h>

struct Callee;

struct Callee *_ZN6CalleeC1Ei(struct Callee *, int);
int _ZN6Callee9PlusValueEi(struct Callee *, int);

struct Callee {
  int value;
};

int main(void) {
  struct Callee c = {};
  _ZN6CalleeC1Ei(&c, 10);
  int result = _ZN6Callee9PlusValueEi(&c, 10);
  printf("%d\n", result);
}
