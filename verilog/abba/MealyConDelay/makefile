SOURCES = test-m1-delay.v m1-delay.v sigma-delay.v omega-delay.v reg-delay.v
CC = iverilog
VIEW = gtkwave
EXECS = a.out MealyDelay.out

mealy:	$(SOURCES)
	$(CC) $(SOURCES) -o MealyDelay.out

clean:
	rm -f $(EXECS)

run:	mealy
	./MealyDelay.out
	$(VIEW) test-mealy-delay.vcd
