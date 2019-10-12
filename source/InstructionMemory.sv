`timescale 1ns / 1ps

module InstructionMemory(
    input [31:0] IMA,
    output logic [31:0] IMRD
    );

	 always_comb begin
	case (IMA[7:0])       //   //   //  //  //  //
	
			0: IMRD = 32'h20020005 ; //addi $2, $0, 5
			1: IMRD = 32'h2003000c ; //addi $3, $0, 12
			2: IMRD = 32'h2067fff7 ; //addi $7, $3, -9 = 3
			3: IMRD = 32'h00e22025 ; //or   $4, $7, $2 $4 = 111 = 7
			4: IMRD = 32'h00642824 ; //and  $5, $3, $4 = 4
			5: IMRD = 32'h00a42820 ; //add  $5, $5, $4 =11
			6: IMRD = 32'h08000002 ; //jump  to addr 2
			7: IMRD = 32'h00e23822 ; //sub  $7, $7, $2 = 12 - 5 = 7
			8: IMRD = 32'h00e2202a ; //slt $4, $7, $2 = 3 < 2 = 1
			9: IMRD = 32'h0064202a ; //slt  $4, $3, $4  = 0
			10: IMRD = 32'h00e2202a ; //slt $4, $7, $2 = 3 < 2 = 1
			11: IMRD = 32'h00853820 ; //add  $7, $4, $5 = 1 + 11 = 12
			12: IMRD = 32'h00e23822 ; //sub  $7, $7, $2 = 12 - 5 = 7
		
			default: IMRD = 32'b11111111111111111111111111111111;
	endcase 
end
	
 
	 
	 


endmodule
