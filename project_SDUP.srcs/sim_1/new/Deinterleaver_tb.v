`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.05.2023 16:37:06
// Design Name: 
// Module Name: Deinterleaver_tb
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


module Deinterleaver_tb;
    reg [3:0] data_in;
    
    wire [3:0] data_out;
    wire [3:0] Deinterleaved_data_out;
    
    Deinterleaver UUT (
        .data_in(data_in), 
        .data_out(data_out), 
        .Deinterleaved_data_out(Deinterleaved_data_out) 
    );
    
    initial begin
        #10;
        data_in <= 4'b0001;
        #10
        data_in <= 4'b0011;
        #10
        data_in <= 4'b0101;
        #10;
        $finish;
    end
endmodule