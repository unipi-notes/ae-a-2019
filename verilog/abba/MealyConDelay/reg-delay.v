module registro(output [1:N]stato, input clock, input  enable, input  [1:N]inval);

   parameter N = 2;

   reg [1:N] st;
   
   initial
     begin
	st = 0;
     end
   
   always @(posedge clock)
     begin
	if(enable) 
	  st <= inval;
     end

   assign
     #1 stato = st;
   
endmodule
