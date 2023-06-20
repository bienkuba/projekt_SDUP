`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2023 11:03:36
// Design Name: 
// Module Name: RSC_encoder_TB
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


module RSC_Encoder_8bit_TB();

    // Inputs
    reg clk;
    reg reset;
    reg [7:0] data_in_1;
    wire [7:0] data_in_2;
    
    // Outputs
    wire [15:0] data_out;
    reg [7:0] parity_1, parity_2;
    integer i = 0;
    // Instantiate the module
    RSC_Encoder_8bit RSC1 (
        .clk(clk),
        .reset(reset),
        .data_in(data_in_1),
        .data_out(parity_1)
    );
    
    RSC_Encoder_8bit RRSC2 (
        .clk(clk),
        .reset(reset),
        .data_in(data_in_2),
        .data_out(parity_2)
    );
    
    Interleaver_8bit interleaver (
        .data_in(data_in_1),
        .data_out(data_in_2)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Reset generation
    initial begin
        reset = 1;
        #10 reset = 0;
    end
    // Test case 1: Encode 8-bit input with all zeros
    initial begin
        data_in_1 = 8'b10110100;
        #90;
        parity_1 = {data_out[14], data_out[12], data_out[10], data_out[8], data_out[6], data_out[4], data_out[2], data_out[0]};
    end
    
    // End simulation
    initial #95 $finish;
    
endmodule
