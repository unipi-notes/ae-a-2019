module m1(output z, input [1:2]x , input clock);

   wire [1:3]sinp;
   wire [1:3]sout;

   sigma sm(sinp, sout, x);
   omega om(z, sout, x);
   registro #(3) rs(sout, clock, 1'b1, sinp);
   
   
endmodule
