`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 03:23:19 AM
// Design Name: 
// Module Name: rotateLED
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


module rotateLED(
input       clk,
input       shift,
input       rst,
input [7:0] d0,
output[7:0] q
    );
 wire mclk;
 
 ClockDivder #(.PRESCALER(25000000)) CD(.clkin(clk), .clkout(mclk));
 
 Dregister pt0(.d(q[7]), .nd(d0[0]), .shift(shift), .rst(rst), .clk(mclk), .q(q[0]));
 
    genvar i;
    generate 
        for (i=1;i<8; i= i+1)begin
            Dregister pt(.d(q[i-1]), .nd(d0[i]), .shift(shift), .rst(rst), .clk(mclk), .q(q[i]));
       end
    endgenerate
endmodule
