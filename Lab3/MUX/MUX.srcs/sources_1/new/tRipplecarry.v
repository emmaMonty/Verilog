`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2021 02:24:19 AM
// Design Name: 
// Module Name: tRipplecarry
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


module Ripplecarry(
    input[3:0] a,
    input [3:0]b,
    input sel,
    output [3:0] Sum,
    output Cout
    );
    wire w1,w2,w3;
    fulladder fa0(a[0], b[0], sel, Sum[0], w1);
    fulladder fa1(a[1], b[1], w1, Sum[1], w2);
    fulladder fa2(a[2], b[2], w2, Sum[2], w3);
    fulladder fa3(a[3], b[3], w3, Sum[3], Cout);
endmodule
