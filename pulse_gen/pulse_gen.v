`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:14 06/15/2018 
// Design Name: 
// Module Name:    pulse_gen 
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
module pulse_gen(
        clk,
        rst_n,
        out
    );

    input   clk;
    input   rst_n;
    output  out;
    
    reg     [15 : 0]    count;
    reg                 out_reg;
    
    
    assign out = out_reg;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out_reg <= #1 0;
        end
        else begin
            case (count) 
                16'd0:      out_reg <= #1 1;                        
                16'd27:     out_reg <= #1 0;
                16'd54:     out_reg <= #1 1;
                16'd81:     out_reg <= #1 0;
                16'd108:    out_reg <= #1 1;
                16'd135:    out_reg <= #1 0;
                16'd162:    out_reg <= #1 1;
                16'd189:    out_reg <= #1 0;
                16'd216:    out_reg <= #1 1;
                16'd243:    out_reg <= #1 0;
                16'd270:    out_reg <= #1 1;
                16'd297:    out_reg <= #1 0;
            endcase
        
        end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= #1 0;
        end
        else begin
            if (count == 16'd9999) begin
                count <= #1 0;
            end
            else begin
                count <= #1 count + 1;            
            end
        end
    end
    

endmodule
