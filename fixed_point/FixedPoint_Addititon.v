`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:  
// Design Name: 
// Module Name:    FixedPoint_Addititon 
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
module FixedPoint_Addititon #(
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
	input 	[N - 1		: 0]	i_a;
	input 	[N - 1		: 0]	i_b;
	output 	[N - 1		: 0]	o_c;  

//-------------------------------------------------
// Regs & Wires Declaration
//-------------------------------------------------	
	wire 	[N - 1		: 0]	a;
	wire 	[N - 1		: 0]	b;
	reg 	[N - 1		: 0]	sum;

//-------------------------------------------------
// Combinational
//-------------------------------------------------
	assign a 	= i_a;
	assign b 	= i_b;
	assign o_c 	= sum;


//-------------------------------------------------
// Sequential
//-------------------------------------------------	
	always @(a or b) begin
		// a and b are both positive or negative
		if(a[N-1] == b[N-1]) begin						
			//	a + b
			sum[N-2:0] = a[N-2:0] + b[N-2:0];
			//	Set the sign
			sum[N-1] = a[N-1];							 	
		end												
		// a is positive and b is negative
		else if(a[N-1] == 0 && b[N-1] == 1) begin		
			//	abs(a) > abs(b),
			if (a[N-2:0] > b[N-2:0]) begin
				//	a - b
				sum[N-2:0]  = a[N-2:0] - b[N-2:0];                                                                       
				sum[N-1]    = 0;   //	Set the sign to positive	    									
			end
			//	abs(a) > abs(b),
			else if (a[N-2:0] < b[N-2:0]) begin	
				// b - a to avoid 2's complement
				sum[N-2:0]  = b[N-2:0] - a[N-2:0];                                                                                                          
				sum[N-1]    = 1;   // Set the sign to negative 									
			end
			// abs(a) = abs(b)
			else begin
				sum[N-2:0] = 0;
				sum[N-1] = 0;
			end
		end
		// a is negative and b is positive
		else begin
			// abs(a) > abs(b)
			if (a[N-2:0] > b[N-2:0]) begin
				// a - b to avoid 2's complement
				sum[N-2:0]  = a[N-2:0] - b[N-2:0];                                    
				sum[N-1]    = 1;		
			end
			// abs(a) < abs(b)
			else if (a[N-2:0] < b[N-2:0]) begin
				sum[N-2:0]  = b[N-2:0] - a[N-2:0];
				sum[N-1]    = 0;
			end
			else begin
				sum[N-2:0] = 0;
				sum[N-1] = 0;
			end
		end		
	end

endmodule
