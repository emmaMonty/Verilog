`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2021 09:33:37 AM
// Design Name: 
// Module Name: fullTest
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


module fullTest();
reg incr;
reg rst;
reg clk;
wire [7:0] Q;
debouncer DUT(
.incr(incr),
.rst(rst),
.clk(clk),
.Q(Q)
);
initial forever #10 clk = ~clk;
initial begin
incr = 0;
clk= 0;
rst = 1;
#25
rst =0;
#10
incr = 1;
#25
incr = 0;
#25
incr =1;
#25
incr = 0;
#25
incr =1;
#25
incr = 0;
#25
incr =1;
#25
incr=0;
#50
rst=0; 
end
endmodule
