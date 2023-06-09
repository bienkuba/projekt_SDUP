`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2023 15:01:35
// Design Name: 
// Module Name: data_assembler
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


module DataAssembler(
    input clk,
    input ready_data_enc_1,
    input ready_data_enc_2,
    input [7:0] data_in,
    input [15:0] data_1,
    input [15:0] data_2,
    output reg [23:0] data_assembled,
    output reg ready_data_encoded
);
    
    reg [7:0] parity_1, parity_2;
    
    initial ready_data_encoded <= 0;
    
    always @ (posedge clk) begin
        if (ready_data_enc_1 && ready_data_enc_2) begin
            parity_1 = {data_1[14], data_1[12], data_1[10], data_1[8], data_1[6], data_1[4], data_1[2], data_1[0]};
            parity_2 = {data_2[14], data_2[12], data_2[10], data_2[8], data_2[6], data_2[4], data_2[2], data_2[0]};
            data_assembled = {data_in, parity_1, parity_2};
            ready_data_encoded <= 1;
        end
    end
        
endmodule
