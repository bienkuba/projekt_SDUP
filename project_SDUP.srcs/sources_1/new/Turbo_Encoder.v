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
    input wire          clk,
    input wire          rst,
    input wire [3:0]    data_in,
    output reg [11:0]   data_out
    );
    
    wire [3:0] inter1_out, inter2_out, parity_1, parity_2;
    wire [11:0] transmitter_out;

    RSC_Encoder my_RSC_Encoder1( //recursive systematic convolutional
        .U(inter1_out),
        .P(parity_1)
    );
      
    RSC_Encoder my_RSC_Encoder2(
        .U(inter2_out),
        .P(parity_2)
    );
    
    Interleaver my_Interleaver(
        .data_in(data_in),
        .data_out(inter1_out),
        .Interleaved_data_out(inter2_out)
    );
    
    Transmitter Transmitter(
        .systematic_data(inter1_out),
        .parity_1(parity_1),
        .parity_2(parity_2),
        .send_package(transmitter_out)
    );
    
    always @(*) begin
        data_out = transmitter_out;
    end
    
endmodule