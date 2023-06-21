`timescale 1ns / 1ps

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
            //output_data <= 8'b00000000;
        end
        else begin
            //if (enable) begin
                if (original == data_deinterleaved == data_decode_1) begin
                      $display("ZDEKODOWANO POPRAWNIE");
                      led0 <= 0;
                      led1 <= 0;
                      led2 <= 0;
                      led3 <= 1;
                end
                if (original != data_decode_1) begin
                    $display("B£¥D: dekoder1");
                    led0 <= 0;
                    led1 <= 1;
                    led2 <= 0;
                    led3 <= 0;
                end
                if (original != data_deinterleaved) begin
                    $display("B£¥D: dekoder2");
                    led0 <= 0;
                    led1 <= 0;
                    led2 <= 1;
                    led3 <= 0;
                end   
//                if (original == data_deinterleaved == data_decode_1) begin
//                    $display("ZDEKODOWANO POPRAWNIE");
//                    led0 <= 0;
//                    led1 <= 0;
//                    led2 <= 0;
//                    led3 <= 1;
//                end
              //end
         end
    end
endmodule
