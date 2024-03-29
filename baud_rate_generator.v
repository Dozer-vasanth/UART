`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2024 01:50:01
// Design Name: 
// Module Name: baud_rate_generator
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


module baud_rate_generator
    #(parameter FINAL_VALUE_BITS = 10)
    (
        input [FINAL_VALUE_BITS-1:0] FINAL_VALUE,
        input clk,reset,
        output done
    );
    
    reg [FINAL_VALUE_BITS-1:0] state;
    reg done_store;
    
    always @(posedge clk,negedge reset)
    begin
        if(~reset)
        begin
            done_store <= 0;
            state <= 0;
        end
        else 
        begin
            
            if(state==FINAL_VALUE)
            begin
                done_store <= 1;
                state <=0;
            end
            else
            begin
                state <= state + 1;
                done_store <= 0;
            end
        end
    end
    
    assign done = done_store;
endmodule
