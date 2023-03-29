`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 01:32:49 PM
// Design Name: 
// Module Name: mealy
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


module memory(
    input clk,
    input [3:0] index,
    output reg [3:0] pattern
);
always @(posedge clk) begin
    case(index)
        4'b0000: pattern <= 4'b0001;
        4'b0001: pattern <= 4'b1000;
        4'b0010: pattern <= 4'b0010;
        4'b0011: pattern <= 4'b1000;
        4'b0100: pattern <= 4'b1000;
        4'b0101: pattern <= 4'b0001;
        4'b0110: pattern <= 4'b0100;
        4'b0111: pattern <= 4'b0100;
        4'b1000: pattern <= 4'b0001;
    
        default: pattern <= 4'b0000;
        
        endcase
    end
    
endmodule