module alupm(output [31:0] o,
	     output 	  z,
	     output 	  n,
	     output 	  c,
	     output 	  w, 
	     input [31:0] a,
	     input [31:0] b,
	     input 	  op);

   assign
     o = (op == 1'b0 ? a+b : a-b);
   assign
     z = ((op == 1'b0 && a+b == 0) || (op == 1'b1 && a-b == 0) ? 1'b1 : 1'b0);
   assign
     n = ((op == 1'b0 && a+b < 0) || (op == 1'b1 && a-b < 0) ? 1'b1 : 1'b0);
   // TODO : Da completare ... 
   assign
     w = 0;
   assign
     c = 0;
   // TODOEND
   
endmodule // alu
