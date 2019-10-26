module test();

   reg [0:7] x;
   reg [0:7] y;
   wire [0:7] z;
   reg clock;

   automata a(x, y, clock, z);

   initial
     clock = 0;
   
   always
     begin
	    #2 clock = 1;
	    #1 clock = 0;
     end
   
   initial
     begin
	    $dumpfile("test.vcd");
	    $dumpvars;

	    x = 3;
	    y = 5;
	    #3 x = 2;
	    y = 3;
        #3 x = 3;
        #3 x = 1;
        #3 x = 2;
        y = 2;

	    #10 $finish;
     end
endmodule // test