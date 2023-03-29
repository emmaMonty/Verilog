`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2021 11:12:41 AM
// Design Name: 
// Module Name: test
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


module test();
reg        clk;
reg        shift;
reg        rst;
integer    count;
reg  [7:0] d0;
wire [7:0] q; 

rotateLED  DUT(
    .clk(clk),.shift(shift),
    .rst(rst),.d0(d0),.q(q));
    initial begin
    clk = 0;
    shift = 0;
    rst = 0;
    d0 =3;
    count =0;
    #100
    forever #10 clk = ~clk;
    end
    
    always @(posedge clk) begin
    if(count % 20 ==0)begin
        rst =1;
        shift = ~shift;
    end
    if(count % 20 == 5)begin
    rst =0;
    end
    count = count +1;
    
        
    end
endmodule
