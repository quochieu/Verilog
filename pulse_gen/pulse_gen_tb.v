`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:33:18 06/15/2018
// Design Name:   pulse_gen
// Module Name:   D:/Workspace/pulse/pulse_gen_tb.v
// Project Name:  pulse
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pulse_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pulse_gen_tb;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	pulse_gen uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.out(out) 
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#1000;
        
		// Add stimulus here
        rst_n = 1;
        
        
	end
    
    always forever #5 clk = ~clk;
      
endmodule

