module per2(output [N-1:0]out, input [N-1:0]in);

   parameter N = 8;
   
   assign
     #2 out = in*2;

endmodule // per2
