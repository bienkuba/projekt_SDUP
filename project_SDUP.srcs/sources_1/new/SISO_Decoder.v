`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2023 19:52:20
// Design Name: 
// Module Name: SISO_Decoder
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


module SISO_Decoder(
    input wire clk,
    input wire rst,
    input wire [7:0] dk,  //information
    input wire [7:0] pk1, //parity bits
    input wire [7:0] pk2, //interleaved parity bits
    
    output reg out
    );
    
    localparam S00 = 3'b000;
    localparam S01 = 3'b001;
    localparam S10 = 3'b011;
    localparam S11 = 3'b100; 
              
    reg [1:0]  state_nxt, state;
    
    always@(posedge clk)
        if (rst)
            state      <= S00; 
        else begin
            state        <= state_nxt;
    end
    
  /*  always@*begin
        case(state)
            S00: state_nxt = mouse_left||btnR ? MOVE_DOWN : IDLE;   
            S01: state_nxt = ;
            S10: state_nxt = ;
            S11: state_nxt = ;
        default:
            state_nxt = IDLE;  
        endcase
    end
            
    always@*begin 
        case (state_nxt)  
            S00: begin
                // 0/0 go S00
                // 1/1 go S10
                dk
            end 
            S01: begin
                // 0/1 go S01
                // 1/0 go S11
                
            end 
            S10: begin
                // 0/1 go S01
                // 1/0 go S11
                
            end 
            S11: begin
                // 0/0 go S00
                // 1/1 go S10
                
            end 
            default: begin 
            
            end
        endcase
    end      */
endmodule