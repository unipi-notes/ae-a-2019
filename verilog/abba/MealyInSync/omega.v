module omega(output z, input [1:2]s, input [1:2]x);

  assign
    z = s[1] & ~s[2] & ~x[1] & ~x[2];

endmodule
