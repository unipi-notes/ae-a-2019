module stadio(output  [N-1:0]out, input [N-1:0]in, input clock);

   parameter N = 8;
   
   wire [N-1:0] pass;
   reg [N-1:0] 	ingresso;
   
   per2 p1(out, ingresso);

   always @(posedge clock)
     ingresso = in;
   
endmodule // per2
