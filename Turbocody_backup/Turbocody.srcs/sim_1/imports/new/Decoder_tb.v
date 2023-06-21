`timescale 1ns / 1ps

module Decoder_tb();
    reg [5:0] encoded_data;
    wire [2:0] decoded_data;
    
    // Instantiate the unit under test (UUT)
    Decoder uut (
        .encoded_data(encoded_data), 
        .decoded_data(decoded_data)
    );
    
    // Stimulus
    initial begin
        encoded_data = 6'b000000;
        #10;
        if(decoded_data == 3'b000) 
            $display("Test 1 passed");
        else 
            $display("Test 1 failed");
        
        encoded_data = 6'b000011;
        #10;
        if(decoded_data == 3'b001) 
            $display("Test 2 passed");
        else 
            $display("Test 2 failed");
        
        encoded_data = 6'b001110;
        #10;
        if(decoded_data == 3'b010) 
            $display("Test 3 passed");
        else 
            $display("Test 3 failed");
        
        encoded_data = 6'b001101;
        #10;
        if(decoded_data == 3'b011) 
            $display("Test 4 passed");
        else 
            $display("Test 4 failed");
        
        encoded_data = 6'b111011;
        #10;
        if(decoded_data == 3'b100) 
            $display("Test 5 passed");
        else 
            $display("Test 5 failed");
        
        encoded_data = 6'b111000;
        #10;
        if(decoded_data == 3'b101) 
            $display("Test 6 passed");
        else 
            $display("Test 6 failed");
        
        encoded_data = 6'b110101;
        #10;
        if(decoded_data == 3'b110) 
            $display("Test 7 passed");
        else 
            $display("Test 7 failed");
        
        encoded_data = 6'b110110;
        #10;
        if(decoded_data == 3'b111) 
            $display("Test 8 passed");
        else 
            $display("Test 8 failed");
       
        $finish;
    end

endmodule
