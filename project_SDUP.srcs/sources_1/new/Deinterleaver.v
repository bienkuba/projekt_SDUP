`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2023 19:51:29
// Design Name: 
// Module Name: Deinterleaver
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


module Deinterleaver(
    input wire [3:0] data_in,
    output reg [3:0] data_out,
    output reg [3:0] Deinterleaved_data_out
    );
    
    always@* begin
        data_out = data_in;
        Deinterleaved_data_out = {data_in[0], data_in[1], data_in[2], data_in[3]};
    end
    
endmodule
