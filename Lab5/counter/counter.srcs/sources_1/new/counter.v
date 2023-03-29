`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2021 10:06:33 AM
// Design Name: 
// Module Name: counter
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


module counter(
input        clk,
input        incr,
input        rst,
output [7:0] Q
    );
    wire mclk;
    ClockDivder CD(.clkin(clk), .clkout(mclk));
    
    wire [7:0]J, K;
    assign J[0] = (incr&~rst);
    assign K[0] = (rst | J[0]);
    JKFF tjkff (.j(J[0]), .k(K[0]), .clk(mclk), .q(Q[0]));
    genvar i;
    generate
    for(i=1;i<8;i =i+1)begin
        assign J[i] = (J[i-1] & Q[i-1]);
        assign K[i] = (J[i] | rst);
        JKFF tjkff1 (.j(J[i]), .k(K[i]), .clk(mclk), .q(Q[i])); 
    
    end
    endgenerate 
endmodule
