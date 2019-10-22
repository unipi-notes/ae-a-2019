module per4(output  [N-1:0]out, input [N-1:0]in, input clock);

   parameter N = 8;
   
   wire [N-1:0] pass;
   stadio s1(pass, in, clock);
   stadio s2(out, pass, clock);
	     
endmodule // per2
