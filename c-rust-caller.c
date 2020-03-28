#include <stdio.h>

struct Callee;

extern int __RUST_CALLEE_PLUS_VALUE__(struct Callee *, int);

void __CORE_PANICKING_PANIC__() { }

struct Callee {
  int value;
};

int main(void) {
  struct Callee c = {.value = 10};
  int result = __RUST_CALLEE_PLUS_VALUE__(&c, 10);
  printf("%d\n", result);
}
