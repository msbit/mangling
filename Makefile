CXXFLAGS=-g
CFLAGS=-g
RUSTFLAGS=--crate-type=lib --emit=obj

%.o : %.rs
	rustc -o $(@) $(RUSTFLAGS) $(<)

all: c-cxx-caller c-rust-caller cxx-cxx-caller

c-cxx-caller: cxx-callee.o c-cxx-caller.o
	$(CC) -o $(@) $(CFLAGS) $(^)

c-rust-caller: rust-callee.o c-rust-caller.o
	$(CC) -o $(@) $(CFLAGS) $(^)

cxx-cxx-caller: cxx-callee.o cxx-cxx-caller.o
	$(CXX) -o $(@) $(CXXFLAGS) $(^)

clean:
	rm -f c-cxx-caller c-cxx-caller.o \
      c-rust-caller c-rust-caller.o \
      cxx-cxx-caller cxx-cxx-caller.o \
      cxx-callee.o rust-callee.o
