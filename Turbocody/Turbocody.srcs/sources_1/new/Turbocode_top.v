`timescale 1ns / 1ps

module Turbocode_top(
        input clk,
        input reset_BTN,
        input sw0,
        input sw2,
        //input [7:0] data_in,
        //output [7:0] data_out,
        //output data_ready,
        output led0,
        output led1,
        output led2,
        output led3
    );
    
    reg  [7:0] data_in;
    wire [23:0] data_encode, data_out_error;
    wire ready_encoded, ready_to_decode;
    
            
    Turbo_Encoder TE (
        .clk(clk),
        .reset(reset_BTN),
        .sw2(sw2),
        .data_in(8'b10110100),
        .data_out(data_encode),
        .ready_encoded(ready_encoded)
    );
    
/*    error_in EI (
        .clk(clk),
        .ready_encoded(ready_encoded),
        .data_in(data_encode),
        .sw2(sw2),
        .data_out(data_out_error),
        .ready(ready_to_decode)
    );
    */
    Turbo_Decoder TD (
        .clk(clk),
        .reset(reset_BTN),
        .en(ready_encoded),
        .data_in(data_encode),
        .led0(led0),
        .led1(led1),
        .led2(led2),
        .led3(led3)
    );
    
//   initial begin
//        reset = 1;
//        #500;
//        reset = 0;
//    end
    
    always@(*) begin
        if(sw0) data_in = 8'b10110100;
        else    data_in = 8'b00000000;
    end
    
    

endmodule
