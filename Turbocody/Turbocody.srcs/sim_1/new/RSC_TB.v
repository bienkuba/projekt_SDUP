`timescale 1ns / 1ps

module RSC_TB();

    // Inputs
    reg clk;
    reg reset;
    reg [7:0] data_in;
	
	wire [15:0] data_enc;
    
    // Outputs
    wire [7:0] data_out;
    integer i = 0;
    // Instantiate the module
	RSC_encoder dut_enc (
        .clk(clk),
        .reset(reset_enc),
        .data_in(data_in),
        .data_out(data_enc)
    );
	
    RSC_decoder dut_dec (
        .clk(clk),
        .reset(reset_dec),
        .data_in(data_enc),
        .data_out(data_out)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Reset generation
    initial begin
        reset_enc = 1;
		reset_dec = 1;
        #10 reset_enc = 0;
		#90;
		reset_dec = 0;
    end
    // Test case 1: Encode 8-bit input with all zeros
    initial begin
        data_in = 8'b10011010;
        #90;
    end
    
    // End simulation
    initial #185 $finish;
    
endmodule