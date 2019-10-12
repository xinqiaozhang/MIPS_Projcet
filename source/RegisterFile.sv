`timescale 1ns / 1ps


module RegisterFile(
    input RFWE,
    input [4:0] RFRA1,
    input [4:0] RFRA2,
    input [4:0] RFWA,
    input clk,
	input rst,
    input [31:0] RFWD,
    output [31:0] RFRD1,
    output [31:0] RFRD2
    );
	 
	 logic  [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10,
					reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20,
					reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31;
	
	
	assign RFRD1 = (RFRA1 == 0) ? reg0 :
					       (RFRA1 == 1) ? reg1 :
							 (RFRA1 == 2) ? reg2 :
					       (RFRA1 == 3) ? reg3 :
							 (RFRA1 == 4) ? reg4 :
					       (RFRA1 == 5) ? reg5 :
							 (RFRA1 == 6) ? reg6 :
					       (RFRA1 == 7) ? reg7 :
							 (RFRA1 == 8) ? reg8 :
					       (RFRA1 == 9) ? reg9 :
							 (RFRA1 == 10) ? reg10 :
					       (RFRA1 == 11) ? reg11 :
							 (RFRA1 == 12) ? reg12 :
					       (RFRA1 == 13) ? reg13 :
							 (RFRA1 == 14) ? reg14 :
					       (RFRA1 == 15) ? reg15 :
							 (RFRA1 == 16) ? reg16 :
					       (RFRA1 == 17) ? reg17 :
							 (RFRA1 == 18) ? reg18 :
					       (RFRA1 == 19) ? reg19 :
							 (RFRA1 == 20) ? reg20 :
					       (RFRA1 == 21) ? reg21 :
							 (RFRA1 == 22) ? reg22 :
					       (RFRA1 == 23) ? reg23 :
							 (RFRA1 == 24) ? reg24 :
					       (RFRA1 == 25) ? reg25 :
							 (RFRA1 == 26) ? reg26 :
					       (RFRA1 == 27) ? reg27 :
							 (RFRA1 == 28) ? reg28 :
					       (RFRA1 == 29) ? reg29 :
							 (RFRA1 == 30) ? reg30 :
					       (RFRA1 == 31) ? reg31 :0;
							 
	assign RFRD2 = (RFRA2 == 0) ? reg0 :
					       (RFRA2 == 1) ? reg1 :
							 (RFRA2 == 2) ? reg2 :
					       (RFRA2 == 3) ? reg3 :
							 (RFRA2 == 4) ? reg4 :
					       (RFRA2 == 5) ? reg5 :
							 (RFRA2 == 6) ? reg6 :
					       (RFRA2 == 7) ? reg7 :
							 (RFRA2 == 8) ? reg8 :
					       (RFRA2 == 9) ? reg9 :
							 (RFRA2 == 10) ? reg10 :
					       (RFRA2 == 11) ? reg11 :
							 (RFRA2 == 12) ? reg12 :
					       (RFRA2 == 13) ? reg13 :
							 (RFRA2 == 14) ? reg14 :
					       (RFRA2 == 15) ? reg15 :
							 (RFRA2 == 16) ? reg16 :
					       (RFRA2 == 17) ? reg17 :
							 (RFRA2 == 18) ? reg18 :
					       (RFRA2 == 19) ? reg19 :
							 (RFRA2 == 20) ? reg20 :
					       (RFRA2 == 21) ? reg21 :
							 (RFRA2 == 22) ? reg22 :
					       (RFRA2 == 23) ? reg23 :
							 (RFRA2 == 24) ? reg24 :
					       (RFRA2 == 25) ? reg25 :
							 (RFRA2 == 26) ? reg26 :
					       (RFRA2 == 27) ? reg27 :
							 (RFRA2 == 28) ? reg28 :
					       (RFRA2 == 29) ? reg29 :
							 (RFRA2 == 30) ? reg30 :
					       (RFRA2 == 31) ? reg31 :0;
							 
		always @(posedge clk) begin
			if ( rst == 1 ) begin
				reg0 = 0;
				reg1 = 0;
				reg2 = 0;
				reg3 = 0;
				reg4 = 0;
				reg5 = 0;
				reg6 = 0;
				reg7 = 0;
				reg8 = 0;
				reg9 = 0;
				reg10 = 0;
				reg11 = 0;
				reg12 = 0;
				reg13 = 0;
				reg14 = 0;
				reg15 = 0;
				reg16 = 0;
				reg17 = 0;
				reg18 = 0;
				reg19 = 0;
				reg20 = 0;
				reg21 = 0;
				reg22 = 0;
				reg23 = 0;
				reg24 = 0;
				reg25 = 0;
				reg26 = 0;
				reg27 = 0;
				reg28 = 0;
				reg29 = 0;
				reg30 = 0;
				reg31 = 0;
			end
			else begin
				if (RFWE)
					case(RFWA)
						0: reg0 = RFWD;
						1: reg1 = RFWD;
						2: reg2 = RFWD;
						3: reg3 = RFWD;
						4: reg4 = RFWD;
						5: reg5 = RFWD;
						6: reg6 = RFWD;
						7: reg7 = RFWD;
						8: reg8 = RFWD;
						9: reg9 = RFWD;
						10: reg10 = RFWD;
						11: reg11 = RFWD;
						12: reg12 = RFWD;
						13: reg13 = RFWD;
						14: reg14 = RFWD;
						15: reg15 = RFWD;
						16: reg16 = RFWD;
						17: reg17 = RFWD;
						18: reg18 = RFWD;
						19: reg19 = RFWD;
						20: reg20 = RFWD;
						21: reg21 = RFWD;
						22: reg22 = RFWD;
						23: reg23 = RFWD;
						24: reg24 = RFWD;
						25: reg25 = RFWD;
						26: reg26 = RFWD;
						27: reg27 = RFWD;
						28: reg28 = RFWD;
						29: reg29 = RFWD;
						30: reg30 = RFWD;
						31: reg31 = RFWD;
				endcase
			end
		end


endmodule
