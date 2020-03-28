#include <stdio.h>

struct Callee;

void _ZN4core9panicking5panic17h8627f9662a331d41E() { }
int _ZN9rs_callee6Callee10plus_value17h316222399865b924E(struct Callee *, int);

struct Callee {
  int value;
};

int main(void) {
  struct Callee c = {.value = 10};
  int result = _ZN9rs_callee6Callee10plus_value17h316222399865b924E(&c, 10);
  printf("%d\n", result);
}
