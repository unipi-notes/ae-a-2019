module automata (
    input [0:M-1] x,
    input [0:M-1] y,
    input clock,
    output [0:N-1] z
);
    parameter N = 8;
    parameter M = 8;

    wire inc;
    sigma sm(x, y, inc);
    counter c(inc, clock, z);
endmodule // automata