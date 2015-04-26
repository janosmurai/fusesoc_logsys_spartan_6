//////////////////////////////////////////////////////////////////////
///                                                               ////
/// ORPSoC top for  board                                    ////
///                                                               ////
/// Instantiates modules, depending on ORPSoC defines file        ////
///                                                               ////
/// Copyright (C) 2013 Stefan Kristiansson                        ////
///  <stefan.kristiansson@saunalahti.fi                           ////
///                                                               ////
//////////////////////////////////////////////////////////////////////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

module orpsoc_top #(
   	parameter	rom0_aw = 6,
   	parameter	uart0_aw = 3
)(
	input		sys_clk_pad_i,
	input		rst_n_pad_i,

	// GPIO
	inout	[7:0]	gpio0_io
);

	parameter	IDCODE_VALUE=32'h14951185;

////////////////////////////////////////////////////////////////////////
//
// Modules interconnections
//
////////////////////////////////////////////////////////////////////////
`include "wb_intercon.vh"


////////////////////////////////////////////////////////////////////////
//
// Clock and reset generation module
//
////////////////////////////////////////////////////////////////////////

wire	dbg_tck;


clkgen clkgen0 (
	.sys_clk_pad_i	(sys_clk_pad_i),
	.rst_n_pad_i	(rst_n_pad_i),
	
	.wb_clk_o	(wb_clk),
	.wb_rst_o	(wb_rst)
);

wire	[31:0]	or1k_irq;

wire	[31:0]	or1k_dbg_dat_i;
wire	[31:0]	or1k_dbg_adr_i;
wire		or1k_dbg_we_i;
wire		or1k_dbg_stb_i;
wire		or1k_dbg_ack_o;
wire	[31:0]	or1k_dbg_dat_o;

wire		or1k_dbg_stall_i;
wire		or1k_dbg_ewt_i;
wire	[3:0]	or1k_dbg_lss_o;
wire	[1:0]	or1k_dbg_is_o;
wire	[10:0]	or1k_dbg_wp_o;
wire		or1k_dbg_bp_o;
wire		or1k_dbg_rst;

wire		sig_tick;

wire		or1k_rst;


////////////////////////////////////////////////////////////////////////
//
// or1200
// 
////////////////////////////////////////////////////////////////////////

mor1kx #(
       .FEATURE_DEBUGUNIT ("ENABLED"),
       .FEATURE_INSTRUCTIONCACHE ("ENABLED"),
       .OPTION_ICACHE_SET_WIDTH	(8),
       .OPTION_ICACHE_BLOCK_WIDTH	(5),
       .OPTION_ICACHE_WAYS	(2),
       .OPTION_ICACHE_LIMIT_WIDTH	(32),
       .FEATURE_DATACACHE	("NONE"),
       .OPTION_DCACHE_SET_WIDTH	(8),
       .OPTION_DCACHE_BLOCK_WIDTH	(5),
       .OPTION_DCACHE_WAYS	(2),
       .OPTION_DCACHE_LIMIT_WIDTH	(31),

       .FEATURE_IMMU	("NONE"),
       .FEATURE_DMMU	("NONE"),

       .FEATURE_DSX ("ENABLED"),
       .FEATURE_DIVIDER ("SERIAL"),
       .OPTION_PIC_TRIGGER	("LEVEL"),

	.IBUS_WB_TYPE("B3_REGISTERED_FEEDBACK"),
	.DBUS_WB_TYPE("B3_REGISTERED_FEEDBACK"),
	.OPTION_CPU0("CAPPUCCINO"),
	.OPTION_RESET_PC(32'h00000000)
) mor1kx0 (
	// Core clocks, resets
	.clk(wb_clk),
	.rst(wb_rst),

	// Instruction bus
	.iwbm_adr_o(wb_m2s_or1k_i_adr),
	.iwbm_stb_o(wb_m2s_or1k_i_stb),
	.iwbm_cyc_o(wb_m2s_or1k_i_cyc),
	.iwbm_sel_o(wb_m2s_or1k_i_sel),
	.iwbm_we_o (wb_m2s_or1k_i_we),
	.iwbm_cti_o(wb_m2s_or1k_i_cti),
	.iwbm_bte_o(wb_m2s_or1k_i_bte),
	.iwbm_dat_o(wb_m2s_or1k_i_dat),

	.iwbm_err_i(wb_s2m_or1k_i_err),
	.iwbm_ack_i(wb_s2m_or1k_i_ack),
	.iwbm_dat_i(wb_s2m_or1k_i_dat),
	.iwbm_rty_i(wb_s2m_or1k_i_rty),

	// Data bus
	.dwbm_adr_o(wb_m2s_or1k_d_adr),
	.dwbm_stb_o(wb_m2s_or1k_d_stb),
	.dwbm_cyc_o(wb_m2s_or1k_d_cyc),
	.dwbm_sel_o(wb_m2s_or1k_d_sel),
	.dwbm_we_o (wb_m2s_or1k_d_we ),
	.dwbm_cti_o(wb_m2s_or1k_d_cti),
	.dwbm_bte_o(wb_m2s_or1k_d_bte),
	.dwbm_dat_o(wb_m2s_or1k_d_dat),

	.dwbm_err_i(wb_s2m_or1k_d_err),
	.dwbm_ack_i(wb_s2m_or1k_d_ack),
	.dwbm_dat_i(wb_s2m_or1k_d_dat),
	.dwbm_rty_i(wb_s2m_or1k_d_rty),

	// Interrupts
	.irq_i(32'b0),

	// Debug interface ports
	.du_addr_i(or1k_dbg_adr_i[15:0]),
	.du_stb_i(or1k_dbg_stb_i),
	.du_dat_i(or1k_dbg_dat_i),
	.du_we_i(or1k_dbg_we_i),
	.du_dat_o(or1k_dbg_dat_o),
	.du_ack_o(or1k_dbg_ack_o),
	.du_stall_i(or1k_dbg_stall_i),
	.du_stall_o(or1k_dbg_bp_o)
);


////////////////////////////////////////////////////////////////////////
//
// ROM
//
////////////////////////////////////////////////////////////////////////

assign	wb_s2m_rom0_err = 1'b0;
assign	wb_s2m_rom0_rty = 1'b0;


rom #(.addr_width(rom0_aw))
rom0 (
	.wb_clk		(wb_clk),
	.wb_rst		(wb_rst),
	.wb_adr_i	(wb_m2s_rom0_adr[(rom0_aw + 2) - 1 : 2]),
	.wb_cyc_i	(wb_m2s_rom0_cyc),
	.wb_stb_i	(wb_m2s_rom0_stb),
	.wb_cti_i	(wb_m2s_rom0_cti),
	.wb_bte_i	(wb_m2s_rom0_bte),
	.wb_dat_o	(wb_s2m_rom0_dat),
	.wb_ack_o	(wb_s2m_rom0_ack)
);

////////////////////////////////////////////////////////////////////////
//
// RAM
//
////////////////////////////////////////////////////////////////////////

   localparam WB_RAM_MEM_DEPTH = 32'h10000000;
   
wb_ram
  #(.depth (WB_RAM_MEM_DEPTH))
    //.memfile ("clear_r3_and_jump_to_0x100.vh"))
   wb_ram0
     (//Wishbone Master interface
      .wb_clk_i (wb_clk),
      .wb_rst_i (wb_rst),
      .wb_adr_i	(wb_m2s_ram_adr[31:0]),
      .wb_dat_i	(wb_m2s_ram_dat),
      .wb_sel_i	(wb_m2s_ram_sel),
      .wb_we_i	(wb_m2s_ram_we),
      .wb_cyc_i (wb_m2s_ram_cyc),
      .wb_stb_i	(wb_m2s_ram_stb),
      .wb_cti_i	(wb_m2s_ram_cti),
      .wb_bte_i	(wb_m2s_ram_bte),
      .wb_dat_o	(wb_s2m_ram_dat),
      .wb_ack_o	(wb_s2m_ram_ack),
      .wb_err_o (wb_s2m_ram_err)
);

   assign wb_s2m_ram_rty = 1'b0;

////////////////////////////////////////////////////////////////////////
//
// GPIO 0
//
////////////////////////////////////////////////////////////////////////

wire [7:0]	gpio0_in;
wire [7:0]	gpio0_out;
wire [7:0]	gpio0_dir;

 //Tristate logic for IO
 //0 = input, 1 = output


genvar                    i;
generate
	for (i = 0; i < 8; i = i+1) begin: gpio0_tris
		assign gpio0_io[i] = gpio0_dir[i] ? gpio0_out[i] : 1'bz;
		assign gpio0_in[i] = gpio0_dir[i] ? gpio0_out[i] : gpio0_io[i];
	end
endgenerate

gpio gpio0 (
	// GPIO bus
	.gpio_i		(gpio0_in),
	.gpio_o		(gpio0_out),
	.gpio_dir_o	(gpio0_dir),
	// Wishbone slave interface
	.wb_adr_i	(wb_m2s_gpio0_adr[0]),
	.wb_dat_i	(wb_m2s_gpio0_dat),
	.wb_we_i	(wb_m2s_gpio0_we),
	.wb_cyc_i	(wb_m2s_gpio0_cyc),
	.wb_stb_i	(wb_m2s_gpio0_stb),
	.wb_cti_i	(wb_m2s_gpio0_cti),
	.wb_bte_i	(wb_m2s_gpio0_bte),
	.wb_dat_o	(wb_s2m_gpio0_dat),
	.wb_ack_o	(wb_s2m_gpio0_ack),
	.wb_err_o	(wb_s2m_gpio0_err),
	.wb_rty_o	(wb_s2m_gpio0_rty),

	.wb_clk		(wb_clk),
	.wb_rst		(wb_rst)
);


wire		vga0_irq = 0;


assign eth0_irq = 0;
assign eth0_tx_data = 0;
assign eth0_tx_en = 0;
assign eth0_tx_er = 0;
assign eth0_mdc_pad_o = 0;
assign eth0_md_pad_io = 0;
assign eth0_rst_n_o = 0;



wire ac97_irq = 0;


assign ps2_0_irq = 0;
assign wb_s2m_ps2_0_dat = 0;
assign wb_s2m_ps2_0_ack = 0;


assign ps2_1_irq = 0;
assign wb_s2m_ps2_1_dat = 0;
assign wb_s2m_ps2_1_ack = 0;


assign ps2_2_irq = 0;
assign wb_s2m_ps2_2_dat = 0;
assign wb_s2m_ps2_2_ack = 0;


////////////////////////////////////////////////////////////////////////
//
// Interrupt assignment
//
////////////////////////////////////////////////////////////////////////

wire	uart0_irq;
wire    spi0_irq;

assign or1k_irq[0] = 0; // Non-maskable inside OR1K
assign or1k_irq[1] = 0; // Non-maskable inside OR1K
assign or1k_irq[2] = uart0_irq;
assign or1k_irq[3] = 0;
assign or1k_irq[4] = eth0_irq;
assign or1k_irq[5] = ps2_0_irq;
assign or1k_irq[6] = spi0_irq;
assign or1k_irq[7] = 0;
assign or1k_irq[8] = vga0_irq;
assign or1k_irq[9] = 0;
assign or1k_irq[10] = 0;
assign or1k_irq[11] = 0;
assign or1k_irq[12] = ac97_irq;
assign or1k_irq[13] = ps2_1_irq;
assign or1k_irq[14] = ps2_2_irq;
assign or1k_irq[15] = 0;
assign or1k_irq[16] = 0;
assign or1k_irq[17] = 0;
assign or1k_irq[18] = 0;
assign or1k_irq[19] = 0;
assign or1k_irq[20] = 0;
assign or1k_irq[21] = 0;
assign or1k_irq[22] = 0;
assign or1k_irq[23] = 0;
assign or1k_irq[24] = 0;
assign or1k_irq[25] = 0;
assign or1k_irq[26] = 0;
assign or1k_irq[27] = 0;
assign or1k_irq[28] = 0;
assign or1k_irq[29] = 0;
assign or1k_irq[30] = 0;
assign or1k_irq[31] = 0;

endmodule // orpsoc_top
