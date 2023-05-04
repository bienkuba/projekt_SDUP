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
    input wire [2:0] data_in,
    
    output reg data_out
    );
    
    wire encoder_out1, encoder_out2, encoder_out3;
    wire decoder_out;
    
    Turbo_Encoder my_Turbo_Encoder(
        .data_in(data_in),
        .U(encoder_out1),
        .P(encoder_out2),
        .Q(encoder_out3)
    );
    
/*    Turbo_Decoder my_Turbo_Decoder(
        .clk(clk),
        .rst(rst),
        .U(encoder_out1),
        .P(encoder_out2),
        .Q(encoder_out3),
        
        .decoded_data(decoder_out)
    );*/
    
    always @* begin
        data_out <= decoder_out;
    end
    
endmodule
