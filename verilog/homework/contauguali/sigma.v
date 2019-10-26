module sigma (
    input [0:M-1] x,
    input [0:M-1] y,
    output inc
);
    parameter M = 8;

    assign
        inc = x[M-1] == y[M-1];
endmodule // sigma