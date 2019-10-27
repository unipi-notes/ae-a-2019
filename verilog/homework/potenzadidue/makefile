SOURCES = test.v potenzadidue.v
CC = iverilog
VIEW = gtkwave
EXECS = a.out

all:	$(SOURCES)
	$(CC) $(SOURCES) -o a.out

clean:
	rm -f $(EXECS)

run: 	all
	./a.out
	$(VIEW) test.vcd
