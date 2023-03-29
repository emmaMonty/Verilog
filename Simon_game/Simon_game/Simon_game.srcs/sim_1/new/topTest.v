`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2021 09:59:54 AM
// Design Name: 
// Module Name: topTest
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


module topTest();
integer count;
reg clk;
wire [3:0] an;
wire [6:0] seg;
reg enable;
reg [3:0] user;
wire [3:0] led;
wire lose;
wire win;
reg [3:0] pulse;
wire half_sec = DUT.half_sec;
wire [2:0] state = DUT.fsm0.state;
wire [3:0] RC = DUT.fsm0.roundCount;
wire [3:0] RL = DUT.fsm0.roundLimit;
wire[1:0] sel =DUT.sel;
wire correct= DUT.fsm0.correct;
wire wrong = DUT.fsm0.wrong;
top DUT(
    .clk(clk),
    .an(an),
    .seg(seg),
    .enable(enable),
    .user(user),
    .led(led),
    .lose(lose),
    .win(win)
);
initial begin
clk =0;
enable =0;
count= 0;
user =0;
end
 always #5 clk = ~clk;
 always @(posedge clk) begin
 if (count % 5 ==0) begin
    enable =1;
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
