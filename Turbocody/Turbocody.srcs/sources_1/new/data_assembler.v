`timescale 1ns / 1ps

module DataAssembler(
    input wire          clk,
    input wire          reset,
    input wire          sw1,
    input wire          sw2,
    input wire          ready_data_enc_1,
    input wire          ready_data_enc_2,
    input wire [7:0]    data_in,
    input wire [15:0]   data_1,
    input wire [15:0]   data_2,
    
    output reg [23:0]   data_assembled,
    output reg          ready_data_encoded
);
    
    reg [7:0] parity_1, parity_2;
    
    initial ready_data_encoded <= 0;
    
    always @ (posedge clk) begin
        if(reset) begin
            data_assembled = 0;
            ready_data_encoded <= 0;
        end
        else begin
            if (ready_data_enc_1 && ready_data_enc_2) begin
                    if(sw1) parity_1 = {data_1[14], data_1[12], data_1[10], data_1[8], data_1[6], data_1[4], data_1[2], data_1[0]};
                    else    parity_1 = {data_1[14], data_1[12], data_1[10], ~data_1[8], data_1[6], data_1[4], data_1[2], data_1[0]};
                    if(sw2) parity_2 = {data_2[14], data_2[12], data_2[10], ~data_2[8], data_2[6], data_2[4], data_2[2], data_2[0]};
                    else    parity_2 = {data_2[14], data_2[12], data_2[10], data_2[8], data_2[6], data_2[4], data_2[2], data_2[0]};
                //parity_2 = {data_2[14], data_2[12], data_2[10], data_2[8], data_2[6], data_2[4], data_2[2], data_2[0]};
                data_assembled = {data_in, parity_1, parity_2};
                ready_data_encoded <= 1;
            end
        end
    end
        
endmodule
