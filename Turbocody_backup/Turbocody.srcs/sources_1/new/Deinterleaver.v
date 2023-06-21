`timescale 1ns / 1ps

module Deinterleaver(
        input clk,
        input enable,
        input [7:0] data_in,
        output reg [7:0] data_out,
        output reg ready_out
    );
    
    always @(posedge clk) begin
        if (enable) begin
            assign data_out = {data_in[7], data_in[5], data_in[3], data_in[1], data_in[6], data_in[4], data_in[2], data_in[0]};
            ready_out <= 1;
        end
    end
    
endmodule
