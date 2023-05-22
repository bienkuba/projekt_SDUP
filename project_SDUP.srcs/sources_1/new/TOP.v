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
    input wire          clk,
    input wire          rst,
    input wire [3:0]    data_in,
    
    output reg [3:0]    data_out
    );
    
    wire [11:0] T_encoder_out;
    wire [3:0]  decoder_out;
    
    Turbo_Encoder my_Turbo_Encoder(
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .data_out(T_encoder_out)
    );
    
    Turbo_Decoder my_Turbo_Decoder(
        .clk(clk),
        .rst(rst),
        .encoded_data(T_encoder_out),
        .decoded_data(decoder_out)
    );
    
    always @* begin
        data_out <= decoder_out;
    end
    
endmodule
