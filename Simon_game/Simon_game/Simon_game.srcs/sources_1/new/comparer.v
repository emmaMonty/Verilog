`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2021 11:17:11 AM
// Design Name: 
// Module Name: comparer
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


module comparer(
input [3:0] user,
input check,
input clk,
output reg wrong,
output  reg correct,
input [3:0] pattern
    );

    
    always @(posedge clk)begin
        if(check)begin
            if ((user == pattern))begin
                correct <= 1;
            end
            else if((user != pattern))begin
                wrong <= 1;
            end
       end
        else begin
            wrong <= 0;
            correct<=0;
        end
    end
endmodule
