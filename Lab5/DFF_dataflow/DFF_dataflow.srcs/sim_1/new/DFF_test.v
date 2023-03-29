`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 03:04:52 AM
// Design Name: 
// Module Name: DFF_test
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


module DFF_test();
reg d;
reg clk;

wire q;

reg mclk;
reg [2:0] count;

DFF uut(
    .clk(clk),
    .d(d),
    .q(q)
   );
   
  initial begin
    clk   = 0;
    d     = 0;
    count = 0;
    mclk  = 0;
    clk   = 0;
    
    forever #10 mclk=~mclk;
   end
   always @(posedge mclk) begin
    count = count +1;
    clk   = count[2]^count[0];
    d     = count[1];
    end
endmodule
