`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 09:52:46
// Design Name: 
// Module Name: convolution
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


module RSC_Encoder(
    input wire clk,
    input wire rst, 
    input wire sig,
    
    output reg conv_sig
    );
    
    reg sig_0, sig_1, sig_2, sig_3;
    reg shift_reg_0, shift_reg_1, adder_1, adder_1_nxt, adder_2, adder_2_nxt ;
    
    always@(posedge clk )begin
        if (rst) begin
            shift_reg_0   <= 0;
            shift_reg_1   <= 0;
            adder_1       <= 0;
            adder_2       <= 0;
            conv_sig      <= 0;
        end    
        else begin
            shift_reg_0   <= adder_1;
            shift_reg_1   <= shift_reg_0;
            adder_1       <= adder_1_nxt;
            adder_2       <= adder_2_nxt;
            conv_sig      <= adder_2;            
        end
    end
    
    always@* begin
        adder_1_nxt = sig +  shift_reg_0 + shift_reg_1;
        adder_2_nxt = adder_1 + shift_reg_1;
    end
                
        
endmodule

/*input [4:0]x;

output [5:0]y;

reg [5:0]y;

always@(*)
begin
y[5]=x[0]^x[1]^x[2];
y[4]=x[2]^x[0];
y[3]=x[1]^x[2]^x[3];
y[2]=x[3]^x[1];
y[1]=x[2]^x[3]^x[4];
y[0]=x[4]^x[2];


end
endmodule*/