`timescale 1ns / 1ps

module Turbocode_top(
        input clk,
        input reset,
        input [7:0] data_in,
        output [7:0] data_out,
        output data_ready
    );
    
    wire [23:0] data_encode;
    wire ready_encoded;
            
    Turbo_Encoder TE (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_encode),
        .ready_encoded(ready_encoded)
    );

    Turbo_Decoder TD (
        .clk(clk),
        .reset(~ready_encoded),
        .data_in(data_encode),
        .data_out(data_out),
        .decoded_ready(data_ready)
    );
    
    

endmodule
