`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 04:09:37 AM
// Design Name: 
// Module Name: TimeTest
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


module TimeTest();
reg clk = 0;
always #10 clk = ~clk;
Timer DUT(.clk(clk));
initial #100000 $finish;

always begin
    #10000 $display("tick");
    #10000 $display("tock");
end
endmodule
