`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 02:13:05 PM
// Design Name: 
// Module Name: test
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


module test();
reg  b;
reg  clk;
wire d;


mealy DUT(
.b(b),
.clk(clk),
.d(d)
);
initial forever #10 clk = ~clk;
initial begin
b =0;
clk =0;
#150
b =1;
#150 
b=0;
#150
b =1;
#150 
b =0;

end  
endmodule
