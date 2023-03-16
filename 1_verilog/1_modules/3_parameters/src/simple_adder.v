`timescale 1ns/1ps

// This module uses behavioral Verilog.
//
// Behavior:
//    Inputs `a` and `b` have W bits
//    Output `sum` has W+1 bits
//    `sum` is assigned `a+b` with one-cycle delay
//      
module simple_adder 
  #(                  // Use #( ) to declare parameters before I/O signals
    parameter W=2     // `parameter` keyword, name `W`, default value 2
    )
   (
    input                clk,
    input       [W-1:0]  a,
    input       [W-1:0]  b,
    output reg  [W:0]    sum
    );
   
   always @(posedge clk) begin  // Edge-sensitive timing with
      sum <= a + b;             // non-blocking assignment implies 
   end                          // DFF register, with one-cycle delay
   
endmodule // simple_adder
