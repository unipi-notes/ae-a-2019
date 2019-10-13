module testm1();

   reg [1:2] x;
   reg       clock;
   wire z;
   
   m1 m(z, x, clock);

   initial
     clock = 0;

   // ciclo di clock tau = 4 (leggermente piu' grande del necessario (3))
   always
     begin
	// funz
	#3 clock = 1;
	// non funz
	//#1 clock = 1;
	
	#1 clock = 0;
     end
   
   initial
     begin
	$dumpfile("test-mealy-delay.vcd");
	$dumpvars;

	x = 2'b00;
	#4 x = 2'b01;
	//#4 fa aba e non da' mai 1
	//#8 fa abba e mi da' l'uno
	// se metto il clock a 2 (1+1) non funziona piu'
        #8  x = 2'b01;
	// col clock a 1+1 non funz
	//#5 x = 2'b01;
	
	#1 x = 2'b00;
	
	
	#10 $finish;
     end
endmodule // testm1



