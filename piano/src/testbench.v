`timescale 1ns / 1ps

module testbench();

   reg clk;
   reg rst;
   wire rx;
   reg [7:0] volume;
   
   reg [7:0] n_in;
   reg start;
   
   wire [7:0] note;
   wire AIN;
   wire GAIN;
   wire SHUTDOWN_L;
   wire done;
   
   top DUT (
      clk, rst, rx, volume, note, AIN, GAIN, SHUTDOWN_L
   );
   
   uart_tx TX (
      .start(start),
      .clk(clk),
      .rst_l(~rst),
      .d_out(n_in),
      .done(done),
      .tx(rx)
   );
   
   initial clk = 0;
   initial forever #5 clk <= ~clk;

   initial begin
      rst = 0;
      n_in = 49;
      volume = 255;
      start = 0;
      
      #10000;
      start = 1;
      #10000;
   end

endmodule
