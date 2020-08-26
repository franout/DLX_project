puts "Configuring Innovus"
setMultiCpuUsage -cpuAutoAdjust {true}
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
#loadWorkspace -name Physical
set defHierChar /
set delaycal_input_transition_delay 0.1ps
set fpIsMaxIoHeight 0
set init_gnd_net {gnd}
set init_mmmc_file Default_nopt.view
set init_oa_search_lib {}
set init_pwr_net {vdd}
set init_verilog "$env(path_to_file_synthesis)/output_netlist/dlx_irsize32_pcsize32_nopt.v" 
set init_lef_file /software/dk/nangate45/lef/NangateOpenCellLibrary.lef
set lsgOCPGainMult 1.000000
set LEF_DIR /software/dk/nangate45/lef
set LEF_list [list ${LEF_DIR}/NangateOpenCellLibrary.lef]
set init_lef_file "${LEF_list}"
set LIB_DIR /software/dk/nangate45/liberty
set MyTimingLibNom ${LIB_DIR}/NangateOpenCellLibrary_typical_ecsm_nowlm.lib
set MyTimingLibSlow ${LIB_DIR}/NangateOpenCellLibrary_slow_ecsm.lib
set MyTimingLibFast ${LIB_DIR}/NangateOpenCellLibrary_fast_ecsm.lib

set MycapTable $LEF_DIR/captables/NCSU_FreePDK_45nm.capTbl

puts "Floorplanning Innovus"

init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site FreePDK45_38x28_10R_NP_162NW_34O -r 1 0.6 5 5 5 5
getIoFlowFlag
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0

puts "Power planning and routing Innovus"

setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
#addRing -nets {} -type core_rings -follow core -layer {top metal1 bottom metal1 left metal2 right metal2} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {gnd vdd} -type core_rings -follow core -layer {top metal9 bottom metal9 left metal10 right metal10} -width {top 0.8 bottom 0.8 left 0.8 right 0.8} -spacing {top 0.8 bottom 0.8 left 0.8 right 0.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length 0 -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring }
addStripe -nets {vdd gnd} -layer metal10 -direction vertical -width 0.8 -spacing 0.8 -set_to_set_distance 20 -start_from left -start_offset 15 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit metal10 -padcore_ring_bottom_layer_limit metal1 -block_ring_top_layer_limit metal10 -block_ring_bottom_layer_limit metal1 -use_wire_group 0 -snap_wire_center_to_grid None -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }

setSrouteMode -viaConnectToShape { noshape }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1(1) metal10(10) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal10(10) } -nets { gnd vdd } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { metal1(1) metal10(10) }


puts " Pin assignment "

getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin CLK
setPinAssignMode -pinEditInBatch false
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin RST
setPinAssignMode -pinEditInBatch false


# iram 
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin IRAM_ENABLE
setPinAssignMode -pinEditInBatch false

setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin IRAM_READY
setPinAssignMode -pinEditInBatch false

setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -side Top -layer 1 -spreadType side -pin {{IRAM_ADDRESS[0]} {IRAM_ADDRESS[1]} {IRAM_ADDRESS[2]} {IRAM_ADDRESS[3]} {IRAM_ADDRESS[4]} {IRAM_ADDRESS[5]} {IRAM_ADDRESS[6]} {IRAM_ADDRESS[7]} {IRAM_ADDRESS[8]} {IRAM_ADDRESS[9]} {IRAM_ADDRESS[10]} {IRAM_ADDRESS[11]} {IRAM_ADDRESS[12]} {IRAM_ADDRESS[13]} {IRAM_ADDRESS[14]} {IRAM_ADDRESS[15]} {IRAM_ADDRESS[16]} {IRAM_ADDRESS[17]} {IRAM_ADDRESS[18]} {IRAM_ADDRESS[19]} {IRAM_ADDRESS[20]} {IRAM_ADDRESS[21]} {IRAM_ADDRESS[22]} {IRAM_ADDRESS[23]} {IRAM_ADDRESS[24]} {IRAM_ADDRESS[25]} {IRAM_ADDRESS[26]} {IRAM_ADDRESS[27]} {IRAM_ADDRESS[28]} {IRAM_ADDRESS[29]} {IRAM_ADDRESS[30]} {IRAM_ADDRESS[31]}}
setPinAssignMode -pinEditInBatch true

setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -side Top -layer 2 -spreadType side -pin {{IRAM_DATA[0]} {IRAM_DATA[1]} {IRAM_DATA[2]} {IRAM_DATA[3]} {IRAM_DATA[4]} {IRAM_DATA[5]} {IRAM_DATA[6]} {IRAM_DATA[7]} {IRAM_DATA[8]} {IRAM_DATA[9]} {IRAM_DATA[10]} {IRAM_DATA[11]} {IRAM_DATA[12]} {IRAM_DATA[13]} {IRAM_DATA[14]} {IRAM_DATA[15]} {IRAM_DATA[16]} {IRAM_DATA[17]} {IRAM_DATA[18]} {IRAM_DATA[19]} {IRAM_DATA[20]} {IRAM_DATA[21]} {IRAM_DATA[22]} {IRAM_DATA[23]} {IRAM_DATA[24]} {IRAM_DATA[25]} {IRAM_DATA[26]} {IRAM_DATA[27]} {IRAM_DATA[28]} {IRAM_DATA[29]} {IRAM_DATA[30]} {IRAM_DATA[31]}}
setPinAssignMode -pinEditInBatch true

# dram 
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin DRAM_ENABLE
setPinAssignMode -pinEditInBatch false

setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin DRAM_READNOTWRITE
setPinAssignMode -pinEditInBatch false

setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin DRAM_READY
setPinAssignMode -pinEditInBatch false


setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -side Top -layer 1 -spreadType side -pin {{DRAM_ADDRESS[0]} {DRAM_ADDRESS[1]} {DRAM_ADDRESS[2]} {DRAM_ADDRESS[3]} {DRAM_ADDRESS[4]} {DRAM_ADDRESS[5]} {DRAM_ADDRESS[6]} {DRAM_ADDRESS[7]} {DRAM_ADDRESS[8]} {DRAM_ADDRESS[9]} {DRAM_ADDRESS[10]} {DRAM_ADDRESS[11]} {DRAM_ADDRESS[12]} {DRAM_ADDRESS[13]} {DRAM_ADDRESS[14]} {DRAM_ADDRESS[15]} {DRAM_ADDRESS[16]} {DRAM_ADDRESS[17]} {DRAM_ADDRESS[18]} {DRAM_ADDRESS[19]} {DRAM_ADDRESS[20]} {DRAM_ADDRESS[21]} {DRAM_ADDRESS[22]} {DRAM_ADDRESS[23]} {DRAM_ADDRESS[24]} {DRAM_ADDRESS[25]} {DRAM_ADDRESS[26]} {DRAM_ADDRESS[27]} {DRAM_ADDRESS[28]} {DRAM_ADDRESS[29]} {DRAM_ADDRESS[30]} {DRAM_ADDRESS[31]}}
setPinAssignMode -pinEditInBatch false

setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -side Top -layer 2 -spreadType side -pin {{DRAM_DATA[0]} {DRAM_DATA[1]} {DRAM_DATA[2]} {DRAM_DATA[3]} {DRAM_DATA[4]} {DRAM_DATA[5]} {DRAM_DATA[6]} {DRAM_DATA[7]} {DRAM_DATA[8]} {DRAM_DATA[9]} {DRAM_DATA[10]} {DRAM_DATA[11]} {DRAM_DATA[12]} {DRAM_DATA[13]} {DRAM_DATA[14]} {DRAM_DATA[15]} {DRAM_DATA[16]} {DRAM_DATA[17]} {DRAM_DATA[18]} {DRAM_DATA[19]} {DRAM_DATA[20]} {DRAM_DATA[21]} {DRAM_DATA[22]} {DRAM_DATA[23]} {DRAM_DATA[24]} {DRAM_DATA[25]} {DRAM_DATA[26]} {DRAM_DATA[27]} {DRAM_DATA[28]} {DRAM_DATA[29]} {DRAM_DATA[30]} {DRAM_DATA[31]}}
setPinAssignMode -pinEditInBatch false



puts "Cell placing Innovus"
placeDesign
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -postCTS
optDesign -postCTS -hold
getFillerMode -quiet
addFiller -cell FILLCELL_X8 FILLCELL_X32 FILLCELL_X4 FILLCELL_X2 FILLCELL_X16 FILLCELL_X1 -prefix FILLER

puts "Signal routing  Innovus"

setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
setAnalysisMode -analysisType onChipVariation
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -postRoute
optDesign -postRoute -hold
saveDesign DLX_IR_SIZE32_PC_SIZE32_saved
reset_parasitics
extractRC
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix DLX_IR_SIZE32_PC_SIZE32_postroute -outDir timingReports
get_time_unit
report_timing -machine_readable -max_paths 10000 -max_slack 0.75 -path_exceptions all > DLX_IR_SIZE32_PC_SIZE32.mtarpt
load_timing_debug_report -name default_report DLX_IR_SIZE32_PC_SIZE32.mtarpt

puts "Verification"
verifyConnectivity -type all -error 1000 -warning 50
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
get_verify_drc_mode -disable_rules -quiet
get_verify_drc_mode -quiet -area
get_verify_drc_mode -quiet -layer_range
get_verify_drc_mode -check_implant -quiet
get_verify_drc_mode -check_implant_across_rows -quiet
get_verify_drc_mode -check_ndr_spacing -quiet
get_verify_drc_mode -check_only -quiet
get_verify_drc_mode -check_same_via_cell -quiet
get_verify_drc_mode -exclude_pg_net -quiet
get_verify_drc_mode -ignore_trial_route -quiet
get_verify_drc_mode -max_wrong_way_halo -quiet
get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
get_verify_drc_mode -limit -quiet
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report DLX_IR_SIZE32_PC_SIZE32.drc.rpt -limit 1000
verify_drc


reportGateCount -level 5 -limit 100 -outfile DLX_IR_SIZE32_PC_SIZE32.gateCount
saveNetlist DLX_IR_SIZE32_PC_SIZE32.v
all_hold_analysis_views 
all_setup_analysis_views 
write_sdf  -ideal_clock_network DLX_IR_SIZE32_PC_SIZE32.sdf

#TODO 
puts "Starting with optimized design with a lower slack"
set init_verilog "$env(path_to_file_synthesis)output_netlist/dlx_irsize32_pcsize32_topt_10.v"    
puts "Starting with optimized design with a lower slack and area"
set init_verilog "$env(path_to_file_synthesis)output_netlist/dlx_irsize32_pcsize32_topt_1_minarea.v"
exit
