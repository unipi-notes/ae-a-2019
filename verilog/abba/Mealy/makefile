SOURCES = test-m1.v m1.v sigma.v omega.v reg.v
CC = iverilog
VIEW = gtkwave
EXECS = a.out Mealy.out

mealy:	$(SOURCES)
	$(CC) $(SOURCES) -o Mealy.out

clean:
	rm -f $(EXECS)

run:	mealy
	./Mealy.out
	$(VIEW) test-mealy.vcd
