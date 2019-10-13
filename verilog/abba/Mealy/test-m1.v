module testm1();

   reg [1:2] x;
   reg       clock;
   wire z;
   
   m1 m(z, x, clock);

   initial
     clock = 0;
   
   always
     begin
	#2 clock = 1;
	#1 clock = 0;
     end
   
   initial
     begin
	$dumpfile("test-mealy.vcd");
	$dumpvars;

	x = 2'b00;
	#4 x = 2'b01;
	#5 x = 2'b01;
	#1 x = 2'b00;
	
	
	#10 $finish;
     end
endmodule // testm1



