`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2021 01:57:56 AM
// Design Name: 
// Module Name: Ripplecarry
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


module fulladder(
    input  a,
    input  b,
    input sel,
    output Sum,
    output Cout
    );
    assign Sum = a ^b^sel;
    assign Cout= (a&b)|(sel&b)|(a&sel);
endmodule

