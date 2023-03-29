`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2021 01:04:16 AM
// Design Name: 
// Module Name: CarrySelect16
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


module CarrySelect16(
    input [15:0] a,
    input [15:0] b,
    input sel,
    output [15:0] sum,
    output cout
    );
    wire w1,w2,w3;
     carrySelectaddder cs1(
    .a(a[3:0]),
    .b(b[3:0]),
    .sel(sel),
    .Sum(sum[3:0]),
    .Cout(w1));
    
    carrySelectaddder cs2(
    .a(a[7:4]),
    .b(b[7:4]),
    .sel(w1),
    .Sum(sum[7:4]),
    .Cout(w2));
    
    carrySelectaddder cs3(
    .a(a[11:8]),
    .b(b[11:8]),
    .sel(w2),
    .Sum(sum[11:8]),
    .Cout(w3));
    
    carrySelectaddder cs4(
    .a(a[15:12]),
    .b(b[15:12]),
    .sel(w3),
    .Sum(sum[15:12]),
    .Cout(cout));
endmodule
