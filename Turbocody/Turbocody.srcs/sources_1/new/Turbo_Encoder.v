`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2023 17:00:31
// Design Name: 
// Module Name: Turbo_Encoder
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


module Turbo_Encoder(
    input clk,
    input reset,
    input [7:0] data_in,
    output [23:0] data_out
    );
    
    wire [7:0] data_in_2;
    
    wire [15:0] data_1, data_2;//, data_p1, data_p2;
    reg [7:0] parity_1, parity_2;
    reg [23:0] data_concatentate;
    integer i = 0;
    
    RSC_Encoder_8bit RSC1 (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_1)
    );
        
   RSC_Encoder_8bit RSC2 (
       .clk(clk),
       .reset(reset),
       .data_in(data_in_2),
       .data_out(data_2)
   );
        
   Interleaver_8bit interleaver (
        .data_in(data_in),
        .data_out(data_in_2)
   );
   
   DataAssembler assemble (
            .data_in(data_in),       
            .data_1(data_1),        
            .data_2(data_2),        
            .data_assembled(data_out)
   );
   
endmodule
