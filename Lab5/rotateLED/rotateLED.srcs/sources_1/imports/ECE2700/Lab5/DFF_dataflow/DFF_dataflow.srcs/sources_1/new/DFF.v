`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 03:25:44 AM
// Design Name: 
// Module Name: DFF
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


module DFF(
    input d,
    output q,
    input clk
    );
    
        wire q1;
        wire clkb =~clk;
        
        dlatch d1(.d(d),.q(q1),.clk(clk));
        dlatch d2(.d(q1),.q(q),.clk(clkb));
endmodule
