`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2023 10:40:03
// Design Name: 
// Module Name: RSC_decoder
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


module Decoder_16bit(
    input clk,
    input reset,
    input [15:0] data_in,
    output reg [7:0] data_out, 
    output reg ready_out
    );
    
    integer i = 0;
    reg [1:0] current_data;
    reg [1:0] state, next_state;
    reg next_data_out;
    always @(*) begin
        current_data = {data_in[i], data_in[i-1]};
        case(state)
            2'b00: begin
                if(current_data == 2'b11) begin
                    next_state = 2'b10;
                    next_data_out = 1'b1;
                end
                else if(current_data == 2'b00) begin
                    next_state = 2'b00;
                    next_data_out = 1'b0;
                end
            end
            2'b01: begin
                if(current_data == 2'b00) begin
                    next_state = 2'b10;
                    next_data_out = 1'b0;
                end
                else if(current_data == 2'b11) begin
                    next_state = 2'b00;
                    next_data_out = 1'b1;
                end           
            end
            2'b10: begin
                if(current_data == 2'b01) begin
                    next_state = 2'b11;
                    next_data_out = 1'b0;
                end
                else if(current_data == 2'b10) begin
                    next_state = 2'b01;
                    next_data_out = 1'b1;
                end    
            end
            2'b11: begin
                if(current_data == 2'b10) begin
                    next_state = 2'b11;
                    next_data_out = 1'b1;
                end
                else if(current_data == 2'b01) begin
                    next_state = 2'b01;
                    next_data_out = 1'b0;
                end    
            end
        endcase
    end
     
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= 2'b00;
            current_data <= 2'b00;
            i = 15;
            ready_out <= 0;
        end 
        else if (i >= 0) begin
            $display("%b", current_data);
            state <= next_state;
            data_out <= {data_out, next_data_out};
            i <= i - 2;
        end
        else begin
            ready_out <= 1;
        end
    end
    
    
endmodule
