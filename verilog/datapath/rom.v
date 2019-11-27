module rom(output [31:0] out,
	 input [9:0]  addr,
	 input 	      clock);


   reg [31:0] 	      mem[1023:0];

   initial  //       CONDOPICMD SRn  Rd           Rs2
     begin  //       xxxx----xxxx----xxxx----xxxx----
	mem[0] = 32'b11100000000000010010000000000011;
	// queste sono quelle del libro Fig. 6.19
	mem[4] = 32'b11100000100001100101000000000111;  // add r5, r6, r7
	mem[8] = 32'b11100000010001100101000000000111;  // sub r5, r6, r7
	mem[12] = 32'b11100010100000010000000000101010; // add r0, r1, #42
	mem[16] = 32'b11100010010000110010111011111111; // sub r2, r3, #0xFF0
	
	
     end
		 
   assign
     out = mem[addr];
   
endmodule
