`timescale 1ns/1ps

module uart_rx(
    input clk,
    input rst_l,
    input rx,
    output reg [7:0] d_in,
    output reg ready,
    input ack
);

    localparam WAIT = 0;
    localparam RECEIVE = 1;
    localparam DONE = 2;

    wire div_clk;

    reg [1:0] state;
    reg [2:0] bit_index;

    clock_divider div (
        .clk(clk),
        .rst_l(rst_l),
        .div_clk(div_clk)
    );

    initial begin
        state <= WAIT;
        ready <= 0;
        d_in <= 0;
    end

    //State Machine
    always @(posedge div_clk, negedge rst_l) begin
        if(~rst_l) begin
            state <= WAIT;
        end
        else begin
            case(state)

                WAIT: begin
                    if(~rx) begin
                        bit_index <= 0;
                        state <= RECEIVE;
                    end
                end

                RECEIVE: begin
                    if(bit_index == 7) begin
                        d_in[bit_index] <= rx;
                        ready <= 1;
                        state <= DONE;
                    end
                    else begin
                        d_in[bit_index] <= rx;
                        bit_index <= bit_index + 1;
                    end
                end

                DONE: begin
                    ready <= 0;
                    if(ack && rx) begin
                        state <= WAIT;
                    end
                end

                default: begin
                    state <= WAIT;
                end

            endcase
        end
    end
endmodule

