`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2021 03:08:28 AM
// Design Name: 
// Module Name: carrySelectaddder
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


module carrySelectaddder(
    input [3:0] a,
    input [3:0] b,
    input sel,
    output [3:0] Sum,
    output Cout
    );
    wire [3:0] temp0,temp1;
    wire carry0,carry1;
    
    Ripplecarry CS0(a,b,1,temp0,carry0);
    Ripplecarry CS1(a,b,0,temp1, carry1);
    
    
    //mux for sum
    mux mux_sum0({temp0[0],temp1[0]},sel,Sum[0]);
    mux mux_sum1({temp0[1],temp1[1]},sel,Sum[1]);
    mux mux_sum2({temp0[2],temp1[2]},sel,Sum[2]);
    mux mux_sum3({temp0[3],temp1[3]},sel,Sum[3]);
    mux mux_sum4({carry0,carry1}, sel, Cout);
    
endmodule
