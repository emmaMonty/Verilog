`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 03:06:41 AM
// Design Name: 
// Module Name: Dregister
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


module Dregister(
input     d,
input     nd,
input     shift,
input     rst,
input     clk,
output    q
    );
    wire temp1,temp2;
    mux m1({d,q},shift,temp1);
    mux m2({nd,temp1},rst,temp2);
    DFF DR(.d(temp2),.q(q), .clk(clk));
endmodule
