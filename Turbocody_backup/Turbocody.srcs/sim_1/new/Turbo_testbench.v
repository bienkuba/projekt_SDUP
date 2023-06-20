`timescale 1ns / 1ps

module Turbo_testbench();
    reg clk;
    reg reset;
//    reg reset_dec;
    reg [7:0] data_in;
    wire [23:0] data_encode;
    wire [7:0] data_out;
    wire ready_encoded;
        
        
    Turbo_Encoder TE (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_encode),
        .ready_encoded(ready_encoded)
    );
    
    Turbo_Decoder TD (
        .clk(clk),
        .reset(~ready_encoded),
        .data_in(data_encode),
        .data_out(data_out)
    );
    
      initial begin
          clk = 0;
          forever #5 clk = ~clk;
      end
      
      initial begin
          reset = 1;
//          reset_dec = 1;
          #5;
          reset = 0;
//          #120;
//          //reset_dec = 0;
//          reset_enc = 1;
      end
      
      initial begin
          data_in = 8'b10110100;
          #300 $finish;
      end
endmodule
