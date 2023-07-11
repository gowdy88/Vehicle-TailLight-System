`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:29:54 02/17/2023
// Design Name:   mainlr
// Module Name:   /home/ise/Desktop/2020AAP1735H/2020AAP1735H/headlight/mainlr_tb.v
// Project Name:  headlight
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mainlr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mainlr_tb;

	// Inputs
	reg [1:0] S;
	reg Rst;
	reg Clk;
	wire [2:0] Left;
	wire [2:0]Right;
	

	// Instantiate the Unit Under Test (UUT)
	mainlr uut (.S(S),.Rst(Rst),.Clk(Clk),.Left(Left),.Right(Right)
	);

	initial begin
		// Initialize Inputs
		S = 2'b10;
		Rst=0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	 initial begin
    Clk = 1'b0;
    repeat(40) #2 Clk = ~Clk;
    $finish;
    end

      
endmodule

