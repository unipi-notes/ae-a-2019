module sigma(output  [1:2]news, input  [1:2]s, input  [1:2]x);

  assign
    news[1] = s[2] & ~x[1] & x[2];

  assign	
    news[2] = ~s[1] & ~x[1] & ~x[2] 
	      | s[2] & ~x[1] & ~x[2] 
	      | ~s[1] & s[2] & ~x[1];
   
endmodule
