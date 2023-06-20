`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2023 10:42:06
// Design Name: 
// Module Name: RSC_encoder
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
module RSC_Encoder_8bit(
    input clk,
    input reset,
    input [7:0] data_in,
    output reg [15:0] data_out,
    output reg ready_out
);

integer i = -1;
reg current_data;
reg [1:0] state, next_state, next_data_out;

initial ready_out = 0;

always @(*) begin
    current_data = data_in[i];
    case(state)
        2'b00: begin
            next_state = current_data ? 2'b10 : 2'b00;
            next_data_out = current_data ? 2'b11 : 2'b00;
        end
        2'b01: begin
            next_state = current_data ? 2'b00 : 2'b10;
            next_data_out = current_data ? 2'b11 : 2'b00;
        end
        2'b10: begin
            next_state = current_data ? 2'b01 : 2'b11;
            next_data_out = current_data ? 2'b10 : 2'b01;
        end
        2'b11: begin
            next_state = current_data ? 2'b11 : 2'b01;
            next_data_out = current_data ? 2'b10 : 2'b01;
        end
    endcase
end
 
always @(posedge clk, posedge reset) begin
    if (reset) begin
        state <= 2'b00;
        i = 7;
        ready_out <= 0;
    end 
    else if (i >= 0) begin
        state <= next_state;
        data_out <= {data_out, next_data_out};
        i <= i - 1;
    end
    else begin
        ready_out <= 1;
    end
end

endmodule