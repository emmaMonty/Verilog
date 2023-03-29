`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 02:12:26 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
input incr,
input rst,
input clk,
output  [7:0] Q
    );
    wire incr_d;
    wire rst_d;
    wire mclk;
    mealy DB1(.b(incr), .d(incr_d), .clk(clk));
    mealy DB2 (.b(rst), .d(rst_d), .clk(clk));
    counter CNT1(.clk(clk),.Q(Q), .incr(incr),.rst(rst));
endmodule
