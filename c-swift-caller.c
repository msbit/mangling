#include <stdio.h>

struct Callee;

extern int __SWIFT_CALLEE_PLUS_VALUE__(struct Callee *, int);

void $sBoWV() {}
void swift_allocObject() {}
void swift_beginAccess() {}
void swift_deallocClassInstance() {}
void swift_endAccess() {}

struct Callee {
  int value;
};

int main(void) {
  struct Callee c = {.value = 10};
  int result = __SWIFT_CALLEE_PLUS_VALUE__(&c, 10);
  printf("%d\n", result);
}
