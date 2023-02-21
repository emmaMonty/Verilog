`timescale 1ns/1ps

module uart_tx (
    input start,
    input clk,
    input rst_l,
    input [7:0] d_out,
    output reg done,
    output reg tx
);
    reg [1:0] state;
    reg [2:0] bit_index;
    wire div_clk;
    reg d2;

    localparam WAIT = 0;
    localparam SEND = 1;
    localparam STOP = 2;

    initial begin
        state = WAIT;
    end

    //Clock Divider
    clock_divider div (
        .clk(clk),
        .rst_l(rst_l),
        .div_clk(div_clk)
    );

    //State Machine
    always @(posedge div_clk, negedge rst_l) begin
        if(~rst_l) begin
            done <= 0;
            tx <= 1;
            state <= WAIT;
        end
        else begin
            case(state)

                WAIT: begin
                    if(start) begin
                        bit_index <= 0;
                        tx <= 0;
                        state <= SEND;
                    end
                    else begin
                        tx <= 1;
                        done <= 0;
                    end
                end

                SEND: begin
                    if(bit_index == 7) begin
                        tx <= d_out[bit_index];
                        d2 <= 1;
                        state <= STOP;
                    end
                    else begin
                        tx <= d_out[bit_index];
                        bit_index <= bit_index + 1;
                    end
                end

                STOP: begin
                    if(d2) begin
                        done <= 1;
                        d2 <= 0;
                    end
                    else begin
                        done <= 0;
                        state <= WAIT;
                    end
                end

                default: begin
                    state <= WAIT;
                    tx <= 1;
                    done <= 0;
                end

            endcase
        end
    end

endmodule
