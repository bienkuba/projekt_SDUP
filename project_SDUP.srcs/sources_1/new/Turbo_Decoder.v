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
    input wire          clk,
    input wire          rst,
    input wire [11:0]   encoded_data,

    output reg [3:0]    decoded_data
    );
    
    wire [0:3] inter_out, decoder1_out, decoder2_out, deinter_out, hard_d, sys_data, parity_1, parity_2;
    wire en;
    
    Receiver receiver(
        .clk(clk),
        .rst(rst),
        .get_package(encoded_data),
        .systematic_data(sys_data),
        .parity_1(parity_1),
        .parity_2(parity_2)
    );
    
    SISO_Decoder SISO_Decoder_1(
        .systematic(sys_data),
        .parity(parity_1),
        .en(),
        .alt(en),
        .decoder_out(decoder1_out)
    );  
    
    SISO_Decoder SISO_Decoder_2(
        .systematic(inter_out),
        .parity(parity_2),
        .en(en),
        .alt(),
        .decoder_out(decoder2_out)
    );  
    
    Interleaver Interleaver(
        .data_in(sys_data),
        .data_out(),
        .Interleaved_data_out(inter_out)
    );
    
    Deinterleaver Deinterleaver(
        .data_in(decoder2_out),
        .data_out(),
        .Deinterleaved_data_out(deinter_out)
    );
    
    Hard_Decision my_Hard_Decision(
        .decoder_1(decoder1_out),
        .decoder_2(deinter_out),
        .out(hard_d)
    );
    
    always@* decoded_data = hard_d;
    
endmodule
