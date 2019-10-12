`include "ALU.sv"
`include "Alu_ctrl.sv"
`include "Alu_final.sv"
`include "Control.sv"
`include "ControlInstructionMemory.sv"
`include "DataMemory.sv"
`include "InstructionMemory.sv"
`include "memory.sv"
`include "mipstest.sv"
`include "RegisterFile.sv"
`include "Shifter_2.sv"
`include "SignExtend_16X32.sv"
`include "SignExtend_26X32.sv"
`include "Top_MIPS.sv"

`timescale 1ns / 1ps

module MIPS(
      input clk,
	 input rst,
	 output [31:0] PC,
	 output [31:0] Inst,
	 output [31:0] leer_dato,
	 output DMWE,
	 output [31:0] ALUOut,
	 output [31:0] DMdin
    );
	 
	 logic [31:0] Word; // del pc
	 logic [31:0] Word_1;  // adder+1
	 logic [31:0] Address_branch; // Adder Branch
	 logic [31:0] Address_final;  // mux branch
	 logic [25:0] Address_jump;  //Direccion a saltar con adress
	 logic [31:0] Address_jump_final;  //Direccion final del jump
	 logic RegDst;  // del control
	 logic Branch;
	 logic MemRead;
	 logic MemtoReg;
	 logic [1:0] Alu_op;
	 logic AluSrc;
	 logic RegWrite;
	 logic [4:0] Address1;
	 logic [4:0] Address2;
	 logic[4:0] Address3;
	 logic [15:0] extender;
	 logic J; // Jump
	 logic [31:0] ReadData1;  // registros
	 logic [31:0] ReadData2;  // registros
	 logic [4:0] Mux_Address3; // registros
	 logic [31:0] Extend_32;  // extender 32 bits
	 logic [31:0] Shifter_32;  //  shifter
	 logic [31:0] Mux_Alu;  //   mux
	 logic zero; // zero
	 logic [31:0] result; //Alu
	 logic And; // And
	 logic [31:0] Data_DataMemory;  // DataMemory
	 logic [31:0] WriteData;  //
	 logic [31:0] Address;  // pc
	 
	 // extra
	 assign DMWE = RegWrite;
	 assign ALUOut= Mux_Address3;
	 assign DMdin = WriteData;
	 
	 
	 InstructionMemory InstructionMemory(
	 Address,
	 Word
	 );
	 
	 ControlInstructionMemory ControlInstructionMemory(
	.ReadAddress(Word),
    	.RegDst(RegDst),
    	.Branch(Branch),
    	.MemRead(MemRead),
	.MemtoReg(MemtoReg),
	.Alu_op(Alu_op),
	.MemWrite(MemWrite),
	.AluSrc(AluSrc),
	.RegWrite(RegWrite),
	.J(J),
	.Address1(Address1),
	.Address2(Address2),
	.Address3(Address3),
	.extender(extender),
	.AddressJ(Address_jump)
	 );
	 
	 SignExtend_26X32 SignExtend_26x32(
	 .Input_26(Address_jump),
	 .Output_32(Address_jump_final)
	 );
	 

	 RegisterFile RegisterFile(
		RRegWrite,
		Address1,
		Address2,
		Mux_Address3,
		clk,
		rst,
		WriteData, 
		ReadData1,
		ReadData2
	 );
	 
	 
	 SignExtend_16X32 SignExtend_16X32(
	 .Input_16(extender),
	 .Output_32(Extend_32)
	 );
	 
	 Shifter_2 Shifter_2(
	 .Input(Extend_32),
	 .Output(Shifter_32)
	 );
	 
	 Alu_final Alu_final(
	 .a(ReadData1),
	 .b(Mux_Alu),
	 .Alu_op(Alu_op),
	 .funct(extender[5:0]),
	 .zero(zero),
	 .result(result)
	 );
	 
	 DataMemory DataMemory(
		 result,
		 ReadData2,
		 MemWrite,
		 MemRead,
		 clk,
		 Data_DataMemory
	 );
	 
	 assign Word_1 = Address + 1;
	 assign Address_branch = Word_1 + Shifter_32; 
	 assign Address_final = (And) ? Address_branch:Word_1;           
	 
	 //Program Counter
	 always @(posedge clk) begin
		if (rst == 1 ) Address <= 0;
		else Address <= (J) ? Address_jump_final:Address_final; 
	 end
	 //
	 
	 assign Mux_Address3 = (RegDst) ? Address3:Address2;
	 
	 assign Mux_Alu = (AluSrc) ? Extend_32:ReadData2;
	 
	 assign PC = Address;
	 
	 assign And = (Branch & zero);
	 
	 assign WriteData = (MemtoReg) ? Data_DataMemory:result;
	 
	 assign Inst = Word;
	 
	 assign leer_dato = WriteData;
	 
endmodule
