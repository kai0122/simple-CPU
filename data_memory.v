`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:11 01/05/2017 
// Design Name: 
// Module Name:    data_memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module data_memory( 
		input reset,
		input clk,
		input [19:0] instruct,
		output [7:0] reg1,
		output [7:0] reg2,
		output [7:0] reg3,
		output [7:0] reg4
		// if you need more I/O you can add more here
		
		); 

	reg  [7:0] register [3:0];
    
	assign reg1 = register[0];
	assign reg2 = register[1];
	assign reg3 = register[2];
	assign reg4 = register[3];
    
    reg [7:0] location;
    reg [2:0] aluMode;
    reg [7:0] aluR1, aluR2;
    wire [7:0] aluOut;
    
    ALU alu0(
        .mode(aluMode),
        .reg1(aluR1),
        .reg2(aluR2),
        .out(aluOut)
    );
    
    always@(*) begin 
    case(instruct[19:16])
        4'b0010: begin
            aluMode = 0;
            aluR1 = register[instruct[15:8]];
            aluR2 = register[instruct[7:0]];
        end
        4'b0011: begin
            aluMode = 0;
            aluR1 = register[instruct[15:8]];
            aluR2 = instruct[7:0];
        end
        4'b0100: begin
            aluMode = 1;
            aluR1 = register[instruct[15:8]];
            aluR2 = register[instruct[7:0]];
        end
        4'b0101: begin
            aluMode = 1;
            aluR1 = register[instruct[15:8]];
            aluR2 = instruct[7:0];
        end
        4'b1110: begin
            aluMode = 2;
            aluR1 = register[instruct[15:8]];
            aluR2 = register[instruct[7:0]];
        end
        4'b1100: begin
            aluMode = 3;
            aluR1 = register[instruct[15:8]];
            aluR2 = register[instruct[7:0]];
        end
        4'b1000: begin
            aluMode = 4;
            aluR1 = register[instruct[15:8]];
            aluR2 = register[instruct[7:0]];
        end
        4'b1010: begin
            aluMode = 5;
            aluR1 = register[instruct[15:8]];
            aluR2 = register[instruct[7:0]];
        end
        default: {aluMode,aluR1,aluR2} <= ~0;
        endcase
    end
    
    always@(posedge clk, posedge reset) begin
        if(reset) begin
            register[0] <= 0;
            register[1] <= 0;
            register[2] <= 0;
            register[3] <= 0;
        end else if(instruct[19:16])
            register[instruct[15:8]]<=aluOut;
        else
            register[instruct[15:8]] <= register[instruct[15:8]];
    end
    
endmodule

module FS(A,B,S);
	input [7:0] A, B;
	output [7:0] S;
	wire [7:0] t;
	wire Cout;
	FS_1bit FS0(.A(A[0]), .B(B[0]), .Cin(0), .S(S[0]), .Cout(t[0]));
	FS_1bit FS1(.A(A[1]), .B(B[1]), .Cin(t[0]), .S(S[1]), .Cout(t[1]));
	FS_1bit FS2(.A(A[2]), .B(B[2]), .Cin(t[1]), .S(S[2]), .Cout(t[2]));
	FS_1bit FS3(.A(A[3]), .B(B[3]), .Cin(t[2]), .S(S[3]), .Cout(t[3]));
	FS_1bit FS4(.A(A[4]), .B(B[4]), .Cin(t[3]), .S(S[4]), .Cout(t[4]));
	FS_1bit FS5(.A(A[5]), .B(B[5]), .Cin(t[4]), .S(S[5]), .Cout(t[5]));
	FS_1bit FS6(.A(A[6]), .B(B[6]), .Cin(t[5]), .S(S[6]), .Cout(t[6]));
	FS_1bit FS7(.A(A[7]), .B(B[7]), .Cin(t[6]), .S(S[7]), .Cout(t[7]));
	FS_1bit FS8(.A(A[7]), .B(B[7]), .Cin(t[6]), .S(S[7]), .Cout(Cout));
endmodule

module FS_1bit(A, B, Cin, S, Cout);
	input A, B, Cin;
	output S, Cout;
	assign S = Cin ^ A ^ B;
	assign Cout = ((~A) & B) | (Cin & B) | (Cin & (~A));
endmodule

module FA(A,B,S);
	input [7:0] A, B;
	output [7:0] S;
	wire [6:0] t;
	wire Cout;
	FA_1bit FA0(.A(A[0]), .B(B[0]), .Cin(0), .S(S[0]), .Cout(t[0]));
	FA_1bit FA1(.A(A[1]), .B(B[1]), .Cin(t[0]), .S(S[1]), .Cout(t[1]));
	FA_1bit FA2(.A(A[2]), .B(B[2]), .Cin(t[1]), .S(S[2]), .Cout(t[2]));
	FA_1bit FA3(.A(A[3]), .B(B[3]), .Cin(t[2]), .S(S[3]), .Cout(t[3]));
	FA_1bit FA4(.A(A[4]), .B(B[4]), .Cin(t[3]), .S(S[4]), .Cout(t[4]));
	FA_1bit FA5(.A(A[5]), .B(B[5]), .Cin(t[4]), .S(S[5]), .Cout(t[5]));
	FA_1bit FA6(.A(A[6]), .B(B[6]), .Cin(t[5]), .S(S[6]), .Cout(t[6]));
	FA_1bit FA7(.A(A[7]), .B(B[7]), .Cin(t[6]), .S(S[7]), .Cout(Cout));
endmodule

module FA_1bit(A, B, Cin, S, Cout);
	input A, B, Cin;
	output S, Cout;
	assign S = Cin ^ A ^ B;
	assign Cout = (A & B) | (Cin & B) | (Cin & A);
endmodule

module AND(A,B,t);
	input [7:0] A, B;
	output [7:0]t;
	assign t[0] = A[0] & B[0];
	assign t[1] = A[1] & B[1];
	assign t[2] = A[2] & B[2];
	assign t[3] = A[3] & B[3];
	assign t[4] = A[4] & B[4];
	assign t[5] = A[5] & B[5];
	assign t[6] = A[6] & B[6];
	assign t[7] = A[7] & B[7];
endmodule

module OR(A,B,t);
	input [7:0] A, B;
	output [7:0]t;
	assign t[0] = A[0] | B[0];
	assign t[1] = A[1] | B[1];
	assign t[2] = A[2] | B[2];
	assign t[3] = A[3] | B[3];
	assign t[4] = A[4] | B[4];
	assign t[5] = A[5] | B[5];
	assign t[6] = A[6] | B[6];
	assign t[7] = A[7] | B[7];
endmodule

module NOT(A,t);
	input [7:0] A;
	output [7:0]t;
	assign t[0] = ~A[0];
	assign t[1] = ~A[1];
	assign t[2] = ~A[2];
	assign t[3] = ~A[3];
	assign t[4] = ~A[4];
	assign t[5] = ~A[5];
	assign t[6] = ~A[6];
	assign t[7] = ~A[7];
endmodule

module XOR(A,B,t);
	input [7:0] A, B;
	output [7:0]t;
	assign t[0] = A[0] ^ B[0];
	assign t[1] = A[1] ^ B[1];
	assign t[2] = A[2] ^ B[2];
	assign t[3] = A[3] ^ B[3];
	assign t[4] = A[4] ^ B[4];
	assign t[5] = A[5] ^ B[5];
	assign t[6] = A[6] ^ B[6];
	assign t[7] = A[7] ^ B[7];
endmodule
