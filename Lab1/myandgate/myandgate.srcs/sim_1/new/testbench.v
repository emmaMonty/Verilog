`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2021 01:58:02 AM
// Design Name: 
// Module Name: testbench
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


module testbench( );
    reg in1, in2;
    wire out;
    
    myandgate DUT(.A(in1), .B(in2), .F(out) );
    
    initial begin
        in1 = 0; in2 = 0;
        #10
        in1 = 1; in2 = 0;
        #10
        in1 = 0; in2 = 1;
        #10
        in1 = 1; in2 = 1;
        #10
        $finish;
    end
endmodule
