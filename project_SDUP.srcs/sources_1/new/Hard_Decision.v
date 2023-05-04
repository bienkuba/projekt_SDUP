`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2023 19:53:04
// Design Name: 
// Module Name: Hard_Decision
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


module Hard_Decision(
    input wire [3:0]    decoder_1,
    input wire [3:0]    decoder_2,
    output reg [3:0]    out
    );
    
    always@* begin
        out = decoder_1;
    end
    
endmodule
