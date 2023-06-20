`timescale 1ns / 1ps

module convolutional_encoder_tb;
  reg [2:0] input_data;
  wire [5:0] encoded_data;

  convolutional_encoder uut (
    .input_data(input_data),
    .encoded_data(encoded_data)
  );
  
  initial begin
    input_data = 3'b000;
    #5;
    input_data = 3'b001;
    #5;
    input_data = 3'b010;
    #5;
    input_data = 3'b011;
    #5;
    input_data = 3'b100;
    #5;
    input_data = 3'b101;
    #5;
    input_data = 3'b111;
    #5;
    $finish;

  end
  
endmodule
