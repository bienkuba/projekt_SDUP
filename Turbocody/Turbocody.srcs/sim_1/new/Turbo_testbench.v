`timescale 1ns / 1ps

module Turbo_testbench();
    reg clk;
    reg reset_enc;
    reg reset_dec;
    reg [7:0] data_in;
    wire [23:0] data_encode;
    wire [7:0] data_out;
        
        
    Turbo_Encoder TE (
        .clk(clk),
        .reset(reset_enc),
        .data_in(data_in),
        .data_out(data_encode)
    );
    
    Turbo_Decoder TD (
        .clk(clk),
        .reset(reset_dec),
        .data_in(data_encode),
        .data_out(data_out)
    );
    
      initial begin
          clk = 0;
          forever #5 clk = ~clk;
      end
      
      initial begin
          reset_enc = 1;
          reset_dec = 1;
          #10;
          reset_enc = 0;
          #80;
          reset_dec = 0;
          reset_enc = 1;
      end
      
      initial begin
          data_in = 8'b10110100;
          #175 $finish;
      end
endmodule
