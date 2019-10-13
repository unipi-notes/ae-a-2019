module registro(output [1:N]z, input clock, input  enable, input  [1:N]inval);

   parameter N = 2;

   reg [1:N] stato;
   
   initial
     begin
	stato = 0;
     end
   
   always @(posedge clock)
     begin
	if(enable) 
	  stato <= inval;
     end

   assign
     z = stato;
   
endmodule
