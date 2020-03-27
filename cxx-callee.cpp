class Callee {
private:
  int value;

public:
  Callee(int value);
  int PlusValue(int value);
};

Callee::Callee(int value) { this->value = value; }

int Callee::PlusValue(int value) { return this->value + value; }
