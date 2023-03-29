`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2021 01:08:35 AM
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
    reg       sel;
    reg [1:0] i;
    
    wire      o;
    mux DUT(
    .i(i),
    .o(o),
    .sel(sel)
    );
    initial begin
        i[0] = 0;
        i[1] = 1;
        sel= 0;
        #10;
        forever #10 sel = ~sel; 
    end
endmodule
