`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:13:47 04/27/2018 
// Design Name: 
// Module Name:    rounder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rounder #(
		parameter DATA_IN_WIDTH = 8,
		parameter DATA_OUT_WIDTH = 4
	)
	(
		i_data_in,
		o_data_out
    );

//-------------------------------------------------
// Inputs & Outputs Declaration
//-------------------------------------------------
	input 		[DATA_IN_WIDTH - 1		: 0]	i_data_in;
	output reg	[DATA_OUT_WIDTH - 1		: 0]	o_data_out;


//-------------------------------------------------
// 
//-------------------------------------------------
	always @(i_data_in) begin
		if (i_data_in[DATA_IN_WIDTH-1] == 0) begin
			o_data_out 	<= 4'b0001;	// 1.0  
		end
		else begin
			o_data_out	<= 4'b1111;	// -1.0		two's complement	
		end
	end

endmodule
