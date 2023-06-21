`timescale 1ns / 1ps

module Turbo_testbench();
    reg clk;
    reg reset;
    reg sw0;
    reg sw2;
    reg [7:0] data_in;
    //wire [7:0] data_out;
    //wire data_ready;
    wire led0;
    wire led1;
    wire led2;
    wire led3;
        
    Turbocode_top TC (
        .clk(clk),
        .reset_BTN(reset),
        .data_in(data_in),
        .sw0(sw0),
        .sw2(sw2),
        .led0(led0),
        .led1(led1),
        .led2(led2),
        .led3(led3)
    );    
      initial begin
        sw0 = 1;
        sw2 = 0;
      end
      
      initial begin
          clk = 0;
          forever #5 clk = ~clk;
      end
      
      initial begin
          reset = 1;
          #50;
          reset = 0;
      end
      
      initial begin
          data_in = 8'b10110100;
      end
      
//      always @ (posedge data_ready) begin
//        $finish;
//      end  
        
endmodule
