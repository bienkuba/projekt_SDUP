`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2023 13:08:52
// Design Name: 
// Module Name: convolutional_encoder
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



module convolutional_encoder(x,y);	//x is the 3 bit input, padd 00 at last , and y is the encoded output
input [4:0]x;	//for a 3 bit input pad 00 and 00 in start and last

output [5:0]y;

reg [5:0]y;

always@(*)
begin
y[5]=          x[2]^x[1]^x[0];
y[4]=          x[2]     ^x[0];
y[3]=     x[3]^x[2]^x[1];
y[2]=     x[3]     ^x[1];
y[1]=x[4]^x[3]^x[2];
y[0]=x[4]     ^x[2];


end
endmodule