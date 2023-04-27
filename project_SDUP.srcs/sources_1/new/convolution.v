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
    input wire [2:0] U,
    output reg [2:0] P
    );
    
    reg [2:0] R0, R1;
    
    always@* begin
        R0[0] = 0;
        R1[0] = 0;
        R0[1] = U[0] ^ R0[0] ^ R1[0];
        R1[1] = R0[0];
        R0[2] = U[1] ^ R0[1] ^ R1[1];
        R1[2] = R0[1];
        P[0] = (U[0]^R0[0]^R1[0])^R1[0];
        P[1] = (U[1]^R0[1]^R1[1])^R1[1];
        P[2] = (U[2]^R0[2]^R1[2])^R1[2];
    end
                
        
endmodule
