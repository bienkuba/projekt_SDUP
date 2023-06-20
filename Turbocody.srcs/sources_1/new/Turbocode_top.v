`timescale 1ns / 1ps

module Turbocode_top(
        input clk,
        input reset,
        //input [7:0] data_in,
        input sw0,
        input sw1,
        
        output [7:0] data_out,
        output data_ready,
        output led0
    );
    
    
    wire [23:0] data_encode;
    wire ready_encoded;
    
    reg [7:0] data_in;
            
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
        .decoded_ready(data_ready),
        .led0(led0)
    );
    
    always@(*) begin
        if(sw0)data_in = 8'b10101001;
        else data_in = 0;
    end
    

endmodule
