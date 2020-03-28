CXXFLAGS=-g
CFLAGS=-g
RUSTFLAGS=--crate-type=lib --emit=obj
SWIFTFLAGS=-emit-object -parse-as-library

%.o: %.rs
	rustc -o $(@) $(RUSTFLAGS) $(<)

all: c-cxx-caller c-rust-caller c-swift-caller cxx-cxx-caller

c-cxx-caller: cxx-callee.o c-cxx-caller.o
	$(CC) -o $(@) $(CFLAGS) $(^)

c-rust-caller: rust-callee.o
	$(eval CORE_PANICKING_PANIC := $(shell nm rust-callee.o | grep 4core9panicking5panic | cut -c20-))
	$(eval RUST_CALLEE_PLUS_VALUE := $(shell nm rust-callee.o | grep 11rust_callee6Callee10plus_value | cut -c20-))

	sed -i'' -e "s/__CORE_PANICKING_PANIC__/$(CORE_PANICKING_PANIC)/g" -e "s/__RUST_CALLEE_PLUS_VALUE__/$(RUST_CALLEE_PLUS_VALUE)/g" c-rust-caller.c

	$(CC) -c -o c-rust-caller.o $(CFLAGS) c-rust-caller.c
	$(CC) -o $(@) $(CFLAGS) $(^) c-rust-caller.o
	git checkout -- c-rust-caller.c

swift-callee.o: swift-callee.swift
	swiftc -o $(@) $(SWIFTFLAGS) -module-name SwiftCallee $(<)

c-swift-caller: swift-callee.o
	$(eval SWIFT_CALLEE_PLUS_VALUE := $(shell nm swift-callee.o | grep ' T ' | cut -c20- | grep 11SwiftCallee | grep 9plusValue | sed -e 's/\$$/$$$$/g'))

	sed -i'' 's/__SWIFT_CALLEE_PLUS_VALUE__/$(SWIFT_CALLEE_PLUS_VALUE)/g' c-swift-caller.c

	$(CC) -c -o c-swift-caller.o $(CFLAGS) c-swift-caller.c
	$(CC) -o $(@) $(CFLAGS) $(^) c-swift-caller.o
	git checkout -- c-swift-caller.c

cxx-cxx-caller: cxx-callee.o cxx-cxx-caller.o
	$(CXX) -o $(@) $(CXXFLAGS) $(^)

clean:
	rm -f c-cxx-caller c-cxx-caller.o \
      c-rust-caller c-rust-caller.o \
      c-swift-caller c-swift-caller.o \
      cxx-cxx-caller cxx-cxx-caller.o \
      cxx-callee.o rust-callee.o swift-callee.o
