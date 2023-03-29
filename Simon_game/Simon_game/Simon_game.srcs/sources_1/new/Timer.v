`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 03:44:15 AM
// Design Name: 
// Module Name: Timer
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


module Timer(
    input clk,
    input tic,
    input en,
    output timeout
    );
    reg [2:0] q;
    reg [25:0] count;
    assign timeout = &q; 
    initial begin
        q=0;
        count =0;
    end
    always @(posedge clk)begin
    if(en)begin
        if(tic) begin
            q <= q+1;
        end
    end
    else begin
        q <= 0;
    end
  end
endmodule
//always@(posedge clk)begin
//        if(count ==26'd50_000_000) begin
//            count <=0;
//            tic<=0;
//        end
//        else begin 
//            tic<=0;
//            count <= count +1;
//        end
//    end