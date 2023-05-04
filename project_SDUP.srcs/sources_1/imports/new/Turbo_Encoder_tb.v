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
    reg [3:0] data_in;
    
    wire [3:0] U;
    wire [3:0] P;
    wire [3:0] Q;
    
    Turbo_Encoder UUT ( 
        .clk(clk), 
        .rst(rst), 
        .data_in(data_in), 
        .U(U), 
        .P(P), 
        .Q(Q) 
    );
    
    always #5 clk = ~clk;
    
    initial begin
        rst <= 1;
        #10;
        rst <= 0;
        
        data_in <= 4'b0000;
        #10;
        $display(data_in[3:0],"-",P[3:0]);
        data_in <= 4'b0001;
        #10;
        $display("%0b %0b", data_in[3:0], P[3:0]);
        data_in <= 4'b0010;
        #10;
        data_in <= 4'b0011;
        #10;
        data_in <= 4'b0100;
        #10;
        data_in <= 4'b0101;
        #10;
        data_in <= 4'b0110;
        #10;
        data_in <= 4'b0111;
        #10
        data_in <= 4'b1000;
        #10;          
        data_in <= 4'b1001;
        #10;          
        data_in <= 4'b1010;
        #10;          
        data_in <= 4'b1011;
        #10;          
        data_in <= 4'b1100;
        #10;          
        data_in <= 4'b1101;
        #10;          
        data_in <= 4'b1110;
        #10;
        data_in <= 4'b1111;
        #10;
        $finish;
    end
    
endmodule
