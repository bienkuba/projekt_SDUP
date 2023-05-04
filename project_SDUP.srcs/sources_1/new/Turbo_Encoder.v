`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2023 19:40:48
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
    input wire clk,
    input wire rst,
    input wire [2:0] data_in,
    output reg [2:0] U,
    output reg [2:0] P,
    output reg [2:0] Q
    );
    
    wire [2:0] toRSC1, toRSC2, conv_sig_out_1, conv_sig_out_2;
    

    RSC_Encoder my_RSC_Encoder1( //recursive systematic convolutional
        .U(toRSC1),
        .P(conv_sig_out_1)
    );
      
    RSC_Encoder my_RSC_Encoder2(
        .U(toRSC2),
        .P(conv_sig_out_2)
    );
    
    Interleaver my_Interleaver(
        .data_in(data_in),
        .data_out(toRSC1),
        .Interleaved_data_out(toRSC2)
    );
    
    always @(*) begin
        U = data_in;
        P = conv_sig_out_1;
        Q = conv_sig_out_2;
    end
endmodule