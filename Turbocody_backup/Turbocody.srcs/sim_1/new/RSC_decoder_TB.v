`timescale 1ns / 1ps

module RSC_decoder_TB();

    // Inputs
    reg clk;
    reg reset;
    reg [15:0] data_in;
    
    // Outputs
    wire [7:0] data_out;
    integer i = 0;
    // Instantiate the module
    RSC_decoder dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Reset generation
    initial begin
        reset = 1;
        #10 reset = 0;
    end
    // Test case 1: Encode 8-bit input with all zeros
    initial begin
        data_in = 16'b1101101001110000;
        //data_in = 8'b10011010;
        #90;
    end
    
    // End simulation
    initial #95 $finish;
    
endmodule