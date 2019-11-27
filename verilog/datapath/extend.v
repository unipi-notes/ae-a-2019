module extend(output [31:0] o,
	      input [N-1:0] i,
	      input ctrl);


   parameter N = 24;
   
   assign
     o = (ctrl == 0 ?           // se il controllo e' 0 estendi immediato da 12 bit
	  $signed(i[11:0]) : 
	  $signed(i[23:0]));    // altrimenti estendi immediato per il branch
   
endmodule // extend
