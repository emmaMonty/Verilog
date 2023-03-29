`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 10:17:22 AM
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:mm
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module test();
reg             clk;
reg             incr;
reg             rst;
reg [8:0]   count;
wire [7:0]      Q; 


counter  DUT(
    .clk(clk),
    .incr(incr),
    .rst(rst),
    .Q(Q)
    );
    initial begin
    clk = 0;
    incr = 0;
    rst = 0;
    count =0;
    #100
    forever #10 clk = ~clk;
    end
    
    always @(posedge clk) begin
   if(count % 255 ==0)begin
        rst =1;
        incr =0;
        count = 0;
    end
    if(count == 4)begin
        rst =0;
    end    
    if(count ==6)begin
        incr = 1;
     end
    count = count +1;
    end    
endmodule
