SOURCES = test-m1.v moore.v mo-sigma.v mo-omega.v reg.v
CC = iverilog
VIEW = gtkwave
EXECS = a.out Moore.out

mealy:	$(SOURCES)
	$(CC) $(SOURCES) -o Moore.out

clean:
	rm -f $(EXECS)

run:	mealy
	./Moore.out
	$(VIEW) test-moore.vcd
