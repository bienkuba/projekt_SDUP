`timescale 1ns / 1ps

module Deinterleaver(
    input wire          clk,
    input wire          reset,
    input wire          enable,
    input wire [7:0]    data_in,
    output reg [7:0]    data_out,
    output reg          ready_out
    );
    
    reg [7:0] data_out_nxt;
    
    always @ (*) begin
        data_out_nxt = {data_in[7], data_in[5], data_in[3], data_in[1], data_in[6], data_in[4], data_in[2], data_in[0]};
    end
  
    
    always @(posedge clk) begin
            if(reset || !enable) begin
                data_out <= 0;
                ready_out <= 0;
            end
            else begin
                data_out <= data_out_nxt;
                ready_out <= 1;
            end
    end
    
endmodule
