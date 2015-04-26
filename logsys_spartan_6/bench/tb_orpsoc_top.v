`timescale 1ps / 1ps

module tb_orpsoc_top;

////////////////////////////////////////////////////////////////////////////////
//Add --vcd and --timeout options to the simulation 
///////////////////////////////////////////////////////////////////////////////
vlog_tb_utils vlog_tb_utils0();

	// Inputs
	reg sys_clk_pad_i;
	reg rst_n_pad_i;

	// Bidirs
	wire [7:0] gpio0_io;

	// Instantiate the Unit Under Test (UUT)
	orpsoc_top uut (
		.sys_clk_pad_i(sys_clk_pad_i), 
		.rst_n_pad_i(rst_n_pad_i), 
		.gpio0_io(gpio0_io)
	);

	initial begin
		// Initialize Inputs
		sys_clk_pad_i = 0;
		rst_n_pad_i = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst_n_pad_i = 0;
	end
	
	always #5
	sys_clk_pad_i = ~sys_clk_pad_i;
      
endmodule

