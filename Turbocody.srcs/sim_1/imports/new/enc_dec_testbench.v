`timescale 1ns / 1ps

module enc_dec_testbench;

reg [2:0] input_data;
wire [5:0] encoded_data;
wire [2:0] decoded_data;

convolutional_encoder dut1(input_data, encoded_data);
Decoder dut2(encoded_data, decoded_data);

initial begin
    input_data = 3'b001;
    #10;
    input_data = 3'b001;
    #10;
    input_data = 3'b101;
    #10;
    input_data = 3'b110;
    #10;
    input_data = 3'b111;
    #10;
    $finish;
end

endmodule
