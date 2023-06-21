`timescale 1ns / 1ps

module Turbo_Decoder(
    input wire          clk,
    input wire          reset,
    input wire          en,
    input wire [23:0]   data_in,
    output reg          led0,
    output reg          led1,
    output reg          led2,
    output reg          led3
    );
    
    wire        on0, on1, on2, on3;
    wire [7:0] data_deinterleaved;
    wire [15:0] data_parity_1, data_parity_2;
    wire [7:0] data_original, data_decode_1, data_decode_2;
    wire data_ready, data_decoded_1, data_decoded_2, deintl_ready;
    //, decoded_ready;
    
    Decoder_16bit decoder_1(
        .clk(clk),
        .reset(reset),
        .en(data_ready),
        .data_in(data_parity_1),
        .data_out(data_decode_1),
        .ready_out(data_decoded_1)
    );
    
    Decoder_16bit decoder_2(
        .clk(clk),
        .reset(reset),
        .en(data_ready),
        .data_in(data_parity_2),
        .data_out(data_decode_2),
        .ready_out(data_decoded_2)
    );
    
    Disassembler_24bit disassembler(
        .clk(clk),
        .reset(reset),
        .en(en),
        .data_in(data_in),
        .out_1(data_original),
        .out_2(data_parity_1),
        .out_3(data_parity_2),
        .data_disassembled(data_ready)
    );
    
    Deinterleaver deinterleaver (
        .clk(clk),
        .reset(reset),
        .enable(data_decoded_2),
        .data_in(data_decode_2),
        .data_out(data_deinterleaved),
        .ready_out(deintl_ready)
    );
    
    
    check_if_equal check(
        .clk(clk),
        .reset(reset),
        .enable(deintl_ready),
        .original(data_original),        
        .data_decode_1(data_decode_1),     
        .data_deinterleaved(data_deinterleaved),
        .output_data(),
        .led0(on0),
        .led1(on1),
        .led2(on2),
        .led3(on3)
     );   
    
    always@* begin
        led0 = on0;
        led1 = on1;
        led2 = on2;
        led3 = on3;
    end
    
//    initial begin
////        assign data_in_1 = {data_in[23], data_in[15], data_in[22], data_in[14], data_in[21], data_in[13], data_in[20], data_in[12], data_in[19], data_in[11], data_in[18], data_in[10], data_in[17], data_in[9], data_in[16], data_in[8]};
////        assign data_in_2 = {data_interleaved[7], data_in[7], data_interleaved[6], data_in[6], data_interleaved[5], data_in[5], data_interleaved[4], data_in[4], data_interleaved[3], data_in[3], data_interleaved[2], data_in[2], data_interleaved[1], data_in[1], data_interleaved[0], data_in[0]};
        
//            assign data_out = data_decode_1;
//    end
    
    
endmodule
