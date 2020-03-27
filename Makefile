CXXFLAGS=-g
CFLAGS=-g
RUSTFLAGS=--crate-type=lib --emit=obj

%.o : %.rs
	rustc -o $(@) $(RUSTFLAGS) $(<)

all: c-cxx-caller c-rs-caller cxx-cxx-caller

c-cxx-caller: cxx-callee.o c-cxx-caller.o
	$(CC) -o $(@) $(CFLAGS) $(^)

c-rs-caller: rs-callee.o c-rs-caller.o
	$(CC) -o $(@) $(CFLAGS) $(^)

cxx-cxx-caller: cxx-callee.o cxx-cxx-caller.o
	$(CXX) -o $(@) $(CXXFLAGS) $(^)

clean:
	rm -f c-cxx-caller c-rs-caller cxx-cxx-caller c-cxx-caller.o c-rs-caller.o cxx-cxx-caller.o cxx-callee.o rs-callee.o
