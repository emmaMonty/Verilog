`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 02:13:35 AM
// Design Name: 
// Module Name: NewSevenSegment
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


module NewSevenSegment(
    input[3:0] wxyz,
    output[6:0] seg
    );
    wire [15:0] d;
    
    
    decoder4_16 D(.d(wxyz), .o(d));
    assign seg[0]= |(d & 16'h03ED);
    assign seg[1]= |(d & 16'h039F);
    assign seg[2]= |(d & 16'h03FB);
    assign seg[3]= |(d & 16'h036D);
    assign seg[4]= |(d & 16'h0145);
    assign seg[5]= |(d & 16'h0371);
    assign seg[6]= |(d & 16'h037C);
endmodule
