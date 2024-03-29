`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2021 03:04:03 AM
// Design Name: 
// Module Name: ClockDivder
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

module ClockDivder #(parameter PRESCALER = 25_000_000)(
    input clkin,
    output reg clkout
    );
    reg [24:0] count;
    initial begin
        count = 0;
        clkout = 0;
    end
    
    always @(posedge clkin) begin
        if (count == PRESCALER) begin
            count <= 0;
            clkout <= ~clkout;
        end
        else begin
            count <= count +1;
        end
    end
endmodule
