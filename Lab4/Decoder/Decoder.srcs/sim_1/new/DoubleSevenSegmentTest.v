`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2021 01:55:31 PM
// Design Name: 
// Module Name: DoubleSevenSegmentTest
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


module DoubleSevenSegmentTest();
reg [3:0] a;
reg [3:0] b;
reg     clk;

wire [6:0] seg;
wire [3:0]  an;

DoubleSevenSeg DUT(
.seg(seg),
.an(an),
.a(a),
.b(b)
);

initial begin
    a = 0;
    b = 0;
    clk = 0;
    
    
    #100
  forever # 10 clk=~clk;
  
 end
 
 always @(posedge clk)begin
    if(a >= 5)
        if(b >=5)begin
            a <=0;
            b<=0;
        end
        else
        b <= b+1;
      else
        a <= a+1;
end 
endmodule
