module synchronizer(output [1:N] z, 
		    input [1:N] x, 
		    input 	clock);

   parameter N = 4;
   
   reg f1;
   reg f2;

   always @(posedge clock)
     begin
	f1 <= x;
	f2 <= f1;
     end

   assign z = f2;
   
endmodule
