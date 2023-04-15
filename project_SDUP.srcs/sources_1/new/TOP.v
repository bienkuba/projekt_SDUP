`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2023 10:51:37
// Design Name: 
// Module Name: TOP
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


module TOP(
    input wire clk,
    input wire rst,
    input wire data_in,
    output reg a,
    output reg b,
    output reg c
    );
    
    wire toRSC1, toRSC2, conv_sig_out_1, conv_sig_out_2;
    
    RSC_Encoder my_RSC_Enkoder1(
        .clk(clk),
        .rst(rst), 
        .sig(toRSC1),
        
        .conv_sig(conv_sig_out_1)
    );
      
    RSC_Encoder my_RSC_Enkoder2(
        .clk(clk),
        .rst(rst), 
        .sig(toRSC2),
        
        .conv_sig(conv_sig_out_2)
    );
    
    Interleaver my_Interleaver(
        .clk(clk),
        .rst(rst),
        .D(data_in),
        .Q(toRSC1),
        .Interleaved_Q(toRSC2)
    );
    
    always @(posedge clk) begin
        a <= data_in;
        b <= conv_sig_out_1;
        c <= conv_sig_out_2;
    end
endmodule
