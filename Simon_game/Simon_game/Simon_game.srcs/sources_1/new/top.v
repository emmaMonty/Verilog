`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 04:26:40 PM
// Design Name: 
// Module Name: top
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


module top#(parameter PRESCALER = 50_000_000)(
    input clk,
    output [3:0] an,
    output [6:0] seg,
    input enable,
    input [3:0] user,
    output [3:0] led,
    output lose,
    output win
    );
    wire rst;
    wire half_sec;
    wire tic;
    wire  [3:0] DBOut;
    //clockdivder
    ClockDivder #(.PRESCALER(PRESCALER))cd(.clkin(clk), .clkout(half_sec),.tic(tic));
    //debouncers
    mealy db0(.b(user[0]), .clk(clk),.d(DBOut[0]));
    mealy db1(.b(user[1]), .clk(clk), .d(DBOut[1]));
    mealy db2(.b(user[2]), .clk(clk), .d(DBOut[2]));
    mealy db3(.b(user[3]), .clk(clk), .d(DBOut[3]));
    //comparer
    wire check= |DBOut;
    wire correct;
    wire wrong;
    wire [3:0] pattern;
    comparer c1(.user(DBOut),.check(check),.clk(clk),.pattern(pattern),.wrong(wrong),.correct(correct));
    //timer
     wire timeout;
     wire timeEN;
    Timer t1(.clk(clk), .en(timeEN), .tic(tic), .timeout(timeout));
    //fsm
    wire fsmWrong = wrong |timeout;
    wire clear_score, incr_score,lose,win;
    wire [3:0] index;
    wire [1:0] sel;
    fsm fsm0(.enable(enable), .clk(clk),. half_sec(half_sec), .rst(rst),
     .correct(correct),.wrong(fsmWrong),.clear_score(clear_score), .index(index),
     .lose(lose),.win(win),.incr_score(incr_score),.timer(timeEN), .sel(sel));
     
   //memory
    memory m1(.clk(clk), .index(index), .pattern(pattern));
   // counter
   wire [7:0] sw;
   counter cn1( .clk(clk), .incr(incr_score), .rst(clear_score), .Q(sw));
   
   //SSD
   SevenSegmentTop SSD(.an(an), .seg(seg), .sw(sw));
   //MUX
   wire [3:0] a;
   wire [3:0] d = pattern&{4{half_sec}};
   Mux mx1(.a({4{0}}), .b({4{half_sec}}),.c(user), .d(d), .sel(sel), .out(led));
endmodule
