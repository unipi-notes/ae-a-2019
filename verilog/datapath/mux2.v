module mux2(output [N-1:0] o,
	    input [N-1:0] i1,
	    input [N-1:0] i2,
	    input 	  ctr);

   parameter N = 32;
   
   assign
     o = (ctr == 1'b0 ? i1 : i2);
   
endmodule // mux2



	   
