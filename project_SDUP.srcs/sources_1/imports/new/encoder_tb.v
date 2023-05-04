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
    reg [3:0] U;
    
    wire [3:0] P;
    
    RSC_Encoder UUT ( 
        .U(U), 
        .P(P)
    );
    
    
    
    initial begin
        #10;
        U <= 4'b0000;
        #10;
        U <= 4'b0001;
        #10;
        U <= 4'b0010;
        #10;
        U <= 4'b0011;
        #10;
        U <= 4'b0100;
        #10;
        U <= 4'b0101;
        #10;
        U <= 4'b0110;
        #10;
        U <= 4'b0111;
        #10;
        U <= 4'b1000;
        #10;
        U <= 4'b1001;
        #10;
        U <= 4'b1010;
        #10;
        U <= 4'b1011;
        #10;
        U <= 4'b1100;
        #10;
        U <= 4'b1101;
        #10;
        U <= 4'b1110;
        #10;
        U <= 4'b1111;
        #10;
        
        #50;
        $finish;
    end
endmodule
