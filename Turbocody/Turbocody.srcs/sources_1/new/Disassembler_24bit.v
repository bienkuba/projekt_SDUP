`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2023 09:52:24
// Design Name: 
// Module Name: Disassembler_24bit
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


module Disassembler_24bit(
    input [23:0] data_in,
    output reg [7:0] out_1,
    output reg [15:0] out_2,
    output reg [15:0] out_3
    );
    
    wire [7:0] data_interleaved;
    
    Interleaver_8bit interleaver (
           .data_in(data_in[23:16]),
           .data_out(data_interleaved)
    );
    
    initial begin
        assign out_1 = data_in[23:16];
        assign out_2 = {data_in[23], data_in[15], data_in[22], data_in[14], data_in[21], data_in[13], data_in[20], data_in[12], data_in[19], data_in[11], data_in[18], data_in[10], data_in[17], data_in[9], data_in[16], data_in[8]};
        assign out_3 = {data_interleaved[7], data_in[7], data_interleaved[6], data_in[6], data_interleaved[5], data_in[5], data_interleaved[4], data_in[4], data_interleaved[3], data_in[3], data_interleaved[2], data_in[2], data_interleaved[1], data_in[1], data_interleaved[0], data_in[0]};
    end
    
endmodule
