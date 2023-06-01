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
    input [7:0] original,
    input [7:0] data_decode_1,
    input [7:0] data_deinterleaved,
    output reg [7:0] ouput_data
    );
    
    initial begin
        if(data_decode_1 == data_deinterleaved) begin
            ouput_data = original;
            $display("ZDEKODOWANO POPRAWNIE");
         end
    end
    
endmodule
