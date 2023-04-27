`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2023 19:50:52
// Design Name: 
// Module Name: Turbo_Decoder
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


module Turbo_Decoder(
    input wire clk,
    input wire rst,
    input wire U,
    input wire P,
    input wire Q,
    
    output reg decoded_data
    );
    
    wire decoder1_out, decoder2_out, deinter1_out, inter1_out, inter2_out, hard_d;

    SISO_Decoder SISO_Decoder_1(
        .clk(clk),
        .rst(rst),
        .Systematic_information(U),
        .Parity_information(P),
        .Extrinsic_information(deinter1_out),
        .out(decoder1_out)
    );  
    
    SISO_Decoder SISO_Decoder_2(
        .clk(clk),
        .rst(rst),
        .Systematic_information(Q),
        .Parity_information(inter2_out),
        .Extrinsic_information(inter1_out),
        .out(decoder2_out)
    );    
    
    Interleaver Interleaver_1(
        .clk(clk),
        .rst(rst),
        .D(decoder1_out),
        .Q(),
        .Interleaved_Q(inter1_out)
    );  
         
    Interleaver Interleaver_2(
        .clk(clk),
        .rst(rst),
        .D(P),
        .Q(),
        .Interleaved_Q(inter2_out)
    );      
         
    Deinterleaver Deinterleaver_1(
        .clk(clk),
        .rst(rst),
        .in(),
        .out(deinter1_out)
    );
    
    Hard_Decision my_Hard_Decision(
        .in(decoder2_out),
        .out(hard_d)
    );
    
    always@* decoded_data = hard_d;
    
endmodule
