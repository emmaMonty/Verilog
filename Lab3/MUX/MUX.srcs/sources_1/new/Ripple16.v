`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2021 12:50:51 AM
// Design Name: 
// Module Name: Ripple16
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


module Ripple16(
    input [15:0] a,
    input [15:0] b,
    input sel,
    output [15:0] sum,
    output cout
    );
    wire w1,w2,w3;
    
    Ripplecarry rc1(
    .a(a[3:0]),
    .b(b[3:0]),
    .sel(sel),
    .Sum(sum[3:0]),
    .Cout(w1)
    );
    
    Ripplecarry rc2(
    .a(a[7:4]),
    .b(b[7:4]),
    .sel(w1),
    .Sum(sum[7:4]),
    .Cout(w2)
    );
    
    Ripplecarry rc3(
    .a(a[11:8]),
    .b(b[11:8]),
    .sel(w2),
    .Sum(sum[11:8]),
    .Cout(w3)
    );
    
    Ripplecarry rc4(
    .a(a[15:12]),
    .b(b[15:12]),
    .sel(w3),
    .Sum(sum[15:12]),
    .Cout(cout)
    );
endmodule
