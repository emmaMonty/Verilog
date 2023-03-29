`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 01:10:36 AM
// Design Name: 
// Module Name: MuxTest
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


module MuxTest();
reg      clk;
reg [8:0] count;
reg [3:0]  a;
reg [3:0]  b;
reg     sel;
wire [3:0] o;

MUXarray DUT(
.a(a),
.b(b),
.sel(sel),
.o(o)
);
    initial begin
            a = 0;
            b = 0;
            clk = 0;
            count =0;
            #100
            forever #10 clk=~clk;
    end
    
    always @(posedge clk) begin
        a  <= count [4:1];
        b <= count [8:5];
        sel <= count[0];
        count = count + 1;
    end
endmodule
