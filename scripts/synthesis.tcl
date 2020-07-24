###############################################
#### analyzing and checking vhdl netlist  #####
###############################################
analyze -library WORK -format vhdl {constants.vhd}
analyze -library WORK -format vhdl {fa.vhd}
analyze -library WORK -format vhdl { rca.vhd  }
analyze -library WORK -format vhdl { csb.vhd  }
analyze -library WORK -format vhdl { sum_gen.vhd  }
analyze -library WORK -format vhdl { pg.vhd  }
analyze -library WORK -format vhdl { gsb.vhd  }
analyze -library WORK -format vhdl { pgsb.vhd  }
analyze -library WORK -format vhdl { stcg.vhd  }
analyze -library WORK -format vhdl { p4_adder.vhd  }
##############################################################
# elaborating the top entity
elaborate p4_adder -architecture struc -library WORK -parameters " NBit=32  "
current_design "p4_adder_NBIT32"
##########################################
# first compilation, without constraints #
compile 
# reporting riming and power after the first synthesis without constraints #
report_timing -nworst 10 > timing10worst_report_adder_struc_32b_nopt.rpt ; # 10 worse paths
report_timing > timing_report_adder_struc_32b_nopt.rpt
report_area > area_report_adder_struc_32b_nopt.rpt




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
compile -map_effort high
# save report
report_timing > timing_report_adder_struc_32b_opt.rpt
report_area > area_report_adder_struc_32b_opt.rpt
# saving files
write -hierarchy -format ddc -output adder_struc_32b_topt.ddc
write -hierarchy -format vhdl -output adder_struc_32b_topt.vhdl
write -hierarchy -format verilog -output adder_struc_32b_topt.v



##########################################################
################## DFT -> Scan Chain #####################
##########################################################
read_verilog b10.v
current_design b10
link
check_design

report_area

set test_default_scan_style multiplexed_flip_flop

create_test_protocol -infer_asynch -infer_clock

dft_drc

set_scan_configuration -chain_count 1
preview_dft
insert_dft
dft_drc

report_scan_path -view existing -chain all
report_scan_path -view existing -cell all

report_area

write -hierarchy -format verilog -output b10_scan.v
write_test_protocol -output b10_scan.spf
