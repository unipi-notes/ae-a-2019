module m(output [31:0] out,
	 input [31:0] in,
	 input [9:0]  addr,
	 input 	      we,
	 input 	      clock);
   
   integer 	      i;

   reg [31:0] 	      mem[1023:0];

   initial
     begin
	for(i=0;i<1024;i=i+4)
	  mem[i] = i/4;
     end
   
   always @(posedge clock)
     begin
	if(we == 1)
	  begin
	     mem[addr] <= in;
	  end
     end

   assign
     out = mem[addr];
   
endmodule
