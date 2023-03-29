`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 01:32:49 PM
// Design Name: 
// Module Name: mealy
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


module mealy(
    input  b,
    input  clk,
    output reg d
    );
reg [1:0] state;
always @ (posedge clk) begin
    case (state)
  2'b00:begin
     d <= 0;
    if(b)
    state <=01; 
    end
   2'b01:begin 
    d <= 0;
    if(b)
    state <=11; 
    end
  2'b11:begin
    d <= 0;
    if(b)
    state <=10; 
    end
  2'b10:begin
    if(~b)begin
    state <=00;
    d <=1;
    end
    else 
    d <= 0;
    end
    default:
        state <=00;
  endcase
end
endmodule