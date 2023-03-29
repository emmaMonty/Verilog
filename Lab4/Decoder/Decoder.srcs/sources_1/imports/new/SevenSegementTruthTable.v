`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2021 01:11:26 AM
// Design Name: 
// Module Name: SevenSegementTruthTable
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SevenSegmentTruthTable(
input [3:0] wxyz,
output [6:0] seg
    );
    
    wire [3:0] N = wxyz;
    reg [6:0] D;
    assign seg[0] = D[6];
    assign seg[1] = D[5];
    assign seg[2] = D[4];
    assign seg[3] = D[3];
    assign seg[4] = D[2];
    assign seg[5] = D[1];
    assign seg[6] = D[0];
    
    always @ (*) begin
        case (N)
                4'b0000: D = 7'b1111110;
                4'b0001: D = 7'b0110000;
                4'b0010: D = 7'b1101101;
                4'b0011: D = 7'b1111001;
                4'b0100: D = 7'b0110011;
                4'b0101: D = 7'b1011011;
                4'b0110: D = 7'b1011111;
                4'b0111: D = 7'b1110000;
                4'b1000: D = 7'b1111111;
                4'b1001: D = 7'b1111011;
               //Hexadecimals 4'b1010: D = 7'b1110111;
//                4'b1011: D = 7'b0011111;
//                4'b1100: D = 7'b1001110;
//                4'b1101: D = 7'b0111101;
//                4'b1110: D = 7'b1001111;
//                4'b1111: D = 7'b1000111;
//               
                default: D = 7'b0000000;
         endcase
     end
endmodule
