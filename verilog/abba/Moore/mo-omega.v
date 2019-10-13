module omega(output z, input [1:3]s, input [1:2]x);
  // z = 1 solo se ci troviamo nello stato 5 (100)
  assign
    z = s[1]& ~s[2] &~s[3];
   

endmodule
