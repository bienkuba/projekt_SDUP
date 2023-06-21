`timescale 1ns / 1ps

module Turbocode_top(
        input wire  clk,
        input wire  reset_BTN,
        input wire  sw0,
        input wire  sw1,
        input wire  sw2,
        //input [7:0] data_in,
        //output [7:0] data_out,
        //output data_ready,
        output reg led0,
        output reg led1,
        output reg led2,
        output reg led3
    );
    
    wire        on0, on1, on2, on3;
    reg  [7:0]  data_in;
    wire [23:0] data_encode, data_out_error;
    wire        ready_encoded, ready_to_decode;
    
            
    Turbo_Encoder TE (
        .clk(clk),
        .reset(reset_BTN),
        .sw1(sw1),
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
        .led0(on0),
        .led1(on1),
        .led2(on2),
        .led3(on3)
    );
    
//   initial begin
//        reset = 1;
//        #500;
//        reset = 0;
//    end
    
    always@(*) begin
        if(sw0) data_in = 8'b10110100;
        else    data_in = 8'b00000000;
        led0 = on0;
        led1 = on1;
        led2 = on2;
        led3 = on3;
    end
    
    

endmodule
