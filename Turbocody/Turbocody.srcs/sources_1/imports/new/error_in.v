`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2023 11:47:15
// Design Name: 
// Module Name: error_in
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


module error_in(
    input clk,
    input ready_encoded,
    input [23:0] data_in,
    input sw2,
    output reg [23:0] data_out,
    output reg ready
    );
    
   // reg [23:0] data_in_nxt;
    
//    always @(*) begin
//       if(sw2) begin
//           data_in_nx = 23'b//{data_in[23:20], ~data_in[19], data_in[18:0]}; 
//       end
//       else begin
//           data_in_nxt = data_in;
//       end 
//    end
    
    always @(posedge clk) begin
        if(ready_encoded) begin
            if(sw2) begin
                data_out <= {data_in[23:14], !data_in[13], data_in[12:0]};
            end
            else begin
                data_out <= data_in;
            end
            
            ready <= ready_encoded;
        end
    end
    
endmodule
