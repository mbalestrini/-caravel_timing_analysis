set STD_CELL_LIBRARY sky130_fd_sc_hd
set SPECIAL_VOLTAGE_LIBRARY sky130_fd_sc_hvl
set IO_LIBRARY sky130_fd_io

set RESULTS_PATH /results


read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$STD_CELL_LIBRARY/lib/$STD_CELL_LIBRARY\__tt_025C_1v80.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/sky130_sram_macros/lib/sky130_sram_2kbyte_1rw1r_32x512_8_TT_1p8V_25C.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$SPECIAL_VOLTAGE_LIBRARY/lib/$SPECIAL_VOLTAGE_LIBRARY\__tt_025C_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$SPECIAL_VOLTAGE_LIBRARY/lib/$SPECIAL_VOLTAGE_LIBRARY\__tt_025C_3v30_lv1v80.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_fd_io__top_gpiov2_tt_tt_025C_1v80_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_fd_io__top_ground_hvc_wpad_tt_025C_1v80_3v30_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_fd_io__top_ground_lvc_wpad_tt_025C_1v80_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_fd_io__top_ground_lvc_wpad_tt_100C_1v80_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_fd_io__top_power_lvc_wpad_tt_025C_1v80_3v30_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_fd_io__top_xres4v2_tt_tt_025C_1v80_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_ef_io__gpiov2_pad_tt_tt_025C_1v80_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_ef_io__vccd_lvc_clamped_pad_tt_025C_1v80_3v30_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_ef_io__vdda_hvc_clamped_pad_tt_025C_1v80_3v30_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_ef_io__vssa_hvc_clamped_pad_tt_025C_1v80_3v30_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_ef_io__vssd_lvc_clamped3_pad_tt_025C_1v80_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_ef_io__vccd_lvc_clamped3_pad_tt_025C_1v80_3v30_3v30.lib;\
read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/$IO_LIBRARY/lib/sky130_ef_io__vssd_lvc_clamped_pad_tt_025C_1v80_3v30.lib;\

read_verilog /caravel/mgmt_core_wrapper/verilog/gl/mgmt_core.v;\
read_verilog /caravel/mgmt_core_wrapper/verilog/gl/DFFRAM.v;\
read_verilog /caravel/mgmt_core_wrapper/verilog/gl/mgmt_core_wrapper.v;\
read_verilog /caravel/verilog/gl/caravel_clocking.v;\
read_verilog /caravel/verilog/gl/digital_pll.v;\
read_verilog /caravel/verilog/gl/housekeeping.v;\
read_verilog /caravel/verilog/gl/gpio_logic_high.v;\
read_verilog /caravel/verilog/gl/gpio_control_block.v;\
read_verilog /caravel/verilog/gl/gpio_defaults_block.v;\
read_verilog /caravel/verilog/gl/gpio_defaults_block_0403.v;\
read_verilog /caravel/verilog/gl/gpio_defaults_block_1803.v;\
read_verilog /caravel/verilog/gl/mgmt_protect_hv.v;\
read_verilog /caravel/verilog/gl/mprj_logic_high.v;\
read_verilog /caravel/verilog/gl/mprj2_logic_high.v;\
read_verilog /caravel/verilog/gl/mgmt_protect.v;\
read_verilog /caravel/verilog/gl/user_id_programming.v;\
read_verilog /caravel/verilog/gl/xres_buf.v;\
read_verilog /caravel/verilog/gl/spare_logic_block.v;\
read_verilog /caravel/verilog/gl/chip_io.v;\
read_verilog /caravel/verilog/gl/caravel.v;\

# Current project verilogs
#read_verilog /project_files/verilog/user_project_wrapper_PLACEHOLDER.v 

link_design caravel;

# Current project SPEF files
# read_spef -path mprj /home/videogamo/Work/caravel_timing_analysis/user_projects/empty/spef/user_project_wrapper.spef
	
read_spef -path soc/DFFRAM_0 /caravel/mgmt_core_wrapper/spef/DFFRAM.spef;\
read_spef -path soc/core /caravel/mgmt_core_wrapper/spef/mgmt_core.spef;\
read_spef -path soc /caravel/mgmt_core_wrapper/spef/mgmt_core_wrapper.spef;\
read_spef -path padframe /caravel/spef/chip_io.spef;\
read_spef -path rstb_level /caravel/spef/xres_buf.spef;\
read_spef -path pll /caravel/spef/digital_pll.spef;\
read_spef -path housekeeping /caravel/spef/housekeeping.spef;\
read_spef -path mgmt_buffers/powergood_check /caravel/spef/mgmt_protect_hv.spef;\
read_spef -path mgmt_buffers/mprj_logic_high_inst /caravel/spef/mprj_logic_high.spef;\
read_spef -path mgmt_buffers/mprj2_logic_high_inst /caravel/spef/mprj2_logic_high.spef;\
read_spef -path mgmt_buffers /caravel/spef/mgmt_protect.spef;\
read_spef -path \gpio_control_bidir_1[0] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_bidir_1[1] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_bidir_2[1] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_bidir_2[2] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1[0] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1[10] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1[1] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1[2] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1[3] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1[4] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1[5] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1[6] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1[7] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1[8] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1[9] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1a[0] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1a[1] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1a[2] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1a[3] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1a[4] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_1a[5] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[0] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[10] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[11] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[12] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[13] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[14] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[15] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[1] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[2] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[3] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[4] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[5] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[6] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[7] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[8] /caravel/spef/gpio_control_block.spef;\
read_spef -path \gpio_control_in_2[9] /caravel/spef/gpio_control_block.spef;\
read_spef -path gpio_defaults_block_0 /caravel/spef/gpio_defaults_block_1803.spef;\
read_spef -path gpio_defaults_block_1 /caravel/spef/gpio_defaults_block_1803.spef;\
read_spef -path gpio_defaults_block_2 /caravel/spef/gpio_defaults_block_0403.spef;\
read_spef -path gpio_defaults_block_3 /caravel/spef/gpio_defaults_block_0403.spef;\
read_spef -path gpio_defaults_block_4 /caravel/spef/gpio_defaults_block_0403.spef;\
read_spef -path gpio_defaults_block_5 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_6 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_7 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_8 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_9 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_10 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_11 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_12 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_13 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_14 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_15 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_16 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_17 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_18 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_19 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_20 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_21 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_22 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_23 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_24 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_25 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_26 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_27 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_28 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_29 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_30 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_31 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_32 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_33 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_34 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_35 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_36 /caravel/spef/gpio_defaults_block.spef;\
read_spef -path gpio_defaults_block_37 /caravel/spef/gpio_defaults_block.spef;\


read_sdc -echo /project_files/caravel.sdc;


report_checks -path_delay min -fields {slew cap input nets fanout} -format full_clock_expanded -group_count 50;
report_checks -path_delay max -fields {slew cap input nets fanout} -format full_clock_expanded -group_count 50;
report_worst_slack -max ;
report_worst_slack -min ;
report_checks -path_delay min -fields {slew cap input nets fanout} -format full_clock_expanded -slack_max 0.18 -group_count 10;

write_sdf $RESULTS_PATH/caravel.sdf;

check_setup -verbose > $RESULTS_PATH/check_setup_detail.rpt;
