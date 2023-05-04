`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2023 21:59:50
// Design Name: 
// Module Name: Receiver
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


module Receiver(
    input wire          clk,
    input wire          rst,
    input wire [11:0]   get_package,
    output reg [3:0]    systematic_data,
    output reg [3:0]    parity_1,
    output reg [3:0]    parity_2
    );
    
    always@(posedge clk) begin
        if(rst) begin
            systematic_data = 0;
            parity_1        = 0;
            parity_2        = 0;
        end
        else begin
            systematic_data = get_package[11:8];
            parity_1        = get_package[7:4];
            parity_2        = get_package[3:0];
        end
    end
      
endmodule
