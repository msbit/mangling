#include <iostream>

class Callee {
private:
  int value;

public:
  Callee(int value);
  int PlusValue(int value);
};

int main(void) {
  Callee c = Callee(10);
  int result = c.PlusValue(10);
  std::cout << result << std::endl;
}
