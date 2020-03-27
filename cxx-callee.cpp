#include "cxx-callee.hpp"

Callee::Callee(int value) { this->value = value; }

int Callee::PlusValue(int value) { return this->value + value; }
