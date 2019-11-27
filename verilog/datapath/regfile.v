module regfile(output [31:0] RD1, // first reg out
	       output [31:0] RD2, // second reg out
	       output [31:0] RD3, // third reg out
	       input [31:0]  WD3, // value to store
	       input [31:0]  R15, // pc in value
	       input [3:0]   A1, // first read address
	       input [3:0]   A2, // second read address
	       input [3:0]   A3, // third read/write address
	       input 	     WE3, // write enable
	       input 	     CLK) ; // the clock

   reg [31:0] 		     rf[14:0];

   initial
     begin
	rf[0] = 32'd11;
	rf[1] = 32'd22;
	rf[2] = 32'd33;
	rf[3] = 32'd44;
	rf[4] = 32'd55;
	rf[5] = 32'd66;
	rf[6] = 32'd77;
	rf[7] = 32'd88;
	rf[8] = 32'd99;
	rf[9] = 32'd111;
     end
	
   always @(posedge CLK)
     begin
	if(WE3 == 1'b1)
	  begin
	     rf[A3] <= WD3;
	  end
     end

   assign
     RD1 = (A1 == 4'b1111 ? R15 : rf[A1]); //rf[A1]; // (A1 == 4'b1111 ? R15 : rf[A1]);
   assign
     RD2 = rf[A2]; // non si puo' leggere r15 qui
   assign
     RD3 = rf[A3];

endmodule
