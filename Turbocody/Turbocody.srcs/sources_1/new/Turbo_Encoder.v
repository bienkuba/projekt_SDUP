`timescale 1ns / 1ps

module Turbo_Encoder(
    input wire          clk,
    input wire          reset,
    input wire          sw1,
    input wire          sw2,
    input wire [7:0]    data_in,
    output  [23:0]   data_out,
    output           ready_encoded
    );
    
    wire        ready_data_1, ready_data_2, ready_out_intl, inter_ready_out;
    wire [7:0]  inter_out_1, inter_out_2;
    wire [15:0] data_1, data_2;//, data_p1, data_p2;
    
    reg [7:0] parity_1, parity_2;
    //reg [23:0] data_concatentate;
    
    integer i = 0;
    
    RSC_Encoder_8bit RSC1 (
        .clk(clk),
        .reset(reset),
        .en(inter_ready_out),
        .data_in(inter_out_2),
        .data_out(data_1),
        .ready_out(ready_data_1)
    );
       
   RSC_Encoder_8bit RSC2 (
        .clk(clk),
        .reset(reset),
        .en(inter_ready_out),
        .data_in(inter_out_1),
        .data_out(data_2),
        .ready_out(ready_data_2)
   );
      
   Interleaver_8bit interleaver (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(inter_out_1),
        .data_in_pass(inter_out_2),
        .ready_out(inter_ready_out)
   );  
   
   DataAssembler assemble (
        .clk(clk),
        .reset(reset),
        .sw1(sw1),
        .sw2(sw2),
        .ready_data_enc_1(ready_data_1),
        .ready_data_enc_2(ready_data_2),
        .data_in(data_in),       
        .data_1(data_1),        
        .data_2(data_2),        
        .data_assembled(data_out),
        .ready_data_encoded(ready_encoded)
   );
   
endmodule
