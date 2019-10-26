module potenzadidue(output z, input [0:N-1]x);
    parameter N = 8;

    assign
        z = (x & (x-1)) == 0 ;
endmodule //potenzadidue