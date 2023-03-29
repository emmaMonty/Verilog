`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 10:11:24 AM
// Design Name: 
// Module Name: Test
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


module Test();
reg incr;
reg rst;
reg clk;
wire [7:0] Q;
integer count;
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
rst = 0;
count =0;
end
always @(posedge clk)
begin
 if(count % 10 ==0)begin
        rst =1;
        incr =0;
    end
    if(count % 10 == 1)begin
    rst =0;
    end
    if (count % 10 == 3)begin
    incr =1;
    end
    if (count % 10 == 4)begin
    incr =0;
    end
    if (count % 10 == 5)begin
    incr =1;
    end
    count = count +1;
end
endmodule
