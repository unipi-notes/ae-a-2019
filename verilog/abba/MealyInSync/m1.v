module m1(output z, input [1:2]x, input clock);

   wire [1:2] outreg;
   wire [1:2] inreg;
   wire [1:2] xsy;
   
   registro #(2) r(xsy, clock, 1'b1, x);

   registro #(2) s(outreg, clock, 1'b1, inreg);
   sigma sm(inreg, outreg, xsy);
   omega om(z, outreg, xsy);
   
   
endmodule
