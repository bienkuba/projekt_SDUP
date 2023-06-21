`timescale 1ns / 1ps

module Interleaver_8bit(
    input clk, 
    input [7:0] data_in,
    input reset,
    output reg [7:0] data_out,
    output reg [7:0] data_in_pass,
    output reg ready_out
);
    reg [7:0] data_out_nxt, data_in_pass_nxt;
     
    always @ (*) begin
        data_out_nxt = {data_in[7], data_in[3], data_in[6], data_in[2], data_in[5], data_in[1], data_in[4], data_in[0]};
        data_in_pass_nxt = data_in;
    end
    
    always @ (posedge clk) begin
        if(reset) begin
            ready_out <= 0;
        end
        else begin
            data_out <= data_out_nxt;
            data_in_pass <= data_in_pass_nxt;
            ready_out <= 1;
        end
    end
    
endmodule
