`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 03:22:29 AM
// Design Name: 
// Module Name: dlatch
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


module dlatch(
    input d,
    output reg q,
    input clk
    );
    always @(clk or d) begin
        if (clk)
            q <= d;
    end
endmodule
