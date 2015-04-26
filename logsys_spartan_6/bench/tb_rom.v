`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:20:22 04/05/2015
// Design Name:   rom
// Module Name:   /home/murai/orpsoc-cores-ng/systems/logsys_spartan_6/ise_project/tb_rom.v
// Project Name:  ise_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rom
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_rom;

	// Inputs
	reg wb_clk;
	reg wb_rst;
	reg [6:2] wb_adr_i;
	reg wb_stb_i;
	reg wb_cyc_i;
	reg [2:0] wb_cti_i;
	reg [1:0] wb_bte_i;

	// Outputs
	wire [31:0] wb_dat_o;
	wire wb_ack_o;

	// Instantiate the Unit Under Test (UUT)
	rom uut (
		.wb_clk(wb_clk), 
		.wb_rst(wb_rst), 
		.wb_adr_i(wb_adr_i), 
		.wb_stb_i(wb_stb_i), 
		.wb_cyc_i(wb_cyc_i), 
		.wb_cti_i(wb_cti_i), 
		.wb_bte_i(wb_bte_i), 
		.wb_dat_o(wb_dat_o), 
		.wb_ack_o(wb_ack_o)
	);

	initial begin
		// Initialize Inputs
		wb_clk = 0;
		wb_rst = 1;
		wb_adr_i = 0;
		wb_stb_i = 0;
		wb_cyc_i = 0;
		wb_cti_i = 0;
		wb_bte_i = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		wb_rst <= 0;
		wb_stb_i <= 1;
		wb_cyc_i <= 1;
	end
	
	always #5
	wb_clk = ~wb_clk;
	
	always @ (posedge wb_clk)
	begin
		if(wb_stb_i)
		wb_adr_i <= wb_adr_i + 1;
	end
      
endmodule

