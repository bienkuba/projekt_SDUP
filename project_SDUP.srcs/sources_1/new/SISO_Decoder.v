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


module SISO_Decoder(	//Sequnce is the input to be given which is 6 bit, path is the decoded output
    input wire [3:0]    systematic,
    input wire [3:0]    parity,
    input wire          en,
    output reg          alt,
    output reg [3:0]    decoder_out
);

reg [3:0]x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,xA,xB,xC,xD,xE,xF;
reg [3:0]d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,dA,dB,dC,dD,dE,dF;
reg [3:0]min=4'b1111;

always@(*)begin
	alt = 1;
	
    if(en==1)begin
        x0=parity^4'b0000;
        x1=parity^4'b1000;      
        x2=parity^4'b1100;
        x3=parity^4'b0100;
        x4=parity^4'b1110;
        x5=parity^4'b0110;
        x6=parity^4'b0010;
        x7=parity^4'b1010;
        x8=parity^4'b0111;
        x9=parity^4'b1111;
        xA=parity^4'b1011;
        xB=parity^4'b0011;
        xC=parity^4'b1001;
        xD=parity^4'b0001;
        xE=parity^4'b0101;
        xF=parity^4'b1101;
    end
    else begin        
        x0=parity^4'b0000;
        x1=parity^4'b0111;	
        x2=parity^4'b1110;
        x3=parity^4'b1001;
        x4=parity^4'b1100;            
        x5=parity^4'b1011;
        x6=parity^4'b0010;
        x7=parity^4'b0101;
        x8=parity^4'b1000;
        x9=parity^4'b1111;
        xA=parity^4'b0110;
        xB=parity^4'b0001;
        xC=parity^4'b0100;
        xD=parity^4'b0011;
        xE=parity^4'b1010;
        xF=parity^4'b1101;
    end
    
	d0=x0[3]+x0[2]+x0[1]+x0[0]; //Calculating the Hamming distance
	d1=x1[3]+x1[2]+x1[1]+x1[0];
	d2=x2[3]+x2[2]+x2[1]+x2[0];
	d3=x3[3]+x3[2]+x3[1]+x3[0];
	d4=x4[3]+x4[2]+x4[1]+x4[0];
	d5=x5[3]+x5[2]+x5[1]+x5[0];
	d6=x6[3]+x6[2]+x6[1]+x6[0];
	d7=x7[3]+x7[2]+x7[1]+x7[0];
	d8=x8[3]+x8[2]+x8[1]+x8[0];
	d9=x9[3]+x9[2]+x9[1]+x9[0];
	dA=xA[3]+xA[2]+xA[1]+xA[0];
	dB=xB[3]+xB[2]+xB[1]+xB[0];
	dC=xC[3]+xC[2]+xC[1]+xC[0];
	dD=xD[3]+xD[2]+xD[1]+xD[0];
	dE=xE[3]+xE[2]+xE[1]+xE[0];
	dF=xF[3]+xF[2]+xF[1]+xF[0];
	
	//Finding the minimum of the Hamming Distance
	
	if(d0<min) min=d0;
	if(d1<min) min=d1;
	if(d2<min) min=d2;
	if(d3<min) min=d3;
	if(d4<min) min=d4;
	if(d5<min) min=d5;
	if(d6<min) min=d6;
	if(d7<min) min=d7;
	if(d8<min) min=d8;
	if(d9<min) min=d9;
	if(dA<min) min=dA;
	if(dB<min) min=dB;
	if(dC<min) min=dC;
	if(dD<min) min=dD;
	if(dE<min) min=dE;
	if(dF<min) min=dF;
	
	 if(d0==min) decoder_out=4'b0000;
else if(d1==min) decoder_out=4'b0001;
else if(d2==min) decoder_out=4'b0010;
else if(d3==min) decoder_out=4'b0011;
else if(d4==min) decoder_out=4'b0100;
else if(d5==min) decoder_out=4'b0101;
else if(d6==min) decoder_out=4'b0110;
else if(d7==min) decoder_out=4'b0111;
else if(d8==min) decoder_out=4'b1000;   
else if(d9==min) decoder_out=4'b1001;
else if(dA==min) decoder_out=4'b1010;
else if(dB==min) decoder_out=4'b1011;
else if(dC==min) decoder_out=4'b1100;
else if(dD==min) decoder_out=4'b1101;
else if(dE==min) decoder_out=4'b1110;
else if(dF==min) decoder_out=4'b1111;

end		

endmodule

/* module SISO_Decoder(
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
    
   always@*begin
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
    end      
endmodule*/