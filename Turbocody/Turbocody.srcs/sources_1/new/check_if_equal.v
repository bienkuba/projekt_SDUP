`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2023 14:41:56
// Design Name: 
// Module Name: check_if_equal
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module check_if_equal(
    input clk,
    input reset,
    input enable,
    input [7:0] original,
    input [7:0] data_decode_1,
    input [7:0] data_deinterleaved,
    output reg [7:0] output_data,
    output reg led0,
    output reg led1,
    output reg led2,
    output reg led3
    );
    
    always @(posedge clk) begin
        if (reset) begin
            led0 <= 0;
            led1 <= 0;
            led2 <= 0;
            led3 <= 0;
        end
        else begin
            led0 <= (original == data_decode_1 == data_deinterleaved)   ? 1 : 0; //all outputs correct
            led1 <= (data_decode_1 == data_deinterleaved)               ? 1 : 0; //original with error
            led2 <= (original == data_deinterleaved)                    ? 1 : 0; //parity1 with error
            led3 <= (original == data_decode_1)                         ? 1 : 0; //parity2 with error
        end
    end
    
/*    always @(posedge clk) begin
        if (reset) begin
            led0 <= 0;
            led1 <= 0;
            led2 <= 0;
            led3 <= 0;
            //output_data <= 8'b00000000;
        end
        else begin
            if (enable) begin
                if (original == data_deinterleaved == data_decode_1) begin
                      $display("ZDEKODOWANO POPRAWNIE");
                      led0 <= 0;
                      led1 <= 0;
                      led2 <= 0;
                      led3 <= 1;
                end
                else if (original != data_decode_1) begin
                    $display("B£¥D: dekoder1");
                    led0 <= 0;
                    led1 <= 1;
                    led2 <= 0;
                    led3 <= 0;
                end
                else if (original != data_deinterleaved) begin
                    $display("B£¥D: dekoder2");
                    led0 <= 0;
                    led1 <= 0;
                    led2 <= 1;
                    led3 <= 0;
                end   
                else if (original == data_deinterleaved == data_decode_1) begin
                    $display("ZDEKODOWANO POPRAWNIE");
                    led0 <= 0;
                    led1 <= 0;
                    led2 <= 0;
                    led3 <= 1;
                end
              end
         end*/
    end
endmodule
