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
    input enable,
    input [7:0] original,
    input [7:0] data_decode_1,
    input [7:0] data_deinterleaved,
    output reg [7:0] output_data,
    output reg ready_out
    );
    
    always @(posedge clk)
    begin
        if (enable) begin
            if((original == data_deinterleaved)&&(original == data_decode_1)) begin
                output_data = original;
                $display("ZDEKODOWANO POPRAWNIE");
                ready_out <= 1;
            end
        end
    end
    
endmodule
