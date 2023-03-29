`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 02:32:55 AM
// Design Name: 
// Module Name: JKTest
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


module JKTest();
reg   j;
reg   k;
reg   clk;
wire  q;

integer idx;

wire [11:0] jvals = 8'b0110_1010;
wire [11:0] kvals = 8'b0111_0001;

JKFF DUT(
.clk(clk),
.j(j),
.k(k),
.q(q)
);
initial begin
    j =0;
    k =1;
    idx =0;
    clk = 1;
    
    forever #10 clk =~clk;
 end
 always @(posedge clk) begin
 
    idx = (idx +1) %8;
    j= jvals[idx];
    k= kvals[idx];
 end
endmodule
