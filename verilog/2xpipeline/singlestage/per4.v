module per4(output  [N-1:0]out, input [N-1:0]in, input clock);

   parameter N = 8;
   
   wire [N-1:0] pass;
   reg [N-1:0] 	ingresso;
   
   per2 p1(pass, ingresso);
   per2 p2(out, pass);

   always @(posedge clock)
     ingresso = in;
   
endmodule // per2
