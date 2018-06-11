CXXFLAGS=-g
CFLAGS=-g

OBJFILES=callee.o
COBJFILES=c-caller.o
CXXOBJFILES=cxx-caller.o

all: c-caller cxx-caller

c-caller: $(OBJFILES) $(COBJFILES)
	gcc -o c-caller $(CFLAGS) $(OBJFILES) $(COBJFILES)

cxx-caller: $(OBJFILES) $(CXXOBJFILES)
	g++ -o cxx-caller $(OBJFILES) $(CXXOBJFILES)

clean:
	rm -f $(OBJFILES) $(COBJFILES) $(CXXOBJFILES) c-caller cxx-caller
