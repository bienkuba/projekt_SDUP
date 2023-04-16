`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.04.2023 10:31:38
// Design Name: 
// Module Name: encoder_tb
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


module encoder_tb;
    reg clk = 0;
    reg rst;
    reg sig;
    
    wire conv_sig;
    
    RSC_Encoder UUT ( 
        .clk(clk), 
        .rst(rst), 
        .sig(sig), 
        .conv_sig(conv_sig)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        rst <= 1;
        sig <= 1;
        
        #10;
        rst <= 0;
        
        #50;
        $finish;
    end
endmodule
