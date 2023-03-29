`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2021 10:01:31 AM
// Design Name: 
// Module Name: compareTest
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


module compareTest();
integer count;
reg clk;
reg [3:0] index, pulse;
wire wrong, correct;
reg [3:0] user;
wire [3:0] pattern;
wire check = | user;


memory mmy (
.clk(clk),
.index(index),
.pattern(pattern)
);

comparer cmp (
.clk(clk),
.check(check),
.pattern(pattern),
.user(user),
.correct(correct),
.wrong(wrong)
);

initial begin
count = 0;
clk = 0;
index = 0;
pulse = 4'b0001;
user = 0;
end

always #5 clk = ~clk;

always @(posedge clk) begin
if (count % 5 == 0) begin
index <= index + 1;
pulse <= 4'b0001;
end
if (count % 2 == 0) begin
pulse <= pulse << 1;
user <= 0;
end
else begin
user <= pulse;
end
count <= count + 1;
end

endmodule