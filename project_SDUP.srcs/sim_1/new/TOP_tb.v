`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2023 22:33:38
// Design Name: 
// Module Name: TOP_tb
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


module TOP_tb;
    reg clk = 0;
    reg rst;
    reg [3:0] data_in;
    
    wire [3:0] data_out;
    
    TOP UUT (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    always #10 clk = ~clk;
    
    initial begin
        #60
        rst <= 1;
        #20
        rst <= 0;
        #20;
        data_in <= 4'b0000;
        #20;
        data_in <= 4'b0001;
        #20;
        data_in <= 4'b0010;
        #20;
        data_in <= 4'b0011;
        #20;
        data_in <= 4'b0100;
        #20;
        data_in <= 4'b0101;
        #20;
        data_in <= 4'b0110;
        #20;
        data_in <= 4'b0111;
        #20;
        data_in <= 4'b1000;
        #20;
        data_in <= 4'b1001;
        #20;
        data_in <= 4'b1010;
        #20;
        data_in <= 4'b1011;
        #20;
        data_in <= 4'b1100;
        #20;
        data_in <= 4'b1101;
        #20;
        data_in <= 4'b1110;
        #20;
        data_in <= 4'b1111;
        #20;
        data_in <= 4'b0000;
        #50;
        $finish;
    end
endmodule
