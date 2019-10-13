// Code your testbench here
// or browse Examples
module test();
  
   wire z;
   reg 	clock, enable, reset, inval;
   
   registro #(1) r(z, clock, enable, inval);
   
   always
     begin
	#1 clock = ~clock;
     end	
   
   initial
     begin
	$dumpfile("test.vcd");
	$dumpvars;
	
	clock = 0;
	reset = 1; 
	enable = 0;
	inval = 0;
	#2 reset = 0;
	
	#3
	  inval = 1;
	#3 enable =1;
	#5 enable = 0;
	
	#3 inval = 0;
	#3 enable = 1;
	#1 inval = 1;
	#2 enable = 0;
	
	#10 
	  $finish;
    end	
  
endmodule
