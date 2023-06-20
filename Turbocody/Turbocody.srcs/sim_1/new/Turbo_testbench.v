`timescale 1ns / 1ps

module Turbo_testbench();
    reg clk;
    reg reset;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire data_ready;
        
    Turbocode_top TC (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_out),
        .data_ready(data_ready)
    );    
    
      initial begin
          clk = 0;
          forever #5 clk = ~clk;
      end
      
      initial begin
          reset = 1;
          #5;
          reset = 0;
      end
      
      initial begin
          data_in = 8'b10110100;
      end
      
      always @ (posedge data_ready) begin
        $finish;
      end  
        
endmodule
