`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2021 01:57:54 AM
// Design Name: 
// Module Name: Test16
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


module Test16();
    reg [15:0] a;
    reg [15:0] b;
    reg sel;
    wire [15:0] sum;
    wire cout;
    reg clk;
    
    CarrySelect16 DUT(
        .a(a),
        .b(b),
        .sel(sel),
        .sum(sum),
        .cout(cout)
        );
        
        initial begin
            a=32600;
            b=32600;
            sel=0;
            clk=32600;
            
            #10
            forever #10 clk = ~clk;
        end
          always@(posedge clk)begin
            a<= a+1;
            b <= b+1;
            sel<= ~sel;
           end
endmodule
