`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 03:13:22 AM
// Design Name: 
// Module Name: fsmTest
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


module fsmTest();
reg clk, rst, enable, correct, wrong;
reg [3:0] count;

wire timer_3_en, clear_score, lose, win, half_sec;
wire [1:0] sel;
wire [2:0] state;
wire [3:0] roundCount, roundLimit;

fsm DUT(
.clk(clk),
.rst(rst),
.enable(enable),
.timer(timer),
.correct(correct),
.wrong(wrong),
.half_sec(half_sec),
.clear_score(clear_score),
.sel(sel),
.lose(lose),
.win(win)
);

assign state = fsm.state;
assign roundCount = fsm.roundCount;
assign roundLimit= fsm.roundLimit;
assign half_sec = count[3];

initial begin
clk = 0;
rst = 1;
enable = 0;
correct = 0;
wrong = 0;
count = 0;
#50 rst = 0;
#20 enable = 1;
end

always #10 clk = ~clk;

always @(posedge clk) begin
count <= count + 1;
end
endmodule
