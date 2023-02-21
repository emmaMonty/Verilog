`timescale 1ns/1ps

module clock_divider #(parameter N=5208) (
    input      clk,
    input      rst_l,
    output reg div_clk
);
   
   reg [31:0]  clk_count;
   
   initial begin
      div_clk   = 0;
      clk_count = 0;
   end

    always @(posedge clk) begin
       if(~rst_l) begin
          clk_count <= 0;
          div_clk <= 0; 
       end
       else if (clk_count == N) begin
          div_clk   <= ~div_clk;
          clk_count <= 0;          
       end
       else begin
          clk_count <= clk_count + 1;
       end
    end
   
endmodule
