

project new logsys_spartan_6
project set family spartan6
project set device xc6slx9
project set package tqg144
project set speed -3
project set "Generate Detailed MAP Report" true
project set "Verilog Include Directories" "/home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog|/home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/verilog_utils/|/home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/wb_bfm/|/home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/wb_common/|/home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/logsys_spartan_6/rtl/verilog|/home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/logsys_spartan_6/rtl/verilog/include" -process "Synthesize - XST"
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/gpio/gpio.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_branch_prediction.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_bus_if_avalon.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_bus_if_wb32.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_cache_lru.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_cfgrs.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_cpu_cappuccino.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_cpu_espresso.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_cpu_prontoespresso.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_cpu.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_ctrl_cappuccino.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_ctrl_espresso.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_ctrl_prontoespresso.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_dcache.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_decode_execute_cappuccino.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_decode.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_dmmu.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_execute_alu.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_execute_ctrl_cappuccino.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_fetch_cappuccino.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_fetch_espresso.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_fetch_prontoespresso.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_fetch_tcm_prontoespresso.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_icache.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_immu.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_lsu_cappuccino.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_lsu_espresso.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_pic.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_rf_cappuccino.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_rf_espresso.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_simple_dpram_sclk.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_store_buffer.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_ticktimer.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_true_dpram_sclk.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_wb_mux_cappuccino.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/mor1kx_wb_mux_espresso.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/pfpu32/pfpu32_addsub.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/pfpu32/pfpu32_cmp.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/pfpu32/pfpu32_f2i.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/pfpu32/pfpu32_i2f.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/pfpu32/pfpu32_muldiv.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/pfpu32/pfpu32_rnd.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/mor1kx/rtl/verilog/pfpu32/pfpu32_top.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/verilog-arbiter/src/arbiter.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/wb_intercon/wb_arbiter.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/wb_intercon/wb_data_resize.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/wb_intercon/wb_mux.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/wb_ram/rtl/verilog/wb_ram.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/wb_ram/rtl/verilog/wb_ram_generic.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/logsys_spartan_6/rtl/verilog/orpsoc_top.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/logsys_spartan_6/rtl/verilog/clkgen.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/logsys_spartan_6/rtl/verilog/rom.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/logsys_spartan_6/rtl/verilog/wb_intercon.v
xfile add /home/murai/openrisc/orpsoc-cores-ng/systems/logsys_spartan_6/build/logsys_spartan_6/src/logsys_spartan_6/data/logsys_sp6_board.ucf
project set top "orpsoc_top"

process run "Generate Programming File"
