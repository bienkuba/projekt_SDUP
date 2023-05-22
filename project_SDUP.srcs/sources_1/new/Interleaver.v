`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2023 09:43:57
// Design Name: 
// Module Name: Interleaver
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


module Interleaver(
    input wire [3:0] data_in,
    output reg [3:0] data_out,
    output reg [3:0] Interleaved_data_out
    );
    
    always@* begin
        data_out = data_in;
        Interleaved_data_out = {data_in[0],data_in[1],data_in[2],data_in[3]};
    end
    
endmodule
