`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 08:02:44 AM
// Design Name: 
// Module Name: avg_and_DPID
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


module avg_and_DPID#(
parameter BUFF_SIZE = 10 // TODO: think the max for 32 bit "sum register"
)(
input clk,
output rst,
input [9:0]adc_in,
output [9:0] adc_out
);

reg [9:0] buff [BUFF_SIZE-1:0];
integer i;

reg [32:0] sum;

always @(posedge clk) begin
    buff[0] <= adc_in;
    for(i = 0; i<BUFF_SIZE-1 ; i=i+1)    buff[i+1] <= buff[i];
end

always @(posedge clk) begin
    for(i = 0; i<BUFF_SIZE ; i=i+1)    sum = sum + buff[i];
end

assign adc_out = sum/BUFF_SIZE;

endmodule