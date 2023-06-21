`timescale 1ns / 1ps

module Decoder_16bit(
    input wire          clk,
    input wire          reset,
    input wire          en,
    input wire [15:0]   data_in,
    output reg [7:0]    data_out, 
    output reg          ready_out
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
     
    always @(posedge clk) begin
        if (reset || !en) begin
            state <= 0;
            i = 15;
            ready_out <= 0;
        end 
        else if (i >= 0) begin
            state <= next_state;
            data_out <= {data_out, next_data_out};
            i <= i - 2;
        end
        else begin
            ready_out <= 1;
        end
    end
    
    
endmodule
