module fa(output c, output z, input x, input y, input r);

    assign
        c = ~x&y&r | x&~y&r | x&y&~r | x&y&r;

    assign
        z = ~x&~y&r | ~x&y&~r | x&~y&~r | x&y&r;

endmodule //fa