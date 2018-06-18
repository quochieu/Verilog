`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:59 04/16/2018 
// Design Name: 
// Module Name:    multiplication 
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
//This function is optimized for multipication of numbers which have absolute value smaller than 1
module FixedPoint_Multiplication # (
		parameter Q = 6,
        parameter N = 8
    )
    (
        i_a,
        i_b,
        o_c
    );


//-------------------------------------------------
// Inputs & Outputs Declaration
//-------------------------------------------------
	input 	[N - 1		: 0]	i_a;    // N bits
	input 	[N - 1		: 0]	i_b;    // N bits
	output 	[2*N - 2	: 0]	o_c;    // 2N -1 bits

//-------------------------------------------------
// Regs & Wires Declaration
//-------------------------------------------------

    reg 	[2*N - 7	: 0]	product;
	reg 	[2*N - 2	: 0]	result;
	
	wire 	[12:0]	a_invert;
	wire 	[12:0]	b_invert;
	wire 	[25:0]	product_invert;

//-------------------------------------------------
// Combinational
//-------------------------------------------------
	assign o_c 			= result;

//-------------------------------------------------
// Sequential
//-------------------------------------------------
	always @(i_a or i_b) begin
		product 	<= i_a[N-4:0] * i_b[N-4:0];	    // Fragment multiplication
	end

	always @(product) begin
		result[2*N - 2]             <= i_a[N-1] ^ i_b[N-1];	    // 1-bit sign
		result[2*N - 3 : 2*N - 4]	<= 2'b0;	                // 2-bit interger - always 0 
		result[2*N - 5 : 0]	        <= {product , 2'b00};       // 
	end

endmodule
