module DataPath(output [31:0] Instr,  // istruzione alla PC
		output 	    Z, output N, output C, output V, // flag dalla ALU
		input 	    PCSrc,  // segnali di controllo dall PC
		input [1:0] RegSrc,
		input 	    RegWrite, ImmSrc,
			    ALUSrc, ALUControl, MemWrite, MemtoReg, clock);

   // definizione dei collegamenti fra le componenti del datapath

   wire [31:0] 	      PC1, PC, PCPlus4, PCPlus8;
   wire [3:0] 	      RA1, RA2;
   wire [31:0] 	      Dummy, ExtImm, SrcA, SrcB, WriteData, ALUResult, ReadData, Result;

   // componenti del datapath

   // multiplexer per controllare gli ingressi di PC
   mux2 muxpcsrc(PC1, PCPlus4, Result, PCSrc);
   // registro del program counter
   registro pc(PC, PC1, 1'b1, clock);
   // memoria istruzioni: ingresso a 0 (non si usa) e WE a 0 (non si scrive mai)
   rom MemI(Instr, PC[9:0], clock);  // e' una memoria da 1K, prendo 10 bit di PC
   // alu incremento PC
   alu4 alu1(PCPlus4, PC);
   // alu incremento PC per registri generali
   alu4 alu2(PCPlus8, PCPlus4);
   // multiplexer per il calcolo del primo indirizzo della unita' registri
   mux2  #(4) muxSrc1 (RA1, Instr[19:16], 4'd15, RegSrc[0]);
   // multiplexer per il calcolo del secondo indirizzo della unita' registri
   mux2  #(4) muxSrc2 (RA2, Instr[3:0], Instr[15:12], RegSrc[1]);
   // unita' registri
   regfile rfile(SrcA, WriteData, Dummy, Result, PCPlus8, RA1, RA2, Instr[15:12], RegWrite, clock);
   //regfile rf(clock,RegWrite,RA1,RA2,Instr[15:12],Result,PCPlus8,SrcA,WriteData);

   // Estensore degli immediati
   extend #(24) ext(ExtImm, Instr[23:0],ImmSrc);
   // multiplexer sul secondo ingresso della ALU
   mux2 muxalu2(SrcB, WriteData, ExtImm, ALUSrc);
   // ALU principale
   alupm aluprincip(ALUResult, Z, N, C, V, SrcA, SrcB, ALUControl);
   // Memoria dati (indirizzo troncato a 1K)
   m MemD(ReadData, WriteData, ALUResult[9:0], MemWrite, clock);
   // multiplexer writeback
   mux2 muxwb(Result, ALUResult, ReadData, MemtoReg);


endmodule
