`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 01:29:20 AM
// Design Name: 
// Module Name: decorder_test
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


module decorder_test();
    reg  [3:0] d;
    reg        en1;
    reg        en2; 
    wire [15:0] o;
    reg        clk;
    reg  [3:0] count;
    
    
    decoder4_16 DUT(
        .d(d),
        .o(o)
    );
    initial begin
            d = 0;
            count = 0;
            clk = 0;
            
            #100;
            forever #10 clk=~clk;
    end
    
    always @(posedge clk) begin
        count <= count + 1;
        d     <= count [3:0];
    end
endmodule
