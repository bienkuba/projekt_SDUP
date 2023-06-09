`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2023 13:08:52
// Design Name: 
// Module Name: Decoder
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


module Decoder(sequence,path);	//Sequnce is the input to be given which is 6 bit, path is the decoded output
input [5:0]sequence;
output [2:0]path;

reg [5:0]   a0a1a2a3=6'b000000, //to s� kody cykliczne albo kody hamminga imo
            a0a1a2b3=6'b000011,
            a0a1b2c3=6'b001110,
            a0a1b2d3=6'b001101,
            a0b1c2a3=6'b111011,
            a0b1c2b3=6'b111000, 
            a0b1d2c3=6'b110101,
            a0b1d2d3=6'b110110;

reg [5:0]x1,x2,x3,x4,x5,x6,x7,x8;
reg [2:0]d1,d2,d3,d4,d5,d6,d7,d8;
reg [2:0]path;
reg [2:0]x;
reg [2:0]min=3'b111;

always@(*)begin
	
	x1=sequence^a0a1a2a3;	
	x2=sequence^a0a1a2b3;
	x3=sequence^a0a1b2c3;
	x4=sequence^a0a1b2d3;
	x5=sequence^a0b1c2a3;
	x6=sequence^a0b1c2b3;
	x7=sequence^a0b1d2c3;
	x8=sequence^a0b1d2d3;

	d1=x1[5]+x1[4]+x1[3]+x1[2]+x1[1]+x1[0];	//Calculating the Hamming distance
	d2=x2[5]+x2[4]+x2[3]+x2[2]+x2[1]+x2[0];
	d3=x3[5]+x3[4]+x3[3]+x3[2]+x3[1]+x3[0];
	d4=x4[5]+x4[4]+x4[3]+x4[2]+x4[1]+x4[0];
	d5=x5[5]+x5[4]+x5[3]+x5[2]+x5[1]+x5[0];
	d6=x6[5]+x6[4]+x6[3]+x6[2]+x6[1]+x6[0];
	d7=x7[5]+x7[4]+x7[3]+x7[2]+x7[1]+x7[0];
	d8=x8[5]+x8[4]+x8[3]+x8[2]+x8[1]+x8[0];
	
	//Finding the minimum of the Hamming Distance
	
	if(d1<min) min=d1;
		else min=min;
		
	if(d2<min) min=d2;
		else min=min;
	
	if(d3<min) min=d3;
		else min=min;
		
	if(d4<min) min=d4;
		else min=min;

	if(d5<min) min=d5;
		else min=min;
		
	if(d6<min) min=d6;
		else min=min;
	
	if(d7<min) min=d7;
		else min=min;
		
	if(d8<min) min=d8;
		else min=min;

     if(d1==min) path=3'b000;
else if(d2==min) path=3'b001;
else if(d3==min) path=3'b010;
else if(d4==min) path=3'b011;
else if(d5==min) path=3'b100;
else if(d6==min) path=3'b101;
else if(d7==min) path=3'b110;
else if(d8==min) path=3'b111;


end		

endmodule