`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 02:25:25 AM
// Design Name: 
// Module Name: DoubleSevenSeg
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


module DoubleSevenSeg(
    input[3:0] a,
    input [3:0]b,
    input clk,
    output [3:0]an,
    output [6:0]seg
    );
    wire sel;
    wire [3:0] o;
    wire [6:0] temp;
    MUXarray MUXa(
    .sel(sel),
    .a(a),
    .b(b),
    .o(o)
    );
    NewSevenSegment sevSeg(
    .wxyz(o),
    .seg(temp)
    );
    assign an[0] = sel;
    assign an[1] = ~sel;
    assign an[2] = 1;
    assign an[3] = 1; 
    assign seg = ~temp;
    ClockDivder #(.PRESCALER(50000)) CD(
        .clkin(clk),
        .clkout(sel)
    );
    
endmodule
