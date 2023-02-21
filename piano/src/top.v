`timescale 1ns/1ps

module top (
   input clk,
   input rst,
   input rx,
   input [7:0] volume,
   output reg [7:0] note,
   output reg AIN,
   output reg GAIN,
   output reg SHUTDOWN_L
);

   wire rst_n;
   assign rst_n = ~rst;
   wire sout;
   wire [13:0] hz;
   reg ack;
   wire rdy;
   wire [7:0] d_in;
   
   uart_rx URX (
      .clk(clk),
      .rst_l(rst_n),
      .rx(rx),
      .d_in(d_in),
      .ready(rdy),
      .ack(ack)
   );
   
   synthesizer SYNTH (
      .clk(clk),
      .note(note),
      .hz(hz)
   );
   
   pwm_audio PWM1 (
      .clk(clk),
      .rst_n(rst_n),
      .volume(volume),
      .N(hz),
      .sout(sout)
   );
   initial begin
     GAIN       = 1;
     SHUTDOWN_L = 1;
     AIN        = 0;
   end
   always @(posedge clk) begin
      if(rdy) begin
         ack <= 1;
         note <= d_in;
      end
      else begin
         ack <= 0;
      end
      
      if(note == 0) begin
         AIN <= 0;
      end
      else begin
         AIN <= sout;
      end
   end
   
endmodule
