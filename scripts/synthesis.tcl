###############################################
#### analyzing and checking vhdl netlist  #####
###############################################
puts "Starting top down compilation"

## maybe for vhdl2008 support 
#set_property file_type {VHDL 2008} [get_files  {{D:/uni/2018-2019/Microelectronic systems/dlx_project/hardware/dlx/global_components.package/pg.vhd}}]
 path_to_file from synthesis.sh


puts "Compiling labs units"
analyze -library WORK -format vhdl {${path_to_file}global_components.package/wrf.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/adder.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/alu.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/alu_type.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/boothmul.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/complement2.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/constants.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/csb.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/encoder.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/fa.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/fd.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/gsb.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/mult_gm.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/mux.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/mux21.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/mux21_nbit.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/p4_adder.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/pgsb.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/rca.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/reg_nbit.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/registerfile.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/stcg.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/sum_gen.vhd }
analyze -library WORK -format vhdl {${path_to_file}global_components.package/pg.vhd}

puts "Compiling stages,control unit and datapath"
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.vhd }
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.e-Write_back.stage.vhd }
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.a-Fetch.stage.vhd }
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.b-Decode.stage.vhd }
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage.vhd }
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.d.Memory.stage.vhd }
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.b-Decode.stage/a.b.b.a-sign_extension.vhd }
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.a-check_branch_logic.vhd }
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.b-general_alu.vhd }
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.vhd }
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.a-mux.vhd}
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.b-adder.vhd}
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.c-complement2.vhd}
analyze -library WORK -format vhdl {${path_to_file}a.b-DataPath.core/a.b.c-Execute.stage/a.b.c.c-boothmul_pipelined.core/a.b.c.d-encoder.vhd}
analyze -library WORK -format vhdl {${path_to_file}a.a-control_unit.vhd }
analyze -library WORK -format vhdl {${path_to_file}a.DLX.vhd }

###########################################################
################ elaborating the top entity ###############
###########################################################
puts "Elaborating top level entity"
elaborate DLX -architecture dlx_rtl -library WORK -parameters " IR_SIZE=32 PC_SIZE =32  "
current_design "dlx_irsize32_pcsize32"
##########################################
# first compilation, without constraints #
puts "Synthesis without constraints"
compile 
# reporting riming and power after the first synthesis without constraints #
report_timing -nworst 10 > timing10worst_report_dlx_irsize32_pcsize32_nopt.rpt ; # 10 worse paths
report_timing > timing_report_dlx_irsize32_pcsize32b_nopt.rpt
report_area > area_report_dlx_irsize32_pcsize32_nopt.rpt


puts "Synthesis push as much as possible the clock frequency i.e. until the slack is positive"
# forces a combinational max delay of REQUIRED_TIME from each of the inputs
# to each of th eoutput, that is a delay lower than the one found after
# the first compilation step #
# often this is the working clock period of your system #
#set a 20% lower required time( float )  than maxpath
set MAX_PATH_c [ get_timing_paths -delay_type max -nworst 1 -true -include_hierarchical_pins ]

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

set_max_delay $REQUIRED_TIME -from [all_inputs] -to [all_outputs]
# optimize
compile_ultra -map_effort high
# save report
report_timing > timing_report_dlx_irsize32_pcsize32_opt_20.rpt
report_area > area_report_dlx_irsize32_pcsize32_opt_20.rpt
# saving files
write -hierarchy -format ddc -output adlx_irsize32_pcsize32_topt_20.ddc
write -hierarchy -format vhdl -output dlx_irsize32_pcsize32_topt_20.vhdl
write -hierarchy -format verilog -output dlx_irsize32_pcsize32_topt_20.v

#set a 10% lower required time( float )  than maxpath
set REQUIRED_TIME [ expr $mp_l*0.90 ]

set_max_delay $REQUIRED_TIME -from [all_inputs] -to [all_outputs]
# optimize
compile_ultra -map_effort high
# save report
report_timing > timing_report_dlx_irsize32_pcsize32_opt_10.rpt
report_area > area_report_dlx_irsize32_pcsize32_opt_10.rpt
# saving files
write -hierarchy -format ddc -output adlx_irsize32_pcsize32_topt_10.ddc
write -hierarchy -format vhdl -output dlx_irsize32_pcsize32_topt_10.vhdl
write -hierarchy -format verilog -output dlx_irsize32_pcsize32_topt_10.v


#set a 1% lower required time( float )  than maxpath
set REQUIRED_TIME [ expr $mp_l*0.99 ]

set_max_delay $REQUIRED_TIME -from [all_inputs] -to [all_outputs]
# optimize
compile_ultra -map_effort high
# save report
report_timing > timing_report_dlx_irsize32_pcsize32_opt_1.rpt
report_area > area_report_dlx_irsize32_pcsize32_opt_1.rpt
# saving files
write -hierarchy -format ddc -output adlx_irsize32_pcsize32_topt_1.ddc
write -hierarchy -format vhdl -output dlx_irsize32_pcsize32_topt_1.vhdl
write -hierarchy -format verilog -output dlx_irsize32_pcsize32_topt_1.v