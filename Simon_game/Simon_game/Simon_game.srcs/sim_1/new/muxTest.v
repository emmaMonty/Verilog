`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 02:15:17 AM
// Design Name: 
// Module Name: muxTest
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


module muxTest( );
    reg [1:0] sel;
    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] c;
    reg [3:0] d;
    
    reg clk;
    reg [3:0] count;
    wire [3:0] out;
    Mux DUT(
    .a(a),.b(b),.c(c),.d(d),
    .out(out),
    .sel(sel)
    );
    initial begin
        a =0;
        b =0;
        c =0;
        d=1;
        count =0;
        clk =0;
       sel= 0; 
       forever #10 clk = ~clk;
    end
    always @(posedge clk)begin
        if(count % 20 ==0)
         sel =1;
        else if(count %20 ==4)
           sel = 2;
        else if(count %20 == 8)
            sel = 3;
        else if (count %20 == 12)
            sel =0;
        count =count +1;            
    end
endmodule
