/*
 *
 * Clock, reset generation unit for Atlys board
 *
 * Implements clock generation according to design defines
 *
 */
module clkgen
       (
	// Main clocks in, depending on board
	input  sys_clk_pad_i,
	// Asynchronous, active low reset in
	input  rst_n_pad_i,

	// Wishbone clock and reset out
	output wb_clk_o,
	output wb_rst_o
);

assign wb_clk_o = sys_clk_pad_i;
assign wb_rst_o = rst_n_pad_i;

endmodule // clkgen
