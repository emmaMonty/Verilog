`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Utah State University
// Engineer: Emma Montgomery
// 
// Create Date: 01/28/2021 01:52:50 AM
// Design Name: Lab
// Module Name: myandgate
// Project Name: myandgate
// Target Devices: Basys3
// Tool Versions: Vivado
// Description: 
//  a trivial module to implement an and gate
// Dependencies: 
//  none
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module myandgate(
    output reg F,
    input A,
    input B
    );
    
    always @(A, B) begin
        F = A & B;
    end
endmodule
