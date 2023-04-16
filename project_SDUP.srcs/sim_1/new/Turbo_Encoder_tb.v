`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2023 10:41:13
// Design Name: 
// Module Name: Turbo_Encoder_tb
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


module Turbo_Encoder_tb;
    reg clk = 0;
    reg rst;
    reg data_in;
    
    wire a;
    wire b;
    wire c;
    
    Turbo_Encoder UUT ( .clk(clk), .rst(rst), .data_in(data_in), .a(a), .b(b), .c(c) );
    
    always #5 clk = ~clk;
    
    initial begin
        rst <= 1;
        data_in <= 1;
        
        #10;
        rst <= 0;
        
        #100;
        $finish;
    end
    
endmodule
