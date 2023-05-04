`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2023 21:49:01
// Design Name: 
// Module Name: Transmitter
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


module Transmitter(
    input wire [3:0]    systematic_data,
    input wire [3:0]    parity_1,
    input wire [3:0]    parity_2,
    output reg [11:0]   send_package
    );
    
    always@* begin
        send_package = {systematic_data, parity_1, parity_2};
    end
    
endmodule
