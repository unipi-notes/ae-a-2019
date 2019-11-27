module test_dp();

   // registri per le variabili di controllo (in ingresso al datapath)
   reg [1:0] RegSrc;
   reg 	     PCSrc, RegWrite, ImmSrc, ALUSrc, ALUControl, MemWrite, MemtoReg, clock;

   // wire per le uscite, dovrebbero essere l'istruzione di cui si e' fatto il fetch e i flag della ALU
   wire [31:0] Instr;
   wire        Z,N,C,V;

   // istanza del datapath
   DataPath dp(Instr, Z, N, C, V, PCSrc, RegSrc, RegWrite, ImmSrc, ALUSrc, ALUControl, MemWrite, MemtoReg, clock);

   parameter CLOCK = 10;
   
   always
     begin
	#(CLOCK-1) clock = ~clock;
	#1 clock = ~clock;
     end

   initial
     begin
	// setup delle direttive per ottenere le tracce
	$dumpfile("test_dp.vcd");
	$dumpvars;
	// inizializzazione
	clock = 0;
	PCSrc = 0; // ingresso del registro PC dalla ALU +4
	RegSrc = 2'b10; // primo indirizzo registro da campo Rn, secondo indirizzo registro da campo Rd
	RegWrite = 0;   // non scrivere nei registri
	ImmSrc  = 0;
	ALUSrc = 0 ;  // primo ingresso della ALU da uscita reg (non imm)
	ALUControl = 2'b00;  // fai una somma (01 sottrazione, 10 and, 11 orr)
	MemWrite = 0; // non scrivere nella memoria
	MemtoReg = 0; // writeback uscita della alu (1 uscita della memoria)
	 
	// fine della simulazione
	#50
	  $finish;
     end
endmodule
