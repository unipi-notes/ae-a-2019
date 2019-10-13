module testsynch();
   
   parameter N = 1;

   reg clock;
   reg [1:N] in;
   wire [1:N] out;
   wire [1:N] outr;

   initial
     begin
	clock = 0;
     end

   always
     begin
	#2 clock = 1;
	#1 clock = 0;
     end

   
   synchronizer #(N) sy(out,in,clock);
   registro #(N) r(outr,clock,1'b1,in);
   
   initial
     begin
	$dumpfile("testsy.vcd");
	$dumpvars;

	in = 0;
	#7 in = 1;
	#3 in = 2;
	#3 in = 3;
	#3 in = 0;
	
	#10 $finish;
     end
endmodule // testsynch
