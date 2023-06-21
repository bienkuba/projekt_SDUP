`timescale 1ns / 1ps

module Disassembler_24bit(
    input wire          clk,
    input wire          reset,
    input wire          en,
    input wire [23:0]   data_in,
    
    output reg [7:0]    out_1,
    output reg [15:0]   out_2,
    output reg [15:0]   out_3,
    output reg          data_disassembled
    );
    
    wire [7:0] data_interleaved;
    wire intl_in_progress;
    
    reg  [7:0] out_1_nxt;
    reg [15:0] out_2_nxt;
    reg [15:0] out_3_nxt;
    
    Interleaver_8bit interleaver (
           .clk(clk),
           .reset(en),
           .data_in(data_in[23:16]),
           .data_out(data_interleaved),
           .ready_out(intl_in_progress)
    );
    
    always @(*) begin
            out_1_nxt = data_in[23:16];
            out_2_nxt = {data_in[23], data_in[15], data_in[22], data_in[14], data_in[21], data_in[13], data_in[20], data_in[12], data_in[19], data_in[11], data_in[18], data_in[10], data_in[17], data_in[9], data_in[16], data_in[8]};
            out_3_nxt = {data_in[23], data_in[7], data_in[19], data_in[6], data_in[22], data_in[5], data_in[18], data_in[4], data_in[21], data_in[3], data_in[17], data_in[2], data_in[20], data_in[1], data_in[16], data_in[0]};
    end
    
    always @(posedge clk) begin
            if(intl_in_progress) begin
                out_1 = out_1_nxt;
                out_2 = out_2_nxt;
                out_3 = out_3_nxt;
                data_disassembled <= 0;
            end 
            else begin
                data_disassembled <= 1;
            end
        end
    
endmodule
