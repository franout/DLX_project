###############################################
#### analyzing and checking vhdl netlist  #####
###############################################
puts "Starting top down compilation"
set designer "Franout - Francesco Angione"
set company "Microelectronic Systems @ Polito"
## maybe for vhdl2008 support 
#set_property file_type {VHDL 2008} [get_files  {{D:/uni/2018-2019/Microelectronic systems/dlx_project/hardware/dlx/global_components.package/pg.vhd}}]
## path_to_file variable comes from bash script
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/constants.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/alu_type.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)000-globals.vhd"
analyze -library WORK -format vhdl "$env(path_to_file)001-global_components.vhd"

puts "Compiling labs units"
analyze -library WORK -format vhdl  "$env(path_to_file)global_components.package/wrf.vhd" 
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/adder.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/alu.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/boothmul.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/complement2.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/encoder.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/fa.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/fd.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/gsb.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/mult_gm.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/mux.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/mux21.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/mux21_nbit.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/p4_adder.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/pgsb.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/rca.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/csb.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/reg_nbit.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/registerfile.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/stcg.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/sum_gen.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)global_components.package/pg.vhd"

puts "Compiling stages,control unit and datapath"
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.e-Write_back.stage.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.a-Fetch.stage.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.b-Decode.stage.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.c-Execute.stage.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.d.Memory.stage.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.b-Decode.stage/a.b.b.a-sign_extension.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.a-check_branch_logic.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.b-general_alu.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.vhd "
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.a-mux.vhd"
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.b-adder.vhd"
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.c-complement2.vhd"
analyze -library WORK -format vhdl "$env(path_to_file)a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.d-encoder.vhd"
analyze -library WORK -format vhdl "$env(path_to_file)a.a-control_unit.vhd "
analyze -autoread -library WORK -format vhdl "$env(path_to_file)a-DLX.vhd "


###########################################################
################ elaborating the top entity ###############
###########################################################
puts "Elaborating top level entity"
elaborate -update dlx -architecture dlx_rtl -library WORK -parameters "IR_SIZE=32,PC_SIZE=32"
current_design "DLX_IR_SIZE32_PC_SIZE32"

# define a clock name
set clockName "clk"
create_clock -name $clockName CLK

##########################################
# first compilation, without constraints #
##########################################
puts "Synthesis without constraints"
compile 
# reporting riming and power after the first synthesis without constraints #
report_timing -nworst 10 > ./report/timing10worst_report_dlx_irsize32_pcsize32_nopt.rpt ; # 10 worse paths
report_timing > ./report/timing_report_dlx_irsize32_pcsize32b_nopt.rpt
report_area > ./report/area_report_dlx_irsize32_pcsize32_nopt.rpt
report_power > ./report/power_report_dlx_irsize32_pcsize32_nopt.rpt
report_clock > ./report/report_clock_dlx_irsize32_pcsize32_nopt.rpt

write -hierarchy -format ddc -output ./output_netlist/dlx_irsize32_pcsize32_nopt.ddc
write -hierarchy -format vhdl -output ./output_netlist/dlx_irsize32_pcsize32_nopt.vhdl
write -hierarchy -format verilog -output ./output_netlist/dlx_irsize32_pcsize32_nopt.v
write_sdc ./output_netlist/dlx_irsize32_pcsize32_nopt.sdc

puts "Synthesis push as much as possible the clock frequency i.e. until the slack is positive"
# forces a combinational max delay of REQUIRED_TIME from each of the inputs
# to each of th eoutput, that is a delay lower than the one found after
# the first compilation step #
# often this is the working clock period of your system #
#set a 20% lower required time( float )  than maxpath
set MAX_PATH_c [ get_timing_paths -delay_type max -nworst 1  -include_hierarchical_pins ]

#calculating the value of max_path in ns
set mp_l [list]
foreach_in_collection path $MAX_PATH_c   { 
        set mpi 0.0
    foreach_in_collection point [ get_attribute $path points ] {
        set mpi [ expr $mpi + [ get_attribute $point arrival ]]
        }
lappend mp_l $mpi 
}

# since the path is critical there is only one object into the list 
set REQUIRED_TIME [ expr $mp_l*0.80 ]
#########################
### clock constraints ###
#########################
create_clock -name $clockName -period $REQUIRED_TIME CLK
set_max_delay $REQUIRED_TIME -from [all_inputs] -to [all_outputs]
set_fix_hold $clockName

set max_transition_time 0.01
set_max_transition $max_transition_time [all_outputs]
set_min_delay 0.20 -from [all_inputs] -to [all_outputs]
set_input_delay 0.15 -clock $clockName [all_inputs]
set_output_delay 0.15 -clock $clockName [all_outputs]

optimize_registers -clock $clockName  -minimum_period_only
set_fix_hold $clockName

# optimize
# enable the scan insetion and evaluation of impact
compile_ultra -scan 
# save report
report_timing > ./report/timing_report_dlx_irsize32_pcsize32_opt_20.rpt
report_area > ./report/area_report_dlx_irsize32_pcsize32_opt_20.rpt
report_power > ./report/power_report_dlx_irsize32_pcsize32_opt_20.rpt
report_clock > ./report/report_clock_dlx_irsize32_pcsize32_opt_20.rpt
# saving files
write -hierarchy -format ddc -output ./output_netlist/dlx_irsize32_pcsize32_topt_20.ddc
write -hierarchy -format vhdl -output ./output_netlist/dlx_irsize32_pcsize32_topt_20.vhdl
write -hierarchy -format verilog -output ./output_netlist/dlx_irsize32_pcsize32_topt_20.v

#set a 10% lower required time( float )  than maxpath
set REQUIRED_TIME [ expr $mp_l*0.90 ]
#########################
### clock constraints ###
#########################
create_clock -name $clockName -period $REQUIRED_TIME CLK
set_max_delay $REQUIRED_TIME -from [all_inputs] -to [all_outputs]
set_fix_hold $clockName

set max_transition_time 0.01
set_max_transition $max_transition_time [all_outputs]
set_min_delay 0.20 -from [all_inputs] -to [all_outputs]
set_input_delay 0.15 -clock $clockName [all_inputs]
set_output_delay 0.15 -clock $clockName [all_outputs]

optimize_registers -clock $clockName  -minimum_period_only
set_fix_hold $clockName
# optimize
compile_ultra -scan
# save report
report_timing > ./report/timing_report_dlx_irsize32_pcsize32_opt_10.rpt
report_area > ./report/area_report_dlx_irsize32_pcsize32_opt_10.rpt
report_power > ./report/power_report_dlx_irsize32_pcsize32_opt_10.rpt
report_clock > ./report/report_clock_dlx_irsize32_pcsize32_opt_10.rpt

# saving files
write -hierarchy -format ddc -output ./output_netlist/dlx_irsize32_pcsize32_topt_10.ddc
write -hierarchy -format vhdl -output ./output_netlist/dlx_irsize32_pcsize32_topt_10.vhdl
write -hierarchy -format verilog -output ./output_netlist/dlx_irsize32_pcsize32_topt_10.v
write_sdc ./output_netlist/dlx_irsize32_pcsize32_10.sdc


#set a 1% lower required time( float )  than maxpath
set REQUIRED_TIME [ expr $mp_l*0.99 ]
#########################
### clock constraints ###
#########################
create_clock -name $clockName -period $REQUIRED_TIME CLK
set_max_delay $REQUIRED_TIME -from [all_inputs] -to [all_outputs]
set_fix_hold $clockName

set max_transition_time 0.01
set_max_transition $max_transition_time [all_outputs]
set_min_delay 0.20 -from [all_inputs] -to [all_outputs]
set_input_delay 0.15 -clock $clockName [all_inputs]
set_output_delay 0.15 -clock $clockName [all_outputs]

optimize_registers -clock $clockName  -minimum_period_only
set_fix_hold $clockName
# optimize
compile_ultra -scan
# save report
report_timing > ./report/timing_report_dlx_irsize32_pcsize32_opt_1.rpt
report_area > ./report/area_report_dlx_irsize32_pcsize32_opt_1.rpt
report_power > ./report/power_report_dlx_irsize32_pcsize32_opt_1.rpt
report_clock > ./report/report_clock_dlx_irsize32_pcsize32_opt_1.rpt

# saving files
write -hierarchy -format ddc -output ./output_netlist/dlx_irsize32_pcsize32_topt_1.ddc
write -hierarchy -format vhdl -output ./output_netlist/dlx_irsize32_pcsize32_topt_1.vhdl
write -hierarchy -format verilog -output ./output_netlist/dlx_irsize32_pcsize32_topt_1.v



# put constraint on finding the minimum possible areea for this design 
set_max_area  0.0 
puts "Synthesis push as much as possible the clock frequency i.e. until the slack is positive and push as much as possible the area"

# since the path is critical there is only one object into the list 
set REQUIRED_TIME [ expr $mp_l*0.80 ]

#########################
### clock constraints ###
#########################
create_clock -name $clockName -period $REQUIRED_TIME CLK
set_max_delay $REQUIRED_TIME -from [all_inputs] -to [all_outputs]
set_fix_hold $clockName

set max_transition_time 0.01
set_max_transition $max_transition_time [all_outputs]
set_min_delay 0.20 -from [all_inputs] -to [all_outputs]
set_input_delay 0.15 -clock $clockName [all_inputs]
set_output_delay 0.15 -clock $clockName [all_outputs]

optimize_registers -clock $clockName  -minimum_period_only
set_fix_hold $clockName
# optimize
compile_ultra -scan
# save report
report_timing > ./report/timing_report_dlx_irsize32_pcsize32_opt_20_minarea.rpt
report_area > ./report/area_report_dlx_irsize32_pcsize32_opt_20_minarea.rpt
report_power > ./report/power_report_dlx_irsize32_pcsize32_opt_20_minarea.rpt
report_clock > ./report/report_clock_dlx_irsize32_pcsize32_opt_20_minarea.rpt

# saving files
write -hierarchy -format ddc -output ./output_netlist/dlx_irsize32_pcsize32_topt_20_minarea.ddc
write -hierarchy -format vhdl -output ./output_netlist/dlx_irsize32_pcsize32_topt_20_minarea.vhdl
write -hierarchy -format verilog -output ./output_netlist/dlx_irsize32_pcsize32_topt_20_minarea.v

#set a 10% lower required time( float )  than maxpath
set REQUIRED_TIME [ expr $mp_l*0.90 ]

#########################
### clock constraints ###
#########################
create_clock -name $clockName -period $REQUIRED_TIME CLK
set_max_delay $REQUIRED_TIME -from [all_inputs] -to [all_outputs]
set_fix_hold $clockName

set max_transition_time 0.01
set_max_transition $max_transition_time [all_outputs]
set_min_delay 0.20 -from [all_inputs] -to [all_outputs]
set_input_delay 0.15 -clock $clockName [all_inputs]
set_output_delay 0.15 -clock $clockName [all_outputs]

optimize_registers -clock $clockName  -minimum_period_only
set_fix_hold $clockName
# optimize
compile_ultra -scan
# save report
report_timing > ./report/timing_report_dlx_irsize32_pcsize32_opt_10_minarea.rpt
report_area > ./report/area_report_dlx_irsize32_pcsize32_opt_10_minarea.rpt
report_power > ./report/power_report_dlx_irsize32_pcsize32_opt_10_minarea.rpt
report_clock > ./report/report_clock_dlx_irsize32_pcsize32_opt_10_minarea.rpt

# saving files
write -hierarchy -format ddc -output ./output_netlist/dlx_irsize32_pcsize32_topt_10_minarea.ddc
write -hierarchy -format vhdl -output ./output_netlist/dlx_irsize32_pcsize32_topt_10_minarea.vhdl
write -hierarchy -format verilog -output ./output_netlist/dlx_irsize32_pcsize32_topt_10_minarea.v


#set a 1% lower required time( float )  than maxpath
set REQUIRED_TIME [ expr $mp_l*0.99 ]

#########################
### clock constraints ###
#########################
create_clock -name $clockName -period $REQUIRED_TIME CLK
set_max_delay $REQUIRED_TIME -from [all_inputs] -to [all_outputs]
set_fix_hold $clockName

set max_transition_time 0.01
set_max_transition $max_transition_time [all_outputs]
set_min_delay 0.20 -from [all_inputs] -to [all_outputs]
set_input_delay 0.15 -clock $clockName [all_inputs]
set_output_delay 0.15 -clock $clockName [all_outputs]

optimize_registers -clock $clockName  -minimum_period_only
set_fix_hold $clockName
# optimize
compile_ultra -scan
# save report
report_timing > ./report/timing_report_dlx_irsize32_pcsize32_opt_1_minarea.rpt
report_area > ./report/area_report_dlx_irsize32_pcsize32_opt_1_minarea.rpt
report_power > ./report/power_report_dlx_irsize32_pcsize32_opt_1_minarea.rpt
report_clock > ./report/report_clock_dlx_irsize32_pcsize32_opt_1_minarea.rpt

# saving files
write -hierarchy -format ddc -output ./output_netlist/dlx_irsize32_pcsize32_topt_1_minarea.ddc
write -hierarchy -format vhdl -output ./output_netlist/dlx_irsize32_pcsize32_topt_1_minarea.vhdl
write -hierarchy -format verilog -output ./output_netlist/dlx_irsize32_pcsize32_topt_1_minarea.v
write_sdc ./output_netlist/dlx_irsize32_pcsize32_1_minarea.sdc

exit
