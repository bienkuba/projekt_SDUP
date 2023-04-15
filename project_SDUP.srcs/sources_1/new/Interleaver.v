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
    input wire clk,
    input wire rst,
    input wire D,
    output reg Q,
    output reg Interleaved_Q
    );
    
    
    always@(posedge clk)begin
        if(rst) begin
            Q               <= 0;
            Interleaved_Q   <= 0;
        end
        else begin
            Q               <= D;
            Interleaved_Q   <= Q;
        end
    end
    
    
    
    
    
    
endmodule
