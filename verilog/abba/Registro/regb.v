module registro(output reg [1:N]stato, input clock, input  enable, input  [1:N]inval);

   parameter N = 2;

   
   initial
     begin
	stato = 0;
     end
   
   always @(posedge clock)
     begin
	if(enable) 
	  stato <= inval;
     end

endmodule
