#include <iostream>

#include "callee.hpp"

int main(void) {
  auto c = Callee(10);
  auto result = c.PlusValue(10);
  std::cout << result << std::endl;
}
