`include "../register/register.v"
`include "sigma.v"
`include "omega.v"

// Module for the Mealy automata recognising an "abba" string in an {a,b,c} alphabet
module abba(output z, input[1:2]x, input clock);
    wire [1:2] outreg;
    wire [1:2] inreg;

    register #(2) s(outreg, clock, 1'b1, inreg);
    sigma sm(inreg, outreg, x);
    omega om(z, outreg, x);
endmodule