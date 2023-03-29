`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2021 12:29:17 AM
// Design Name: 
// Module Name: CarryselectTest
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


module CarryselectTest();
    reg [3:0] a;
    reg [3:0] b;
    reg  sel;
    wire [3:0] sum;
    wire cout;
    integer i;
    integer j;
    integer error;
    
     carrySelectaddder DUT(
     .a(a),
     .b(b),
     .sel(sel),
     .Sum(sum),
     .Cout(cout)
     );
     
    initial begin
        a=0;
        b =0;
        error =0;
        sel =0;
      for(i =0;i<16; i=i+1) begin
        for(j=0;j<16;j=j+1)begin
            a = i;
            b = j;
            #10;
            if({cout,sum} != (i+j))
                error <= error +1;
             end
          end
          sel = 1;
           for(i =0;i<16; i=i+1) begin
        for(j=0;j<16;j=j+1)begin
            a = i;
            b = j;
            #10;
            if({cout,sum} != (i+j))
                error <= error +1;
             end
          end
        end
          
endmodule
