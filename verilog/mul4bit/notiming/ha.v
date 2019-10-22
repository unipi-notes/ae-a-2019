module ha(output c, output z, input x, input y);

    assign
        c = x&y;

    assign
        z = ~x&y| x&~y;

endmodule //fa