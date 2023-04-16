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
    
    reg clk = 0;
    reg rst;
    reg D;
    
    wire Q;
    wire Interleaved_Q;
    
    Interleaver UUT ( .clk(clk), .rst(rst), .D(D), .Q(Q), .Interleaved_Q(Interleaved_Q) );
    
    always #5 clk = ~clk;
    
    initial begin
        rst <= 1;
        D   <= 1;
        
        #10;
        rst <= 0;
        
        #100;
        $finish;
    end
endmodule
