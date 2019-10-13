module sigma(output [1:3]t, input [1:3]s, input [1:2]x);
   // s[1] & s[2] & s[3] & x[1] & x[2]
   assign
     t[1] = ~s[1] & s[2] & s[3] & ~x[1] & ~x[2];
   assign
     t[2] = ~s[1] & ~s[2] & s[3] & ~x[1] & x[2] |
	    ~s[1] & s[2] & ~x[1] & x[2];
   assign
     t[3] = ~s[1] & ~s[2] & ~x[1] & ~x[2] |
	    ~s[1] & s[2] & ~s[3] & ~x[1]  |
	     s[1] & ~s[2] & ~s[3] & ~x[1] & x[2];
endmodule
