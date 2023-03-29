`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2021 05:29:14 AM
// Design Name: 
// Module Name: fsm
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


module fsm(
input enable, 
input clk, 
input correct,
input half_sec,
input rst,
input wrong,
output reg clear_score,
output reg incr_score,
output  [3:0] index,
output reg lose,
output reg [1:0] sel,
output reg timer,
output reg win
    );
    
    reg [2:0] state;
    reg [3:0] roundCount, roundLimit;
    
    assign index = roundCount;
    
    localparam OFF            = 2'b00;
    localparam ON             = 2'b01;
    localparam PLAYER         = 2'b10;
    localparam NPC            = 2'b11;
    
    localparam IDLE           = 3'b000;
    localparam INCR_COUNT     = 3'b001;
    localparam ROUND_LIMIT    = 3'b010;
    localparam DELAY          = 3'b011;
    localparam ALL_ON         = 3'b100;
    localparam PLAYER_TURN    = 3'b101;
    localparam ROUND_LIMIT_PL = 3'b110;
    localparam WAITING        = 3'b111;
    
    
    always @(posedge clk) begin
        if(rst) begin
            state <= IDLE;
        end
        else begin
            case(state)
            
            IDLE: begin //0
                if(enable && !half_sec) begin
                    state <= INCR_COUNT;
                end  
                roundCount <= 0;
                roundLimit <= 1;
                win <= 0;
                lose <= 0;
                clear_score <= 0;
                sel <= OFF;
                timer <=0;
                incr_score <=0;
            end
            
            INCR_COUNT: begin //1
                incr_score <= 0;
                sel <= NPC;
                if(half_sec) begin
                    roundCount= roundCount +1;
                    state <= ROUND_LIMIT; 
                end
            end
            
            ROUND_LIMIT: begin //2
                if(roundCount==roundLimit&&!half_sec) begin
                    state <= DELAY;
                end
                else if(!half_sec)begin
                    state <= INCR_COUNT;
                end
            end
            
            DELAY: begin //3
                if(half_sec) begin
                    state <= ALL_ON;
                end
            end
            
            ALL_ON: begin //4
                sel <= ON;
                roundCount <= 1;
                if(!half_sec) begin
                    sel <= PLAYER;
                    state <= PLAYER_TURN;
                    timer <= 1;
                end
            end
            
            PLAYER_TURN: begin //5
                if(correct) begin
                    timer <= 0;
                    state <= ROUND_LIMIT_PL;
                    roundCount <= roundCount +1;
                end
                else if(wrong) begin
                    lose <= 1;
                    sel <= ON;
                    state <= WAITING;
                end
            end
            
            ROUND_LIMIT_PL: begin //6
                if(roundCount == 9) begin
                    win <= 1;
                    sel <= ON;
                    incr_score <= 1;
                    state <= WAITING;
                end
                else if(roundCount > roundLimit && !half_sec) begin
                    state <= INCR_COUNT;
                    roundCount <=0;
                    roundLimit <= roundLimit +1;
                    incr_score <= 1;
                end
                else if(!half_sec) begin
                    state <= PLAYER_TURN;
                end
            end
            
            WAITING: begin //7
                incr_score <=0;
                if(!enable) begin
                    state <= IDLE;
                    clear_score <=1;
                end
            end
            
            default: begin
                state <= IDLE;
            end
            
            
        endcase
    end
 end
endmodule 