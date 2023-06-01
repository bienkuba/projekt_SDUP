`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2023 17:10:52
// Design Name: 
// Module Name: Turbo_Encoder_TB
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


module Turbo_Encoder_TB();
    reg clk;
    reg reset;
    reg [7:0] data_in;
    wire [23:0] data_out;
    
    
     Turbo_Encoder TE (
           .clk(clk),
           .reset(reset),
           .data_in(data_in),
           .data_out(data_out)
      );
    
       initial begin
           clk = 0;
           forever #5 clk = ~clk;
       end
       
       initial begin
           reset = 1;
           #10 reset = 0;
       end
       initial begin
           data_in = 8'b10110100;
           #105 $finish;
       end
endmodule
