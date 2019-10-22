module test();

   parameter N = 8;
   
   reg [N-1:0] in;
   reg 	       clock;
   
   wire [N-1:0] out;
   integer 	i;
   
   per4 p4(out,in,clock);

   always
     begin
	#3 clock = 1;
	#1 clock = 0;
     end
   
   initial
     begin
	clock = 0;
	in = 0;
	
	$dumpfile("test.vcd");
	$dumpvars;
	
	#3 in=0;
	
	for(i=1; i<9; i=i+1)
	  #4 in = i;
	
	#10 $finish;
	
     end
endmodule // test
