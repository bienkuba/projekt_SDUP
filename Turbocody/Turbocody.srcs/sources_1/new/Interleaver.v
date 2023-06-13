`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2023 16:48:17
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


module Interleaver_8bit(
    input clk, 
    input [7:0] data_in,
    input reset,
    output reg [7:0] data_out,
    output reg ready_out
);
    
    always @ (posedge clk, posedge reset) begin
        if(reset) begin
            ready_out <= 1;
        end
        else begin
            assign data_out = {data_in[7], data_in[3], data_in[6], data_in[2], data_in[5], data_in[1], data_in[4], data_in[0]};
            ready_out <= 0;
        end
    end
    
endmodule
