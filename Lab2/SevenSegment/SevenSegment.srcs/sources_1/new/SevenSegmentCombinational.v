`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2021 01:11:26 AM
// Design Name: 
// Module Name: SevenSegmentCombinational
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


module SevenSegmentCombinational(
    input x3,
    input x2,
    input x1,
    input x0,
    output a,
    output b,
    output c,
    input d,
    output e,
    output f,
    output g
    );
    
    assign a = x3| x1 | x2&x0 | ~x2&~x0;
    assign b = ~x2 | x1&x0 | ~x1&!x0;
    assign c = x3 | x2 | ~x1 | x0;
    assign d = x3|~x2&x1|~x2&~x0|x2&~x1&x0|x1&~x0;
    assign e = ~x3&~x0&x1 |~x2&~x0&~x1|~x2&~x0&~x3;
    assign f = x3| x2&~x1|~x1&~x0|x2 &~x0;
    assign g = x1&~x0 | x2&~x1 |x3 | ~x2&x1;
    
endmodule
