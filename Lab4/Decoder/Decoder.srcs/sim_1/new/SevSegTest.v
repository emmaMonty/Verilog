`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 03:25:07 PM
// Design Name: 
// Module Name: SevSegTest
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


module SevSegTest();
reg clk;
reg [3:0] wxyz;
wire [6:0] segNew;
wire [6:0] segTruthTable;
wire [6:0] err;
wire not_the_same;

NewSevenSegment DUT (
.wxyz(wxyz),
.seg(segNew)
);

SevenSegmentTruthTable REF (
.wxyz(wxyz),
.seg(segTruthTable)
);
assign err = segNew^segTruthTable;
assign not_the_same = |err;
initial begin
wxyz = 0;
clk = 0;

#100;
forever #10 clk = ~clk;
end
 always @(posedge clk) begin
    wxyz = wxyz +1;
    end
endmodule
