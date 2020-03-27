#include <stdio.h>

struct Callee {
  int value;
};

void *_ZN4core9panicking5panic17h8627f9662a331d41E(void *v) {}
int _ZN9rs_callee6Callee9PlusValue17h0ce39cb1c4ac843dE(struct Callee *, int);

int main(void) {
  struct Callee c = {.value = 10};
  int result = _ZN9rs_callee6Callee9PlusValue17h0ce39cb1c4ac843dE(&c, 10);
  printf("%d\n", result);
}
