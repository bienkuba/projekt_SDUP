`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2023 10:10:40
// Design Name: 
// Module Name: Interleaver_tb
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


module Interleaver_tb;
    reg [3:0] data_in;
    
    wire [3:0] data_out;
    wire [3:0] Interleaved_data_out;
    
    Interleaver UUT (
        .data_in(data_in), 
        .data_out(data_out), 
        .Interleaved_data_out(Interleaved_data_out) 
    );
    
    initial begin
        #10;
        data_in <= 4'b0001;
        #10
        data_in <= 4'b0011;
        #10
        data_in <= 4'b0101;
        #100;
        $finish;
    end
endmodule
