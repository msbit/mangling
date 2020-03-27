#include <iostream>

#include "cxx-callee.hpp"

int main(void) {
  Callee c = Callee(10);
  int result = c.PlusValue(10);
  std::cout << result << std::endl;
}
