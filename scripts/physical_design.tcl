#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed Aug 19 17:53:14 2020                
#                                                     
#######################################################

#@(#)CDS: Innovus v17.11-s080_1 (64bit) 08/04/2017 11:13 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 17.11-s080_1 NR170721-2155/17_11-UB (database version 2.30, 390.7.1) {superthreading v1.44}
#@(#)CDS: AAE 17.11-s034 (64bit) 08/04/2017 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 17.11-s053_1 () Aug  1 2017 23:31:41 ( )
#@(#)CDS: SYNTECH 17.11-s012_1 () Jul 21 2017 02:29:12 ( )
#@(#)CDS: CPE v17.11-s095
#@(#)CDS: IQRC/TQRC 16.1.1-s215 (64bit) Thu Jul  6 20:18:10 PDT 2017 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getDrawView
loadWorkspace -name Physical
win
set defHierChar /
set delaycal_input_transition_delay 0.1ps
set fpIsMaxIoHeight 0
set init_gnd_net gnd
set init_mmmc_file Default.view
set init_oa_search_lib {}
set init_pwr_net vdd
set init_verilog sum.v
set init_lef_file /software/dk/nangate45/lef/NangateOpenCellLibrary.lef
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site FreePDK45_38x28_10R_NP_162NW_34O -r 1 0.6 5 5 5 5
uiSetTool select
getIoFlowFlag
fit
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
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {} -type core_rings -follow core -layer {top metal1 bottom metal1 left metal2 right metal2} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
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
gui_select -rect {50.198 73.481 75.108 83.413}
pan 32.232 7.529
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1(1) metal10(10) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal10(10) } -nets { gnd vdd } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { metal1(1) metal10(10) }
pan 3.176 15.057
pan -7.176 -19.174
pan 7.764 17.291
setPlaceMode -prerouteAsObs {1 2 3 4 5 6 7 8}
setPlaceMode -fp false
placeDesign
pan -4.823 -6.234
pan 0.824 -11.175
setDrawView ameba
pan 0.353 10.587
deselectAll
selectObject Module maprca
deselectAll
setDrawView place
setDrawView fplan
pan 1.149 6.513
setDrawView place
panCenter 83.599 34.304
panCenter 154.183 42.541
panCenter 224.767 50.778
panCenter 295.351 59.014
panCenter 365.935 67.251
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -side Top -layer 1 -spreadType side -pin {{A[0]} {A[1]} {A[2]} {A[3]} {A[4]} {A[5]} {A[6]} {A[7]} {A[8]} {A[9]} {A[10]} {A[11]} {A[12]} {A[13]} {A[14]} {A[15]} {A[16]} {A[17]} {A[18]} {A[19]} {A[20]} {A[21]} {A[22]} {A[23]} {A[24]} {A[25]} {A[26]} {A[27]} {A[28]} {A[29]} {A[30]} {A[31]} {A[32]} {A[33]} {A[34]} {A[35]} {A[36]} {A[37]} {A[38]} {A[39]} {A[40]} {A[41]} {A[42]} {A[43]} {A[44]} {A[45]} {A[46]} {A[47]} {A[48]} {A[49]} {A[50]} {A[51]} {A[52]} {A[53]} {A[54]} {A[55]} {A[56]} {A[57]} {A[58]} {A[59]} {A[60]} {A[61]} {A[62]} {A[63]} {A[64]} {A[65]} {A[66]} {A[67]} {A[68]} {A[69]} {A[70]} {A[71]} {A[72]} {A[73]} {A[74]} {A[75]} {A[76]} {A[77]} {A[78]} {A[79]} {A[80]} {A[81]} {A[82]} {A[83]} {A[84]} {A[85]} {A[86]} {A[87]} {A[88]} {A[89]} {A[90]} {A[91]} {A[92]} {A[93]} {A[94]} {A[95]} {A[96]} {A[97]} {A[98]} {A[99]} {A[100]} {A[101]} {A[102]} {A[103]} {A[104]} {A[105]} {A[106]} {A[107]} {A[108]} {A[109]} {A[110]} {A[111]} {A[112]} {A[113]} {A[114]} {A[115]} {A[116]} {A[117]} {A[118]} {A[119]} {A[120]} {A[121]} {A[122]} {A[123]} {A[124]} {A[125]} {A[126]} {A[127]}}
setPinAssignMode -pinEditInBatch false
pan -25.237 -22.877
pan -1.411 15.999
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch false
pan 0.969 13.287
selectInst {ATMP_reg[85]}
deselectAll
selectInst {BTMP_reg[100]}
deselectAll
selectInst {S_reg[33]}
deselectAll
selectWire 61.7300 2.9200 62.5300 74.3600 10 gnd
deselectAll
selectInst {S_reg[11]}
deselectAll
selectInst {S_reg[74]}
deselectAll
selectWire 5.1300 67.9550 75.2400 68.1250 1 gnd
gui_select -rect {9.892 66.431 9.477 62.279}
gui_select -rect {9.754 57.020 9.616 55.913}
selectWire 5.1300 53.9550 75.2400 54.1250 1 gnd
deselectAll
gui_select -rect {12.383 26.434 20.273 9.964}
deselectAll
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -side Left -layer 1 -spreadType side -pin {{B[0]} {B[1]} {B[2]} {B[3]} {B[4]} {B[5]} {B[6]} {B[7]} {B[8]} {B[9]} {B[10]} {B[11]} {B[12]} {B[13]} {B[14]} {B[15]} {B[16]} {B[17]} {B[18]} {B[19]} {B[20]} {B[21]} {B[22]} {B[23]} {B[24]} {B[25]} {B[26]} {B[27]} {B[28]} {B[29]} {B[30]} {B[31]} {B[32]} {B[33]} {B[34]} {B[35]} {B[36]} {B[37]} {B[38]} {B[39]} {B[40]} {B[41]} {B[42]} {B[43]} {B[44]} {B[45]} {B[46]} {B[47]} {B[48]} {B[49]} {B[50]} {B[51]} {B[52]} {B[53]} {B[54]} {B[55]} {B[56]} {B[57]} {B[58]} {B[59]} {B[60]} {B[61]} {B[62]} {B[63]} {B[64]} {B[65]} {B[66]} {B[67]} {B[68]} {B[69]} {B[70]} {B[71]} {B[72]} {B[73]} {B[74]} {B[75]} {B[76]} {B[77]} {B[78]} {B[79]} {B[80]} {B[81]} {B[82]} {B[83]} {B[84]} {B[85]} {B[86]} {B[87]} {B[88]} {B[89]} {B[90]} {B[91]} {B[92]} {B[93]} {B[94]} {B[95]} {B[96]} {B[97]} {B[98]} {B[99]} {B[100]} {B[101]} {B[102]} {B[103]} {B[104]} {B[105]} {B[106]} {B[107]} {B[108]} {B[109]} {B[110]} {B[111]} {B[112]} {B[113]} {B[114]} {B[115]} {B[116]} {B[117]} {B[118]} {B[119]} {B[120]} {B[121]} {B[122]} {B[123]} {B[124]} {B[125]} {B[126]} {B[127]}}
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin Ci
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin CLK
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin Co
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin RST
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -side Bottom -layer 1 -spreadType side -pin {{S[0]} {S[1]} {S[2]} {S[3]} {S[4]} {S[5]} {S[6]} {S[7]} {S[8]} {S[9]} {S[10]} {S[11]} {S[12]} {S[13]} {S[14]} {S[15]} {S[16]} {S[17]} {S[18]} {S[19]} {S[20]} {S[21]} {S[22]} {S[23]} {S[24]} {S[25]} {S[26]} {S[27]} {S[28]} {S[29]} {S[30]} {S[31]} {S[32]} {S[33]} {S[34]} {S[35]} {S[36]} {S[37]} {S[38]} {S[39]} {S[40]} {S[41]} {S[42]} {S[43]} {S[44]} {S[45]} {S[46]} {S[47]} {S[48]} {S[49]} {S[50]} {S[51]} {S[52]} {S[53]} {S[54]} {S[55]} {S[56]} {S[57]} {S[58]} {S[59]} {S[60]} {S[61]} {S[62]} {S[63]} {S[64]} {S[65]} {S[66]} {S[67]} {S[68]} {S[69]} {S[70]} {S[71]} {S[72]} {S[73]} {S[74]} {S[75]} {S[76]} {S[77]} {S[78]} {S[79]} {S[80]} {S[81]} {S[82]} {S[83]} {S[84]} {S[85]} {S[86]} {S[87]} {S[88]} {S[89]} {S[90]} {S[91]} {S[92]} {S[93]} {S[94]} {S[95]} {S[96]} {S[97]} {S[98]} {S[99]} {S[100]} {S[101]} {S[102]} {S[103]} {S[104]} {S[105]} {S[106]} {S[107]} {S[108]} {S[109]} {S[110]} {S[111]} {S[112]} {S[113]} {S[114]} {S[115]} {S[116]} {S[117]} {S[118]} {S[119]} {S[120]} {S[121]} {S[122]} {S[123]} {S[124]} {S[125]} {S[126]} {S[127]}}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.07 -pinDepth 0.07 -fixOverlap 1 -spreadDirection clockwise -side Bottom -layer 1 -spreadType side -pin {{S[0]} {S[1]} {S[2]} {S[3]} {S[4]} {S[5]} {S[6]} {S[7]} {S[8]} {S[9]} {S[10]} {S[11]} {S[12]} {S[13]} {S[14]} {S[15]} {S[16]} {S[17]} {S[18]} {S[19]} {S[20]} {S[21]} {S[22]} {S[23]} {S[24]} {S[25]} {S[26]} {S[27]} {S[28]} {S[29]} {S[30]} {S[31]} {S[32]} {S[33]} {S[34]} {S[35]} {S[36]} {S[37]} {S[38]} {S[39]} {S[40]} {S[41]} {S[42]} {S[43]} {S[44]} {S[45]} {S[46]} {S[47]} {S[48]} {S[49]} {S[50]} {S[51]} {S[52]} {S[53]} {S[54]} {S[55]} {S[56]} {S[57]} {S[58]} {S[59]} {S[60]} {S[61]} {S[62]} {S[63]} {S[64]} {S[65]} {S[66]} {S[67]} {S[68]} {S[69]} {S[70]} {S[71]} {S[72]} {S[73]} {S[74]} {S[75]} {S[76]} {S[77]} {S[78]} {S[79]} {S[80]} {S[81]} {S[82]} {S[83]} {S[84]} {S[85]} {S[86]} {S[87]} {S[88]} {S[89]} {S[90]} {S[91]} {S[92]} {S[93]} {S[94]} {S[95]} {S[96]} {S[97]} {S[98]} {S[99]} {S[100]} {S[101]} {S[102]} {S[103]} {S[104]} {S[105]} {S[106]} {S[107]} {S[108]} {S[109]} {S[110]} {S[111]} {S[112]} {S[113]} {S[114]} {S[115]} {S[116]} {S[117]} {S[118]} {S[119]} {S[120]} {S[121]} {S[122]} {S[123]} {S[124]} {S[125]} {S[126]} {S[127]}}
setPinAssignMode -pinEditInBatch false
pan 1.075 0.459
panCenter 79.942 76.674
panCenter 80.523 76.530
setOptMode -fixCap true -fixTran true -fixFanoutLoad false
optDesign -postCTS
optDesign -postCTS -hold
getFillerMode -quiet
addFiller -cell FILLCELL_X8 FILLCELL_X32 FILLCELL_X4 FILLCELL_X2 FILLCELL_X16 FILLCELL_X1 -prefix FILLER
pan 8.537 1.111
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
saveDesign SUM_saved
set_analysis_view -setup {default} -hold {default}
reset_parasitics
extractRC
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix SUM_postRoute -outDir timingReports
get_time_unit
report_timing -machine_readable -max_paths 10000 -max_slack 0.75 -path_exceptions all > top.mtarpt
load_timing_debug_report -name default_report top.mtarpt
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
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report SUM.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
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
zoomBox 108.078 45.590 108.078 46.005
panCenter 108.171 45.934
panCenter 108.264 46.071
zoomSelected
zoomSelected
gui_select -rect {108.065 46.179 108.167 46.111}
zoomOut
zoomOut
zoomIn
panCenter 107.639 45.896
panCenter 107.014 45.721
reportGateCount -level 5 -limit 100 -outfile SUM.gateCount
saveNetlist SUM.v
all_hold_analysis_views 
all_setup_analysis_views 
write_sdf  -ideal_clock_network SUM.sdf

Cadence Innovus(TM) Implementation System.
Copyright 2017 Cadence Design Systems, Inc. All rights reserved worldwide.

Version:	v17.11-s080_1, built Fri Aug 4 11:13:11 PDT 2017
Options:	
Date:		Wed Aug 19 17:52:46 2020
Host:		localhost.localdomain (x86_64 w/Linux 3.10.0-1062.12.1.el7.x86_64) (1core*8cpus*Westmere E56xx/L56xx/X56xx (Nehalem-C) 4096KB)
OS:		CentOS Linux release 7.7.1908 (Core)

License:
		invs	Innovus Implementation System	17.1	checkout succeeded
		8 CPU jobs allowed with the current license(s). Use setMultiCpuUsage to set your required CPU count.
Change the soft stacksize limit to 0.2%RAM (96 mbytes). Set global soft_stack_size_limit to change the value.

**INFO:  MMMC transition support version v31-84 

<CMD> set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
<CMD> suppressMessage ENCEXT-2799
<CMD> getDrawView
<CMD> loadWorkspace -name Physical
<CMD> win
<CMD> set defHierChar /
Set Default Input Pin Transition as 0.1 ps.
<CMD> set delaycal_input_transition_delay 0.1ps
<CMD> set fpIsMaxIoHeight 0
<CMD> set init_gnd_net gnd
<CMD> set init_mmmc_file Default.view
<CMD> set init_oa_search_lib {}
<CMD> set init_pwr_net vdd
<CMD> set init_verilog sum.v
<CMD> set init_lef_file /software/dk/nangate45/lef/NangateOpenCellLibrary.lef
<CMD> init_design
#% Begin Load MMMC data ... (date=08/19 17:57:38, mem=446.1M)
#% End Load MMMC data ... (date=08/19 17:57:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=446.2M, current mem=446.2M)
high standard low

Loading LEF file /software/dk/nangate45/lef/NangateOpenCellLibrary.lef ...
Set DBUPerIGU to M2 pitch 380.

viaInitial starts at Wed Aug 19 17:57:38 2020
viaInitial ends at Wed Aug 19 17:57:38 2020
Loading view definition file from Default.view
Reading libsTYP timing library '/software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib' ...
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND2_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND2_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND2_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND3_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND3_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND3_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND4_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND4_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND4_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI21_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI21_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI21_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI22_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI22_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI22_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI211_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI211_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI211_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI221_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
**WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI221_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
Message <TECHLIB-436> has exceeded the message display limit of '20'. Use 'set_message -no_limit -id list_of_msgIDs' to reset the message limit.
Read 134 cells in library 'NangateOpenCellLibrary' 
*** End library_loading (cpu=0.03min, real=0.03min, mem=17.7M, fe_cpu=1.03min, fe_real=4.90min, fe_mem=524.3M) ***
#% Begin Load netlist data ... (date=08/19 17:57:40, mem=541.3M)
*** Begin netlist parsing (mem=524.3M) ***
Created 134 new cells from 1 timing libraries.
Reading netlist ...
Backslashed names will retain backslash and a trailing blank character.
Reading verilog netlist 'sum.v'

*** Memory Usage v#1 (Current mem = 524.277M, initial mem = 187.684M) ***
*** End netlist parsing (cpu=0:00:00.0, real=0:00:00.0, mem=524.3M) ***
#% End Load netlist data ... (date=08/19 17:57:40, total cpu=0:00:00.1, real=0:00:00.0, peak res=541.3M, current mem=470.2M)
Top level cell is SUM.
Hooked 134 DB cells to tlib cells.
Starting recursive module instantiation check.
No recursion found.
Building hierarchical netlist for Cell SUM ...
*** Netlist is unique.
** info: there are 264 modules.
** info: there are 1109 stdCell insts.

*** Memory Usage v#1 (Current mem = 556.949M, initial mem = 187.684M) ***
Generated pitch 1.68 in metal10 is different from 1.6 defined in technology file in preferred direction.
Generated pitch 0.84 in metal8 is different from 0.8 defined in technology file in preferred direction.
Generated pitch 0.84 in metal7 is different from 0.8 defined in technology file in preferred direction.
Set Default Net Delay as 1000 ps.
Set Default Net Load as 0.5 pF. 
Set Default Input Pin Transition as 0.1 ps.
*Info: initialize multi-corner CTS.
Reading timing constraints file 'SUM.sdc' ...
Current (total cpu=0:01:03, real=0:04:55, peak res=597.8M, current mem=597.8M)
INFO (CTE): Constraints read successfully.
Ending "Constraint file reading stats" (total cpu=0:00:00.1, real=0:00:00.0, peak res=605.7M, current mem=605.7M)
Current (total cpu=0:01:03, real=0:04:55, peak res=605.7M, current mem=605.7M)
Total number of combinational cells: 99
Total number of sequential cells: 29
Total number of tristate cells: 6
Total number of level shifter cells: 0
Total number of power gating cells: 0
Total number of isolation cells: 0
Total number of power switch cells: 0
Total number of pulse generator cells: 0
Total number of always on buffers: 0
Total number of retention cells: 0
List of usable buffers: BUF_X1 BUF_X2 BUF_X4 BUF_X8 BUF_X16 BUF_X32 CLKBUF_X1 CLKBUF_X2 CLKBUF_X3
Total number of usable buffers: 9
List of unusable buffers:
Total number of unusable buffers: 0
List of usable inverters: INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32
Total number of usable inverters: 6
List of unusable inverters:
Total number of unusable inverters: 0
List of identified usable delay cells:
Total number of identified usable delay cells: 0
List of identified unusable delay cells:
Total number of identified unusable delay cells: 0
No delay cells were detected in the set of buffers. Buffers will be used to fix hold violations.
Extraction setup Started 
Initializing multi-corner RC extraction with 1 active RC Corners ...
Reading Capacitance Table File /software/dk/nangate45/lef/captables/NCSU_FreePDK_45nm.capTbl ...
Cap table was created using Encounter 08.10-p004_1.
Process name: master_techFreePDK45.
Importing multi-corner RC tables ... 
Summary of Active RC-Corners : 
 
 Analysis View: default
    RC-Corner Name        : standard
    RC-Corner Index       : 0
    RC-Corner Temperature : 300 Celsius
    RC-Corner Cap Table   : '/software/dk/nangate45/lef/captables/NCSU_FreePDK_45nm.capTbl'
    RC-Corner PreRoute Res Factor         : 1
    RC-Corner PreRoute Cap Factor         : 1
    RC-Corner PostRoute Res Factor        : 1 {1 1 1}
    RC-Corner PostRoute Cap Factor        : 1 {1 1 1}
    RC-Corner PostRoute XCap Factor       : 1 {1 1 1}
    RC-Corner PreRoute Clock Res Factor   : 1	[Derived from postRoute_res (effortLevel low)]
    RC-Corner PreRoute Clock Cap Factor   : 1	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Cap Factor  : 1 {1 1 1} 	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Res Factor  : 1 {1 1 1} 	[Derived from postRoute_res (effortLevel low)]

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary                                  
WARNING   TECHLIB-436         20  Attribute '%s' on '%s' pin '%s' of cell ...
*** Message Summary: 20 warning(s), 0 error(s)

<CMD> getIoFlowFlag
<CMD> setIoFlowFlag 0
<CMD> floorPlan -site FreePDK45_38x28_10R_NP_162NW_34O -r 1 0.6 5 5 5 5
Generated pitch 1.68 in metal10 is different from 1.6 defined in technology file in preferred direction.
Generated pitch 0.84 in metal8 is different from 0.8 defined in technology file in preferred direction.
Generated pitch 0.84 in metal7 is different from 0.8 defined in technology file in preferred direction.
**WARN: (IMPFP-325):	Floorplan of the design is resized. All current floorplan objects are automatically derived based on specified new floorplan. This may change blocks, fixed standard cells, existing routes and blockages.
<CMD> uiSetTool select
<CMD> getIoFlowFlag
<CMD> fit
<CMD> set sprCreateIeRingOffset 1.0
<CMD> set sprCreateIeRingThreshold 1.0
<CMD> set sprCreateIeRingJogDistance 1.0
<CMD> set sprCreateIeRingLayers {}
<CMD> set sprCreateIeRingOffset 1.0
<CMD> set sprCreateIeRingThreshold 1.0
<CMD> set sprCreateIeRingJogDistance 1.0
<CMD> set sprCreateIeRingLayers {}
<CMD> set sprCreateIeStripeWidth 10.0
<CMD> set sprCreateIeStripeThreshold 1.0
<CMD> set sprCreateIeStripeWidth 10.0
<CMD> set sprCreateIeStripeThreshold 1.0
<CMD> set sprCreateIeRingOffset 1.0
<CMD> set sprCreateIeRingThreshold 1.0
<CMD> set sprCreateIeRingJogDistance 1.0
<CMD> set sprCreateIeRingLayers {}
<CMD> set sprCreateIeStripeWidth 10.0
<CMD> set sprCreateIeStripeThreshold 1.0
<CMD> setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
The ring targets are set to core/block ring wires.
addRing command will consider rows while creating rings.
addRing command will disallow rings to go over rows.
addRing command will ignore shorts while creating rings.
<CMD> addRing -nets {} -type core_rings -follow core -layer {top metal1 bottom metal1 left metal2 right metal2} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

**ERROR: Error: Invalid net names specified. 
<CMD> setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
The ring targets are set to core/block ring wires.
addRing command will consider rows while creating rings.
addRing command will disallow rings to go over rows.
addRing command will ignore shorts while creating rings.
<CMD> addRing -nets {gnd vdd} -type core_rings -follow core -layer {top metal9 bottom metal9 left metal10 right metal10} -width {top 0.8 bottom 0.8 left 0.8 right 0.8} -spacing {top 0.8 bottom 0.8 left 0.8 right 0.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

Ring generation is complete.
vias are now being generated.
addRing created 8 wires.
ViaGen created 8 vias, deleted 0 via to avoid violation.
+--------+----------------+----------------+
|  Layer |     Created    |     Deleted    |
+--------+----------------+----------------+
| metal9 |        4       |       NA       |
|  via9  |        8       |        0       |
| metal10|        4       |       NA       |
+--------+----------------+----------------+
<CMD> set sprCreateIeRingOffset 1.0
<CMD> set sprCreateIeRingThreshold 1.0
<CMD> set sprCreateIeRingJogDistance 1.0
<CMD> set sprCreateIeRingLayers {}
<CMD> set sprCreateIeRingOffset 1.0
<CMD> set sprCreateIeRingThreshold 1.0
<CMD> set sprCreateIeRingJogDistance 1.0
<CMD> set sprCreateIeRingLayers {}
<CMD> set sprCreateIeStripeWidth 10.0
<CMD> set sprCreateIeStripeThreshold 1.0
<CMD> set sprCreateIeStripeWidth 10.0
<CMD> set sprCreateIeStripeThreshold 1.0
<CMD> set sprCreateIeRingOffset 1.0
<CMD> set sprCreateIeRingThreshold 1.0
<CMD> set sprCreateIeRingJogDistance 1.0
<CMD> set sprCreateIeRingLayers {}
<CMD> set sprCreateIeStripeWidth 10.0
<CMD> set sprCreateIeStripeThreshold 1.0
<CMD> setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length 0 -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring }
addStripe will allow jog to connect padcore ring and block ring.
Stripes will stop at the boundary of the specified area.
When breaking rings, the power planner will consider the existence of blocks.
Stripes will not extend to closest target.
The power planner will set stripe antenna targets to none (no trimming allowed).
Stripes will not be created over regions without power planning wires.
The entire stripe set will break at the domain if one of the nets is not in the domain.
addStripe will break automatically at non-default domains when generating global stripes over the core area or default domain.
AddStripe segment minimum length set to 1
Offset for stripe breaking is set to 0.
<CMD> addStripe -nets {vdd gnd} -layer metal10 -direction vertical -width 0.8 -spacing 0.8 -set_to_set_distance 20 -start_from left -start_offset 15 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit metal10 -padcore_ring_bottom_layer_limit metal1 -block_ring_top_layer_limit metal10 -block_ring_bottom_layer_limit metal1 -use_wire_group 0 -snap_wire_center_to_grid None -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }

Starting stripe generation ...
Non-Default Mode Option Settings :
  NONE
Stripe generation is complete.
vias are now being generated.
addStripe created 6 wires.
ViaGen created 12 vias, deleted 0 via to avoid violation.
+--------+----------------+----------------+
|  Layer |     Created    |     Deleted    |
+--------+----------------+----------------+
|  via9  |       12       |        0       |
| metal10|        6       |       NA       |
+--------+----------------+----------------+
<CMD> gui_select -rect {50.198 73.481 75.108 83.413}
<CMD> pan 32.232 7.529
<CMD> setSrouteMode -viaConnectToShape { noshape }
<CMD> sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1(1) metal10(10) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal10(10) } -nets { gnd vdd } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { metal1(1) metal10(10) }
*** Begin SPECIAL ROUTE on Wed Aug 19 18:03:58 2020 ***
SPECIAL ROUTE ran on directory: /home/ms20.50/Desktop/try
SPECIAL ROUTE ran on machine: localhost.localdomain (Linux 3.10.0-1062.12.1.el7.x86_64 x86_64 1.99Ghz)

Begin option processing ...
srouteConnectPowerBump set to false
routeSelectNet set to "gnd vdd"
routeSpecial set to true
srouteBlockPin set to "useLef"
srouteBottomLayerLimit set to 1
srouteBottomTargetLayerLimit set to 1
srouteConnectConverterPin set to false
srouteCrossoverViaBottomLayer set to 1
srouteCrossoverViaTopLayer set to 10
srouteFloatingStripeTarget set to "blockring padring ring stripe ringpin blockpin followpin"
srouteFollowCorePinEnd set to 3
srouteJogControl set to "preferWithChanges differentLayer"
srouteNoViaOnWireShape set to "padring ring stripe blockring blockpin coverpin blockwire corewire followpin iowire"
sroutePadPinAllPorts set to true
sroutePreserveExistingRoutes set to true
srouteRoutePowerBarPortOnBothDir set to true
srouteStopBlockPin set to "nearestTarget"
srouteTopLayerLimit set to 10
srouteTopTargetLayerLimit set to 10
End option processing: cpu: 0:00:00, real: 0:00:00, peak: 1660.00 megs.

Reading DB technology information...
Finished reading DB technology information.
Reading floorplan and netlist information...
Finished reading floorplan and netlist information.
Read in 20 layers, 10 routing layers, 1 overlap layer
Read in 134 macros, 8 used
Read in 8 components
  8 core components: 8 unplaced, 0 placed, 0 fixed
Read in 388 logical pins
Read in 388 nets
Read in 2 special nets, 2 routed
2 nets selected.

Begin power routing ...
**WARN: (IMPSR-1253):	Cannot find any standard cell pin connected to net vdd.
Run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as 'USE POWER' or 'USE GROUND'.
**WARN: (IMPSR-1254):	Cannot find any block pin of net vdd. Check netlist, or change option to include the pin.
**WARN: (IMPSR-1256):	Cannot find any CORE class pad pin of net vdd. Change routing area or layer to include the expected pin, or check netlist, or change port class in the technology file.
Type 'man IMPSR-1256' for more detail.
Cannot find any AREAIO class pad pin of net vdd. Check net list, or change port class in the technology file, or change option to include pin in given range.
**WARN: (IMPSR-1253):	Cannot find any standard cell pin connected to net gnd.
Run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as 'USE POWER' or 'USE GROUND'.
**WARN: (IMPSR-1254):	Cannot find any block pin of net gnd. Check netlist, or change option to include the pin.
**WARN: (IMPSR-1256):	Cannot find any CORE class pad pin of net gnd. Change routing area or layer to include the expected pin, or check netlist, or change port class in the technology file.
Type 'man IMPSR-1256' for more detail.
Cannot find any AREAIO class pad pin of net gnd. Check net list, or change port class in the technology file, or change option to include pin in given range.
**WARN: (IMPSR-468):	Cannot find any standard cell pin connected to net vdd.
Use setSrouteMode -corePinReferenceMacro <standard cell> to specify a reference macro for followpin connection, or run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as "USE POWER" or "USE GROUND".
**WARN: (IMPSR-468):	Cannot find any standard cell pin connected to net vdd.
Use setSrouteMode -corePinReferenceMacro <standard cell> to specify a reference macro for followpin connection, or run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as "USE POWER" or "USE GROUND".
CPU time for FollowPin 0 seconds
**WARN: (IMPSR-468):	Cannot find any standard cell pin connected to net gnd.
Use setSrouteMode -corePinReferenceMacro <standard cell> to specify a reference macro for followpin connection, or run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as "USE POWER" or "USE GROUND".
**WARN: (IMPSR-468):	Cannot find any standard cell pin connected to net gnd.
Use setSrouteMode -corePinReferenceMacro <standard cell> to specify a reference macro for followpin connection, or run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as "USE POWER" or "USE GROUND".
CPU time for FollowPin 0 seconds
  Number of IO ports routed: 0
  Number of Block ports routed: 0
  Number of Stripe ports routed: 0
  Number of Core ports routed: 98
  Number of Pad ports routed: 0
  Number of Power Bump ports routed: 0
  Number of Followpin connections: 49
End power routing: cpu: 0:00:00, real: 0:00:00, peak: 1662.00 megs.



 Begin updating DB with routing results ...
 Updating DB with 0 via definition ...Extracting standard cell pins and blockage ...... 
Pin and blockage extraction finished

sroute created 147 wires.
ViaGen created 882 vias, deleted 0 via to avoid violation.
+--------+----------------+----------------+
|  Layer |     Created    |     Deleted    |
+--------+----------------+----------------+
| metal1 |       147      |       NA       |
|  via1  |       98       |        0       |
|  via2  |       98       |        0       |
|  via3  |       98       |        0       |
|  via4  |       98       |        0       |
|  via5  |       98       |        0       |
|  via6  |       98       |        0       |
|  via7  |       98       |        0       |
|  via8  |       98       |        0       |
|  via9  |       98       |        0       |
+--------+----------------+----------------+
<CMD> pan 3.176 15.057
<CMD> pan -7.176 -19.174
<CMD> pan 7.764 17.291
<CMD> setPlaceMode -prerouteAsObs {1 2 3 4 5 6 7 8}
<CMD> setPlaceMode -fp false
<CMD> placeDesign
*** Starting placeDesign default flow ***
*** Start deleteBufferTree ***
Info: Detect buffers to remove automatically.
Analyzing netlist ...
Updating netlist
AAE DB initialization (MEM=949.645 CPU=0:00:00.2 REAL=0:00:01.0) 
siFlow : Timing analysis mode is single, using late cdB files

*summary: 35 instances (buffers/inverters) removed
*** Finish deleteBufferTree (0:00:00.5) ***
**INFO: Enable pre-place timing setting for timing analysis
Set Using Default Delay Limit as 101.
**WARN: (IMPDC-1629):	The default delay limit was set to 101. This is less than the default of 1000 and may result in inaccurate delay calculation for nets with a fanout higher than the setting.  If needed, the default delay limit may be adjusted by running the command 'set delaycal_use_default_delay_limit'.
Set Default Net Delay as 0 ps.
Set Default Net Load as 0 pF. 
**INFO: Analyzing IO path groups for slack adjustment
Effort level <high> specified for reg2reg_tmp.19172 path_group
#################################################################################
# Design Stage: PreRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off 
#################################################################################
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=1151.93)
Total number of fetched objects 1719
End delay calculation. (MEM=1240.25 CPU=0:00:00.5 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=1142.88 CPU=0:00:00.9 REAL=0:00:01.0)
**INFO: Disable pre-place timing setting for timing analysis
Set Using Default Delay Limit as 1000.
Set Default Net Delay as 1000 ps.
Set Default Net Load as 0.5 pF. 
**INFO: Pre-place timing setting for timing analysis already disabled
Deleted 0 physical inst  (cell - / prefix -).
*** Starting "NanoPlace(TM) placement v#10 (mem=1128.7M)" ...
total jobs 1303
multi thread init TemplateIndex for each ta. thread num 1
Wait...
*** Build Buffered Sizing Timing Model
(cpu=0:00:00.8 mem=1128.7M) ***
*** Build Virtual Sizing Timing Model
(cpu=0:00:00.9 mem=1128.7M) ***
No user setting net weight.
Options: timingDriven clkGateAware ignoreScan pinGuide congEffort=auto gpeffort=medium 
Scan chains were not defined.
#std cell=1074 (0 fixed + 1074 movable) #block=0 (0 floating + 0 preplaced)
#ioInst=0 #net=1333 #term=3948 #term/net=2.96, #fixedIo=0, #floatIo=0, #fixedPin=0, #floatPin=388
stdCell: 1074 single + 0 double + 0 multi
Total standard cell length = 1.9958 (mm), area = 0.0028 (mm^2)
Estimated cell power/ground rail width = 0.197 um
Average module density = 0.593.
Density for the design = 0.593.
       = stdcell_area 10504 sites (2794 um^2) / alloc_area 17712 sites (4711 um^2).
Pin Density = 0.2229.
            = total # of pins 3948 / total area 17712.
=== lastAutoLevel = 7 
Clock gating cells determined by native netlist tracing.
Iteration  1: Total net bbox = 3.290e-11 (0.00e+00 3.29e-11)
              Est.  stn bbox = 3.299e-11 (0.00e+00 3.30e-11)
              cpu = 0:00:00.0 real = 0:00:00.0 mem = 1104.4M
Iteration  2: Total net bbox = 3.290e-11 (0.00e+00 3.29e-11)
              Est.  stn bbox = 3.299e-11 (0.00e+00 3.30e-11)
              cpu = 0:00:00.0 real = 0:00:00.0 mem = 1104.4M
Iteration  3: Total net bbox = 1.259e+01 (6.40e+00 6.19e+00)
              Est.  stn bbox = 1.771e+01 (8.98e+00 8.73e+00)
              cpu = 0:00:00.1 real = 0:00:00.0 mem = 1120.4M
Active setup views:
    default
Iteration  4: Total net bbox = 7.003e+02 (3.31e+02 3.69e+02)
              Est.  stn bbox = 1.223e+03 (6.02e+02 6.21e+02)
              cpu = 0:00:00.4 real = 0:00:00.0 mem = 1120.4M
Iteration  5: Total net bbox = 9.560e+02 (4.73e+02 4.83e+02)
              Est.  stn bbox = 1.655e+03 (8.27e+02 8.28e+02)
              cpu = 0:00:00.3 real = 0:00:01.0 mem = 1120.4M
Iteration  6: Total net bbox = 1.574e+03 (8.09e+02 7.65e+02)
              Est.  stn bbox = 2.344e+03 (1.20e+03 1.14e+03)
              cpu = 0:00:00.4 real = 0:00:00.0 mem = 1120.4M
Iteration  7: Total net bbox = 3.266e+04 (1.70e+04 1.57e+04)
              Est.  stn bbox = 3.347e+04 (1.74e+04 1.61e+04)
              cpu = 0:00:00.1 real = 0:00:00.0 mem = 1121.4M
Iteration  8: Total net bbox = 3.266e+04 (1.70e+04 1.57e+04)
              Est.  stn bbox = 3.347e+04 (1.74e+04 1.61e+04)
              cpu = 0:00:00.9 real = 0:00:01.0 mem = 1123.4M
Iteration  9: Total net bbox = 3.691e+03 (1.96e+03 1.73e+03)
              Est.  stn bbox = 4.471e+03 (2.35e+03 2.12e+03)
              cpu = 0:00:00.5 real = 0:00:01.0 mem = 1120.2M
Iteration 10: Total net bbox = 3.417e+04 (1.77e+04 1.65e+04)
              Est.  stn bbox = 3.499e+04 (1.81e+04 1.69e+04)
              cpu = 0:00:01.3 real = 0:00:02.0 mem = 1120.2M
Iteration 11: Total net bbox = 3.417e+04 (1.77e+04 1.65e+04)
              Est.  stn bbox = 3.499e+04 (1.81e+04 1.69e+04)
              cpu = 0:00:00.0 real = 0:00:00.0 mem = 1120.2M
*** cost = 3.417e+04 (1.77e+04 1.65e+04) (cpu for global=0:00:03.7) real=0:00:05.0***
Info: 0 clock gating cells identified, 0 (on average) moved
Solver runtime cpu: 0:00:02.4 real: 0:00:02.8
Core Placement runtime cpu: 0:00:02.5 real: 0:00:04.0
**WARN: (IMPSP-9025):	No scan chain specified/traced.
Type 'man IMPSP-9025' for more detail.
*** Starting refinePlace (0:02:22 mem=1120.2M) ***
Total net bbox length = 3.417e+04 (1.766e+04 1.651e+04) (ext = 3.020e+04)
Density distribution unevenness ratio = 2.734%
Move report: Detail placement moves 1074 insts, mean move: 0.99 um, max move: 10.26 um
	Max move on inst (S_reg[10]): (39.06, 61.24) --> (43.51, 55.44)
	Runtime: CPU: 0:00:00.3 REAL: 0:00:00.0 MEM: 1120.2MB
Summary Report:
Instances move: 1074 (out of 1074 movable)
Instances flipped: 0
Mean displacement: 0.99 um
Max displacement: 10.26 um (Instance: S_reg[10]) (39.0555, 61.2435) -> (43.51, 55.44)
	Length: 20 sites, height: 1 rows, site name: FreePDK45_38x28_10R_NP_162NW_34O, cell type: DFFR_X1
Total net bbox length = 3.360e+04 (1.698e+04 1.663e+04) (ext = 2.991e+04)
Runtime: CPU: 0:00:00.3 REAL: 0:00:00.0 MEM: 1120.2MB
*** Finished refinePlace (0:02:22 mem=1120.2M) ***
*** End of Placement (cpu=0:00:05.3, real=0:00:07.0, mem=1120.2M) ***
default core: bins with density >  0.75 =    0 % ( 0 / 25 )
Density distribution unevenness ratio = 2.440%
*** Free Virtual Timing Model ...(mem=1120.2M)
Starting congestion repair ...
[NR-eGR] honorMsvRouteConstraint: false
[NR-eGR] honorClockSpecNDR      : 0
[NR-eGR] minRouteLayer          : 2
[NR-eGR] maxRouteLayer          : 127
[NR-eGR] numTracksPerClockWire  : 0
[NR-eGR] Layer1 has no routable track
[NR-eGR] Layer2 has single uniform track structure
[NR-eGR] Layer3 has single uniform track structure
[NR-eGR] Layer4 has single uniform track structure
[NR-eGR] Layer5 has single uniform track structure
[NR-eGR] Layer6 has single uniform track structure
[NR-eGR] Layer7 has single uniform track structure
[NR-eGR] Layer8 has single uniform track structure
[NR-eGR] Layer9 has single uniform track structure
[NR-eGR] Layer10 has single uniform track structure
[NR-eGR] numRoutingBlks=0 numInstBlks=0 numPGBlocks=1720 numBumpBlks=0 numBoundaryFakeBlks=0
[NR-eGR] numPreroutedNet = 0  numPreroutedWires = 0
[NR-eGR] Read numTotalNets=946  numIgnoredNets=0
[NR-eGR] There are 1 clock nets ( 0 with NDR ).
[NR-eGR] ============ Routing rule table ============
[NR-eGR] Rule id 0. Nets 946 
[NR-eGR] id=0  ndrTrackId=0  ndrViaId=-1  extraSpace=0  numShields=0  maxHorDemand=1  maxVerDemand=1
[NR-eGR] Pitch:  L1=270  L2=380  L3=280  L4=560  L5=560  L6=560  L7=1680  L8=1680  L9=3200  L10=3360
[NR-eGR] ========================================
[NR-eGR] 
[NR-eGR] Layer group 1: route 946 net(s) in layer range [2, 10]
[NR-eGR] earlyGlobalRoute overflow of layer group 1: 0.00% H + 0.00% V. EstWL: 5.306000e+03um
[NR-eGR] 
[NR-eGR] Congestion Analysis Layer By layer: (blocked Gcells are excluded) 
[NR-eGR]                OverCon            
[NR-eGR]                 #Gcell     %Gcell
[NR-eGR] Layer              (0)    OverCon 
[NR-eGR] ------------------------------------
[NR-eGR] Layer1       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer2       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer3       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer4       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer5       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer6       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer7       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer8       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer9       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer10       0( 0.00%)   ( 0.00%) 
[NR-eGR] ------------------------------------
[NR-eGR] Total        0( 0.00%)   ( 0.00%) 
[NR-eGR] 
[NR-eGR] Overflow after earlyGlobalRoute (GR compatible) 0.00% H + 0.00% V
[NR-eGR] Overflow after earlyGlobalRoute 0.00% H + 0.00% V
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
Skipped repairing congestion.
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Layer1(metal1)(F) length: 0.000000e+00um, number of vias: 3173
[NR-eGR] Layer2(metal2)(V) length: 2.165245e+03um, number of vias: 3824
[NR-eGR] Layer3(metal3)(H) length: 2.867250e+03um, number of vias: 984
[NR-eGR] Layer4(metal4)(V) length: 8.489600e+02um, number of vias: 0
[NR-eGR] Layer5(metal5)(H) length: 0.000000e+00um, number of vias: 0
[NR-eGR] Layer6(metal6)(V) length: 0.000000e+00um, number of vias: 0
[NR-eGR] Layer7(metal7)(H) length: 0.000000e+00um, number of vias: 0
[NR-eGR] Layer8(metal8)(V) length: 0.000000e+00um, number of vias: 0
[NR-eGR] Layer9(metal9)(H) length: 0.000000e+00um, number of vias: 0
[NR-eGR] Layer10(metal10)(V) length: 0.000000e+00um, number of vias: 0
[NR-eGR] Total length: 5.881455e+03um, number of vias: 7981
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total clock nets wire length: 1.099290e+03um 
[NR-eGR] --------------------------------------------------------------------------
End of congRepair (cpu=0:00:00.1, real=0:00:00.0)
*** Finishing placeDesign default flow ***
**placeDesign ... cpu = 0: 0: 7, real = 0: 0: 9, mem = 1100.5M **

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary                                  
WARNING   IMPDC-1629           1  The default delay limit was set to %d. T...
WARNING   IMPSP-9025           1  No scan chain specified/traced.          
*** Message Summary: 2 warning(s), 0 error(s)

<CMD> pan -4.823 -6.234
<CMD> pan 0.824 -11.175
<CMD> setDrawView ameba
<CMD> pan 0.353 10.587
<CMD> deselectAll
<CMD> selectObject Module maprca
<CMD> deselectAll
<CMD> setDrawView place
<CMD> setDrawView fplan
<CMD> pan 1.149 6.513
<CMD> setDrawView place
<CMD> panCenter 83.599 34.304
<CMD> panCenter 154.183 42.541
<CMD> panCenter 224.767 50.778
<CMD> panCenter 295.351 59.014
<CMD> panCenter 365.935 67.251
<CMD> getPinAssignMode -pinEditInBatch -quiet
<CMD> setPinAssignMode -pinEditInBatch true
<CMD> editPin -fixOverlap 1 -spreadDirection clockwise -side Top -layer 1 -spreadType side -pin {{A[0]} {A[1]} {A[2]} {A[3]} {A[4]} {A[5]} {A[6]} {A[7]} {A[8]} {A[9]} {A[10]} {A[11]} {A[12]} {A[13]} {A[14]} {A[15]} {A[16]} {A[17]} {A[18]} {A[19]} {A[20]} {A[21]} {A[22]} {A[23]} {A[24]} {A[25]} {A[26]} {A[27]} {A[28]} {A[29]} {A[30]} {A[31]} {A[32]} {A[33]} {A[34]} {A[35]} {A[36]} {A[37]} {A[38]} {A[39]} {A[40]} {A[41]} {A[42]} {A[43]} {A[44]} {A[45]} {A[46]} {A[47]} {A[48]} {A[49]} {A[50]} {A[51]} {A[52]} {A[53]} {A[54]} {A[55]} {A[56]} {A[57]} {A[58]} {A[59]} {A[60]} {A[61]} {A[62]} {A[63]} {A[64]} {A[65]} {A[66]} {A[67]} {A[68]} {A[69]} {A[70]} {A[71]} {A[72]} {A[73]} {A[74]} {A[75]} {A[76]} {A[77]} {A[78]} {A[79]} {A[80]} {A[81]} {A[82]} {A[83]} {A[84]} {A[85]} {A[86]} {A[87]} {A[88]} {A[89]} {A[90]} {A[91]} {A[92]} {A[93]} {A[94]} {A[95]} {A[96]} {A[97]} {A[98]} {A[99]} {A[100]} {A[101]} {A[102]} {A[103]} {A[104]} {A[105]} {A[106]} {A[107]} {A[108]} {A[109]} {A[110]} {A[111]} {A[112]} {A[113]} {A[114]} {A[115]} {A[116]} {A[117]} {A[118]} {A[119]} {A[120]} {A[121]} {A[122]} {A[123]} {A[124]} {A[125]} {A[126]} {A[127]}}
Successfully spread [128] pins.
editPin : finished (cpu = 0:00:00.2 real = 0:00:00.0, mem = 1104.6M).
<CMD> setPinAssignMode -pinEditInBatch false
<CMD> pan -25.237 -22.877
<CMD> pan -1.411 15.999
<CMD> getPinAssignMode -pinEditInBatch -quiet
**ERROR: (IMPSYT-16268):	Only support 'start' and 'center' spread for single pin.
<CMD> setPinAssignMode -pinEditInBatch false
<CMD> pan 0.969 13.287
<CMD> selectInst {ATMP_reg[85]}
<CMD> deselectAll
<CMD> selectInst {BTMP_reg[100]}
<CMD> deselectAll
<CMD> selectInst {S_reg[33]}
<CMD> deselectAll
<CMD> selectWire 61.7300 2.9200 62.5300 74.3600 10 gnd
<CMD> deselectAll
<CMD> selectInst {S_reg[11]}
<CMD> deselectAll
<CMD> selectInst {S_reg[74]}
<CMD> deselectAll
<CMD> selectWire 5.1300 67.9550 75.2400 68.1250 1 gnd
<CMD> gui_select -rect {9.892 66.431 9.477 62.279}
<CMD> gui_select -rect {9.754 57.020 9.616 55.913}
<CMD> selectWire 5.1300 53.9550 75.2400 54.1250 1 gnd
<CMD> deselectAll
<CMD> gui_select -rect {12.383 26.434 20.273 9.964}
<CMD> deselectAll
<CMD> getPinAssignMode -pinEditInBatch -quiet
<CMD> setPinAssignMode -pinEditInBatch true
<CMD> editPin -fixOverlap 1 -spreadDirection clockwise -side Left -layer 1 -spreadType side -pin {{B[0]} {B[1]} {B[2]} {B[3]} {B[4]} {B[5]} {B[6]} {B[7]} {B[8]} {B[9]} {B[10]} {B[11]} {B[12]} {B[13]} {B[14]} {B[15]} {B[16]} {B[17]} {B[18]} {B[19]} {B[20]} {B[21]} {B[22]} {B[23]} {B[24]} {B[25]} {B[26]} {B[27]} {B[28]} {B[29]} {B[30]} {B[31]} {B[32]} {B[33]} {B[34]} {B[35]} {B[36]} {B[37]} {B[38]} {B[39]} {B[40]} {B[41]} {B[42]} {B[43]} {B[44]} {B[45]} {B[46]} {B[47]} {B[48]} {B[49]} {B[50]} {B[51]} {B[52]} {B[53]} {B[54]} {B[55]} {B[56]} {B[57]} {B[58]} {B[59]} {B[60]} {B[61]} {B[62]} {B[63]} {B[64]} {B[65]} {B[66]} {B[67]} {B[68]} {B[69]} {B[70]} {B[71]} {B[72]} {B[73]} {B[74]} {B[75]} {B[76]} {B[77]} {B[78]} {B[79]} {B[80]} {B[81]} {B[82]} {B[83]} {B[84]} {B[85]} {B[86]} {B[87]} {B[88]} {B[89]} {B[90]} {B[91]} {B[92]} {B[93]} {B[94]} {B[95]} {B[96]} {B[97]} {B[98]} {B[99]} {B[100]} {B[101]} {B[102]} {B[103]} {B[104]} {B[105]} {B[106]} {B[107]} {B[108]} {B[109]} {B[110]} {B[111]} {B[112]} {B[113]} {B[114]} {B[115]} {B[116]} {B[117]} {B[118]} {B[119]} {B[120]} {B[121]} {B[122]} {B[123]} {B[124]} {B[125]} {B[126]} {B[127]}}
Successfully spread [128] pins.
editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
**ERROR: (IMPSYT-16268):	Only support 'start' and 'center' spread for single pin.
<CMD> setPinAssignMode -pinEditInBatch true
<CMD> editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin Ci
Successfully spread [1] pins.
editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
<CMD> setPinAssignMode -pinEditInBatch true
<CMD> editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin CLK
Successfully spread [1] pins.
editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
<CMD> setPinAssignMode -pinEditInBatch false
<CMD> getPinAssignMode -pinEditInBatch -quiet
<CMD> setPinAssignMode -pinEditInBatch true
<CMD> editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin Co
Successfully spread [1] pins.
editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
<CMD> setPinAssignMode -pinEditInBatch true
<CMD> editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin RST
Successfully spread [1] pins.
editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
<CMD> setPinAssignMode -pinEditInBatch false
<CMD> getPinAssignMode -pinEditInBatch -quiet
<CMD> setPinAssignMode -pinEditInBatch true
<CMD> editPin -fixOverlap 1 -spreadDirection clockwise -side Bottom -layer 1 -spreadType side -pin {{S[0]} {S[1]} {S[2]} {S[3]} {S[4]} {S[5]} {S[6]} {S[7]} {S[8]} {S[9]} {S[10]} {S[11]} {S[12]} {S[13]} {S[14]} {S[15]} {S[16]} {S[17]} {S[18]} {S[19]} {S[20]} {S[21]} {S[22]} {S[23]} {S[24]} {S[25]} {S[26]} {S[27]} {S[28]} {S[29]} {S[30]} {S[31]} {S[32]} {S[33]} {S[34]} {S[35]} {S[36]} {S[37]} {S[38]} {S[39]} {S[40]} {S[41]} {S[42]} {S[43]} {S[44]} {S[45]} {S[46]} {S[47]} {S[48]} {S[49]} {S[50]} {S[51]} {S[52]} {S[53]} {S[54]} {S[55]} {S[56]} {S[57]} {S[58]} {S[59]} {S[60]} {S[61]} {S[62]} {S[63]} {S[64]} {S[65]} {S[66]} {S[67]} {S[68]} {S[69]} {S[70]} {S[71]} {S[72]} {S[73]} {S[74]} {S[75]} {S[76]} {S[77]} {S[78]} {S[79]} {S[80]} {S[81]} {S[82]} {S[83]} {S[84]} {S[85]} {S[86]} {S[87]} {S[88]} {S[89]} {S[90]} {S[91]} {S[92]} {S[93]} {S[94]} {S[95]} {S[96]} {S[97]} {S[98]} {S[99]} {S[100]} {S[101]} {S[102]} {S[103]} {S[104]} {S[105]} {S[106]} {S[107]} {S[108]} {S[109]} {S[110]} {S[111]} {S[112]} {S[113]} {S[114]} {S[115]} {S[116]} {S[117]} {S[118]} {S[119]} {S[120]} {S[121]} {S[122]} {S[123]} {S[124]} {S[125]} {S[126]} {S[127]}}
Successfully spread [128] pins.
editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
<CMD> setPinAssignMode -pinEditInBatch true
<CMD> editPin -pinWidth 0.07 -pinDepth 0.07 -fixOverlap 1 -spreadDirection clockwise -side Bottom -layer 1 -spreadType side -pin {{S[0]} {S[1]} {S[2]} {S[3]} {S[4]} {S[5]} {S[6]} {S[7]} {S[8]} {S[9]} {S[10]} {S[11]} {S[12]} {S[13]} {S[14]} {S[15]} {S[16]} {S[17]} {S[18]} {S[19]} {S[20]} {S[21]} {S[22]} {S[23]} {S[24]} {S[25]} {S[26]} {S[27]} {S[28]} {S[29]} {S[30]} {S[31]} {S[32]} {S[33]} {S[34]} {S[35]} {S[36]} {S[37]} {S[38]} {S[39]} {S[40]} {S[41]} {S[42]} {S[43]} {S[44]} {S[45]} {S[46]} {S[47]} {S[48]} {S[49]} {S[50]} {S[51]} {S[52]} {S[53]} {S[54]} {S[55]} {S[56]} {S[57]} {S[58]} {S[59]} {S[60]} {S[61]} {S[62]} {S[63]} {S[64]} {S[65]} {S[66]} {S[67]} {S[68]} {S[69]} {S[70]} {S[71]} {S[72]} {S[73]} {S[74]} {S[75]} {S[76]} {S[77]} {S[78]} {S[79]} {S[80]} {S[81]} {S[82]} {S[83]} {S[84]} {S[85]} {S[86]} {S[87]} {S[88]} {S[89]} {S[90]} {S[91]} {S[92]} {S[93]} {S[94]} {S[95]} {S[96]} {S[97]} {S[98]} {S[99]} {S[100]} {S[101]} {S[102]} {S[103]} {S[104]} {S[105]} {S[106]} {S[107]} {S[108]} {S[109]} {S[110]} {S[111]} {S[112]} {S[113]} {S[114]} {S[115]} {S[116]} {S[117]} {S[118]} {S[119]} {S[120]} {S[121]} {S[122]} {S[123]} {S[124]} {S[125]} {S[126]} {S[127]}}
Successfully spread [128] pins.
editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
<CMD> setPinAssignMode -pinEditInBatch false
<CMD> pan 1.075 0.459
<CMD> panCenter 79.942 76.674
<CMD> panCenter 80.523 76.530
<CMD> setOptMode -fixCap true -fixTran true -fixFanoutLoad false
<CMD> optDesign -postCTS
**INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
GigaOpt running with 1 threads.
Updating RC grid for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
Setting timing_disable_library_data_to_data_checks to 'true'.
Setting timing_disable_user_data_to_data_checks to 'true'.
**optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 883.6M, totSessionCpu=0:05:03 **
Added -handlePreroute to trialRouteMode
*** optDesign -postCTS ***
DRC Margin: user margin 0.0; extra margin 0.2
Hold Target Slack: user slack 0
Setup Target Slack: user slack 0; extra slack 0.1
setUsefulSkewMode -ecoRoute false
No user sequential activity specified, applying default sequential activity of "0.2" for Dynamic Power reporting.
'set_default_switching_activity' finished successfully.
Multi-VT timing optimization disabled based on library information.
Start to check current routing status for nets...
All nets will be re-routed.
End to check current routing status for nets (mem=1141.4M)
[NR-eGR] Started earlyGlobalRoute kernel
[NR-eGR] Initial Peak syMemory usage = 1143.4 MB
[NR-eGR] honorMsvRouteConstraint: false
[NR-eGR] honorClockSpecNDR      : 0
[NR-eGR] minRouteLayer          : 2
[NR-eGR] maxRouteLayer          : 127
[NR-eGR] numTracksPerClockWire  : 0
[NR-eGR] Layer1 has no routable track
[NR-eGR] Layer2 has single uniform track structure
[NR-eGR] Layer3 has single uniform track structure
[NR-eGR] Layer4 has single uniform track structure
[NR-eGR] Layer5 has single uniform track structure
[NR-eGR] Layer6 has single uniform track structure
[NR-eGR] Layer7 has single uniform track structure
[NR-eGR] Layer8 has single uniform track structure
[NR-eGR] Layer9 has single uniform track structure
[NR-eGR] Layer10 has single uniform track structure
[NR-eGR] numRoutingBlks=0 numInstBlks=0 numPGBlocks=1720 numBumpBlks=0 numBoundaryFakeBlks=0
[NR-eGR] numPreroutedNet = 0  numPreroutedWires = 0
[NR-eGR] Read numTotalNets=1333  numIgnoredNets=0
[NR-eGR] There are 1 clock nets ( 0 with NDR ).
[NR-eGR] ============ Routing rule table ============
[NR-eGR] Rule id 0. Nets 1333 
[NR-eGR] id=0  ndrTrackId=0  ndrViaId=-1  extraSpace=0  numShields=0  maxHorDemand=1  maxVerDemand=1
[NR-eGR] Pitch:  L1=270  L2=380  L3=280  L4=560  L5=560  L6=560  L7=1680  L8=1680  L9=3200  L10=3360
[NR-eGR] ========================================
[NR-eGR] 
[NR-eGR] Layer group 1: route 1333 net(s) in layer range [2, 10]
[NR-eGR] earlyGlobalRoute overflow of layer group 1: 0.03% H + 0.00% V. EstWL: 2.956800e+04um
[NR-eGR] 
[NR-eGR] Congestion Analysis Layer By layer: (blocked Gcells are excluded) 
[NR-eGR]                OverCon            
[NR-eGR]                 #Gcell     %Gcell
[NR-eGR] Layer              (2)    OverCon 
[NR-eGR] ------------------------------------
[NR-eGR] Layer1       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer2       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer3       2( 0.06%)   ( 0.06%) 
[NR-eGR] Layer4       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer5       5( 0.16%)   ( 0.16%) 
[NR-eGR] Layer6       2( 0.06%)   ( 0.06%) 
[NR-eGR] Layer7       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer8       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer9       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer10       0( 0.00%)   ( 0.00%) 
[NR-eGR] ------------------------------------
[NR-eGR] Total        9( 0.04%)   ( 0.04%) 
[NR-eGR] 
[NR-eGR] Overflow after earlyGlobalRoute (GR compatible) 0.06% H + 0.00% V
[NR-eGR] Overflow after earlyGlobalRoute 0.08% H + 0.00% V
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Layer1(metal1)(F) length: 0.000000e+00um, number of vias: 3948
[NR-eGR] Layer2(metal2)(V) length: 4.152410e+03um, number of vias: 4691
[NR-eGR] Layer3(metal3)(H) length: 9.238400e+03um, number of vias: 1648
[NR-eGR] Layer4(metal4)(V) length: 6.401675e+03um, number of vias: 296
[NR-eGR] Layer5(metal5)(H) length: 4.430010e+03um, number of vias: 292
[NR-eGR] Layer6(metal6)(V) length: 5.745860e+03um, number of vias: 26
[NR-eGR] Layer7(metal7)(H) length: 4.962600e+02um, number of vias: 12
[NR-eGR] Layer8(metal8)(V) length: 3.242400e+02um, number of vias: 0
[NR-eGR] Layer9(metal9)(H) length: 0.000000e+00um, number of vias: 0
[NR-eGR] Layer10(metal10)(V) length: 0.000000e+00um, number of vias: 0
[NR-eGR] Total length: 3.078886e+04um, number of vias: 10913
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total clock nets wire length: 1.131225e+03um 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] End Peak syMemory usage = 1139.4 MB
[NR-eGR] Early Global Router Kernel+IO runtime : 0.10 seconds
Updating RC grid for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
Extraction called for design 'SUM' of instances=1074 and nets=1335 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design SUM.
RC Extraction called in multi-corner(1) mode.
RCMode: PreRoute
      RC Corner Indexes            0   
Capacitance Scaling Factor   : 1.00000 
Resistance Scaling Factor    : 1.00000 
Clock Cap. Scaling Factor    : 1.00000 
Clock Res. Scaling Factor    : 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Updating RC grid for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:00.0  Real Time: 0:00:00.0  MEM: 1139.367M)

Footprint cell infomation for calculating maxBufDist
*info: There are 9 candidate Buffer cells
*info: There are 6 candidate Inverter cells

Compute RC Scale Done ...
#################################################################################
# Design Stage: PreRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off 
#################################################################################
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=1358.66)
Total number of fetched objects 1719
End delay calculation. (MEM=1382.79 CPU=0:00:00.6 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=1382.79 CPU=0:00:00.8 REAL=0:00:01.0)
*** Done Building Timing Graph (cpu=0:00:01.0 real=0:00:01.0 totSessionCpu=0:05:06 mem=1382.8M)

------------------------------------------------------------
             Initial Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.022  |  0.022  |  2.394  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      1 (1)       |   -0.752   |      1 (1)       |
|   max_tran     |     1 (387)      |   -1.775   |     1 (387)      |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 59.304%
------------------------------------------------------------
**optDesign ... cpu = 0:00:03, real = 0:00:03, mem = 983.6M, totSessionCpu=0:05:06 **
** INFO : this run is activating low effort ccoptDesign flow
*** Starting optimizing excluded clock nets MEM= 1241.5M) ***
*info: There are no clock nets marked defIn, clock nets will not be optimized.
*info: No excluded clock nets to be optimized.
*** Finished optimizing excluded clock nets (CPU Time= 0:00:00.0  MEM= 1241.5M) ***
*** Starting optimizing excluded clock nets MEM= 1241.5M) ***
*info: There are no clock nets marked defIn, clock nets will not be optimized.
*info: No excluded clock nets to be optimized.
*** Finished optimizing excluded clock nets (CPU Time= 0:00:00.0  MEM= 1241.5M) ***
Begin: GigaOpt DRV Optimization
Info: 1 clock net  excluded from IPO operation.
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|     1|   387|    -1.81|     1|     1|    -0.76|     0|     0|     0|     0|     0.02|     0.00|       0|       0|       0|  59.30|          |         |
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.02|     0.00|       7|       0|       1|  59.49| 0:00:00.0|  1402.8M|
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.02|     0.00|       0|       0|       0|  59.49| 0:00:00.0|  1402.8M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
**** Begin NDR-Layer Usage Statistics ****
0 Ndr or Layer constraints added by optimization 
**** End NDR-Layer Usage Statistics ****

*** Finish DRV Fixing (cpu=0:00:00.6 real=0:00:00.0 mem=1402.8M) ***

*** Starting refinePlace (0:05:08 mem=1418.8M) ***
Total net bbox length = 2.868e+04 (1.324e+04 1.543e+04) (ext = 2.469e+04)
**WARN: (IMPSP-5140):	Global net connect rules have not been created. Added  insts would have no supply connectivity, and would fail DRC.
Type 'man IMPSP-5140' for more detail.
**WARN: (IMPSP-315):	Found 1081 instances insts with no PG Term connections.
Type 'man IMPSP-315' for more detail.
Density distribution unevenness ratio = 2.378%
Density distribution unevenness ratio = 2.378%
Move report: Detail placement moves 8 insts, mean move: 1.26 um, max move: 1.78 um
	Max move on inst (FE_OFC2_n386): (32.49, 59.64) --> (32.87, 61.04)
	Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1421.9MB
Summary Report:
Instances move: 8 (out of 1081 movable)
Instances flipped: 0
Mean displacement: 1.26 um
Max displacement: 1.78 um (Instance: FE_OFC2_n386) (32.49, 59.64) -> (32.87, 61.04)
	Length: 4 sites, height: 1 rows, site name: FreePDK45_38x28_10R_NP_162NW_34O, cell type: BUF_X2
Total net bbox length = 2.868e+04 (1.325e+04 1.543e+04) (ext = 2.469e+04)
Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1421.9MB
*** Finished refinePlace (0:05:08 mem=1421.9M) ***
*** maximum move = 1.78 um ***
*** Finished re-routing un-routed nets (1421.9M) ***

*** Finish Physical Update (cpu=0:00:00.1 real=0:00:00.0 mem=1421.9M) ***
End: GigaOpt DRV Optimization

------------------------------------------------------------
     Summary (cpu=0.04min real=0.03min mem=1259.0M)                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.022  |  0.022  |  3.880  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 59.485%
Routing Overflow: 0.08% H and 0.00% V
------------------------------------------------------------
**optDesign ... cpu = 0:00:06, real = 0:00:05, mem = 996.6M, totSessionCpu=0:05:08 **

Active setup views:
 default
  Dominating endpoints: 0
  Dominating TNS: -0.000

*** Timing NOT met, worst failing slack is 0.022
*** Check timing (0:00:00.0)
Info: 1 clock net  excluded from IPO operation.
Begin: Area Reclaim Optimization
Usable buffer cells for single buffer setup transform:
CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32 
Number of usable buffer cells above: 9
Reclaim Optimization WNS Slack 0.020  TNS Slack 0.000 Density 59.49
+----------+---------+--------+--------+------------+--------+
| Density  | Commits |  WNS   |  TNS   |    Real    |  Mem   |
+----------+---------+--------+--------+------------+--------+
|    59.49%|        -|   0.020|   0.000|   0:00:00.0| 1408.5M|
|    59.49%|        0|   0.020|   0.000|   0:00:01.0| 1408.5M|
|    59.49%|        0|   0.020|   0.000|   0:00:00.0| 1408.5M|
|    59.49%|        0|   0.020|   0.000|   0:00:00.0| 1408.5M|
|    59.49%|        0|   0.020|   0.000|   0:00:00.0| 1408.5M|
|    59.49%|        0|   0.020|   0.000|   0:00:00.0| 1408.5M|
+----------+---------+--------+--------+------------+--------+
Reclaim Optimization End WNS Slack 0.020  TNS Slack 0.000 Density 59.49
**** Begin NDR-Layer Usage Statistics ****
0 Ndr or Layer constraints added by optimization 
**** End NDR-Layer Usage Statistics ****
** Finished Core Area Reclaim Optimization (cpu = 0:00:01.1) (real = 0:00:01.0) **
*** Starting refinePlace (0:05:10 mem=1408.5M) ***
Total net bbox length = 2.868e+04 (1.325e+04 1.543e+04) (ext = 2.469e+04)
**WARN: (IMPSP-5140):	Global net connect rules have not been created. Added  insts would have no supply connectivity, and would fail DRC.
Type 'man IMPSP-5140' for more detail.
**WARN: (IMPSP-315):	Found 1081 instances insts with no PG Term connections.
Type 'man IMPSP-315' for more detail.
Move report: Detail placement moves 0 insts, mean move: 0.00 um, max move: 0.00 um
	Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1408.5MB
Summary Report:
Instances move: 0 (out of 1081 movable)
Instances flipped: 0
Mean displacement: 0.00 um
Max displacement: 0.00 um 
Total net bbox length = 2.868e+04 (1.325e+04 1.543e+04) (ext = 2.469e+04)
Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1408.5MB
*** Finished refinePlace (0:05:10 mem=1408.5M) ***
*** maximum move = 0.00 um ***
*** Finished re-routing un-routed nets (1408.5M) ***

*** Finish Physical Update (cpu=0:00:00.1 real=0:00:00.0 mem=1408.5M) ***
*** Finished Area Reclaim Optimization (cpu=0:00:01, real=0:00:01, mem=1258.99M, totSessionCpu=0:05:10).
[NR-eGR] honorMsvRouteConstraint: false
[NR-eGR] honorClockSpecNDR      : 0
[NR-eGR] minRouteLayer          : 2
[NR-eGR] maxRouteLayer          : 127
[NR-eGR] numTracksPerClockWire  : 0
[NR-eGR] Layer1 has no routable track
[NR-eGR] Layer2 has single uniform track structure
[NR-eGR] Layer3 has single uniform track structure
[NR-eGR] Layer4 has single uniform track structure
[NR-eGR] Layer5 has single uniform track structure
[NR-eGR] Layer6 has single uniform track structure
[NR-eGR] Layer7 has single uniform track structure
[NR-eGR] Layer8 has single uniform track structure
[NR-eGR] Layer9 has single uniform track structure
[NR-eGR] Layer10 has single uniform track structure
[NR-eGR] numRoutingBlks=0 numInstBlks=0 numPGBlocks=1720 numBumpBlks=0 numBoundaryFakeBlks=0
[NR-eGR] numPreroutedNet = 0  numPreroutedWires = 0
[NR-eGR] Read numTotalNets=1340  numIgnoredNets=0
[NR-eGR] There are 1 clock nets ( 0 with NDR ).
[NR-eGR] ============ Routing rule table ============
[NR-eGR] Rule id 0. Nets 1340 
[NR-eGR] id=0  ndrTrackId=0  ndrViaId=-1  extraSpace=0  numShields=0  maxHorDemand=1  maxVerDemand=1
[NR-eGR] Pitch:  L1=270  L2=380  L3=280  L4=560  L5=560  L6=560  L7=1680  L8=1680  L9=3200  L10=3360
[NR-eGR] ========================================
[NR-eGR] 
[NR-eGR] Layer group 1: route 1340 net(s) in layer range [2, 10]
[NR-eGR] earlyGlobalRoute overflow of layer group 1: 0.03% H + 0.00% V. EstWL: 2.957640e+04um
[NR-eGR] 
[NR-eGR] Congestion Analysis Layer By layer: (blocked Gcells are excluded) 
[NR-eGR]                OverCon         OverCon            
[NR-eGR]                 #Gcell          #Gcell     %Gcell
[NR-eGR] Layer              (1)             (3)    OverCon 
[NR-eGR] ---------------------------------------------------
[NR-eGR] Layer1       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer2       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer3       6( 0.19%)       0( 0.00%)   ( 0.19%) 
[NR-eGR] Layer4       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer5       3( 0.10%)       1( 0.03%)   ( 0.13%) 
[NR-eGR] Layer6       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer7       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer8       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer9       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer10       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[NR-eGR] ---------------------------------------------------
[NR-eGR] Total        9( 0.04%)       1( 0.00%)   ( 0.04%) 
[NR-eGR] 
[NR-eGR] Overflow after earlyGlobalRoute (GR compatible) 0.06% H + 0.00% V
[NR-eGR] Overflow after earlyGlobalRoute 0.08% H + 0.00% V
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Layer1(metal1)(F) length: 0.000000e+00um, number of vias: 3962
[NR-eGR] Layer2(metal2)(V) length: 4.013356e+03um, number of vias: 4702
[NR-eGR] Layer3(metal3)(H) length: 9.215950e+03um, number of vias: 1651
[NR-eGR] Layer4(metal4)(V) length: 6.507235e+03um, number of vias: 296
[NR-eGR] Layer5(metal5)(H) length: 4.434170e+03um, number of vias: 290
[NR-eGR] Layer6(metal6)(V) length: 5.799690e+03um, number of vias: 26
[NR-eGR] Layer7(metal7)(H) length: 5.076900e+02um, number of vias: 12
[NR-eGR] Layer8(metal8)(V) length: 3.309600e+02um, number of vias: 0
[NR-eGR] Layer9(metal9)(H) length: 0.000000e+00um, number of vias: 0
[NR-eGR] Layer10(metal10)(V) length: 0.000000e+00um, number of vias: 0
[NR-eGR] Total length: 3.080905e+04um, number of vias: 10939
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] Total clock nets wire length: 1.130475e+03um 
[NR-eGR] --------------------------------------------------------------------------
[NR-eGR] End Peak syMemory usage = 1239.3 MB
[NR-eGR] Early Global Router Kernel+IO runtime : 0.11 seconds
Extraction called for design 'SUM' of instances=1081 and nets=1342 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design SUM.
RC Extraction called in multi-corner(1) mode.
RCMode: PreRoute
      RC Corner Indexes            0   
Capacitance Scaling Factor   : 1.00000 
Resistance Scaling Factor    : 1.00000 
Clock Cap. Scaling Factor    : 1.00000 
Clock Res. Scaling Factor    : 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Updating RC grid for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:00.0  Real Time: 0:00:00.0  MEM: 1239.332M)
Compute RC Scale Done ...
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.00 |          0.00 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
#################################################################################
# Design Stage: PreRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=1292.57)
Total number of fetched objects 1726
End delay calculation. (MEM=1327.78 CPU=0:00:00.6 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=1327.78 CPU=0:00:00.8 REAL=0:00:01.0)
Begin: GigaOpt postEco DRV Optimization
Info: 1 clock net  excluded from IPO operation.
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.02|     0.00|       0|       0|       0|  59.49|          |         |
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.02|     0.00|       0|       0|       0|  59.49| 0:00:00.0|  1404.1M|
+-------------------------------------------------------------------------------------------------------------------------------------------------------+
**** Begin NDR-Layer Usage Statistics ****
0 Ndr or Layer constraints added by optimization 
**** End NDR-Layer Usage Statistics ****

*** Finish DRV Fixing (cpu=0:00:00.1 real=0:00:00.0 mem=1404.1M) ***

End: GigaOpt postEco DRV Optimization
*** Steiner Routed Nets: 0.000%; Threshold: 100; Threshold for Hold: 100
Re-routed 0 nets

Active setup views:
 default
  Dominating endpoints: 0
  Dominating TNS: -0.000

Extraction called for design 'SUM' of instances=1081 and nets=1342 using extraction engine 'preRoute' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PreRoute RC Extraction called for design SUM.
RC Extraction called in multi-corner(1) mode.
RCMode: PreRoute
      RC Corner Indexes            0   
Capacitance Scaling Factor   : 1.00000 
Resistance Scaling Factor    : 1.00000 
Clock Cap. Scaling Factor    : 1.00000 
Clock Res. Scaling Factor    : 1.00000 
Shrink Factor                : 1.00000
PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
Using capacitance table file ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
PreRoute RC Extraction DONE (CPU Time: 0:00:00.0  Real Time: 0:00:00.0  MEM: 1235.824M)
#################################################################################
# Design Stage: PreRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=1239.35)
Total number of fetched objects 1726
End delay calculation. (MEM=1314.71 CPU=0:00:00.6 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=1314.71 CPU=0:00:00.8 REAL=0:00:01.0)
*** Done Building Timing Graph (cpu=0:00:01.1 real=0:00:01.0 totSessionCpu=0:05:13 mem=1314.7M)
Reported timing to dir ./timingReports
**optDesign ... cpu = 0:00:11, real = 0:00:10, mem = 997.9M, totSessionCpu=0:05:13 **

------------------------------------------------------------
     optDesign Final Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.021  |  0.021  |  3.895  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 59.485%
Routing Overflow: 0.08% H and 0.00% V
------------------------------------------------------------
**optDesign ... cpu = 0:00:12, real = 0:00:12, mem = 999.3M, totSessionCpu=0:05:15 **
*** Finished optDesign ***
Info: Destroy the CCOpt slew target map.
<CMD> optDesign -postCTS -hold
**INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
GigaOpt running with 1 threads.
**optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 920.0M, totSessionCpu=0:05:16 **
*** optDesign -postCTS ***
DRC Margin: user margin 0.0
Hold Target Slack: user slack 0
Setup Target Slack: user slack 0;
setUsefulSkewMode -ecoRoute false
Start to check current routing status for nets...
All nets are already routed correctly.
End to check current routing status for nets (mem=1183.6M)
Compute RC Scale Done ...
GigaOpt Hold Optimizer is used
Starting initialization (fixHold) cpu=0:00:00.0 real=0:00:00.0 totSessionCpu=0:05:17 mem=1398.6M ***
*info: Run optDesign holdfix with 1 thread.
**INFO: Starting Blocking QThread with 1 CPU
   ____________________________________________________________________
__/ message from Blocking QThread
#################################################################################
# Design Stage: PreRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=0)
Total number of fetched objects 1726
End delay calculation. (MEM=0 CPU=0:00:00.6 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=0 CPU=0:00:00.6 REAL=0:00:01.0)
*** Done Building Timing Graph (cpu=0:00:00.8 real=0:00:01.0 totSessionCpu=0:00:01.0 mem=0.0M)

Active hold views:
 default
  Dominating endpoints: 0
  Dominating TNS: -0.000

Done building cte hold timing graph (fixHold) cpu=0:00:01.0 real=0:00:01.0 totSessionCpu=0:00:01.0 mem=0.0M ***
Done building hold timer [3074 node(s), 4459 edge(s), 1 view(s)] (fixHold) cpu=0:00:01.3 real=0:00:01.0 totSessionCpu=0:00:01.3 mem=0.0M ***

_______________________________________________________________________
Done building cte setup timing graph (fixHold) cpu=0:00:01.9 real=0:00:02.0 totSessionCpu=0:05:19 mem=1417.7M ***
Restoring autoHoldViews:  default

------------------------------------------------------------
             Initial Summary                             
------------------------------------------------------------

Setup views included:
 default
Hold  views included:
 default

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.021  |  0.021  |  3.895  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+--------------------+---------+---------+---------+
|     Hold mode      |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):| -0.190  |  0.107  | -0.190  |
|           TNS (ns):| -8.667  |  0.000  | -8.667  |
|    Violating Paths:|   358   |    0    |   358   |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 59.485%
Routing Overflow: 0.08% H and 0.00% V
------------------------------------------------------------

*Info: minBufDelay = 21.9 ps, libStdDelay = 10.1 ps, minBufSize = 3192000 (3.0)
*Info: worst delay setup view: default
**optDesign ... cpu = 0:00:04, real = 0:00:04, mem = 1006.2M, totSessionCpu=0:05:20 **
Info: 1 clock net  excluded from IPO operation.

*** Starting Core Fixing (fixHold) cpu=0:00:02.8 real=0:00:03.0 totSessionCpu=0:05:20 mem=1409.0M density=59.485% ***

Phase I ......
Executing transform: ECO Safe Resize
+-----------------------------------------------------------------------------------------------+
|Iter|  WNS   |  TNS    |  #VP   |  #Buffer  |  #Resize(F/F)  | Density  | Real Time  |   Mem   |
+-----------------------------------------------------------------------------------------------+
|   0|  -0.190|    -8.66|     358|          0|       0(     0)|    59.49%|   0:00:03.0|  1409.0M|
|   1|  -0.190|    -8.66|     358|          0|       0(     0)|    59.49%|   0:00:03.0|  1409.0M|
+-----------------------------------------------------------------------------------------------+
Executing transform: AddBuffer + LegalResize
+-----------------------------------------------------------------------------------------------+
|Iter|  WNS   |  TNS    |  #VP   |  #Buffer  |  #Resize(F/F)  | Density  | Real Time  |   Mem   |
+-----------------------------------------------------------------------------------------------+
|   0|  -0.190|    -8.66|     358|          0|       0(     0)|    59.49%|   0:00:03.0|  1409.0M|
|   1|  -0.161|    -6.30|      41|        258|       0(     0)|    63.86%|   0:00:06.0|  1420.6M|
|   2|  -0.127|    -4.94|      41|          1|       0(     0)|    63.87%|   0:00:06.0|  1420.6M|
|   3|  -0.099|    -3.77|      41|          1|       0(     0)|    63.89%|   0:00:06.0|  1420.6M|
|   4|  -0.072|    -2.67|      41|          1|       0(     0)|    63.91%|   0:00:06.0|  1420.6M|
|   5|  -0.048|    -1.68|      41|          1|       0(     0)|    63.92%|   0:00:06.0|  1420.6M|
|   6|  -0.023|    -0.67|      41|          1|       0(     0)|    63.94%|   0:00:06.0|  1420.6M|
|   7|   0.001|     0.00|       0|          1|       0(     0)|    63.96%|   0:00:06.0|  1420.6M|
+-----------------------------------------------------------------------------------------------+

*info:    Total 264 cells added for Phase I

*** Finished Core Fixing (fixHold) cpu=0:00:05.7 real=0:00:06.0 totSessionCpu=0:05:23 mem=1420.6M density=63.957% ***

*info:
*info: Added a total of 264 cells to fix/reduce hold violation
*info:
*info: Summary: 
*info:          257 cells of type 'BUF_X1' used
*info:            7 cells of type 'CLKBUF_X1' used

*** Starting refinePlace (0:05:23 mem=1420.6M) ***
Total net bbox length = 2.896e+04 (1.337e+04 1.559e+04) (ext = 2.220e+04)
**WARN: (IMPSP-5140):	Global net connect rules have not been created. Added  insts would have no supply connectivity, and would fail DRC.
Type 'man IMPSP-5140' for more detail.
**WARN: (IMPSP-315):	Found 1345 instances insts with no PG Term connections.
Type 'man IMPSP-315' for more detail.
Density distribution unevenness ratio = 2.225%
Move report: Detail placement moves 0 insts, mean move: 0.00 um, max move: 0.00 um
	Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1420.6MB
Summary Report:
Instances move: 0 (out of 1345 movable)
Instances flipped: 0
Mean displacement: 0.00 um
Max displacement: 0.00 um 
Total net bbox length = 2.896e+04 (1.337e+04 1.559e+04) (ext = 2.220e+04)
Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1420.6MB
*** Finished refinePlace (0:05:23 mem=1420.6M) ***
*** maximum move = 0.00 um ***
*** Finished re-routing un-routed nets (1420.6M) ***

*** Finish Physical Update (cpu=0:00:00.1 real=0:00:00.0 mem=1420.6M) ***
*** Finish Post CTS Hold Fixing (cpu=0:00:05.8 real=0:00:06.0 totSessionCpu=0:05:23 mem=1420.6M density=63.957%) ***
*** Steiner Routed Nets: 32.544%; Threshold: 100; Threshold for Hold: 100
Re-routed 0 nets
GigaOpt_HOLD: Recover setup timing after hold fixing
GigaOpt: WNS changes after routing: 0.000 -> 0.000 (bump = 0.0)
GigaOpt: Skipping postEco optimization
GigaOpt: WNS changes after postEco optimization: 0.000 -> 0.000 (bump = 0.0)
GigaOpt: Skipping nonLegal postEco optimization
*** Steiner Routed Nets: 32.544%; Threshold: 100; Threshold for Hold: 100
Re-routed 0 nets
GigaOpt: WNS changes after postEco optimization: 0.000 -> 0.000 (bump = 0.0, threshold = 0.00505)
GigaOpt: Skipping post-eco TNS optimization

Active setup views:
 default
  Dominating endpoints: 0
  Dominating TNS: -0.000

[NR-eGR] honorMsvRouteConstraint: false
[NR-eGR] honorClockSpecNDR      : 0
[NR-eGR] minRouteLayer          : 2
[NR-eGR] maxRouteLayer          : 127
[NR-eGR] numTracksPerClockWire  : 0
[NR-eGR] Layer1 has no routable track
[NR-eGR] Layer2 has single uniform track structure
[NR-eGR] Layer3 has single uniform track structure
[NR-eGR] Layer4 has single uniform track structure
[NR-eGR] Layer5 has single uniform track structure
[NR-eGR] Layer6 has single uniform track structure
[NR-eGR] Layer7 has single uniform track structure
[NR-eGR] Layer8 has single uniform track structure
[NR-eGR] Layer9 has single uniform track structure
[NR-eGR] Layer10 has single uniform track structure
[NR-eGR] numRoutingBlks=0 numInstBlks=0 numPGBlocks=1720 numBumpBlks=0 numBoundaryFakeBlks=0
[NR-eGR] numPreroutedNet = 0  numPreroutedWires = 0
[NR-eGR] Read numTotalNets=1604  numIgnoredNets=0
[NR-eGR] There are 1 clock nets ( 0 with NDR ).
[NR-eGR] ============ Routing rule table ============
[NR-eGR] Rule id 0. Nets 1604 
[NR-eGR] id=0  ndrTrackId=0  ndrViaId=-1  extraSpace=0  numShields=0  maxHorDemand=1  maxVerDemand=1
[NR-eGR] Pitch:  L1=270  L2=380  L3=280  L4=560  L5=560  L6=560  L7=1680  L8=1680  L9=3200  L10=3360
[NR-eGR] ========================================
[NR-eGR] 
[NR-eGR] Layer group 1: route 1604 net(s) in layer range [2, 10]
[NR-eGR] earlyGlobalRoute overflow of layer group 1: 0.00% H + 0.00% V. EstWL: 2.978500e+04um
[NR-eGR] 
[NR-eGR] Congestion Analysis Layer By layer: (blocked Gcells are excluded) 
[NR-eGR]                OverCon            
[NR-eGR]                 #Gcell     %Gcell
[NR-eGR] Layer              (1)    OverCon 
[NR-eGR] ------------------------------------
[NR-eGR] Layer1       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer2       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer3       1( 0.03%)   ( 0.03%) 
[NR-eGR] Layer4       1( 0.03%)   ( 0.03%) 
[NR-eGR] Layer5       5( 0.16%)   ( 0.16%) 
[NR-eGR] Layer6       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer7       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer8       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer9       0( 0.00%)   ( 0.00%) 
[NR-eGR] Layer10       0( 0.00%)   ( 0.00%) 
[NR-eGR] ------------------------------------
[NR-eGR] Total        7( 0.03%)   ( 0.03%) 
[NR-eGR] 
[NR-eGR] Overflow after earlyGlobalRoute (GR compatible) 0.00% H + 0.00% V
[NR-eGR] Overflow after earlyGlobalRoute 0.00% H + 0.00% V
[NR-eGR] End Peak syMemory usage = 1265.0 MB
[NR-eGR] Early Global Router Kernel+IO runtime : 0.05 seconds
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.00 |          0.00 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
Reported timing to dir ./timingReports
**optDesign ... cpu = 0:00:07, real = 0:00:07, mem = 969.8M, totSessionCpu=0:05:23 **
**INFO: Starting Blocking QThread with 1 CPU
   ____________________________________________________________________
__/ message from Blocking QThread
#################################################################################
# Design Stage: PreRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=0)
Total number of fetched objects 1990
End delay calculation. (MEM=0 CPU=0:00:00.6 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=0 CPU=0:00:00.7 REAL=0:00:00.0)
*** Done Building Timing Graph (cpu=0:00:00.8 real=0:00:00.0 totSessionCpu=0:00:02.0 mem=0.0M)

_______________________________________________________________________
#################################################################################
# Design Stage: PreRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC Non-OCV 
# Parasitics Mode: No SPEF/RCDB
# Signoff Settings: SI Off 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate delays in Single mode...
Start delay calculation (fullDC) (1 T). (MEM=1238.84)
Total number of fetched objects 1990
End delay calculation. (MEM=1314.21 CPU=0:00:00.7 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=1314.21 CPU=0:00:00.7 REAL=0:00:01.0)
*** Done Building Timing Graph (cpu=0:00:01.0 real=0:00:01.0 totSessionCpu=0:05:25 mem=1314.2M)

------------------------------------------------------------
     optDesign Final Summary                             
------------------------------------------------------------

Setup views included:
 default 
Hold  views included:
 default

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.021  |  0.021  |  3.703  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+--------------------+---------+---------+---------+
|     Hold mode      |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.001  |  0.107  |  0.001  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
Routing Overflow: 0.00% H and 0.00% V
------------------------------------------------------------
**optDesign ... cpu = 0:00:11, real = 0:00:11, mem = 996.1M, totSessionCpu=0:05:26 **
*** Finished optDesign ***
Info: Destroy the CCOpt slew target map.
<CMD> getFillerMode -quiet
<CMD> addFiller -cell FILLCELL_X8 FILLCELL_X32 FILLCELL_X4 FILLCELL_X2 FILLCELL_X16 FILLCELL_X1 -prefix FILLER
*INFO: Adding fillers to top-module.
*INFO:   Added 1 filler inst  (cell FILLCELL_X32 / prefix FILLER).
*INFO:   Added 46 filler insts (cell FILLCELL_X16 / prefix FILLER).
*INFO:   Added 181 filler insts (cell FILLCELL_X8 / prefix FILLER).
*INFO:   Added 650 filler insts (cell FILLCELL_X4 / prefix FILLER).
*INFO:   Added 1568 filler insts (cell FILLCELL_X1 / prefix FILLER).
*INFO:   Added 0 filler inst  (cell FILLCELL_X2 / prefix FILLER).
*INFO: Total 2446 filler insts added - prefix FILLER (CPU: 0:00:00.1).
For 2446 new insts, *** Applied 0 GNC rules (cpu = 0:00:00.0)
<CMD> pan 8.537 1.111
**WARN: (IMPTCM-77):	Option "-drouteStartIteration" for command getNanoRouteMode is obsolete and will be removed in a future release. The obsolete option still works in this release but to avoid this warning and to ensure compatibility with future releases, remove the obsolete option from your script.
<CMD> setNanoRouteMode -quiet -timingEngine {}
<CMD> setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
**WARN: (IMPTCM-77):	Option "-drouteStartIteration" for command getNanoRouteMode is obsolete and will be removed in a future release. The obsolete option still works in this release but to avoid this warning and to ensure compatibility with future releases, remove the obsolete option from your script.
<CMD> setNanoRouteMode -quiet -drouteStartIteration default
**WARN: (IMPTCM-77):	Option "-drouteStartIteration" for command setNanoRouteMode is obsolete and will be removed in a future release. The obsolete option still works in this release but to avoid this warning and to ensure compatibility with future releases, remove the obsolete option from your script.
<CMD> setNanoRouteMode -quiet -routeTopRoutingLayer default
<CMD> setNanoRouteMode -quiet -routeBottomRoutingLayer default
<CMD> setNanoRouteMode -quiet -drouteEndIteration default
**WARN: (IMPTCM-77):	Option "-routeEcoOnlyInLayers" for command getNanoRouteMode is obsolete and will be removed in a future release. The obsolete option still works in this release but to avoid this warning and to ensure compatibility with future releases, remove the obsolete option from your script.
<CMD> setNanoRouteMode -quiet -routeWithTimingDriven false
<CMD> setNanoRouteMode -quiet -routeWithSiDriven false
Running Native NanoRoute ...
<CMD> routeDesign -globalDetail
#routeDesign: cpu time = 00:00:00, elapsed time = 00:00:00, memory = 998.38 (MB), peak = 1022.11 (MB)
#WARNING (NRIG-96) Selected single pass global detail route "-globalDetail". Clock eco and post optimizations will not be run. See "man NRIG-96" for more details.
#**INFO: setDesignMode -flowEffort standard
#**INFO: mulit-cut via swapping is disabled by user.
#**INFO: All auto set options tuned by routeDesign will be restored to their original settings on command completion.
#**INFO: auto set of routeReserveSpaceForMultiCut to true
#**INFO: auto set of routeConcurrentMinimizeViaCountEffort to high
Begin checking placement ... (start mem=1257.0M, init mem=1257.0M)
*info: Placed = 3791          
*info: Unplaced = 0           
Placement Density:100.00%(4711/4711)
Placement Density (including fixed std cells):100.00%(4711/4711)
Finished checkPlace (cpu: total=0:00:00.0, vio checks=0:00:00.0; mem=1257.0M)
#**INFO: honoring user setting for routeWithTimingDriven set to false
#**INFO: honoring user setting for routeWithSiDriven set to false
**WARN: (IMPCK-8086):	The command changeUseClockNetStatus is obsolete and will be removed in the next release. This command still works in this release, but by the next release you must transition to the CCOpt-based CTS flow.

changeUseClockNetStatus Option :  -noFixedNetWires 
*** Changed status on (0) nets in Clock.
*** End changeUseClockNetStatus (cpu=0:00:00.0, real=0:00:00.0, mem=1257.0M) ***

globalDetailRoute

#setNanoRouteMode -routeConcurrentMinimizeViaCountEffort "high"
#setNanoRouteMode -routeReserveSpaceForMultiCut true
#setNanoRouteMode -routeWithSiDriven false
#setNanoRouteMode -routeWithTimingDriven false
#Start globalDetailRoute on Wed Aug 19 18:27:08 2020
#
#WARNING (NRDB-2005) SPECIAL_NET vdd has special wires but no definitions for instance pins or top level pins. This will cause routability problems later.
#WARNING (NRDB-2005) SPECIAL_NET gnd has special wires but no definitions for instance pins or top level pins. This will cause routability problems later.
#NanoRoute Version 17.11-s080_1 NR170721-2155/17_11-UB
#Start routing data preparation on Wed Aug 19 18:27:08 2020
#
#WARNING (NRDB-2077) The below via enclosure for LAYER metal1 is not specified for width 0.0700.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal2 is not specified for width 0.0700.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal1 is not specified for width 0.0700.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal2 is not specified for width 0.0700.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal2 is not specified for width 0.0700.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal3 is not specified for width 0.0700.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal2 is not specified for width 0.0700.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal3 is not specified for width 0.0700.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal3 is not specified for width 0.0700.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal4 is not specified for width 0.1400.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal3 is not specified for width 0.0700.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal4 is not specified for width 0.1400.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal4 is not specified for width 0.1400.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal5 is not specified for width 0.1400.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal4 is not specified for width 0.1400.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal5 is not specified for width 0.1400.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal5 is not specified for width 0.1400.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal6 is not specified for width 0.1400.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal5 is not specified for width 0.1400.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal6 is not specified for width 0.1400.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal6 is not specified for width 0.1400.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal7 is not specified for width 0.4000.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal6 is not specified for width 0.1400.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal7 is not specified for width 0.4000.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal7 is not specified for width 0.4000.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal8 is not specified for width 0.4000.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal7 is not specified for width 0.4000.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal8 is not specified for width 0.4000.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal8 is not specified for width 0.4000.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal9 is not specified for width 0.8000.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal8 is not specified for width 0.4000.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal9 is not specified for width 0.8000.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal9 is not specified for width 0.8000.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal10 is not specified for width 0.8000.
#WARNING (NRDB-2077) The below via enclosure for LAYER metal9 is not specified for width 0.8000.
#WARNING (NRDB-2078) The above via enclosure for LAYER metal10 is not specified for width 0.8000.
#Minimum voltage of a net in the design = 0.000.
#Maximum voltage of a net in the design = 1.100.
#Voltage range [0.000 - 0.000] has 1 net.
#Voltage range [1.100 - 1.100] has 1 net.
#Voltage range [0.000 - 1.100] has 1604 nets.
# metal1       H   Track-Pitch = 0.1400    Line-2-Via Pitch = 0.1350
# metal2       V   Track-Pitch = 0.1900    Line-2-Via Pitch = 0.1400
# metal3       H   Track-Pitch = 0.1400    Line-2-Via Pitch = 0.1400
# metal4       V   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
# metal5       H   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
# metal6       V   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
# metal7       H   Track-Pitch = 0.8400    Line-2-Via Pitch = 0.8000
# metal8       V   Track-Pitch = 0.8400    Line-2-Via Pitch = 0.8000
# metal9       H   Track-Pitch = 1.6000    Line-2-Via Pitch = 1.6000
# metal10      V   Track-Pitch = 1.6800    Line-2-Via Pitch = 1.6000
#Regenerating Ggrids automatically.
#Auto generating G-grids with size=15 tracks, using layer metal3's pitch = 0.1400.
#Using automatically generated G-grids.
#Done routing data preparation.
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 927.16 (MB), peak = 1022.11 (MB)
#Merging special wires...
#
#Finished routing data preparation on Wed Aug 19 18:27:08 2020
#
#Cpu time = 00:00:00
#Elapsed time = 00:00:00
#Increased memory = 7.25 (MB)
#Total memory = 927.32 (MB)
#Peak memory = 1022.11 (MB)
#
#
#Start global routing on Wed Aug 19 18:27:08 2020
#
#Number of eco nets is 0
#
#Start global routing data preparation on Wed Aug 19 18:27:08 2020
#
#Start routing resource analysis on Wed Aug 19 18:27:08 2020
#
#Routing resource analysis is done on Wed Aug 19 18:27:08 2020
#
#  Resource Analysis:
#
#               Routing  #Avail      #Track     #Total     %Gcell
#  Layer      Direction   Track     Blocked      Gcell    Blocked
#  --------------------------------------------------------------
#  metal1         H         552           0        1406    61.95%
#  metal2         V         423           0        1406     0.00%
#  metal3         H         552           0        1406     0.00%
#  metal4         V         286           0        1406     0.00%
#  metal5         H         275           0        1406     0.00%
#  metal6         V         286           0        1406     0.00%
#  metal7         H          91           0        1406     0.00%
#  metal8         V          95           0        1406     4.62%
#  metal9         H          33           4        1406    20.06%
#  metal10        V          29           9        1406    25.75%
#  --------------------------------------------------------------
#  Total                   2622       3.45%       14060    11.24%
#
#
#
#
#Global routing data preparation is done on Wed Aug 19 18:27:08 2020
#
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 927.83 (MB), peak = 1022.11 (MB)
#
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 927.85 (MB), peak = 1022.11 (MB)
#
#start global routing iteration 1...
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 930.31 (MB), peak = 1022.11 (MB)
#
#start global routing iteration 2...
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 934.22 (MB), peak = 1022.11 (MB)
#
#start global routing iteration 3...
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 934.85 (MB), peak = 1022.11 (MB)
#
#
#Total number of trivial nets (e.g. < 2 pins) = 2 (skipped).
#Total number of routable nets = 1604.
#Total number of nets in the design = 1606.
#
#1604 routable nets have only global wires.
#
#Routed nets constraints summary:
#-----------------------------
#        Rules   Unconstrained  
#-----------------------------
#      Default            1604  
#-----------------------------
#        Total            1604  
#-----------------------------
#
#Routing constraints summary of the whole design:
#-----------------------------
#        Rules   Unconstrained  
#-----------------------------
#      Default            1604  
#-----------------------------
#        Total            1604  
#-----------------------------
#
#
#  Congestion Analysis: (blocked Gcells are excluded)
#
#                 OverCon          
#                  #Gcell    %Gcell
#     Layer           (1)   OverCon
#  --------------------------------
#  metal1        0(0.00%)   (0.00%)
#  metal2        3(0.21%)   (0.21%)
#  metal3        0(0.00%)   (0.00%)
#  metal4        0(0.00%)   (0.00%)
#  metal5        0(0.00%)   (0.00%)
#  metal6        0(0.00%)   (0.00%)
#  metal7        0(0.00%)   (0.00%)
#  metal8        0(0.00%)   (0.00%)
#  metal9        0(0.00%)   (0.00%)
#  metal10       0(0.00%)   (0.00%)
#  --------------------------------
#     Total      3(0.02%)   (0.02%)
#
#  The worst congested Gcell overcon (routing demand over resource in number of tracks) = 1
#  Overflow after GR: 0.00% H + 0.04% V
#
[hotspot] +------------+---------------+---------------+
[hotspot] |            |   max hotspot | total hotspot |
[hotspot] +------------+---------------+---------------+
[hotspot] | normalized |          0.00 |          0.00 |
[hotspot] +------------+---------------+---------------+
Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
#Complete Global Routing.
#Total wire length = 29552 um.
#Total half perimeter of net bounding box = 30227 um.
#Total wire length on LAYER metal1 = 660 um.
#Total wire length on LAYER metal2 = 8288 um.
#Total wire length on LAYER metal3 = 11806 um.
#Total wire length on LAYER metal4 = 7080 um.
#Total wire length on LAYER metal5 = 1292 um.
#Total wire length on LAYER metal6 = 426 um.
#Total wire length on LAYER metal7 = 0 um.
#Total wire length on LAYER metal8 = 0 um.
#Total wire length on LAYER metal9 = 0 um.
#Total wire length on LAYER metal10 = 0 um.
#Total number of vias = 7491
#Up-Via Summary (total 7491):
#           
#-----------------------
# metal1           4339
# metal2           2674
# metal3            384
# metal4             70
# metal5             24
#-----------------------
#                  7491 
#
#Max overcon = 1 tracks.
#Total overcon = 0.02%.
#Worst layer Gcell overcon rate = 0.00%.
#
#Global routing statistics:
#Cpu time = 00:00:01
#Elapsed time = 00:00:01
#Increased memory = 8.07 (MB)
#Total memory = 935.43 (MB)
#Peak memory = 1022.11 (MB)
#
#Finished global routing on Wed Aug 19 18:27:09 2020
#
#
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 932.89 (MB), peak = 1022.11 (MB)
#Start Track Assignment.
#Done with 1856 horizontal wires in 1 hboxes and 1995 vertical wires in 1 hboxes.
#Done with 393 horizontal wires in 1 hboxes and 446 vertical wires in 1 hboxes.
#Done with 1 horizontal wires in 1 hboxes and 1 vertical wires in 1 hboxes.
#
#Track assignment summary:
# layer   (wire length)   (overlap)     (long ovlp)	(with obs/pg/clk)  
#------------------------------------------------------------------------
# metal1       670.69 	  0.13%  	  0.00% 	  0.10%
# metal2      8291.05 	  0.05%  	  0.00% 	  0.00%
# metal3     11725.58 	  0.02%  	  0.00% 	  0.00%
# metal4      7123.07 	  0.00%  	  0.00% 	  0.00%
# metal5      1311.67 	  0.00%  	  0.00% 	  0.00%
# metal6       426.30 	  0.00%  	  0.00% 	  0.00%
# metal7         0.00 	  0.00%  	  0.00% 	  0.00%
# metal8         0.00 	  0.00%  	  0.00% 	  0.00%
# metal9         0.00 	  0.00%  	  0.00% 	  0.00%
# metal10        0.00 	  0.00%  	  0.00% 	  0.00%
#------------------------------------------------------------------------
# All       29548.35  	  0.03% 	  0.00% 	  0.00%
#Complete Track Assignment.
#Total wire length = 30451 um.
#Total half perimeter of net bounding box = 30227 um.
#Total wire length on LAYER metal1 = 1266 um.
#Total wire length on LAYER metal2 = 8275 um.
#Total wire length on LAYER metal3 = 12067 um.
#Total wire length on LAYER metal4 = 7106 um.
#Total wire length on LAYER metal5 = 1309 um.
#Total wire length on LAYER metal6 = 428 um.
#Total wire length on LAYER metal7 = 0 um.
#Total wire length on LAYER metal8 = 0 um.
#Total wire length on LAYER metal9 = 0 um.
#Total wire length on LAYER metal10 = 0 um.
#Total number of vias = 7491
#Up-Via Summary (total 7491):
#           
#-----------------------
# metal1           4339
# metal2           2674
# metal3            384
# metal4             70
# metal5             24
#-----------------------
#                  7491 
#
#cpu time = 00:00:01, elapsed time = 00:00:01, memory = 936.27 (MB), peak = 1022.11 (MB)
#
#Routing data preparation, pin analysis, global routing and track assignment statistics:
#Cpu time = 00:00:01
#Elapsed time = 00:00:01
#Increased memory = 16.31 (MB)
#Total memory = 936.35 (MB)
#Peak memory = 1022.11 (MB)
#
#Start Detail Routing..
#start initial detail routing ...
#   number of violations = 1
#
#    By Layer and Type :
#	          Short   Totals
#	metal1        1        1
#	Totals        1        1
#cpu time = 00:00:09, elapsed time = 00:00:09, memory = 968.00 (MB), peak = 1022.11 (MB)
#start 1st optimization iteration ...
#   number of violations = 0
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 968.37 (MB), peak = 1022.11 (MB)
#Complete Detail Routing.
#Total wire length = 30698 um.
#Total half perimeter of net bounding box = 30227 um.
#Total wire length on LAYER metal1 = 2183 um.
#Total wire length on LAYER metal2 = 8953 um.
#Total wire length on LAYER metal3 = 10567 um.
#Total wire length on LAYER metal4 = 7181 um.
#Total wire length on LAYER metal5 = 1373 um.
#Total wire length on LAYER metal6 = 441 um.
#Total wire length on LAYER metal7 = 0 um.
#Total wire length on LAYER metal8 = 0 um.
#Total wire length on LAYER metal9 = 0 um.
#Total wire length on LAYER metal10 = 0 um.
#Total number of vias = 7736
#Up-Via Summary (total 7736):
#           
#-----------------------
# metal1           4536
# metal2           2692
# metal3            416
# metal4             68
# metal5             24
#-----------------------
#                  7736 
#
#Total number of DRC violations = 0
#Cpu time = 00:00:09
#Elapsed time = 00:00:09
#Increased memory = -2.63 (MB)
#Total memory = 933.72 (MB)
#Peak memory = 1022.11 (MB)
#
#Start Post Route wire spreading..
#
#Start DRC checking..
#   number of violations = 0
#cpu time = 00:00:01, elapsed time = 00:00:01, memory = 964.91 (MB), peak = 1022.11 (MB)
#CELL_VIEW SUM,init has no DRC violation.
#Total number of DRC violations = 0
#
#Start data preparation for wire spreading...
#
#Data preparation is done on Wed Aug 19 18:27:20 2020
#
#
#Start Post Route Wire Spread.
#Done with 868 horizontal wires in 1 hboxes and 880 vertical wires in 1 hboxes.
#Complete Post Route Wire Spread.
#
#Total wire length = 31335 um.
#Total half perimeter of net bounding box = 30227 um.
#Total wire length on LAYER metal1 = 2215 um.
#Total wire length on LAYER metal2 = 9221 um.
#Total wire length on LAYER metal3 = 10822 um.
#Total wire length on LAYER metal4 = 7262 um.
#Total wire length on LAYER metal5 = 1375 um.
#Total wire length on LAYER metal6 = 441 um.
#Total wire length on LAYER metal7 = 0 um.
#Total wire length on LAYER metal8 = 0 um.
#Total wire length on LAYER metal9 = 0 um.
#Total wire length on LAYER metal10 = 0 um.
#Total number of vias = 7736
#Up-Via Summary (total 7736):
#           
#-----------------------
# metal1           4536
# metal2           2692
# metal3            416
# metal4             68
# metal5             24
#-----------------------
#                  7736 
#
#
#Start DRC checking..
#   number of violations = 0
#cpu time = 00:00:01, elapsed time = 00:00:01, memory = 962.68 (MB), peak = 1022.11 (MB)
#CELL_VIEW SUM,init has no DRC violation.
#Total number of DRC violations = 0
#   number of violations = 0
#cpu time = 00:00:02, elapsed time = 00:00:02, memory = 938.82 (MB), peak = 1022.11 (MB)
#CELL_VIEW SUM,init has no DRC violation.
#Total number of DRC violations = 0
#Post Route wire spread is done.
#Total wire length = 31335 um.
#Total half perimeter of net bounding box = 30227 um.
#Total wire length on LAYER metal1 = 2215 um.
#Total wire length on LAYER metal2 = 9221 um.
#Total wire length on LAYER metal3 = 10822 um.
#Total wire length on LAYER metal4 = 7262 um.
#Total wire length on LAYER metal5 = 1375 um.
#Total wire length on LAYER metal6 = 441 um.
#Total wire length on LAYER metal7 = 0 um.
#Total wire length on LAYER metal8 = 0 um.
#Total wire length on LAYER metal9 = 0 um.
#Total wire length on LAYER metal10 = 0 um.
#Total number of vias = 7736
#Up-Via Summary (total 7736):
#           
#-----------------------
# metal1           4536
# metal2           2692
# metal3            416
# metal4             68
# metal5             24
#-----------------------
#                  7736 
#
#detailRoute Statistics:
#Cpu time = 00:00:12
#Elapsed time = 00:00:12
#Increased memory = 0.35 (MB)
#Total memory = 936.70 (MB)
#Peak memory = 1022.11 (MB)
#
#globalDetailRoute statistics:
#Cpu time = 00:00:14
#Elapsed time = 00:00:14
#Increased memory = -70.03 (MB)
#Total memory = 928.81 (MB)
#Peak memory = 1022.11 (MB)
#Number of warnings = 38
#Total number of warnings = 39
#Number of fails = 0
#Total number of fails = 0
#Complete globalDetailRoute on Wed Aug 19 18:27:22 2020
#
#routeDesign: cpu time = 00:00:14, elapsed time = 00:00:14, memory = 917.93 (MB), peak = 1022.11 (MB)

*** Summary of all messages that are not suppressed in this session:
Severity  ID               Count  Summary                                  
WARNING   IMPCK-8086           1  The command %s is obsolete and will be r...
*** Message Summary: 1 warning(s), 0 error(s)

<CMD> setAnalysisMode -analysisType onChipVariation
<CMD> setOptMode -fixCap true -fixTran true -fixFanoutLoad false
<CMD> optDesign -postRoute
**INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
Disable merging buffers from different footprints for postRoute code for non-MSV designs
Switching SI Aware to true by default in postroute mode   
GigaOpt running with 1 threads.
Updating RC grid for preRoute extraction ...
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
**optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 932.8M, totSessionCpu=0:06:25 **
#Created 135 library cell signatures
#Created 1606 NETS and 0 SPECIALNETS signatures
#Created 3791 instance signatures
#Build design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 932.92 (MB), peak = 1022.11 (MB)
#Save design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 932.93 (MB), peak = 1022.11 (MB)
Begin checking placement ... (start mem=1193.3M, init mem=1193.3M)
*info: Placed = 3791          
*info: Unplaced = 0           
Placement Density:100.00%(4711/4711)
Placement Density (including fixed std cells):100.00%(4711/4711)
Finished checkPlace (cpu: total=0:00:00.0, vio checks=0:00:00.0; mem=1193.3M)
 Initial DC engine is -> aae
 
 AAE-Opt:: Current number of nets in RC Memory -> 100 K
 
 
 AAE-Opt:: New number of nets in RC Memory -> 100 K
 
Reset EOS DB
Ignoring AAE DB Resetting ...
 Set Options for AAE Based Opt flow 
*** optDesign -postRoute ***
DRC Margin: user margin 0.0; extra margin 0
Setup Target Slack: user slack 0
Hold Target Slack: user slack 0
Opt: RC extraction mode changed to 'detail'
Multi-VT timing optimization disabled based on library information.
** INFO : this run is activating 'postRoute' automaton
Extraction called for design 'SUM' of instances=3791 and nets=1606 using extraction engine 'postRoute' at effort level 'low' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PostRoute (effortLevel low) RC Extraction called for design SUM.
RC Extraction called in multi-corner(1) mode.
Process corner(s) are loaded.
 Corner: standard
extractDetailRC Option : -outfile /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d  -extended
RC Mode: PostRoute -effortLevel low [Extended CapTable, RC Table Resistances]
      RC Corner Indexes            0   
Capacitance Scaling Factor   : 1.00000 
Coupling Cap. Scaling Factor : 1.00000 
Resistance Scaling Factor    : 1.00000 
Clock Cap. Scaling Factor    : 1.00000 
Clock Res. Scaling Factor    : 1.00000 
Shrink Factor                : 1.00000
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1187.2M)
Extracted 10.0065% (CPU Time= 0:00:00.1  MEM= 1226.3M)
Extracted 20.0071% (CPU Time= 0:00:00.1  MEM= 1250.3M)
Extracted 30.0077% (CPU Time= 0:00:00.1  MEM= 1250.3M)
Extracted 40.0082% (CPU Time= 0:00:00.1  MEM= 1250.3M)
Extracted 50.0088% (CPU Time= 0:00:00.1  MEM= 1250.3M)
Extracted 60.0094% (CPU Time= 0:00:00.1  MEM= 1250.3M)
Extracted 70.01% (CPU Time= 0:00:00.2  MEM= 1250.3M)
Extracted 80.0106% (CPU Time= 0:00:00.2  MEM= 1250.3M)
Extracted 90.0112% (CPU Time= 0:00:00.2  MEM= 1250.3M)
Extracted 100% (CPU Time= 0:00:00.3  MEM= 1250.3M)
Number of Extracted Resistors     : 24725
Number of Extracted Ground Cap.   : 26329
Number of Extracted Coupling Cap. : 45656
Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
 Corner: standard
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1210.3M)
PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.4  Real Time: 0:00:01.0  MEM: 1218.328M)
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
Unfixed 0 ViaPillar Nets
**INFO: Starting Blocking QThread with 1 CPU
   ____________________________________________________________________
__/ message from Blocking QThread
#################################################################################
# Design Stage: PostRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI Off 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate late delays in OCV mode...
Calculate early delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=0)
Total number of fetched objects 1990
End delay calculation. (MEM=0 CPU=0:00:00.7 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=0 CPU=0:00:00.7 REAL=0:00:01.0)
*** Done Building Timing Graph (cpu=0:00:00.9 real=0:00:01.0 totSessionCpu=0:00:03.0 mem=0.0M)
Done building cte hold timing graph (HoldAware) cpu=0:00:01.0 real=0:00:01.0 totSessionCpu=0:00:03.0 mem=0.0M ***

_______________________________________________________________________
Starting SI iteration 1 using Infinite Timing Windows
Begin IPO call back ...
End IPO call back ...
#################################################################################
# Design Stage: PostRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI On 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate early delays in OCV mode...
Calculate late delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=1216.33)
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
End delay calculation. (MEM=1270.63 CPU=0:00:01.0 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=1270.63 CPU=0:00:01.3 REAL=0:00:01.0)
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1270.6M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1270.6M)

Executing IPO callback for view pruning ..
Starting SI iteration 2
AAE_INFO: 1 threads acquired from CTE.
Calculate early delays in OCV mode...
Calculate late delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=1278.68)
Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
Glitch Analysis: View default -- Total Number of Nets Analyzed = 1990. 
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  1.6 percent of the nets selected for SI analysis
End delay calculation. (MEM=1246.67 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=1246.67 CPU=0:00:00.2 REAL=0:00:00.0)
*** Done Building Timing Graph (cpu=0:00:02.3 real=0:00:03.0 totSessionCpu=0:06:29 mem=1246.7M)

------------------------------------------------------------
     Initial SI Timing Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
**optDesign ... cpu = 0:00:04, real = 0:00:05, mem = 963.7M, totSessionCpu=0:06:29 **
Setting latch borrow mode to budget during optimization.
Glitch fixing enabled
**INFO: Start fixing DRV (Mem = 1243.23M) ...
Begin: GigaOpt DRV Optimization
Glitch fixing enabled
Info: 1 clock net  excluded from IPO operation.
DRV pessimism of 5.00% is used for tran, 5.00% for cap, 5.00% for fanout, on top of margin 0.00%
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|        max-tran       |        max-cap        |  max-fanout |  max-length |    glitch   |       setup       |        |        |        |       |          |         |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0|     0|     0.08|     0.00|       0|       0|       0| 100.00|          |         |
|     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0|     0|     0.08|     0.00|       0|       0|       0| 100.00| 0:00:00.0|  1483.4M|
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
**** Begin NDR-Layer Usage Statistics ****
0 Ndr or Layer constraints added by optimization 
**** End NDR-Layer Usage Statistics ****

*** Finish DRV Fixing (cpu=0:00:00.1 real=0:00:00.0 mem=1483.4M) ***

drv optimizer changes nothing and skips refinePlace
End: GigaOpt DRV Optimization
**optDesign ... cpu = 0:00:07, real = 0:00:08, mem = 1051.1M, totSessionCpu=0:06:32 **
*info:
**INFO: Completed fixing DRV (CPU Time = 0:00:03, Mem = 1344.26M).

------------------------------------------------------------
     SI Timing Summary (cpu=0.04min real=0.05min mem=1344.3M)                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
**optDesign ... cpu = 0:00:07, real = 0:00:08, mem = 1051.3M, totSessionCpu=0:06:32 **
*** Timing Is met
*** Check timing (0:00:00.0)
*** Setup timing is met (target slack 0ns)
Running postRoute recovery in preEcoRoute mode
**optDesign ... cpu = 0:00:07, real = 0:00:08, mem = 1051.5M, totSessionCpu=0:06:32 **
Checking DRV degradation...
**INFO: Skipping DRV recovery as drv did not degrade beyond margin
*** Finish postRoute recovery in preEcoRoute mode (cpu=0:00:00, real=0:00:00, mem=1277.49M, totSessionCpu=0:06:32).
**optDesign ... cpu = 0:00:07, real = 0:00:08, mem = 1051.5M, totSessionCpu=0:06:32 **

Default Rule : ""
Non Default Rules :
Worst Slack : 0.082 ns
Total 0 nets layer assigned (0.0).
GigaOpt: setting up router preferences
GigaOpt: 0 nets assigned router directives

Start Assign Priority Nets ...
TargetSlk(0.200ns) MaxAssign(3%) minLen(50um)
Existing Priority Nets 0 (0.0%)
Assigned Priority Nets 0 (0.0%)
Default Rule : ""
Non Default Rules :
Worst Slack : 0.082 ns
Total 0 nets layer assigned (0.3).
GigaOpt: setting up router preferences
GigaOpt: 0 nets assigned router directives

Start Assign Priority Nets ...
TargetSlk(0.200ns) MaxAssign(3%) minLen(50um)
Existing Priority Nets 0 (0.0%)
Assigned Priority Nets 0 (0.0%)

------------------------------------------------------------
        Pre-ecoRoute Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
**optDesign ... cpu = 0:00:08, real = 0:00:09, mem = 973.5M, totSessionCpu=0:06:33 **
*** Starting refinePlace (0:06:33 mem=1205.6M) ***
**ERROR: (IMPSP-2002):	Density too high (100.0%), stopping detail placement.
Type 'man IMPSP-2002' for more detail.
**WARN: (IMPSP-5140):	Global net connect rules have not been created. Added  insts would have no supply connectivity, and would fail DRC.
Type 'man IMPSP-5140' for more detail.
**WARN: (IMPSP-315):	Found 3791 instances insts with no PG Term connections.
Type 'man IMPSP-315' for more detail.
Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1205.6MB
*** Finished refinePlace (0:06:33 mem=1205.6M) ***
**ERROR: (IMPSP-9022):	Command 'refinePlace' completed with some error(s).
-routeWithEco false                       # bool, default=false
-routeWithEco true                        # bool, default=false, user setting
-routeSelectedNetOnly false               # bool, default=false
-routeWithTimingDriven false              # bool, default=false, user setting
-routeWithSiDriven false                  # bool, default=false, user setting

globalDetailRoute

#setNanoRouteMode -routeWithEco true
#setNanoRouteMode -routeWithSiDriven false
#setNanoRouteMode -routeWithTimingDriven false
#Start globalDetailRoute on Wed Aug 19 18:29:28 2020
#
#WARNING (NRDB-2005) SPECIAL_NET vdd has special wires but no definitions for instance pins or top level pins. This will cause routability problems later.
#WARNING (NRDB-2005) SPECIAL_NET gnd has special wires but no definitions for instance pins or top level pins. This will cause routability problems later.
#NanoRoute Version 17.11-s080_1 NR170721-2155/17_11-UB
#Loading the last recorded routing design signature
#No placement changes detected since last routing
#Start routing data preparation on Wed Aug 19 18:29:28 2020
#
#Minimum voltage of a net in the design = 0.000.
#Maximum voltage of a net in the design = 1.100.
#Voltage range [0.000 - 0.000] has 1 net.
#Voltage range [1.100 - 1.100] has 1 net.
#Voltage range [0.000 - 1.100] has 1604 nets.
# metal1       H   Track-Pitch = 0.1400    Line-2-Via Pitch = 0.1350
# metal2       V   Track-Pitch = 0.1900    Line-2-Via Pitch = 0.1400
# metal3       H   Track-Pitch = 0.1400    Line-2-Via Pitch = 0.1400
# metal4       V   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
# metal5       H   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
# metal6       V   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
# metal7       H   Track-Pitch = 0.8400    Line-2-Via Pitch = 0.8000
# metal8       V   Track-Pitch = 0.8400    Line-2-Via Pitch = 0.8000
# metal9       H   Track-Pitch = 1.6000    Line-2-Via Pitch = 1.6000
# metal10      V   Track-Pitch = 1.6800    Line-2-Via Pitch = 1.6000
#Regenerating Ggrids automatically.
#Auto generating G-grids with size=15 tracks, using layer metal3's pitch = 0.1400.
#Using automatically generated G-grids.
#Done routing data preparation.
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 974.63 (MB), peak = 1069.11 (MB)
#Merging special wires...
#Found 0 nets for post-route si or timing fixing.
#
#Finished routing data preparation on Wed Aug 19 18:29:28 2020
#
#Cpu time = 00:00:00
#Elapsed time = 00:00:00
#Increased memory = 3.98 (MB)
#Total memory = 974.63 (MB)
#Peak memory = 1069.11 (MB)
#
#
#Start global routing on Wed Aug 19 18:29:28 2020
#
#WARNING (NRGR-22) Design is already detail routed.
#Routing data preparation, pin analysis, global routing and track assignment statistics:
#Cpu time = 00:00:00
#Elapsed time = 00:00:00
#Increased memory = 3.99 (MB)
#Total memory = 974.64 (MB)
#Peak memory = 1069.11 (MB)
#
#Start Detail Routing..
#start initial detail routing ...
#   number of violations = 0
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 976.76 (MB), peak = 1069.11 (MB)
#start 1st optimization iteration ...
#   number of violations = 0
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 976.76 (MB), peak = 1069.11 (MB)
#Complete Detail Routing.
#Total wire length = 31335 um.
#Total half perimeter of net bounding box = 30227 um.
#Total wire length on LAYER metal1 = 2215 um.
#Total wire length on LAYER metal2 = 9221 um.
#Total wire length on LAYER metal3 = 10822 um.
#Total wire length on LAYER metal4 = 7262 um.
#Total wire length on LAYER metal5 = 1375 um.
#Total wire length on LAYER metal6 = 441 um.
#Total wire length on LAYER metal7 = 0 um.
#Total wire length on LAYER metal8 = 0 um.
#Total wire length on LAYER metal9 = 0 um.
#Total wire length on LAYER metal10 = 0 um.
#Total number of vias = 7736
#Up-Via Summary (total 7736):
#           
#-----------------------
# metal1           4536
# metal2           2692
# metal3            416
# metal4             68
# metal5             24
#-----------------------
#                  7736 
#
#Total number of DRC violations = 0
#Cpu time = 00:00:00
#Elapsed time = 00:00:00
#Increased memory = 0.00 (MB)
#Total memory = 974.64 (MB)
#Peak memory = 1069.11 (MB)
#
#Start Post Route wire spreading..
#
#Start data preparation for wire spreading...
#
#Data preparation is done on Wed Aug 19 18:29:28 2020
#
#
#Start Post Route Wire Spread.
#Done with 231 horizontal wires in 1 hboxes and 164 vertical wires in 1 hboxes.
#Complete Post Route Wire Spread.
#
#Total wire length = 31431 um.
#Total half perimeter of net bounding box = 30227 um.
#Total wire length on LAYER metal1 = 2218 um.
#Total wire length on LAYER metal2 = 9269 um.
#Total wire length on LAYER metal3 = 10859 um.
#Total wire length on LAYER metal4 = 7269 um.
#Total wire length on LAYER metal5 = 1375 um.
#Total wire length on LAYER metal6 = 441 um.
#Total wire length on LAYER metal7 = 0 um.
#Total wire length on LAYER metal8 = 0 um.
#Total wire length on LAYER metal9 = 0 um.
#Total wire length on LAYER metal10 = 0 um.
#Total number of vias = 7736
#Up-Via Summary (total 7736):
#           
#-----------------------
# metal1           4536
# metal2           2692
# metal3            416
# metal4             68
# metal5             24
#-----------------------
#                  7736 
#
#   number of violations = 0
#cpu time = 00:00:00, elapsed time = 00:00:00, memory = 981.58 (MB), peak = 1069.11 (MB)
#CELL_VIEW SUM,init has no DRC violation.
#Total number of DRC violations = 0
#Post Route wire spread is done.
#Total wire length = 31431 um.
#Total half perimeter of net bounding box = 30227 um.
#Total wire length on LAYER metal1 = 2218 um.
#Total wire length on LAYER metal2 = 9269 um.
#Total wire length on LAYER metal3 = 10859 um.
#Total wire length on LAYER metal4 = 7269 um.
#Total wire length on LAYER metal5 = 1375 um.
#Total wire length on LAYER metal6 = 441 um.
#Total wire length on LAYER metal7 = 0 um.
#Total wire length on LAYER metal8 = 0 um.
#Total wire length on LAYER metal9 = 0 um.
#Total wire length on LAYER metal10 = 0 um.
#Total number of vias = 7736
#Up-Via Summary (total 7736):
#           
#-----------------------
# metal1           4536
# metal2           2692
# metal3            416
# metal4             68
# metal5             24
#-----------------------
#                  7736 
#
#detailRoute Statistics:
#Cpu time = 00:00:01
#Elapsed time = 00:00:01
#Increased memory = 0.15 (MB)
#Total memory = 974.79 (MB)
#Peak memory = 1069.11 (MB)
#Updating routing design signature
#Created 135 library cell signatures
#Created 1606 NETS and 0 SPECIALNETS signatures
#Created 3791 instance signatures
#Build design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 974.79 (MB), peak = 1069.11 (MB)
#Save design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 974.80 (MB), peak = 1069.11 (MB)
#
#globalDetailRoute statistics:
#Cpu time = 00:00:01
#Elapsed time = 00:00:01
#Increased memory = 0.77 (MB)
#Total memory = 974.30 (MB)
#Peak memory = 1069.11 (MB)
#Number of warnings = 3
#Total number of warnings = 42
#Number of fails = 0
#Total number of fails = 0
#Complete globalDetailRoute on Wed Aug 19 18:29:29 2020
#
**optDesign ... cpu = 0:00:09, real = 0:00:10, mem = 974.3M, totSessionCpu=0:06:34 **
-routeWithEco false                       # bool, default=false
-routeSelectedNetOnly false               # bool, default=false
-routeWithTimingDriven false              # bool, default=false, user setting
-routeWithSiDriven false                  # bool, default=false, user setting
Extraction called for design 'SUM' of instances=3791 and nets=1606 using extraction engine 'postRoute' at effort level 'low' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PostRoute (effortLevel low) RC Extraction called for design SUM.
RC Extraction called in multi-corner(1) mode.
Process corner(s) are loaded.
 Corner: standard
extractDetailRC Option : -outfile /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d -maxResLength 200  -extended
RC Mode: PostRoute -effortLevel low [Extended CapTable, RC Table Resistances]
      RC Corner Indexes            0   
Capacitance Scaling Factor   : 1.00000 
Coupling Cap. Scaling Factor : 1.00000 
Resistance Scaling Factor    : 1.00000 
Clock Cap. Scaling Factor    : 1.00000 
Clock Res. Scaling Factor    : 1.00000 
Shrink Factor                : 1.00000
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1207.4M)
Extracted 10.0078% (CPU Time= 0:00:00.1  MEM= 1243.4M)
Extracted 20.0101% (CPU Time= 0:00:00.1  MEM= 1268.4M)
Extracted 30.0067% (CPU Time= 0:00:00.1  MEM= 1268.4M)
Extracted 40.009% (CPU Time= 0:00:00.1  MEM= 1268.4M)
Extracted 50.0112% (CPU Time= 0:00:00.1  MEM= 1268.4M)
Extracted 60.0078% (CPU Time= 0:00:00.1  MEM= 1268.4M)
Extracted 70.0101% (CPU Time= 0:00:00.2  MEM= 1268.4M)
Extracted 80.0067% (CPU Time= 0:00:00.2  MEM= 1268.4M)
Extracted 90.009% (CPU Time= 0:00:00.2  MEM= 1268.4M)
Extracted 100% (CPU Time= 0:00:00.3  MEM= 1268.4M)
Number of Extracted Resistors     : 25612
Number of Extracted Ground Cap.   : 27216
Number of Extracted Coupling Cap. : 46936
Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
 Corner: standard
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1245.4M)
PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.4  Real Time: 0:00:00.0  MEM: 1253.406M)
**optDesign ... cpu = 0:00:10, real = 0:00:10, mem = 941.7M, totSessionCpu=0:06:34 **
Starting SI iteration 1 using Infinite Timing Windows
Begin IPO call back ...
End IPO call back ...
#################################################################################
# Design Stage: PostRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI On 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate early delays in OCV mode...
Calculate late delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=1197.43)
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
AAE_INFO: 1 threads acquired from CTE.
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
End delay calculation. (MEM=1282.35 CPU=0:00:01.1 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=1282.35 CPU=0:00:01.4 REAL=0:00:01.0)
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1282.3M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1282.3M)
Starting SI iteration 2
AAE_INFO: 1 threads acquired from CTE.
Calculate early delays in OCV mode...
Calculate late delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=1290.39)
Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
Glitch Analysis: View default -- Total Number of Nets Analyzed = 1990. 
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  1.6 percent of the nets selected for SI analysis
End delay calculation. (MEM=1258.39 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=1258.39 CPU=0:00:00.1 REAL=0:00:00.0)
*** Done Building Timing Graph (cpu=0:00:02.7 real=0:00:03.0 totSessionCpu=0:06:37 mem=1258.4M)
**optDesign ... cpu = 0:00:12, real = 0:00:13, mem = 976.4M, totSessionCpu=0:06:37 **
Executing marking Critical Nets1
Footprint XOR2_X1 has at least 2 pins...
Footprint XNOR2_X1 has at least 3 pins...
Footprint TLAT_X1 has at least 4 pins...
Footprint SDFF_X1 has at least 5 pins...
*** Number of Vt Cells Partition = 1
Running postRoute recovery in postEcoRoute mode
**optDesign ... cpu = 0:00:12, real = 0:00:13, mem = 976.4M, totSessionCpu=0:06:37 **
Checking setup slack degradation ...
Checking DRV degradation...
**INFO: Skipping DRV recovery as drv did not degrade beyond margin
*** Finish postRoute recovery in postEcoRoute mode (cpu=0:00:00, real=0:00:00, mem=1193.62M, totSessionCpu=0:06:37).
**optDesign ... cpu = 0:00:12, real = 0:00:13, mem = 976.6M, totSessionCpu=0:06:37 **

Latch borrow mode reset to max_borrow
Reported timing to dir ./timingReports
**optDesign ... cpu = 0:00:13, real = 0:00:13, mem = 976.6M, totSessionCpu=0:06:37 **

------------------------------------------------------------
     optDesign Final SI Timing Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
**optDesign ... cpu = 0:00:14, real = 0:00:15, mem = 976.7M, totSessionCpu=0:06:39 **
 ReSet Options after AAE Based Opt flow 
Opt: RC extraction mode changed to 'detail'
*** Finished optDesign ***
Info: Destroy the CCOpt slew target map.
<CMD> optDesign -postRoute -hold
**INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
Disable merging buffers from different footprints for postRoute code for non-MSV designs
GigaOpt running with 1 threads.
**optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 978.6M, totSessionCpu=0:06:40 **
#Created 135 library cell signatures
#Created 1606 NETS and 0 SPECIALNETS signatures
#Created 3791 instance signatures
#Build design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 978.61 (MB), peak = 1069.11 (MB)
#Save design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 978.80 (MB), peak = 1069.11 (MB)
Begin checking placement ... (start mem=1209.6M, init mem=1209.6M)
*info: Placed = 3791          
*info: Unplaced = 0           
Placement Density:100.00%(4711/4711)
Placement Density (including fixed std cells):100.00%(4711/4711)
Finished checkPlace (cpu: total=0:00:00.0, vio checks=0:00:00.0; mem=1209.6M)
 Initial DC engine is -> aae
 
 AAE-Opt:: Current number of nets in RC Memory -> 100 K
 
 
 AAE-Opt:: New number of nets in RC Memory -> 100 K
 
Reset EOS DB
Ignoring AAE DB Resetting ...
 Set Options for AAE Based Opt flow 
*** optDesign -postRoute ***
DRC Margin: user margin 0.0; extra margin 0
Setup Target Slack: user slack 0
Hold Target Slack: user slack 0
** INFO : this run is activating 'postRoute' automaton
Extraction called for design 'SUM' of instances=3791 and nets=1606 using extraction engine 'postRoute' at effort level 'low' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PostRoute (effortLevel low) RC Extraction called for design SUM.
RC Extraction called in multi-corner(1) mode.
Process corner(s) are loaded.
 Corner: standard
extractDetailRC Option : -outfile /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d -maxResLength 200  -extended
RC Mode: PostRoute -effortLevel low [Extended CapTable, RC Table Resistances]
      RC Corner Indexes            0   
Capacitance Scaling Factor   : 1.00000 
Coupling Cap. Scaling Factor : 1.00000 
Resistance Scaling Factor    : 1.00000 
Clock Cap. Scaling Factor    : 1.00000 
Clock Res. Scaling Factor    : 1.00000 
Shrink Factor                : 1.00000
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1201.6M)
Extracted 10.0078% (CPU Time= 0:00:00.1  MEM= 1237.6M)
Extracted 20.0101% (CPU Time= 0:00:00.1  MEM= 1262.6M)
Extracted 30.0067% (CPU Time= 0:00:00.1  MEM= 1262.6M)
Extracted 40.009% (CPU Time= 0:00:00.1  MEM= 1262.6M)
Extracted 50.0112% (CPU Time= 0:00:00.1  MEM= 1262.6M)
Extracted 60.0078% (CPU Time= 0:00:00.2  MEM= 1262.6M)
Extracted 70.0101% (CPU Time= 0:00:00.2  MEM= 1262.6M)
Extracted 80.0067% (CPU Time= 0:00:00.2  MEM= 1262.6M)
Extracted 90.009% (CPU Time= 0:00:00.3  MEM= 1262.6M)
Extracted 100% (CPU Time= 0:00:00.3  MEM= 1262.6M)
Number of Extracted Resistors     : 25612
Number of Extracted Ground Cap.   : 27216
Number of Extracted Coupling Cap. : 46936
Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
 Corner: standard
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1239.6M)
PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.5  Real Time: 0:00:00.0  MEM: 1243.633M)
Unfixed 0 ViaPillar Nets
**ERROR: (IMPOPT-310):	Design density (100.00%) exceeds/equals limit (95.00%).
Unfixed 0 ViaPillar Nets
**ERROR: (IMPOPT-310):	Design density (100.00%) exceeds/equals limit (95.00%).
GigaOpt Hold Optimizer is used
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
Starting initialization (fixHold) cpu=0:00:00.0 real=0:00:00.0 totSessionCpu=0:06:40 mem=1221.4M ***
*info: Run optDesign holdfix with 1 thread.
**INFO: Starting Blocking QThread with 1 CPU
   ____________________________________________________________________
__/ message from Blocking QThread
Starting SI iteration 1 using Infinite Timing Windows
Begin IPO call back ...
End IPO call back ...
#################################################################################
# Design Stage: PostRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI On 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate late delays in OCV mode...
Calculate early delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=0)
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
End delay calculation. (MEM=0 CPU=0:00:01.0 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=0 CPU=0:00:01.3 REAL=0:00:01.0)
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 0.0M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 0.0M)

Executing IPO callback for view pruning ..
Starting SI iteration 2
AAE_INFO: 1 threads acquired from CTE.
Calculate late delays in OCV mode...
Calculate early delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=0)
Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
Glitch Analysis: View default -- Total Number of Nets Analyzed = 0. 
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  10.7 percent of the nets selected for SI analysis
End delay calculation. (MEM=0 CPU=0:00:00.2 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=0 CPU=0:00:00.2 REAL=0:00:00.0)
*** Done Building Timing Graph (cpu=0:00:02.6 real=0:00:03.0 totSessionCpu=0:00:05.7 mem=0.0M)
Done building cte hold timing graph (fixHold) cpu=0:00:02.7 real=0:00:03.0 totSessionCpu=0:00:05.7 mem=0.0M ***
Done building hold timer [3545 node(s), 4102 edge(s), 1 view(s)] (fixHold) cpu=0:00:03.0 real=0:00:03.0 totSessionCpu=0:00:06.0 mem=0.0M ***
Timing Data dump into file /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/coe_eosdata_hgEHde/default.twf, for view: default 
	 Dumping view 0 default 

_______________________________________________________________________
Starting SI iteration 1 using Infinite Timing Windows
Begin IPO call back ...
End IPO call back ...
#################################################################################
# Design Stage: PostRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI On 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate early delays in OCV mode...
Calculate late delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=1441.05)
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
End delay calculation. (MEM=1530.44 CPU=0:00:01.1 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=1530.44 CPU=0:00:01.3 REAL=0:00:01.0)
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1530.4M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1530.4M)

Executing IPO callback for view pruning ..
Starting SI iteration 2
AAE_INFO: 1 threads acquired from CTE.
Calculate early delays in OCV mode...
Calculate late delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=1538.48)
Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
Glitch Analysis: View default -- Total Number of Nets Analyzed = 1990. 
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  1.6 percent of the nets selected for SI analysis
End delay calculation. (MEM=1506.48 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=1506.48 CPU=0:00:00.1 REAL=0:00:00.0)
*** Done Building Timing Graph (cpu=0:00:02.4 real=0:00:03.0 totSessionCpu=0:06:46 mem=1506.5M)
Done building cte setup timing graph (fixHold) cpu=0:00:06.1 real=0:00:07.0 totSessionCpu=0:06:47 mem=1506.5M ***
Setting latch borrow mode to budget during optimization.
Loading timing data from /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/coe_eosdata_hgEHde/default.twf 
	 Loading view 0 default 

------------------------------------------------------------
             Initial Summary                             
------------------------------------------------------------

Setup views included:
 default
Hold  views included:
 default

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+--------------------+---------+---------+---------+
|     Hold mode      |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):| -0.001  |  0.107  | -0.001  |
|           TNS (ns):| -0.001  |  0.000  | -0.001  |
|    Violating Paths:|    2    |    0    |    2    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
------------------------------------------------------------

*Info: minBufDelay = 21.9 ps, libStdDelay = 10.1 ps, minBufSize = 3192000 (3.0)
*Info: worst delay setup view: default
**optDesign ... cpu = 0:00:08, real = 0:00:09, mem = 1072.7M, totSessionCpu=0:06:48 **
Info: 1 clock net  excluded from IPO operation.

*** Starting Core Fixing (fixHold) cpu=0:00:07.3 real=0:00:08.0 totSessionCpu=0:06:48 mem=1440.6M density=100.000% ***

Phase I ......
Executing transform: ECO Safe Resize
+-----------------------------------------------------------------------------------------------+
|Iter|  WNS   |  TNS    |  #VP   |  #Buffer  |  #Resize(F/F)  | Density  | Real Time  |   Mem   |
+-----------------------------------------------------------------------------------------------+
**Info: Stopping hold fixing due to density exceeding max design density 95.000%
|   0|  -0.001|    -0.00|       2|          0|       0(     0)|   100.00%|   0:00:08.0|  1440.6M|
+-----------------------------------------------------------------------------------------------+
Executing transform: AddBuffer + LegalResize
+-----------------------------------------------------------------------------------------------+
|Iter|  WNS   |  TNS    |  #VP   |  #Buffer  |  #Resize(F/F)  | Density  | Real Time  |   Mem   |
+-----------------------------------------------------------------------------------------------+
**Info: Stopping hold fixing due to density exceeding max design density 95.000%
|   0|  -0.001|    -0.00|       2|          0|       0(     0)|   100.00%|   0:00:08.0|  1440.6M|
+-----------------------------------------------------------------------------------------------+


=======================================================================
                Reasons for remaining hold violations
=======================================================================
*info: Total 9 net(s) have violated hold timing slacks.

Buffering failure reasons
------------------------------------------------

Resizing failure reasons
------------------------------------------------


*** Finished Core Fixing (fixHold) cpu=0:00:07.4 real=0:00:08.0 totSessionCpu=0:06:48 mem=1440.6M density=100.000% ***


*** Finish Post Route Hold Fixing (cpu=0:00:07.4 real=0:00:08.0 totSessionCpu=0:06:48 mem=1440.6M density=100.000%) ***
Latch borrow mode reset to max_borrow
Reported timing to dir ./timingReports
**optDesign ... cpu = 0:00:08, real = 0:00:09, mem = 1066.7M, totSessionCpu=0:06:48 **
**INFO: Starting Blocking QThread with 1 CPU
   ____________________________________________________________________
__/ message from Blocking QThread
Starting SI iteration 1 using Infinite Timing Windows
Begin IPO call back ...
End IPO call back ...
#################################################################################
# Design Stage: PostRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI On 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate late delays in OCV mode...
Calculate early delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=0)
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
End delay calculation. (MEM=0 CPU=0:00:01.0 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=0 CPU=0:00:01.3 REAL=0:00:01.0)
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 0.0M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 0.0M)
Starting SI iteration 2
AAE_INFO: 1 threads acquired from CTE.
Calculate late delays in OCV mode...
Calculate early delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=0)
Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
Glitch Analysis: View default -- Total Number of Nets Analyzed = 0. 
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  10.7 percent of the nets selected for SI analysis
End delay calculation. (MEM=0 CPU=0:00:00.2 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=0 CPU=0:00:00.2 REAL=0:00:00.0)
*** Done Building Timing Graph (cpu=0:00:02.5 real=0:00:02.0 totSessionCpu=0:00:07.7 mem=0.0M)

_______________________________________________________________________

------------------------------------------------------------
     optDesign Final SI Timing Summary                             
------------------------------------------------------------

Setup views included:
 default 
Hold  views included:
 default

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+--------------------+---------+---------+---------+
|     Hold mode      |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):| -0.001  |  0.107  | -0.001  |
|           TNS (ns):| -0.001  |  0.000  | -0.001  |
|    Violating Paths:|    2    |    0    |    2    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
**optDesign ... cpu = 0:00:12, real = 0:00:14, mem = 1061.0M, totSessionCpu=0:06:52 **
 ReSet Options after AAE Based Opt flow 
*** Finished optDesign ***
Info: Destroy the CCOpt slew target map.
<CMD> saveDesign SUM_saved
The in-memory database contained RC information but was not saved. To save 
the RC information, use saveDesign's -rc option. Note: Saving RC information can be quite large, 
so it should only be saved when it is really desired.
#% Begin save design ... (date=08/19 18:30:37, mem=1061.9M)
% Begin Save netlist data ... (date=08/19 18:30:38, mem=1062.5M)
Writing Binary DB to SUM_saved.dat/SUM.v.bin in single-threaded mode...
% End Save netlist data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1062.6M, current mem=1062.6M)
% Begin Save AAE data ... (date=08/19 18:30:38, mem=1062.6M)
Saving AAE Data ...
% End Save AAE data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1062.6M, current mem=1062.6M)
% Begin Save clock tree data ... (date=08/19 18:30:38, mem=1062.8M)
% End Save clock tree data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1062.8M, current mem=1062.8M)
Saving preference file SUM_saved.dat/gui.pref.tcl ...
Saving mode setting ...
Saving global file ...
% Begin Save floorplan data ... (date=08/19 18:30:38, mem=1063.0M)
Saving floorplan file ...
% End Save floorplan data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1063.1M, current mem=1063.1M)
Saving Drc markers ...
... No Drc file written since there is no markers found.
% Begin Save placement data ... (date=08/19 18:30:38, mem=1063.1M)
** Saving stdCellPlacement_binary (version# 1) ...
% End Save placement data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1063.1M, current mem=1063.1M)
% Begin Save routing data ... (date=08/19 18:30:38, mem=1063.1M)
Saving route file ...
*** Completed saveRoute (cpu=0:00:00.0 real=0:00:00.0 mem=1307.0M) ***
% End Save routing data ... (date=08/19 18:30:38, total cpu=0:00:00.1, real=0:00:00.0, peak res=1064.1M, current mem=1064.1M)
Saving property file SUM_saved.dat/SUM.prop
*** Completed saveProperty (cpu=0:00:00.0 real=0:00:00.0 mem=1307.0M) ***
#Saving pin access info...
#
% Begin Save power constraints data ... (date=08/19 18:30:38, mem=1066.3M)
% End Save power constraints data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1066.4M, current mem=1066.4M)
high standard low
Generated self-contained design SUM_saved.dat
#% End save design ... (date=08/19 18:30:38, total cpu=0:00:00.7, real=0:00:01.0, peak res=1066.4M, current mem=982.4M)
*** Message Summary: 0 warning(s), 0 error(s)

worst best default
coherent-synthesis
SUM.sdc
std-typ lt-bc ht-wc
libsBC libsWC libsTYP
high standard low
<CMD> set_analysis_view -setup {default} -hold {default}
The system is switching to MMMC mode. Existing timing, extraction and delay/sdf information from single mode will be reset. Please respecify spef for specific RC corners and/or sdf information for specific views.
Extraction setup Started 
Initializing multi-corner RC extraction with 1 active RC Corners ...
Reading Capacitance Table File /software/dk/nangate45/lef/captables/NCSU_FreePDK_45nm.capTbl ...
Cap table was created using Encounter 08.10-p004_1.
Process name: master_techFreePDK45.
Importing multi-corner RC tables ... 
Summary of Active RC-Corners : 
 
 Analysis View: default
    RC-Corner Name        : standard
    RC-Corner Index       : 0
    RC-Corner Temperature : 300 Celsius
    RC-Corner Cap Table   : '/software/dk/nangate45/lef/captables/NCSU_FreePDK_45nm.capTbl'
    RC-Corner PreRoute Res Factor         : 1
    RC-Corner PreRoute Cap Factor         : 1
    RC-Corner PostRoute Res Factor        : 1 {1 1 1}
    RC-Corner PostRoute Cap Factor        : 1 {1 1 1}
    RC-Corner PostRoute XCap Factor       : 1 {1 1 1}
    RC-Corner PreRoute Clock Res Factor   : 1	[Derived from postRoute_res (effortLevel low)]
    RC-Corner PreRoute Clock Cap Factor   : 1	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Cap Factor  : 1 {1 1 1} 	[Derived from postRoute_cap (effortLevel low)]
    RC-Corner PostRoute Clock Res Factor  : 1 {1 1 1} 	[Derived from postRoute_res (effortLevel low)]
set_analysis_view/update_rc_corner called to change MMMC setup. RC Corner setup information has remained the same. Therefore, parasitic data in the tool brought as per the previous MMMC setup is being maintained.
Reading timing constraints file 'SUM.sdc' ...
Current (total cpu=0:07:15, real=0:39:18, peak res=1215.7M, current mem=927.9M)
INFO (CTE): Constraints read successfully.
Ending "Constraint file reading stats" (total cpu=0:00:00.1, real=0:00:00.0, peak res=928.2M, current mem=928.2M)
Current (total cpu=0:07:15, real=0:39:18, peak res=1215.7M, current mem=928.2M)
Total number of combinational cells: 99
Total number of sequential cells: 29
Total number of tristate cells: 6
Total number of level shifter cells: 0
Total number of power gating cells: 0
Total number of isolation cells: 0
Total number of power switch cells: 0
Total number of pulse generator cells: 0
Total number of always on buffers: 0
Total number of retention cells: 0
List of usable buffers: BUF_X1 BUF_X2 BUF_X4 BUF_X8 BUF_X16 BUF_X32 CLKBUF_X1 CLKBUF_X2 CLKBUF_X3
Total number of usable buffers: 9
List of unusable buffers:
Total number of unusable buffers: 0
List of usable inverters: INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32
Total number of usable inverters: 6
List of unusable inverters:
Total number of unusable inverters: 0
List of identified usable delay cells:
Total number of identified usable delay cells: 0
List of identified unusable delay cells:
Total number of identified unusable delay cells: 0
No delay cells were detected in the set of buffers. Buffers will be used to fix hold violations.
high standard low
<CMD> reset_parasitics
Performing RC Extraction ...
<CMD> extractRC
Extraction called for design 'SUM' of instances=3791 and nets=1606 using extraction engine 'postRoute' at effort level 'low' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PostRoute (effortLevel low) RC Extraction called for design SUM.
RC Extraction called in multi-corner(1) mode.
Process corner(s) are loaded.
 Corner: standard
extractDetailRC Option : -outfile /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d -maxResLength 200  -extended
RC Mode: PostRoute -effortLevel low [Extended CapTable, RC Table Resistances]
      RC Corner Indexes            0   
Capacitance Scaling Factor   : 1.00000 
Coupling Cap. Scaling Factor : 1.00000 
Resistance Scaling Factor    : 1.00000 
Clock Cap. Scaling Factor    : 1.00000 
Clock Res. Scaling Factor    : 1.00000 
Shrink Factor                : 1.00000
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1164.3M)
Extracted 10.0078% (CPU Time= 0:00:00.1  MEM= 1180.9M)
Extracted 20.0101% (CPU Time= 0:00:00.1  MEM= 1204.9M)
Extracted 30.0067% (CPU Time= 0:00:00.1  MEM= 1204.9M)
Extracted 40.009% (CPU Time= 0:00:00.1  MEM= 1204.9M)
Extracted 50.0112% (CPU Time= 0:00:00.1  MEM= 1204.9M)
Extracted 60.0078% (CPU Time= 0:00:00.1  MEM= 1204.9M)
Extracted 70.0101% (CPU Time= 0:00:00.1  MEM= 1204.9M)
Extracted 80.0067% (CPU Time= 0:00:00.2  MEM= 1204.9M)
Extracted 90.009% (CPU Time= 0:00:00.2  MEM= 1204.9M)
Extracted 100% (CPU Time= 0:00:00.3  MEM= 1204.9M)
Number of Extracted Resistors     : 25612
Number of Extracted Ground Cap.   : 27216
Number of Extracted Coupling Cap. : 46936
Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
 Corner: standard
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1188.9M)
PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.4  Real Time: 0:00:00.0  MEM: 1192.891M)
<CMD> redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
<CMD> timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix SUM_postRoute -outDir timingReports
 Reset EOS DB
Ignoring AAE DB Resetting ...
Extraction called for design 'SUM' of instances=3791 and nets=1606 using extraction engine 'postRoute' at effort level 'low' .
**WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
Type 'man IMPEXT-3530' for more detail.
PostRoute (effortLevel low) RC Extraction called for design SUM.
RC Extraction called in multi-corner(1) mode.
Process corner(s) are loaded.
 Corner: standard
extractDetailRC Option : -outfile /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d -maxResLength 200  -extended
RC Mode: PostRoute -effortLevel low [Extended CapTable, RC Table Resistances]
      RC Corner Indexes            0   
Capacitance Scaling Factor   : 1.00000 
Coupling Cap. Scaling Factor : 1.00000 
Resistance Scaling Factor    : 1.00000 
Clock Cap. Scaling Factor    : 1.00000 
Clock Res. Scaling Factor    : 1.00000 
Shrink Factor                : 1.00000
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1164.8M)
Extracted 10.0078% (CPU Time= 0:00:00.1  MEM= 1179.9M)
Extracted 20.0101% (CPU Time= 0:00:00.1  MEM= 1203.9M)
Extracted 30.0067% (CPU Time= 0:00:00.1  MEM= 1203.9M)
Extracted 40.009% (CPU Time= 0:00:00.1  MEM= 1203.9M)
Extracted 50.0112% (CPU Time= 0:00:00.1  MEM= 1203.9M)
Extracted 60.0078% (CPU Time= 0:00:00.2  MEM= 1203.9M)
Extracted 70.0101% (CPU Time= 0:00:00.2  MEM= 1203.9M)
Extracted 80.0067% (CPU Time= 0:00:00.2  MEM= 1203.9M)
Extracted 90.009% (CPU Time= 0:00:00.3  MEM= 1203.9M)
Extracted 100% (CPU Time= 0:00:00.3  MEM= 1203.9M)
Number of Extracted Resistors     : 25612
Number of Extracted Ground Cap.   : 27216
Number of Extracted Coupling Cap. : 46936
Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
 Corner: standard
Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1188.9M)
PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.5  Real Time: 0:00:00.0  MEM: 1192.891M)
AAE DB initialization (MEM=1224.22 CPU=0:00:00.1 REAL=0:00:00.0) 
Starting SI iteration 1 using Infinite Timing Windows
Begin IPO call back ...
End IPO call back ...
#################################################################################
# Design Stage: PostRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI On 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Calculate early delays in OCV mode...
Calculate late delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=1224.22)
Initializing multi-corner capacitance tables ... 
Initializing multi-corner resistance tables ...
AAE_INFO: 1 threads acquired from CTE.
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
End delay calculation. (MEM=1499.88 CPU=0:00:01.1 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=1402.51 CPU=0:00:01.6 REAL=0:00:02.0)
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1402.5M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1402.5M)
Starting SI iteration 2
AAE_INFO: 1 threads acquired from CTE.
Calculate early delays in OCV mode...
Calculate late delays in OCV mode...
Start delay calculation (fullDC) (1 T). (MEM=1410.55)
Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
Glitch Analysis: View default -- Total Number of Nets Analyzed = 1990. 
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  1.6 percent of the nets selected for SI analysis
End delay calculation. (MEM=1378.55 CPU=0:00:00.1 REAL=0:00:00.0)
End delay calculation (fullDC). (MEM=1378.55 CPU=0:00:00.2 REAL=0:00:00.0)

------------------------------------------------------------
          timeDesign Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
Reported timing to dir timingReports
Total CPU time: 5.19 sec
Total Real time: 5.0 sec
Total Memory Usage: 1311.777344 Mbytes
Reset AAE Options
<CMD> get_time_unit
<CMD> report_timing -machine_readable -max_paths 10000 -max_slack 0.75 -path_exceptions all > top.mtarpt
<CMD> load_timing_debug_report -name default_report top.mtarpt
Parsing file top.mtarpt...
<CMD> verifyConnectivity -type all -error 1000 -warning 50
VERIFY_CONNECTIVITY use new engine.

******** Start: VERIFY CONNECTIVITY ********
Start Time: Wed Aug 19 18:34:20 2020

Design Name: SUM
Database Units: 2000
Design Boundary: (0.0000, 0.0000) (80.3700, 77.2800)
Error Limit = 1000; Warning Limit = 50
Check all nets

Begin Summary 
  Found no problems or warnings.
End Summary

End Time: Wed Aug 19 18:34:20 2020
Time Elapsed: 0:00:00.0

******** End: VERIFY CONNECTIVITY ********
  Verification Complete : 0 Viols.  0 Wrngs.
  (CPU Time: 0:00:00.1  MEM: 0.000M)

<CMD> setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
<CMD> verifyGeometry
 *** Starting Verify Geometry (MEM: 1321.8) ***

**WARN: (IMPVFG-257):	verifyGeometry command is replaced by verify_drc command. It still works in this release but will be removed in future release. Please update your script to use the new command.
  VERIFY GEOMETRY ...... Starting Verification
  VERIFY GEOMETRY ...... Initializing
  VERIFY GEOMETRY ...... Deleting Existing Violations
  VERIFY GEOMETRY ...... Creating Sub-Areas
                  ...... bin size: 2160
**WARN: (IMPVFG-47):	This warning message means the PG pin of macro/macros is not connected to relevant PG net in the design. If we query the particular PG pin 'net:NULL' will be displayed in the Innovus GUI.

VG: elapsed time: 1.00
Begin Summary ...
  Cells       : 0
  SameNet     : 0
  Wiring      : 0
  Antenna     : 0
  Short       : 0
  Overlap     : 0
End Summary

  Verification Complete : 0 Viols.  0 Wrngs.

**********End: VERIFY GEOMETRY**********
 *** verify geometry (CPU: 0:00:01.0  MEM: 126.4M)

<CMD> setVerifyGeometryMode -area { 0 0 0 0 }
<CMD> get_verify_drc_mode -disable_rules -quiet
<CMD> get_verify_drc_mode -quiet -area
<CMD> get_verify_drc_mode -quiet -layer_range
<CMD> get_verify_drc_mode -check_implant -quiet
<CMD> get_verify_drc_mode -check_implant_across_rows -quiet
<CMD> get_verify_drc_mode -check_ndr_spacing -quiet
<CMD> get_verify_drc_mode -check_only -quiet
<CMD> get_verify_drc_mode -check_same_via_cell -quiet
<CMD> get_verify_drc_mode -exclude_pg_net -quiet
<CMD> get_verify_drc_mode -ignore_trial_route -quiet
<CMD> get_verify_drc_mode -max_wrong_way_halo -quiet
<CMD> get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
<CMD> get_verify_drc_mode -limit -quiet
<CMD> set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report SUM.drc.rpt -limit 1000
<CMD> verify_drc
#-report SUM.drc.rpt                     # string, default="", user setting
 *** Starting Verify DRC (MEM: 1448.2) ***

  VERIFY DRC ...... Starting Verification
  VERIFY DRC ...... Initializing
  VERIFY DRC ...... Deleting Existing Violations
  VERIFY DRC ...... Creating Sub-Areas
  VERIFY DRC ...... Using new threading
  VERIFY DRC ...... Sub-Area: {0.000 0.000 80.370 77.280} 1 of 1
  VERIFY DRC ...... Sub-Area : 1 complete 49 Viols.

  Verification Complete : 49 Viols.

 *** End Verify DRC (CPU: 0:00:00.5  ELAPSED TIME: 0.00  MEM: 0.0M) ***

<CMD> set_verify_drc_mode -area {0 0 0 0}
<CMD> get_verify_drc_mode -disable_rules -quiet
<CMD> get_verify_drc_mode -quiet -area
<CMD> get_verify_drc_mode -quiet -layer_range
<CMD> get_verify_drc_mode -check_implant -quiet
<CMD> get_verify_drc_mode -check_implant_across_rows -quiet
<CMD> get_verify_drc_mode -check_ndr_spacing -quiet
<CMD> get_verify_drc_mode -check_only -quiet
<CMD> get_verify_drc_mode -check_same_via_cell -quiet
<CMD> get_verify_drc_mode -exclude_pg_net -quiet
<CMD> get_verify_drc_mode -ignore_trial_route -quiet
<CMD> get_verify_drc_mode -max_wrong_way_halo -quiet
<CMD> get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
<CMD> get_verify_drc_mode -limit -quiet
<CMD> zoomBox 108.078 45.590 108.078 46.005
<CMD> panCenter 108.171 45.934
<CMD> panCenter 108.264 46.071
<CMD> zoomSelected
<CMD> zoomSelected
<CMD> gui_select -rect {108.065 46.179 108.167 46.111}
<CMD> zoomOut
<CMD> zoomOut
<CMD> zoomIn
<CMD> panCenter 107.639 45.896
<CMD> panCenter 107.014 45.721
<CMD> reportGateCount -level 5 -limit 100 -outfile SUM.gateCount
Gate area 0.7980 um^2
[0] SUM Gates=3776 Cells=1345 Area=3013.2 um^2
[1] maprca Gates=927 Cells=687 Area=740.0 um^2
<CMD> saveNetlist SUM.v
Writing Netlist "SUM.v" ...
<CMD> all_hold_analysis_views 
<CMD> all_setup_analysis_views 
<CMD> write_sdf  -ideal_clock_network SUM.sdf
**WARN: (SDF-808):	The software is currently operating in a high performance mode which optimizes the handling of multiple timing arcs between input and output pin pairs. With the current settings, the SDF file generated will contain the same delay information for all of these arcs. To have the SDF recalculated with explicit pin pair data, you should use the option '-recompute_parallel_arcs'. This setting is recommended for generating SDF for functional  simulation applications.
Starting SI iteration 1 using Infinite Timing Windows
#################################################################################
# Design Stage: PostRoute
# Design Name: SUM
# Design Mode: 90nm
# Analysis Mode: MMMC OCV 
# Parasitics Mode: SPEF/RCDB
# Signoff Settings: SI On 
#################################################################################
AAE_INFO: 1 threads acquired from CTE.
Start delay calculation (fullDC) (1 T). (MEM=1424)
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
End delay calculation. (MEM=1483.15 CPU=0:00:01.0 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=1483.15 CPU=0:00:01.2 REAL=0:00:01.0)
Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1483.1M)
Add other clocks and setupCteToAAEClockMapping during iter 1
Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1483.1M)
Starting SI iteration 2
AAE_INFO: 1 threads acquired from CTE.
Start delay calculation (fullDC) (1 T). (MEM=1483.15)
Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
Glitch Analysis: View default -- Total Number of Nets Analyzed = 1990. 
Total number of fetched objects 1990
AAE_INFO-618: Total number of nets in the design is 1606,  10.8 percent of the nets selected for SI analysis
End delay calculation. (MEM=1451.14 CPU=0:00:00.2 REAL=0:00:01.0)
End delay calculation (fullDC). (MEM=1451.14 CPU=0:00:00.2 REAL=0:00:01.0)

Cadence Innovus(TM) Implementation System.
Copyright 2017 Cadence Design Systems, Inc. All rights reserved worldwide.

Version:	v17.11-s080_1, built Fri Aug 4 11:13:11 PDT 2017
Options:	help 
Date:		Wed Aug 19 17:53:28 2020
Host:		localhost.localdomain (x86_64 w/Linux 3.10.0-1062.12.1.el7.x86_64) (1core*8cpus*Westmere E56xx/L56xx/X56xx (Nehalem-C) 4096KB)
OS:		CentOS Linux release 7.7.1908 (Core)

License:
**ERROR: (IMPLIC-68):	Unknown argument: help.
	Run "innovus -help" for valid option/argument.
[08/19 17:52:46      0s] 
[08/19 17:52:46      0s] Cadence Innovus(TM) Implementation System.
[08/19 17:52:46      0s] Copyright 2017 Cadence Design Systems, Inc. All rights reserved worldwide.
[08/19 17:52:46      0s] 
[08/19 17:52:46      0s] Version:	v17.11-s080_1, built Fri Aug 4 11:13:11 PDT 2017
[08/19 17:52:46      0s] Options:	
[08/19 17:52:46      0s] Date:		Wed Aug 19 17:52:46 2020
[08/19 17:52:46      0s] Host:		localhost.localdomain (x86_64 w/Linux 3.10.0-1062.12.1.el7.x86_64) (1core*8cpus*Westmere E56xx/L56xx/X56xx (Nehalem-C) 4096KB)
[08/19 17:52:46      0s] OS:		CentOS Linux release 7.7.1908 (Core)
[08/19 17:52:46      0s] 
[08/19 17:52:46      0s] License:
[08/19 17:52:46      0s] 		invs	Innovus Implementation System	17.1	checkout succeeded
[08/19 17:52:46      0s] 		8 CPU jobs allowed with the current license(s). Use setMultiCpuUsage to set your required CPU count.
[08/19 17:53:13     20s] @(#)CDS: Innovus v17.11-s080_1 (64bit) 08/04/2017 11:13 (Linux 2.6.18-194.el5)
[08/19 17:53:13     20s] @(#)CDS: NanoRoute 17.11-s080_1 NR170721-2155/17_11-UB (database version 2.30, 390.7.1) {superthreading v1.44}
[08/19 17:53:13     20s] @(#)CDS: AAE 17.11-s034 (64bit) 08/04/2017 (Linux 2.6.18-194.el5)
[08/19 17:53:13     20s] @(#)CDS: CTE 17.11-s053_1 () Aug  1 2017 23:31:41 ( )
[08/19 17:53:13     20s] @(#)CDS: SYNTECH 17.11-s012_1 () Jul 21 2017 02:29:12 ( )
[08/19 17:53:13     20s] @(#)CDS: CPE v17.11-s095
[08/19 17:53:13     20s] @(#)CDS: IQRC/TQRC 16.1.1-s215 (64bit) Thu Jul  6 20:18:10 PDT 2017 (Linux 2.6.18-194.el5)
[08/19 17:53:13     20s] @(#)CDS: OA 22.50-p063 Fri Feb  3 19:45:13 2017
[08/19 17:53:13     20s] @(#)CDS: SGN 10.10-p124 (19-Aug-2014) (64 bit executable)
[08/19 17:53:13     20s] @(#)CDS: RCDB 11.10
[08/19 17:53:13     20s] --- Running on localhost.localdomain (x86_64 w/Linux 3.10.0-1062.12.1.el7.x86_64) (1core*8cpus*Westmere E56xx/L56xx/X56xx (Nehalem-C) 4096KB) ---
[08/19 17:53:13     20s] Create and set the environment variable TMPDIR to /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9.

[08/19 17:53:13     20s] Change the soft stacksize limit to 0.2%RAM (96 mbytes). Set global soft_stack_size_limit to change the value.
[08/19 17:53:14     21s] 
[08/19 17:53:14     21s] **INFO:  MMMC transition support version v31-84 
[08/19 17:53:14     21s] 
[08/19 17:53:14     21s] <CMD> set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
[08/19 17:53:14     21s] <CMD> suppressMessage ENCEXT-2799
[08/19 17:53:15     21s] <CMD> getDrawView
[08/19 17:53:15     21s] <CMD> loadWorkspace -name Physical
[08/19 17:53:15     21s] <CMD> win
[08/19 17:56:45     52s] <CMD> set defHierChar /
[08/19 17:56:45     52s] Set Default Input Pin Transition as 0.1 ps.
[08/19 17:56:45     52s] <CMD> set delaycal_input_transition_delay 0.1ps
[08/19 17:56:45     52s] <CMD> set fpIsMaxIoHeight 0
[08/19 17:56:45     52s] <CMD> set init_gnd_net gnd
[08/19 17:56:45     52s] <CMD> set init_mmmc_file Default.view
[08/19 17:56:45     52s] <CMD> set init_oa_search_lib {}
[08/19 17:56:45     52s] <CMD> set init_pwr_net vdd
[08/19 17:56:45     52s] <CMD> set init_verilog sum.v
[08/19 17:56:45     52s] <CMD> set init_lef_file /software/dk/nangate45/lef/NangateOpenCellLibrary.lef
[08/19 17:57:38     59s] <CMD> init_design
[08/19 17:57:38     59s] #% Begin Load MMMC data ... (date=08/19 17:57:38, mem=446.1M)
[08/19 17:57:38     59s] #% End Load MMMC data ... (date=08/19 17:57:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=446.2M, current mem=446.2M)
[08/19 17:57:38     59s] 
[08/19 17:57:38     59s] Loading LEF file /software/dk/nangate45/lef/NangateOpenCellLibrary.lef ...
[08/19 17:57:38     59s] Set DBUPerIGU to M2 pitch 380.
[08/19 17:57:38     60s] 
[08/19 17:57:38     60s] viaInitial starts at Wed Aug 19 17:57:38 2020
viaInitial ends at Wed Aug 19 17:57:38 2020
Loading view definition file from Default.view
[08/19 17:57:38     60s] Reading libsTYP timing library '/software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib' ...
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND2_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND2_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND2_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND3_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND3_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND3_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND4_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND4_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AND4_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI21_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI21_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI21_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI22_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI22_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI22_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI211_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI211_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI211_X4' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI221_X1' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] **WARN: (TECHLIB-436):	Attribute 'max_fanout' on 'output/inout' pin 'ZN' of cell 'AOI221_X2' is not defined in the library. (File /software/dk/nangate45/liberty/NangateOpenCellLibrary_typical_ecsm_nowlm.lib)
[08/19 17:57:38     60s] Message <TECHLIB-436> has exceeded the message display limit of '20'. Use 'set_message -no_limit -id list_of_msgIDs' to reset the message limit.
[08/19 17:57:40     61s] Read 134 cells in library 'NangateOpenCellLibrary' 
[08/19 17:57:40     61s] *** End library_loading (cpu=0.03min, real=0.03min, mem=17.7M, fe_cpu=1.03min, fe_real=4.90min, fe_mem=524.3M) ***
[08/19 17:57:40     61s] #% Begin Load netlist data ... (date=08/19 17:57:40, mem=541.3M)
[08/19 17:57:40     61s] *** Begin netlist parsing (mem=524.3M) ***
[08/19 17:57:40     61s] Created 134 new cells from 1 timing libraries.
[08/19 17:57:40     61s] Reading netlist ...
[08/19 17:57:40     61s] Backslashed names will retain backslash and a trailing blank character.
[08/19 17:57:40     61s] Reading verilog netlist 'sum.v'
[08/19 17:57:40     62s] 
[08/19 17:57:40     62s] *** Memory Usage v#1 (Current mem = 524.277M, initial mem = 187.684M) ***
[08/19 17:57:40     62s] *** End netlist parsing (cpu=0:00:00.0, real=0:00:00.0, mem=524.3M) ***
[08/19 17:57:40     62s] #% End Load netlist data ... (date=08/19 17:57:40, total cpu=0:00:00.1, real=0:00:00.0, peak res=541.3M, current mem=470.2M)
[08/19 17:57:40     62s] Top level cell is SUM.
[08/19 17:57:40     62s] Hooked 134 DB cells to tlib cells.
[08/19 17:57:40     62s] Starting recursive module instantiation check.
[08/19 17:57:40     62s] No recursion found.
[08/19 17:57:40     62s] Building hierarchical netlist for Cell SUM ...
[08/19 17:57:40     62s] *** Netlist is unique.
[08/19 17:57:40     62s] ** info: there are 264 modules.
[08/19 17:57:40     62s] ** info: there are 1109 stdCell insts.
[08/19 17:57:40     62s] 
[08/19 17:57:40     62s] *** Memory Usage v#1 (Current mem = 556.949M, initial mem = 187.684M) ***
[08/19 17:57:40     62s] Generated pitch 1.68 in metal10 is different from 1.6 defined in technology file in preferred direction.
[08/19 17:57:40     62s] Generated pitch 0.84 in metal8 is different from 0.8 defined in technology file in preferred direction.
[08/19 17:57:40     62s] Generated pitch 0.84 in metal7 is different from 0.8 defined in technology file in preferred direction.
[08/19 17:57:40     62s] Set Default Net Delay as 1000 ps.
[08/19 17:57:40     62s] Set Default Net Load as 0.5 pF. 
[08/19 17:57:40     62s] Set Default Input Pin Transition as 0.1 ps.
[08/19 17:57:41     62s] Extraction setup Delayed 
[08/19 17:57:41     62s] *Info: initialize multi-corner CTS.
[08/19 17:57:41     62s] Reading timing constraints file 'SUM.sdc' ...
[08/19 17:57:41     62s] Current (total cpu=0:01:03, real=0:04:55, peak res=597.8M, current mem=597.8M)
[08/19 17:57:41     62s] INFO (CTE): Constraints read successfully.
[08/19 17:57:41     62s] Ending "Constraint file reading stats" (total cpu=0:00:00.1, real=0:00:00.0, peak res=605.7M, current mem=605.7M)
[08/19 17:57:41     62s] Current (total cpu=0:01:03, real=0:04:55, peak res=605.7M, current mem=605.7M)
[08/19 17:57:41     62s] Creating Cell Server ...(0, 1, 1, 1)
[08/19 17:57:41     62s] Summary for sequential cells identification: 
[08/19 17:57:41     62s]   Identified SBFF number: 16
[08/19 17:57:41     62s]   Identified MBFF number: 0
[08/19 17:57:41     62s]   Identified SB Latch number: 0
[08/19 17:57:41     62s]   Identified MB Latch number: 0
[08/19 17:57:41     62s]   Not identified SBFF number: 0
[08/19 17:57:41     62s]   Not identified MBFF number: 0
[08/19 17:57:41     62s]   Not identified SB Latch number: 0
[08/19 17:57:41     62s]   Not identified MB Latch number: 0
[08/19 17:57:41     62s]   Number of sequential cells which are not FFs: 13
[08/19 17:57:41     62s] Total number of combinational cells: 99
[08/19 17:57:41     62s] Total number of sequential cells: 29
[08/19 17:57:41     62s] Total number of tristate cells: 6
[08/19 17:57:41     62s] Total number of level shifter cells: 0
[08/19 17:57:41     62s] Total number of power gating cells: 0
[08/19 17:57:41     62s] Total number of isolation cells: 0
[08/19 17:57:41     62s] Total number of power switch cells: 0
[08/19 17:57:41     62s] Total number of pulse generator cells: 0
[08/19 17:57:41     62s] Total number of always on buffers: 0
[08/19 17:57:41     62s] Total number of retention cells: 0
[08/19 17:57:41     62s] List of usable buffers: BUF_X1 BUF_X2 BUF_X4 BUF_X8 BUF_X16 BUF_X32 CLKBUF_X1 CLKBUF_X2 CLKBUF_X3
[08/19 17:57:41     62s] Total number of usable buffers: 9
[08/19 17:57:41     62s] List of unusable buffers:
[08/19 17:57:41     62s] Total number of unusable buffers: 0
[08/19 17:57:41     62s] List of usable inverters: INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32
[08/19 17:57:41     62s] Total number of usable inverters: 6
[08/19 17:57:41     62s] List of unusable inverters:
[08/19 17:57:41     62s] Total number of unusable inverters: 0
[08/19 17:57:41     62s] List of identified usable delay cells:
[08/19 17:57:41     62s] Total number of identified usable delay cells: 0
[08/19 17:57:41     62s] List of identified unusable delay cells:
[08/19 17:57:41     62s] Total number of identified unusable delay cells: 0
[08/19 17:57:41     62s] Creating Cell Server, finished. 
[08/19 17:57:41     62s] 
[08/19 17:57:41     62s] No delay cells were detected in the set of buffers. Buffers will be used to fix hold violations.
[08/19 17:57:41     62s] Deleting Cell Server ...
[08/19 17:57:41     62s] Patterns Extraction called explicitly through PreRoutePatternsIfNeeded call 
[08/19 17:57:41     62s] Extraction setup Started 
[08/19 17:57:41     62s] Initializing multi-corner RC extraction with 1 active RC Corners ...
[08/19 17:57:41     62s] Reading Capacitance Table File /software/dk/nangate45/lef/captables/NCSU_FreePDK_45nm.capTbl ...
[08/19 17:57:41     62s] Cap table was created using Encounter 08.10-p004_1.
[08/19 17:57:41     62s] Process name: master_techFreePDK45.
[08/19 17:57:41     62s] Importing multi-corner RC tables ... 
[08/19 17:57:41     62s] Summary of Active RC-Corners : 
[08/19 17:57:41     62s]  
[08/19 17:57:41     62s]  Analysis View: default
[08/19 17:57:41     62s]     RC-Corner Name        : standard
[08/19 17:57:41     62s]     RC-Corner Index       : 0
[08/19 17:57:41     62s]     RC-Corner Temperature : 300 Celsius
[08/19 17:57:41     62s]     RC-Corner Cap Table   : '/software/dk/nangate45/lef/captables/NCSU_FreePDK_45nm.capTbl'
[08/19 17:57:41     62s]     RC-Corner PreRoute Res Factor         : 1
[08/19 17:57:41     62s]     RC-Corner PreRoute Cap Factor         : 1
[08/19 17:57:41     62s]     RC-Corner PostRoute Res Factor        : 1 {1 1 1}
[08/19 17:57:41     62s]     RC-Corner PostRoute Cap Factor        : 1 {1 1 1}
[08/19 17:57:41     62s]     RC-Corner PostRoute XCap Factor       : 1 {1 1 1}
[08/19 17:57:41     62s]     RC-Corner PreRoute Clock Res Factor   : 1	[Derived from postRoute_res (effortLevel low)]
[08/19 17:57:41     62s]     RC-Corner PreRoute Clock Cap Factor   : 1	[Derived from postRoute_cap (effortLevel low)]
[08/19 17:57:41     62s]     RC-Corner PostRoute Clock Cap Factor  : 1 {1 1 1} 	[Derived from postRoute_cap (effortLevel low)]
[08/19 17:57:41     62s]     RC-Corner PostRoute Clock Res Factor  : 1 {1 1 1} 	[Derived from postRoute_res (effortLevel low)]
[08/19 17:57:41     63s] 
[08/19 17:57:41     63s] *** Summary of all messages that are not suppressed in this session:
[08/19 17:57:41     63s] Severity  ID               Count  Summary                                  
[08/19 17:57:41     63s] WARNING   TECHLIB-436         20  Attribute '%s' on '%s' pin '%s' of cell ...
[08/19 17:57:41     63s] *** Message Summary: 20 warning(s), 0 error(s)
[08/19 17:57:41     63s] 
[08/19 17:57:55     65s] <CMD> getIoFlowFlag
[08/19 17:58:56     74s] <CMD> setIoFlowFlag 0
[08/19 17:58:56     74s] <CMD> floorPlan -site FreePDK45_38x28_10R_NP_162NW_34O -r 1 0.6 5 5 5 5
[08/19 17:58:56     74s] Generated pitch 1.68 in metal10 is different from 1.6 defined in technology file in preferred direction.
[08/19 17:58:56     74s] Generated pitch 0.84 in metal8 is different from 0.8 defined in technology file in preferred direction.
[08/19 17:58:56     74s] Generated pitch 0.84 in metal7 is different from 0.8 defined in technology file in preferred direction.
[08/19 17:58:56     74s] **WARN: (IMPFP-325):	Floorplan of the design is resized. All current floorplan objects are automatically derived based on specified new floorplan. This may change blocks, fixed standard cells, existing routes and blockages.
[08/19 17:58:56     74s] <CMD> uiSetTool select
[08/19 17:58:56     74s] <CMD> getIoFlowFlag
[08/19 17:58:56     74s] <CMD> fit
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingOffset 1.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingThreshold 1.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingJogDistance 1.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingLayers {}
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingOffset 1.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingThreshold 1.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingJogDistance 1.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingLayers {}
[08/19 17:59:10     76s] <CMD> set sprCreateIeStripeWidth 10.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeStripeThreshold 1.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeStripeWidth 10.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeStripeThreshold 1.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingOffset 1.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingThreshold 1.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingJogDistance 1.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeRingLayers {}
[08/19 17:59:10     76s] <CMD> set sprCreateIeStripeWidth 10.0
[08/19 17:59:10     76s] <CMD> set sprCreateIeStripeThreshold 1.0
[08/19 17:59:20     78s] <CMD> setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
[08/19 17:59:20     78s] The ring targets are set to core/block ring wires.
[08/19 17:59:20     78s] addRing command will consider rows while creating rings.
[08/19 17:59:20     78s] addRing command will disallow rings to go over rows.
[08/19 17:59:20     78s] addRing command will ignore shorts while creating rings.
[08/19 17:59:20     78s] <CMD> addRing -nets {} -type core_rings -follow core -layer {top metal1 bottom metal1 left metal2 right metal2} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
[08/19 17:59:20     78s] 
[08/19 17:59:20     78s] **ERROR: Error: Invalid net names specified. 
[08/19 18:00:57     91s] <CMD> setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
[08/19 18:00:57     91s] The ring targets are set to core/block ring wires.
[08/19 18:00:57     91s] addRing command will consider rows while creating rings.
[08/19 18:00:57     91s] addRing command will disallow rings to go over rows.
[08/19 18:00:57     91s] addRing command will ignore shorts while creating rings.
[08/19 18:00:57     91s] <CMD> addRing -nets {gnd vdd} -type core_rings -follow core -layer {top metal9 bottom metal9 left metal10 right metal10} -width {top 0.8 bottom 0.8 left 0.8 right 0.8} -spacing {top 0.8 bottom 0.8 left 0.8 right 0.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 1 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
[08/19 18:00:57     91s] 
[08/19 18:00:57     91s] Ring generation is complete.
[08/19 18:00:57     91s] vias are now being generated.
[08/19 18:00:57     91s] addRing created 8 wires.
[08/19 18:00:57     91s] ViaGen created 8 vias, deleted 0 via to avoid violation.
[08/19 18:00:57     91s] +--------+----------------+----------------+
[08/19 18:00:57     91s] |  Layer |     Created    |     Deleted    |
[08/19 18:00:57     91s] +--------+----------------+----------------+
[08/19 18:00:57     91s] | metal9 |        4       |       NA       |
[08/19 18:00:57     91s] |  via9  |        8       |        0       |
[08/19 18:00:57     91s] | metal10|        4       |       NA       |
[08/19 18:00:57     91s] +--------+----------------+----------------+
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingOffset 1.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingThreshold 1.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingJogDistance 1.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingLayers {}
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingOffset 1.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingThreshold 1.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingJogDistance 1.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingLayers {}
[08/19 18:01:13     94s] <CMD> set sprCreateIeStripeWidth 10.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeStripeThreshold 1.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeStripeWidth 10.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeStripeThreshold 1.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingOffset 1.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingThreshold 1.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingJogDistance 1.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeRingLayers {}
[08/19 18:01:13     94s] <CMD> set sprCreateIeStripeWidth 10.0
[08/19 18:01:13     94s] <CMD> set sprCreateIeStripeThreshold 1.0
[08/19 18:03:12    111s] <CMD> setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length 0 -stacked_via_top_layer metal10 -stacked_via_bottom_layer metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring }
[08/19 18:03:12    111s] addStripe will allow jog to connect padcore ring and block ring.
[08/19 18:03:12    111s] Stripes will stop at the boundary of the specified area.
[08/19 18:03:12    111s] When breaking rings, the power planner will consider the existence of blocks.
[08/19 18:03:12    111s] Stripes will not extend to closest target.
[08/19 18:03:12    111s] The power planner will set stripe antenna targets to none (no trimming allowed).
[08/19 18:03:12    111s] Stripes will not be created over regions without power planning wires.
[08/19 18:03:12    111s] The entire stripe set will break at the domain if one of the nets is not in the domain.
[08/19 18:03:12    111s] addStripe will break automatically at non-default domains when generating global stripes over the core area or default domain.
[08/19 18:03:12    111s] AddStripe segment minimum length set to 1
[08/19 18:03:12    111s] Offset for stripe breaking is set to 0.
[08/19 18:03:12    111s] <CMD> addStripe -nets {vdd gnd} -layer metal10 -direction vertical -width 0.8 -spacing 0.8 -set_to_set_distance 20 -start_from left -start_offset 15 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit metal10 -padcore_ring_bottom_layer_limit metal1 -block_ring_top_layer_limit metal10 -block_ring_bottom_layer_limit metal1 -use_wire_group 0 -snap_wire_center_to_grid None -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
[08/19 18:03:12    111s] 
[08/19 18:03:12    111s] Starting stripe generation ...
[08/19 18:03:12    111s] Non-Default Mode Option Settings :
[08/19 18:03:12    111s]   NONE
[08/19 18:03:12    111s] Stripe generation is complete.
[08/19 18:03:12    111s] vias are now being generated.
[08/19 18:03:12    111s] addStripe created 6 wires.
[08/19 18:03:12    111s] ViaGen created 12 vias, deleted 0 via to avoid violation.
[08/19 18:03:12    111s] +--------+----------------+----------------+
[08/19 18:03:12    111s] |  Layer |     Created    |     Deleted    |
[08/19 18:03:12    111s] +--------+----------------+----------------+
[08/19 18:03:12    111s] |  via9  |       12       |        0       |
[08/19 18:03:12    111s] | metal10|        6       |       NA       |
[08/19 18:03:12    111s] +--------+----------------+----------------+
[08/19 18:03:17    112s] <CMD> gui_select -rect {50.198 73.481 75.108 83.413}
[08/19 18:03:21    113s] <CMD> pan 32.232 7.529
[08/19 18:03:58    119s] <CMD> setSrouteMode -viaConnectToShape { noshape }
[08/19 18:03:58    119s] <CMD> sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1(1) metal10(10) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { metal1(1) metal10(10) } -nets { gnd vdd } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { metal1(1) metal10(10) }
[08/19 18:03:58    119s] *** Begin SPECIAL ROUTE on Wed Aug 19 18:03:58 2020 ***
[08/19 18:03:58    119s] SPECIAL ROUTE ran on directory: /home/ms20.50/Desktop/try
[08/19 18:03:58    119s] SPECIAL ROUTE ran on machine: localhost.localdomain (Linux 3.10.0-1062.12.1.el7.x86_64 x86_64 1.99Ghz)
[08/19 18:03:58    119s] 
[08/19 18:03:58    119s] Begin option processing ...
[08/19 18:03:58    119s] srouteConnectPowerBump set to false
[08/19 18:03:58    119s] routeSelectNet set to "gnd vdd"
[08/19 18:03:58    119s] routeSpecial set to true
[08/19 18:03:58    119s] srouteBlockPin set to "useLef"
[08/19 18:03:58    119s] srouteBottomLayerLimit set to 1
[08/19 18:03:58    119s] srouteBottomTargetLayerLimit set to 1
[08/19 18:03:58    119s] srouteConnectConverterPin set to false
[08/19 18:03:58    119s] srouteCrossoverViaBottomLayer set to 1
[08/19 18:03:58    119s] srouteCrossoverViaTopLayer set to 10
[08/19 18:03:58    119s] srouteFloatingStripeTarget set to "blockring padring ring stripe ringpin blockpin followpin"
[08/19 18:03:58    119s] srouteFollowCorePinEnd set to 3
[08/19 18:03:58    119s] srouteJogControl set to "preferWithChanges differentLayer"
[08/19 18:03:58    119s] srouteNoViaOnWireShape set to "padring ring stripe blockring blockpin coverpin blockwire corewire followpin iowire"
[08/19 18:03:58    119s] sroutePadPinAllPorts set to true
[08/19 18:03:58    119s] sroutePreserveExistingRoutes set to true
[08/19 18:03:58    119s] srouteRoutePowerBarPortOnBothDir set to true
[08/19 18:03:58    119s] srouteStopBlockPin set to "nearestTarget"
[08/19 18:03:58    119s] srouteTopLayerLimit set to 10
[08/19 18:03:58    119s] srouteTopTargetLayerLimit set to 10
[08/19 18:03:58    119s] End option processing: cpu: 0:00:00, real: 0:00:00, peak: 1660.00 megs.
[08/19 18:03:58    119s] 
[08/19 18:03:58    119s] Reading DB technology information...
[08/19 18:03:58    119s] Finished reading DB technology information.
[08/19 18:03:58    119s] Reading floorplan and netlist information...
[08/19 18:03:58    119s] Finished reading floorplan and netlist information.
[08/19 18:03:58    119s] Read in 20 layers, 10 routing layers, 1 overlap layer
[08/19 18:03:58    119s] Read in 134 macros, 8 used
[08/19 18:03:58    119s] Read in 8 components
[08/19 18:03:58    119s]   8 core components: 8 unplaced, 0 placed, 0 fixed
[08/19 18:03:58    119s] Read in 388 logical pins
[08/19 18:03:58    119s] Read in 388 nets
[08/19 18:03:58    119s] Read in 2 special nets, 2 routed
[08/19 18:03:58    119s] 2 nets selected.
[08/19 18:03:58    119s] 
[08/19 18:03:58    119s] Begin power routing ...
[08/19 18:03:58    119s] **WARN: (IMPSR-1253):	Cannot find any standard cell pin connected to net vdd.
[08/19 18:03:58    119s] Run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as 'USE POWER' or 'USE GROUND'.
[08/19 18:03:58    119s] **WARN: (IMPSR-1254):	Cannot find any block pin of net vdd. Check netlist, or change option to include the pin.
[08/19 18:03:58    119s] **WARN: (IMPSR-1256):	Cannot find any CORE class pad pin of net vdd. Change routing area or layer to include the expected pin, or check netlist, or change port class in the technology file.
[08/19 18:03:58    119s] Type 'man IMPSR-1256' for more detail.
[08/19 18:03:58    119s] Cannot find any AREAIO class pad pin of net vdd. Check net list, or change port class in the technology file, or change option to include pin in given range.
[08/19 18:03:58    119s] **WARN: (IMPSR-1253):	Cannot find any standard cell pin connected to net gnd.
[08/19 18:03:58    119s] Run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as 'USE POWER' or 'USE GROUND'.
[08/19 18:03:58    119s] **WARN: (IMPSR-1254):	Cannot find any block pin of net gnd. Check netlist, or change option to include the pin.
[08/19 18:03:58    119s] **WARN: (IMPSR-1256):	Cannot find any CORE class pad pin of net gnd. Change routing area or layer to include the expected pin, or check netlist, or change port class in the technology file.
[08/19 18:03:58    119s] Type 'man IMPSR-1256' for more detail.
[08/19 18:03:58    119s] Cannot find any AREAIO class pad pin of net gnd. Check net list, or change port class in the technology file, or change option to include pin in given range.
[08/19 18:03:58    119s] **WARN: (IMPSR-468):	Cannot find any standard cell pin connected to net vdd.
[08/19 18:03:58    119s] Use setSrouteMode -corePinReferenceMacro <standard cell> to specify a reference macro for followpin connection, or run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as "USE POWER" or "USE GROUND".
[08/19 18:03:58    119s] **WARN: (IMPSR-468):	Cannot find any standard cell pin connected to net vdd.
[08/19 18:03:58    119s] Use setSrouteMode -corePinReferenceMacro <standard cell> to specify a reference macro for followpin connection, or run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as "USE POWER" or "USE GROUND".
[08/19 18:03:58    119s] CPU time for FollowPin 0 seconds
[08/19 18:03:58    119s] **WARN: (IMPSR-468):	Cannot find any standard cell pin connected to net gnd.
[08/19 18:03:58    119s] Use setSrouteMode -corePinReferenceMacro <standard cell> to specify a reference macro for followpin connection, or run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as "USE POWER" or "USE GROUND".
[08/19 18:03:58    119s] **WARN: (IMPSR-468):	Cannot find any standard cell pin connected to net gnd.
[08/19 18:03:58    119s] Use setSrouteMode -corePinReferenceMacro <standard cell> to specify a reference macro for followpin connection, or run globalNetConnect command or change CPF file to make sure that the netlist reflects the correct power ground connections. The standard cell pins must be defined as "USE POWER" or "USE GROUND".
[08/19 18:03:58    119s] CPU time for FollowPin 0 seconds
[08/19 18:03:58    119s]   Number of IO ports routed: 0
[08/19 18:03:58    119s]   Number of Block ports routed: 0
[08/19 18:03:58    119s]   Number of Stripe ports routed: 0
[08/19 18:03:58    119s]   Number of Core ports routed: 98
[08/19 18:03:58    119s]   Number of Pad ports routed: 0
[08/19 18:03:58    119s]   Number of Power Bump ports routed: 0
[08/19 18:03:58    119s]   Number of Followpin connections: 49
[08/19 18:03:58    119s] End power routing: cpu: 0:00:00, real: 0:00:00, peak: 1662.00 megs.
[08/19 18:03:58    119s] 
[08/19 18:03:58    119s] 
[08/19 18:03:58    119s] 
[08/19 18:03:58    119s]  Begin updating DB with routing results ...
[08/19 18:03:58    119s]  Updating DB with 0 via definition ...Extracting standard cell pins and blockage ...... 
[08/19 18:03:58    119s] Pin and blockage extraction finished
[08/19 18:03:58    119s] 
[08/19 18:03:58    119s] sroute created 147 wires.
[08/19 18:03:58    119s] ViaGen created 882 vias, deleted 0 via to avoid violation.
[08/19 18:03:58    119s] +--------+----------------+----------------+
[08/19 18:03:58    119s] |  Layer |     Created    |     Deleted    |
[08/19 18:03:58    119s] +--------+----------------+----------------+
[08/19 18:03:58    119s] | metal1 |       147      |       NA       |
[08/19 18:03:58    119s] |  via1  |       98       |        0       |
[08/19 18:03:58    119s] |  via2  |       98       |        0       |
[08/19 18:03:58    119s] |  via3  |       98       |        0       |
[08/19 18:03:58    119s] |  via4  |       98       |        0       |
[08/19 18:03:58    119s] |  via5  |       98       |        0       |
[08/19 18:03:58    119s] |  via6  |       98       |        0       |
[08/19 18:03:58    119s] |  via7  |       98       |        0       |
[08/19 18:03:58    119s] |  via8  |       98       |        0       |
[08/19 18:03:58    119s] |  via9  |       98       |        0       |
[08/19 18:03:58    119s] +--------+----------------+----------------+
[08/19 18:04:00    120s] <CMD> pan 3.176 15.057
[08/19 18:04:01    120s] <CMD> pan -7.176 -19.174
[08/19 18:04:02    120s] <CMD> pan 7.764 17.291
[08/19 18:04:52    127s] <CMD> setPlaceMode -prerouteAsObs {1 2 3 4 5 6 7 8}
[08/19 18:05:40    134s] <CMD> setPlaceMode -fp false
[08/19 18:05:40    134s] <CMD> placeDesign
[08/19 18:05:40    134s] [check_scan_connected]: number of scan connected with missing definition = 0, number of scan = 0, number of sequential = 386, percentage of missing scan cell = 0.00% (0 / 386)
[08/19 18:05:40    135s] *** Starting placeDesign default flow ***
[08/19 18:05:40    135s] *** Start deleteBufferTree ***
[08/19 18:05:40    135s] Info: Detect buffers to remove automatically.
[08/19 18:05:40    135s] Analyzing netlist ...
[08/19 18:05:40    135s] Updating netlist
[08/19 18:05:41    135s] AAE DB initialization (MEM=949.645 CPU=0:00:00.2 REAL=0:00:01.0) 
[08/19 18:05:41    135s] siFlow : Timing analysis mode is single, using late cdB files
[08/19 18:05:41    135s] Start AAE Lib Loading. (MEM=949.645)
[08/19 18:05:41    135s] End AAE Lib Loading. (MEM=1149.93 CPU=0:00:00.0 Real=0:00:00.0)
[08/19 18:05:41    135s] 
[08/19 18:05:41    135s] *summary: 35 instances (buffers/inverters) removed
[08/19 18:05:41    135s] *** Finish deleteBufferTree (0:00:00.5) ***
[08/19 18:05:41    135s] **INFO: Enable pre-place timing setting for timing analysis
[08/19 18:05:41    135s] Set Using Default Delay Limit as 101.
[08/19 18:05:41    135s] **WARN: (IMPDC-1629):	The default delay limit was set to 101. This is less than the default of 1000 and may result in inaccurate delay calculation for nets with a fanout higher than the setting.  If needed, the default delay limit may be adjusted by running the command 'set delaycal_use_default_delay_limit'.
[08/19 18:05:41    135s] Set Default Net Delay as 0 ps.
[08/19 18:05:41    135s] Set Default Net Load as 0 pF. 
[08/19 18:05:41    135s] **INFO: Analyzing IO path groups for slack adjustment
[08/19 18:05:41    135s] Effort level <high> specified for reg2reg_tmp.19172 path_group
[08/19 18:05:41    135s] #################################################################################
[08/19 18:05:41    135s] # Design Stage: PreRoute
[08/19 18:05:41    135s] # Design Name: SUM
[08/19 18:05:41    135s] # Design Mode: 90nm
[08/19 18:05:41    135s] # Analysis Mode: MMMC Non-OCV 
[08/19 18:05:41    135s] # Parasitics Mode: No SPEF/RCDB
[08/19 18:05:41    135s] # Signoff Settings: SI Off 
[08/19 18:05:41    135s] #################################################################################
[08/19 18:05:41    135s] Calculate delays in Single mode...
[08/19 18:05:41    135s] Topological Sorting (REAL = 0:00:00.0, MEM = 1151.9M, InitMEM = 1151.9M)
[08/19 18:05:41    135s] Start delay calculation (fullDC) (1 T). (MEM=1151.93)
[08/19 18:05:41    136s] End AAE Lib Interpolated Model. (MEM=1168.07 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:05:41    136s] First Iteration Infinite Tw... 
[08/19 18:05:42    136s] Total number of fetched objects 1719
[08/19 18:05:42    136s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:05:42    136s] End delay calculation. (MEM=1240.25 CPU=0:00:00.5 REAL=0:00:01.0)
[08/19 18:05:42    136s] End delay calculation (fullDC). (MEM=1142.88 CPU=0:00:00.9 REAL=0:00:01.0)
[08/19 18:05:42    136s] *** CDM Built up (cpu=0:00:01.0  real=0:00:01.0  mem= 1142.9M) ***
[08/19 18:05:42    136s] **INFO: Disable pre-place timing setting for timing analysis
[08/19 18:05:42    136s] Set Using Default Delay Limit as 1000.
[08/19 18:05:42    136s] Set Default Net Delay as 1000 ps.
[08/19 18:05:42    136s] Set Default Net Load as 0.5 pF. 
[08/19 18:05:42    136s] **INFO: Pre-place timing setting for timing analysis already disabled
[08/19 18:05:42    136s] Deleted 0 physical inst  (cell - / prefix -).
[08/19 18:05:42    136s] *** Starting "NanoPlace(TM) placement v#10 (mem=1128.7M)" ...
[08/19 18:05:42    136s] total jobs 1303
[08/19 18:05:42    136s] multi thread init TemplateIndex for each ta. thread num 1
[08/19 18:05:42    136s] Wait...
[08/19 18:05:43    137s] *** Build Buffered Sizing Timing Model
[08/19 18:05:43    137s] (cpu=0:00:00.8 mem=1128.7M) ***
[08/19 18:05:43    137s] *** Build Virtual Sizing Timing Model
[08/19 18:05:43    137s] (cpu=0:00:00.9 mem=1128.7M) ***
[08/19 18:05:43    137s] No user setting net weight.
[08/19 18:05:43    137s] Options: timingDriven clkGateAware ignoreScan pinGuide congEffort=auto gpeffort=medium 
[08/19 18:05:43    137s] Scan chains were not defined.
[08/19 18:05:43    137s] #std cell=1074 (0 fixed + 1074 movable) #block=0 (0 floating + 0 preplaced)
[08/19 18:05:43    137s] #ioInst=0 #net=1333 #term=3948 #term/net=2.96, #fixedIo=0, #floatIo=0, #fixedPin=0, #floatPin=388
[08/19 18:05:43    137s] stdCell: 1074 single + 0 double + 0 multi
[08/19 18:05:43    137s] Total standard cell length = 1.9958 (mm), area = 0.0028 (mm^2)
[08/19 18:05:43    137s] Core basic site is FreePDK45_38x28_10R_NP_162NW_34O
[08/19 18:05:43    137s] Estimated cell power/ground rail width = 0.197 um
[08/19 18:05:43    137s] Layer info - lib-1st H=1, V=2.  Cell-FPin=1. Top-pin=2
[08/19 18:05:43    137s] Apply auto density screen in pre-place stage.
[08/19 18:05:43    137s] Auto density screen increases utilization from 0.593 to 0.593
[08/19 18:05:43    137s] Auto density screen runtime: cpu = 0:00:00.0 real = 0:00:00.0 mem = 1128.7M
[08/19 18:05:43    137s] Average module density = 0.593.
[08/19 18:05:43    137s] Density for the design = 0.593.
[08/19 18:05:43    137s]        = stdcell_area 10504 sites (2794 um^2) / alloc_area 17712 sites (4711 um^2).
[08/19 18:05:43    137s] Pin Density = 0.2229.
[08/19 18:05:43    137s]             = total # of pins 3948 / total area 17712.
[08/19 18:05:43    137s] Initial padding reaches pin density 0.400 for top
[08/19 18:05:43    137s] Min area ratio padding skipped minAreaTgt 1.050, addOnArea 2959.400
[08/19 18:05:43    137s] Initial padding increases density from 0.593 to 0.783 for top
[08/19 18:05:43    137s] === lastAutoLevel = 7 
[08/19 18:05:43    137s] [adp] 0:1:0:1
[08/19 18:05:44    138s] Clock gating cells determined by native netlist tracing.
[08/19 18:05:44    138s] Effort level <high> specified for reg2reg path_group
[08/19 18:05:45    138s] Iteration  1: Total net bbox = 3.290e-11 (0.00e+00 3.29e-11)
[08/19 18:05:45    138s]               Est.  stn bbox = 3.299e-11 (0.00e+00 3.30e-11)
[08/19 18:05:45    138s]               cpu = 0:00:00.0 real = 0:00:00.0 mem = 1104.4M
[08/19 18:05:45    138s] Iteration  2: Total net bbox = 3.290e-11 (0.00e+00 3.29e-11)
[08/19 18:05:45    138s]               Est.  stn bbox = 3.299e-11 (0.00e+00 3.30e-11)
[08/19 18:05:45    138s]               cpu = 0:00:00.0 real = 0:00:00.0 mem = 1104.4M
[08/19 18:05:45    138s] exp_mt_sequential is set from setPlaceMode option to 1
[08/19 18:05:45    138s] Setting dotProdMode from setPlaceMode option to Multi-thread sequential mode (nrThread=1)
[08/19 18:05:45    138s] place_exp_mt_interval set to default 32
[08/19 18:05:45    138s] place_exp_mt_interval_bias (first half) set to default 0.750000
[08/19 18:05:45    138s] Iteration  3: Total net bbox = 1.259e+01 (6.40e+00 6.19e+00)
[08/19 18:05:45    138s]               Est.  stn bbox = 1.771e+01 (8.98e+00 8.73e+00)
[08/19 18:05:45    138s]               cpu = 0:00:00.1 real = 0:00:00.0 mem = 1120.4M
[08/19 18:05:45    138s] Total number of setup views is 1.
[08/19 18:05:45    138s] Total number of active setup views is 1.
[08/19 18:05:45    138s] Active setup views:
[08/19 18:05:45    138s]     default
[08/19 18:05:45    138s] Iteration  4: Total net bbox = 7.003e+02 (3.31e+02 3.69e+02)
[08/19 18:05:45    138s]               Est.  stn bbox = 1.223e+03 (6.02e+02 6.21e+02)
[08/19 18:05:45    138s]               cpu = 0:00:00.4 real = 0:00:00.0 mem = 1120.4M
[08/19 18:05:46    139s] Iteration  5: Total net bbox = 9.560e+02 (4.73e+02 4.83e+02)
[08/19 18:05:46    139s]               Est.  stn bbox = 1.655e+03 (8.27e+02 8.28e+02)
[08/19 18:05:46    139s]               cpu = 0:00:00.3 real = 0:00:01.0 mem = 1120.4M
[08/19 18:05:46    139s] Iteration  6: Total net bbox = 1.574e+03 (8.09e+02 7.65e+02)
[08/19 18:05:46    139s]               Est.  stn bbox = 2.344e+03 (1.20e+03 1.14e+03)
[08/19 18:05:46    139s]               cpu = 0:00:00.4 real = 0:00:00.0 mem = 1120.4M
[08/19 18:05:46    139s] Starting Early Global Route rough congestion estimation: mem = 1120.4M
[08/19 18:05:46    139s] (I)       Reading DB...
[08/19 18:05:46    139s] (I)       before initializing RouteDB syMemory usage = 1121.4 MB
[08/19 18:05:46    139s] (I)       congestionReportName   : 
[08/19 18:05:46    139s] (I)       layerRangeFor2DCongestion : 
[08/19 18:05:46    139s] (I)       buildTerm2TermWires    : 1
[08/19 18:05:46    139s] (I)       doTrackAssignment      : 1
[08/19 18:05:46    139s] (I)       dumpBookshelfFiles     : 0
[08/19 18:05:46    139s] (I)       numThreads             : 1
[08/19 18:05:46    139s] (I)       bufferingAwareRouting  : false
[08/19 18:05:46    139s] [NR-eGR] honorMsvRouteConstraint: false
[08/19 18:05:46    139s] (I)       honorPin               : false
[08/19 18:05:46    139s] (I)       honorPinGuide          : true
[08/19 18:05:46    139s] (I)       honorPartition         : false
[08/19 18:05:46    139s] (I)       allowPartitionCrossover: false
[08/19 18:05:46    139s] (I)       honorSingleEntry       : true
[08/19 18:05:46    139s] (I)       honorSingleEntryStrong : true
[08/19 18:05:46    139s] (I)       handleViaSpacingRule   : false
[08/19 18:05:46    139s] (I)       handleEolSpacingRule   : false
[08/19 18:05:46    139s] (I)       PDConstraint           : none
[08/19 18:05:46    139s] (I)       expBetterNDRHandling   : false
[08/19 18:05:46    139s] [NR-eGR] honorClockSpecNDR      : 0
[08/19 18:05:46    139s] (I)       routingEffortLevel     : 3
[08/19 18:05:46    139s] (I)       effortLevel            : standard
[08/19 18:05:46    139s] [NR-eGR] minRouteLayer          : 2
[08/19 18:05:46    139s] [NR-eGR] maxRouteLayer          : 127
[08/19 18:05:46    139s] (I)       relaxedTopLayerCeiling : 127
[08/19 18:05:46    139s] (I)       relaxedBottomLayerFloor: 2
[08/19 18:05:46    139s] (I)       numRowsPerGCell        : 4
[08/19 18:05:46    139s] (I)       speedUpLargeDesign     : 0
[08/19 18:05:46    139s] (I)       multiThreadingTA       : 1
[08/19 18:05:46    139s] (I)       blkAwareLayerSwitching : 1
[08/19 18:05:46    139s] (I)       optimizationMode       : false
[08/19 18:05:46    139s] (I)       routeSecondPG          : false
[08/19 18:05:46    139s] (I)       scenicRatioForLayerRelax: 0.00
[08/19 18:05:46    139s] (I)       detourLimitForLayerRelax: 0.00
[08/19 18:05:46    139s] (I)       punchThroughDistance   : 500.00
[08/19 18:05:46    139s] (I)       scenicBound            : 1.15
[08/19 18:05:46    139s] (I)       maxScenicToAvoidBlk    : 100.00
[08/19 18:05:46    139s] (I)       source-to-sink ratio   : 0.00
[08/19 18:05:46    139s] (I)       targetCongestionRatioH : 1.00
[08/19 18:05:46    139s] (I)       targetCongestionRatioV : 1.00
[08/19 18:05:46    139s] (I)       layerCongestionRatio   : 0.70
[08/19 18:05:46    139s] (I)       m1CongestionRatio      : 0.10
[08/19 18:05:46    139s] (I)       m2m3CongestionRatio    : 0.70
[08/19 18:05:46    139s] (I)       localRouteEffort       : 1.00
[08/19 18:05:46    139s] (I)       numSitesBlockedByOneVia: 8.00
[08/19 18:05:46    139s] (I)       supplyScaleFactorH     : 1.00
[08/19 18:05:46    139s] (I)       supplyScaleFactorV     : 1.00
[08/19 18:05:46    139s] (I)       highlight3DOverflowFactor: 0.00
[08/19 18:05:46    139s] (I)       doubleCutViaModelingRatio: 0.00
[08/19 18:05:46    139s] (I)       routeVias              : 
[08/19 18:05:46    139s] (I)       readTROption           : true
[08/19 18:05:46    139s] (I)       extraSpacingFactor     : 1.00
[08/19 18:05:46    139s] [NR-eGR] numTracksPerClockWire  : 0
[08/19 18:05:46    139s] (I)       routeSelectedNetsOnly  : false
[08/19 18:05:46    139s] (I)       clkNetUseMaxDemand     : false
[08/19 18:05:46    139s] (I)       extraDemandForClocks   : 0
[08/19 18:05:46    139s] (I)       steinerRemoveLayers    : false
[08/19 18:05:46    139s] (I)       demoteLayerScenicScale : 1.00
[08/19 18:05:46    139s] (I)       nonpreferLayerCostScale : 100.00
[08/19 18:05:46    139s] (I)       similarTopologyRoutingFast : false
[08/19 18:05:46    139s] (I)       spanningTreeRefinement : false
[08/19 18:05:46    139s] (I)       spanningTreeRefinementAlpha : 0.50
[08/19 18:05:46    139s] (I)       starting read tracks
[08/19 18:05:46    139s] (I)       build grid graph
[08/19 18:05:46    139s] (I)       build grid graph start
[08/19 18:05:46    139s] [NR-eGR] Layer1 has no routable track
[08/19 18:05:46    139s] [NR-eGR] Layer2 has single uniform track structure
[08/19 18:05:46    139s] [NR-eGR] Layer3 has single uniform track structure
[08/19 18:05:46    139s] [NR-eGR] Layer4 has single uniform track structure
[08/19 18:05:46    139s] [NR-eGR] Layer5 has single uniform track structure
[08/19 18:05:46    139s] [NR-eGR] Layer6 has single uniform track structure
[08/19 18:05:46    139s] [NR-eGR] Layer7 has single uniform track structure
[08/19 18:05:46    139s] [NR-eGR] Layer8 has single uniform track structure
[08/19 18:05:46    139s] [NR-eGR] Layer9 has single uniform track structure
[08/19 18:05:46    139s] [NR-eGR] Layer10 has single uniform track structure
[08/19 18:05:46    139s] (I)       build grid graph end
[08/19 18:05:46    139s] (I)       numViaLayers=10
[08/19 18:05:46    139s] (I)       Reading via via1_8 for layer: 0 
[08/19 18:05:46    139s] (I)       Reading via via2_8 for layer: 1 
[08/19 18:05:46    139s] (I)       Reading via via3_2 for layer: 2 
[08/19 18:05:46    139s] (I)       Reading via via4_0 for layer: 3 
[08/19 18:05:46    139s] (I)       Reading via via5_0 for layer: 4 
[08/19 18:05:46    139s] (I)       Reading via via6_0 for layer: 5 
[08/19 18:05:46    139s] (I)       Reading via via7_0 for layer: 6 
[08/19 18:05:46    139s] (I)       Reading via via8_0 for layer: 7 
[08/19 18:05:46    139s] (I)       Reading via via9_0 for layer: 8 
[08/19 18:05:46    139s] (I)       end build via table
[08/19 18:05:46    139s] [NR-eGR] numRoutingBlks=0 numInstBlks=0 numPGBlocks=1720 numBumpBlks=0 numBoundaryFakeBlks=0
[08/19 18:05:46    139s] [NR-eGR] numPreroutedNet = 0  numPreroutedWires = 0
[08/19 18:05:46    139s] (I)       readDataFromPlaceDB
[08/19 18:05:46    139s] (I)       Read net information..
[08/19 18:05:46    139s] [NR-eGR] Read numTotalNets=946  numIgnoredNets=0
[08/19 18:05:46    139s] (I)       Read testcase time = 0.000 seconds
[08/19 18:05:46    139s] 
[08/19 18:05:46    139s] (I)       read default dcut vias
[08/19 18:05:46    139s] (I)       Reading via via1_4 for layer: 0 
[08/19 18:05:46    139s] (I)       Reading via via2_8 for layer: 1 
[08/19 18:05:46    139s] (I)       Reading via via3_2 for layer: 2 
[08/19 18:05:46    139s] (I)       Reading via via4_0 for layer: 3 
[08/19 18:05:46    139s] (I)       Reading via via5_0 for layer: 4 
[08/19 18:05:46    139s] (I)       Reading via via6_0 for layer: 5 
[08/19 18:05:46    139s] (I)       Reading via via7_0 for layer: 6 
[08/19 18:05:46    139s] (I)       Reading via via8_0 for layer: 7 
[08/19 18:05:46    139s] (I)       Reading via via9_0 for layer: 8 
[08/19 18:05:46    139s] (I)       build grid graph start
[08/19 18:05:46    139s] (I)       build grid graph end
[08/19 18:05:46    139s] (I)       Model blockage into capacity
[08/19 18:05:46    139s] (I)       Read numBlocks=1720  numPreroutedWires=0  numCapScreens=0
[08/19 18:05:46    139s] (I)       blocked area on Layer1 : 0  (0.00%)
[08/19 18:05:46    139s] (I)       blocked area on Layer2 : 255192000  (1.03%)
[08/19 18:05:46    139s] (I)       blocked area on Layer3 : 309523200  (1.25%)
[08/19 18:05:46    139s] (I)       blocked area on Layer4 : 430416000  (1.73%)
[08/19 18:05:46    139s] (I)       blocked area on Layer5 : 499564800  (2.01%)
[08/19 18:05:46    139s] (I)       blocked area on Layer6 : 540411200  (2.18%)
[08/19 18:05:46    139s] (I)       blocked area on Layer7 : 2007040000  (8.08%)
[08/19 18:05:46    139s] (I)       blocked area on Layer8 : 2195200000  (8.84%)
[08/19 18:05:46    139s] (I)       blocked area on Layer9 : 10610688000  (42.71%)
[08/19 18:05:46    139s] (I)       blocked area on Layer10 : 13178880000  (53.05%)
[08/19 18:05:46    139s] (I)       Modeling time = 0.000 seconds
[08/19 18:05:46    139s] 
[08/19 18:05:46    139s] (I)       Number of ignored nets = 0
[08/19 18:05:46    139s] (I)       Number of fixed nets = 0.  Ignored: Yes
[08/19 18:05:46    139s] (I)       Number of clock nets = 1.  Ignored: No
[08/19 18:05:46    139s] (I)       Number of analog nets = 0.  Ignored: Yes
[08/19 18:05:46    139s] (I)       Number of special nets = 0.  Ignored: Yes
[08/19 18:05:46    139s] (I)       Number of mixed signal nets = 0.  Ignored: Yes
[08/19 18:05:46    139s] (I)       Number of skip routing nets = 0.  Ignored: Yes
[08/19 18:05:46    139s] (I)       Number of nets with ignore route flag = 0.  Ignored: No
[08/19 18:05:46    139s] (I)       Number of nets with one or no pins = 0.  Ignored: Yes
[08/19 18:05:46    139s] (I)       Number of two pin nets which has pins at the same location = 0.  Ignored: Yes
[08/19 18:05:46    139s] [NR-eGR] There are 1 clock nets ( 0 with NDR ).
[08/19 18:05:46    139s] (I)       Before initializing earlyGlobalRoute syMemory usage = 1121.4 MB
[08/19 18:05:46    139s] (I)       Ndr track 0 does not exist
[08/19 18:05:46    139s] (I)       Layer1  viaCost=200.00
[08/19 18:05:46    139s] (I)       Layer2  viaCost=200.00
[08/19 18:05:46    139s] (I)       Layer3  viaCost=100.00
[08/19 18:05:46    139s] (I)       Layer4  viaCost=100.00
[08/19 18:05:46    139s] (I)       Layer5  viaCost=100.00
[08/19 18:05:46    139s] (I)       Layer6  viaCost=100.00
[08/19 18:05:46    139s] (I)       Layer7  viaCost=100.00
[08/19 18:05:46    139s] (I)       Layer8  viaCost=100.00
[08/19 18:05:46    139s] (I)       Layer9  viaCost=100.00
[08/19 18:05:46    139s] (I)       ---------------------Grid Graph Info--------------------
[08/19 18:05:46    139s] (I)       routing area        :  (0, 0) - (160740, 154560)
[08/19 18:05:46    139s] (I)       core area           :  (10260, 10080) - (150480, 144480)
[08/19 18:05:46    139s] (I)       Site Width          :   380  (dbu)
[08/19 18:05:46    139s] (I)       Row Height          :  2800  (dbu)
[08/19 18:05:46    139s] (I)       GCell Width         : 11200  (dbu)
[08/19 18:05:46    139s] (I)       GCell Height        : 11200  (dbu)
[08/19 18:05:46    139s] (I)       grid                :    15    14    10
[08/19 18:05:46    139s] (I)       vertical capacity   :     0 11200     0 11200     0 11200     0 11200     0 11200
[08/19 18:05:46    139s] (I)       horizontal capacity :     0     0 11200     0 11200     0 11200     0 11200     0
[08/19 18:05:46    139s] (I)       Default wire width  :   140   140   140   280   280   280   800   800  1600  1600
[08/19 18:05:46    139s] (I)       Default wire space  :   130   140   140   280   280   280   800   800  1600  1600
[08/19 18:05:46    139s] (I)       Default pitch size  :   270   380   280   560   560   560  1680  1680  3200  3360
[08/19 18:05:46    139s] (I)       First Track Coord   :     0   190   140   370   700   370  1820  2050  3820  3730
[08/19 18:05:46    139s] (I)       Num tracks per GCell: 41.48 29.47 40.00 20.00 20.00 20.00  6.67  6.67  3.50  3.33
[08/19 18:05:46    139s] (I)       Total num of tracks :     0   423   552   287   275   287    91    95    47    47
[08/19 18:05:46    139s] (I)       Num of masks        :     1     1     1     1     1     1     1     1     1     1
[08/19 18:05:46    139s] (I)       Num of trim masks   :     0     0     0     0     0     0     0     0     0     0
[08/19 18:05:46    139s] (I)       --------------------------------------------------------
[08/19 18:05:46    139s] 
[08/19 18:05:46    139s] [NR-eGR] ============ Routing rule table ============
[08/19 18:05:46    139s] [NR-eGR] Rule id 0. Nets 946 
[08/19 18:05:46    139s] [NR-eGR] id=0  ndrTrackId=0  ndrViaId=-1  extraSpace=0  numShields=0  maxHorDemand=1  maxVerDemand=1
[08/19 18:05:46    139s] [NR-eGR] Pitch:  L1=270  L2=380  L3=280  L4=560  L5=560  L6=560  L7=1680  L8=1680  L9=3200  L10=3360
[08/19 18:05:46    139s] (I)       NumUsedTracks:  L1=1  L2=1  L3=1  L4=1  L5=1  L6=1  L7=1  L8=1  L9=1  L10=1
[08/19 18:05:46    139s] (I)       NumFullyUsedTracks:  L1=1  L2=1  L3=1  L4=1  L5=1  L6=1  L7=1  L8=1  L9=1  L10=1
[08/19 18:05:46    139s] [NR-eGR] ========================================
[08/19 18:05:46    139s] [NR-eGR] 
[08/19 18:05:46    139s] (I)       After initializing earlyGlobalRoute syMemory usage = 1121.4 MB
[08/19 18:05:46    139s] (I)       Loading and dumping file time : 0.02 seconds
[08/19 18:05:46    139s] (I)       ============= Initialization =============
[08/19 18:05:46    139s] (I)       numLocalWires=3024  numGlobalNetBranches=739  numLocalNetBranches=885
[08/19 18:05:46    139s] (I)       totalPins=3173  totalGlobalPin=950 (29.94%)
[08/19 18:05:46    139s] (I)       total 2D Cap : 29493 = (14050 H, 15443 V)
[08/19 18:05:46    139s] (I)       ============  Phase 1a Route ============
[08/19 18:05:46    139s] (I)       Phase 1a runs 0.00 seconds
[08/19 18:05:46    139s] (I)       blkAvoiding Routing :  time=0.00  numBlkSegs=0
[08/19 18:05:46    139s] (I)       Usage: 616 = (349 H, 267 V) = (2.48% H, 1.73% V) = (1.954e+03um H, 1.495e+03um V)
[08/19 18:05:46    139s] (I)       
[08/19 18:05:46    139s] (I)       ============  Phase 1b Route ============
[08/19 18:05:46    139s] (I)       Usage: 616 = (349 H, 267 V) = (2.48% H, 1.73% V) = (1.954e+03um H, 1.495e+03um V)
[08/19 18:05:46    139s] (I)       
[08/19 18:05:46    139s] (I)       earlyGlobalRoute overflow: 0.00% H + 0.00% V
[08/19 18:05:46    139s] 
[08/19 18:05:46    139s] [NR-eGR] Overflow after earlyGlobalRoute (GR compatible) 0.00% H + 0.00% V
[08/19 18:05:46    139s] Finished Early Global Route rough congestion estimation: mem = 1121.4M
[08/19 18:05:46    139s] earlyGlobalRoute rough estimation gcell size 4 row height
[08/19 18:05:46    139s] Congestion driven padding in post-place stage.
[08/19 18:05:46    139s] Congestion driven padding increases utilization from 0.783 to 0.783
[08/19 18:05:46    139s] Congestion driven padding runtime: cpu = 0:00:00.0 real = 0:00:00.0 mem = 1121.4M
[08/19 18:05:46    139s] Global placement CDP skipped at cutLevel 7.
[08/19 18:05:46    139s] Iteration  7: Total net bbox = 3.266e+04 (1.70e+04 1.57e+04)
[08/19 18:05:46    139s]               Est.  stn bbox = 3.347e+04 (1.74e+04 1.61e+04)
[08/19 18:05:46    139s]               cpu = 0:00:00.1 real = 0:00:00.0 mem = 1121.4M
[08/19 18:05:47    140s] nrCritNet: 0.00% ( 0 / 1333 ) cutoffSlk: -160.4ps stdDelay: 10.1ps
[08/19 18:05:47    140s] nrCritNet: 0.00% ( 0 / 1333 ) cutoffSlk: -160.4ps stdDelay: 10.1ps
[08/19 18:05:47    140s] Iteration  8: Total net bbox = 3.266e+04 (1.70e+04 1.57e+04)
[08/19 18:05:47    140s]               Est.  stn bbox = 3.347e+04 (1.74e+04 1.61e+04)
[08/19 18:05:47    140s]               cpu = 0:00:00.9 real = 0:00:01.0 mem = 1123.4M
[08/19 18:05:49    141s] Iteration  9: Total net bbox = 3.691e+03 (1.96e+03 1.73e+03)
[08/19 18:05:49    141s]               Est.  stn bbox = 4.471e+03 (2.35e+03 2.12e+03)
[08/19 18:05:49    141s]               cpu = 0:00:00.5 real = 0:00:01.0 mem = 1120.2M
[08/19 18:05:49    141s] Iteration 10: Total net bbox = 3.417e+04 (1.77e+04 1.65e+04)
[08/19 18:05:49    141s]               Est.  stn bbox = 3.499e+04 (1.81e+04 1.69e+04)
[08/19 18:05:49    141s]               cpu = 0:00:01.3 real = 0:00:02.0 mem = 1120.2M
[08/19 18:05:49    141s] Iteration 11: Total net bbox = 3.417e+04 (1.77e+04 1.65e+04)
[08/19 18:05:49    141s]               Est.  stn bbox = 3.499e+04 (1.81e+04 1.69e+04)
[08/19 18:05:49    141s]               cpu = 0:00:00.0 real = 0:00:00.0 mem = 1120.2M
[08/19 18:05:49    141s] *** cost = 3.417e+04 (1.77e+04 1.65e+04) (cpu for global=0:00:03.7) real=0:00:05.0***
[08/19 18:05:49    141s] Info: 0 clock gating cells identified, 0 (on average) moved
[08/19 18:05:49    141s] Solver runtime cpu: 0:00:02.4 real: 0:00:02.8
[08/19 18:05:49    141s] Core Placement runtime cpu: 0:00:02.5 real: 0:00:04.0
[08/19 18:05:49    141s] **WARN: (IMPSP-9025):	No scan chain specified/traced.
[08/19 18:05:49    141s] Type 'man IMPSP-9025' for more detail.
[08/19 18:05:49    141s] #spOpts: mergeVia=F 
[08/19 18:05:49    141s] Core basic site is FreePDK45_38x28_10R_NP_162NW_34O
[08/19 18:05:49    141s] Layer info - lib-1st H=1, V=2.  Cell-FPin=1. Top-pin=2
[08/19 18:05:49    141s] *** Starting refinePlace (0:02:22 mem=1120.2M) ***
[08/19 18:05:49    141s] Total net bbox length = 3.417e+04 (1.766e+04 1.651e+04) (ext = 3.020e+04)
[08/19 18:05:49    141s] Move report: placeLevelShifters moves 0 insts, mean move: 0.00 um, max move: 0.00 um
[08/19 18:05:49    141s] Starting refinePlace ...
[08/19 18:05:49    141s] default core: bins with density >  0.75 =    0 % ( 0 / 25 )
[08/19 18:05:49    141s] Density distribution unevenness ratio = 2.734%
[08/19 18:05:49    142s]   Spread Effort: high, standalone mode, useDDP on.
[08/19 18:05:49    142s] [CPU] RefinePlace/preRPlace (cpu=0:00:00.0, real=0:00:00.0, mem=1120.2MB) @(0:02:22 - 0:02:22).
[08/19 18:05:49    142s] Move report: preRPlace moves 1074 insts, mean move: 0.51 um, max move: 2.44 um
[08/19 18:05:49    142s] 	Max move on inst (ATMP_reg[92]): (45.35, 32.17) --> (44.84, 30.24)
[08/19 18:05:49    142s] 	Length: 20 sites, height: 1 rows, site name: FreePDK45_38x28_10R_NP_162NW_34O, cell type: DFFR_X1
[08/19 18:05:49    142s] wireLenOptFixPriorityInst 0 inst fixed
[08/19 18:05:49    142s] Placement tweakage begins.
[08/19 18:05:49    142s] wire length = 5.919e+03
[08/19 18:05:49    142s] wire length = 5.474e+03
[08/19 18:05:49    142s] Placement tweakage ends.
[08/19 18:05:49    142s] Move report: tweak moves 174 insts, mean move: 3.44 um, max move: 9.97 um
[08/19 18:05:49    142s] 	Max move on inst (S_reg[10]): (39.14, 61.04) --> (43.51, 55.44)
[08/19 18:05:49    142s] [CPU] RefinePlace/TweakPlacement (cpu=0:00:00.2, real=0:00:00.0, mem=1120.2MB) @(0:02:22 - 0:02:22).
[08/19 18:05:49    142s] Move report: legalization moves 0 insts, mean move: 0.00 um, max move: 0.00 um
[08/19 18:05:49    142s] [CPU] RefinePlace/Legalization (cpu=0:00:00.0, real=0:00:00.0, mem=1120.2MB) @(0:02:22 - 0:02:22).
[08/19 18:05:49    142s] Move report: Detail placement moves 1074 insts, mean move: 0.99 um, max move: 10.26 um
[08/19 18:05:49    142s] 	Max move on inst (S_reg[10]): (39.06, 61.24) --> (43.51, 55.44)
[08/19 18:05:49    142s] 	Runtime: CPU: 0:00:00.3 REAL: 0:00:00.0 MEM: 1120.2MB
[08/19 18:05:49    142s] Statistics of distance of Instance movement in refine placement:
[08/19 18:05:49    142s]   maximum (X+Y) =        10.26 um
[08/19 18:05:49    142s]   inst (S_reg[10]) with max move: (39.0555, 61.2435) -> (43.51, 55.44)
[08/19 18:05:49    142s]   mean    (X+Y) =         0.99 um
[08/19 18:05:49    142s] Total instances flipped for WireLenOpt: 37
[08/19 18:05:49    142s] Summary Report:
[08/19 18:05:49    142s] Instances move: 1074 (out of 1074 movable)
[08/19 18:05:49    142s] Instances flipped: 0
[08/19 18:05:49    142s] Mean displacement: 0.99 um
[08/19 18:05:49    142s] Max displacement: 10.26 um (Instance: S_reg[10]) (39.0555, 61.2435) -> (43.51, 55.44)
[08/19 18:05:49    142s] 	Length: 20 sites, height: 1 rows, site name: FreePDK45_38x28_10R_NP_162NW_34O, cell type: DFFR_X1
[08/19 18:05:49    142s] Total instances moved : 1074
[08/19 18:05:49    142s] Total net bbox length = 3.360e+04 (1.698e+04 1.663e+04) (ext = 2.991e+04)
[08/19 18:05:49    142s] Runtime: CPU: 0:00:00.3 REAL: 0:00:00.0 MEM: 1120.2MB
[08/19 18:05:49    142s] [CPU] RefinePlace/total (cpu=0:00:00.3, real=0:00:00.0, mem=1120.2MB) @(0:02:22 - 0:02:22).
[08/19 18:05:49    142s] *** Finished refinePlace (0:02:22 mem=1120.2M) ***
[08/19 18:05:49    142s] *** End of Placement (cpu=0:00:05.3, real=0:00:07.0, mem=1120.2M) ***
[08/19 18:05:49    142s] #spOpts: mergeVia=F 
[08/19 18:05:49    142s] Core basic site is FreePDK45_38x28_10R_NP_162NW_34O
[08/19 18:05:49    142s] Layer info - lib-1st H=1, V=2.  Cell-FPin=1. Top-pin=2
[08/19 18:05:49    142s] default core: bins with density >  0.75 =    0 % ( 0 / 25 )
[08/19 18:05:49    142s] Density distribution unevenness ratio = 2.440%
[08/19 18:05:49    142s] *** Free Virtual Timing Model ...(mem=1120.2M)
[08/19 18:05:49    142s] Starting congestion repair ...
[08/19 18:05:49    142s] congRepair options: -clkGateAware 1 -rplaceIncrNPClkGateAwareMode 4.
[08/19 18:05:49    142s] Starting Early Global Route congestion estimation: mem = 1106.0M
[08/19 18:05:49    142s] (I)       Reading DB...
[08/19 18:05:49    142s] (I)       before initializing RouteDB syMemory usage = 1106.0 MB
[08/19 18:05:49    142s] (I)       congestionReportName   : 
[08/19 18:05:49    142s] (I)       layerRangeFor2DCongestion : 
[08/19 18:05:49    142s] (I)       buildTerm2TermWires    : 1
[08/19 18:05:49    142s] (I)       doTrackAssignment      : 1
[08/19 18:05:49    142s] (I)       dumpBookshelfFiles     : 0
[08/19 18:05:49    142s] (I)       numThreads             : 1
[08/19 18:05:49    142s] (I)       bufferingAwareRouting  : false
[08/19 18:05:49    142s] [NR-eGR] honorMsvRouteConstraint: false
[08/19 18:05:49    142s] (I)       honorPin               : false
[08/19 18:05:49    142s] (I)       honorPinGuide          : true
[08/19 18:05:49    142s] (I)       honorPartition         : false
[08/19 18:05:49    142s] (I)       allowPartitionCrossover: false
[08/19 18:05:49    142s] (I)       honorSingleEntry       : true
[08/19 18:05:49    142s] (I)       honorSingleEntryStrong : true
[08/19 18:05:49    142s] (I)       handleViaSpacingRule   : false
[08/19 18:05:49    142s] (I)       handleEolSpacingRule   : false
[08/19 18:05:49    142s] (I)       PDConstraint           : none
[08/19 18:05:49    142s] (I)       expBetterNDRHandling   : false
[08/19 18:05:49    142s] [NR-eGR] honorClockSpecNDR      : 0
[08/19 18:05:49    142s] (I)       routingEffortLevel     : 3
[08/19 18:05:49    142s] (I)       effortLevel            : standard
[08/19 18:05:49    142s] [NR-eGR] minRouteLayer          : 2
[08/19 18:05:49    142s] [NR-eGR] maxRouteLayer          : 127
[08/19 18:05:49    142s] (I)       relaxedTopLayerCeiling : 127
[08/19 18:05:49    142s] (I)       relaxedBottomLayerFloor: 2
[08/19 18:05:49    142s] (I)       numRowsPerGCell        : 1
[08/19 18:05:49    142s] (I)       speedUpLargeDesign     : 0
[08/19 18:05:49    142s] (I)       multiThreadingTA       : 1
[08/19 18:05:49    142s] (I)       blkAwareLayerSwitching : 1
[08/19 18:05:49    142s] (I)       optimizationMode       : false
[08/19 18:05:49    142s] (I)       routeSecondPG          : false
[08/19 18:05:49    142s] (I)       scenicRatioForLayerRelax: 0.00
[08/19 18:05:49    142s] (I)       detourLimitForLayerRelax: 0.00
[08/19 18:05:49    142s] (I)       punchThroughDistance   : 500.00
[08/19 18:05:49    142s] (I)       scenicBound            : 1.15
[08/19 18:05:49    142s] (I)       maxScenicToAvoidBlk    : 100.00
[08/19 18:05:49    142s] (I)       source-to-sink ratio   : 0.00
[08/19 18:05:49    142s] (I)       targetCongestionRatioH : 1.00
[08/19 18:05:49    142s] (I)       targetCongestionRatioV : 1.00
[08/19 18:05:49    142s] (I)       layerCongestionRatio   : 0.70
[08/19 18:05:49    142s] (I)       m1CongestionRatio      : 0.10
[08/19 18:05:49    142s] (I)       m2m3CongestionRatio    : 0.70
[08/19 18:05:49    142s] (I)       localRouteEffort       : 1.00
[08/19 18:05:49    142s] (I)       numSitesBlockedByOneVia: 8.00
[08/19 18:05:49    142s] (I)       supplyScaleFactorH     : 1.00
[08/19 18:05:49    142s] (I)       supplyScaleFactorV     : 1.00
[08/19 18:05:49    142s] (I)       highlight3DOverflowFactor: 0.00
[08/19 18:05:49    142s] (I)       doubleCutViaModelingRatio: 0.00
[08/19 18:05:49    142s] (I)       routeVias              : 
[08/19 18:05:49    142s] (I)       readTROption           : true
[08/19 18:05:49    142s] (I)       extraSpacingFactor     : 1.00
[08/19 18:05:49    142s] [NR-eGR] numTracksPerClockWire  : 0
[08/19 18:05:49    142s] (I)       routeSelectedNetsOnly  : false
[08/19 18:05:49    142s] (I)       clkNetUseMaxDemand     : false
[08/19 18:05:49    142s] (I)       extraDemandForClocks   : 0
[08/19 18:05:49    142s] (I)       steinerRemoveLayers    : false
[08/19 18:05:49    142s] (I)       demoteLayerScenicScale : 1.00
[08/19 18:05:49    142s] (I)       nonpreferLayerCostScale : 100.00
[08/19 18:05:49    142s] (I)       similarTopologyRoutingFast : false
[08/19 18:05:49    142s] (I)       spanningTreeRefinement : false
[08/19 18:05:49    142s] (I)       spanningTreeRefinementAlpha : 0.50
[08/19 18:05:49    142s] (I)       starting read tracks
[08/19 18:05:49    142s] (I)       build grid graph
[08/19 18:05:49    142s] (I)       build grid graph start
[08/19 18:05:49    142s] [NR-eGR] Layer1 has no routable track
[08/19 18:05:49    142s] [NR-eGR] Layer2 has single uniform track structure
[08/19 18:05:49    142s] [NR-eGR] Layer3 has single uniform track structure
[08/19 18:05:49    142s] [NR-eGR] Layer4 has single uniform track structure
[08/19 18:05:49    142s] [NR-eGR] Layer5 has single uniform track structure
[08/19 18:05:49    142s] [NR-eGR] Layer6 has single uniform track structure
[08/19 18:05:49    142s] [NR-eGR] Layer7 has single uniform track structure
[08/19 18:05:49    142s] [NR-eGR] Layer8 has single uniform track structure
[08/19 18:05:49    142s] [NR-eGR] Layer9 has single uniform track structure
[08/19 18:05:49    142s] [NR-eGR] Layer10 has single uniform track structure
[08/19 18:05:49    142s] (I)       build grid graph end
[08/19 18:05:49    142s] (I)       numViaLayers=10
[08/19 18:05:49    142s] (I)       Reading via via1_8 for layer: 0 
[08/19 18:05:49    142s] (I)       Reading via via2_8 for layer: 1 
[08/19 18:05:49    142s] (I)       Reading via via3_2 for layer: 2 
[08/19 18:05:49    142s] (I)       Reading via via4_0 for layer: 3 
[08/19 18:05:49    142s] (I)       Reading via via5_0 for layer: 4 
[08/19 18:05:49    142s] (I)       Reading via via6_0 for layer: 5 
[08/19 18:05:49    142s] (I)       Reading via via7_0 for layer: 6 
[08/19 18:05:49    142s] (I)       Reading via via8_0 for layer: 7 
[08/19 18:05:49    142s] (I)       Reading via via9_0 for layer: 8 
[08/19 18:05:49    142s] (I)       end build via table
[08/19 18:05:49    142s] [NR-eGR] numRoutingBlks=0 numInstBlks=0 numPGBlocks=1720 numBumpBlks=0 numBoundaryFakeBlks=0
[08/19 18:05:49    142s] [NR-eGR] numPreroutedNet = 0  numPreroutedWires = 0
[08/19 18:05:49    142s] (I)       readDataFromPlaceDB
[08/19 18:05:49    142s] (I)       Read net information..
[08/19 18:05:49    142s] [NR-eGR] Read numTotalNets=946  numIgnoredNets=0
[08/19 18:05:49    142s] (I)       Read testcase time = 0.000 seconds
[08/19 18:05:49    142s] 
[08/19 18:05:49    142s] (I)       read default dcut vias
[08/19 18:05:49    142s] (I)       Reading via via1_4 for layer: 0 
[08/19 18:05:49    142s] (I)       Reading via via2_8 for layer: 1 
[08/19 18:05:49    142s] (I)       Reading via via3_2 for layer: 2 
[08/19 18:05:49    142s] (I)       Reading via via4_0 for layer: 3 
[08/19 18:05:49    142s] (I)       Reading via via5_0 for layer: 4 
[08/19 18:05:49    142s] (I)       Reading via via6_0 for layer: 5 
[08/19 18:05:49    142s] (I)       Reading via via7_0 for layer: 6 
[08/19 18:05:49    142s] (I)       Reading via via8_0 for layer: 7 
[08/19 18:05:49    142s] (I)       Reading via via9_0 for layer: 8 
[08/19 18:05:49    142s] (I)       build grid graph start
[08/19 18:05:49    142s] (I)       build grid graph end
[08/19 18:05:49    142s] (I)       Model blockage into capacity
[08/19 18:05:49    142s] (I)       Read numBlocks=1720  numPreroutedWires=0  numCapScreens=0
[08/19 18:05:49    142s] (I)       blocked area on Layer1 : 0  (0.00%)
[08/19 18:05:49    142s] (I)       blocked area on Layer2 : 255192000  (1.03%)
[08/19 18:05:49    142s] (I)       blocked area on Layer3 : 309523200  (1.25%)
[08/19 18:05:49    142s] (I)       blocked area on Layer4 : 430416000  (1.73%)
[08/19 18:05:49    142s] (I)       blocked area on Layer5 : 499564800  (2.01%)
[08/19 18:05:49    142s] (I)       blocked area on Layer6 : 540411200  (2.18%)
[08/19 18:05:49    142s] (I)       blocked area on Layer7 : 2007040000  (8.08%)
[08/19 18:05:49    142s] (I)       blocked area on Layer8 : 2195200000  (8.84%)
[08/19 18:05:49    142s] (I)       blocked area on Layer9 : 10610688000  (42.71%)
[08/19 18:05:49    142s] (I)       blocked area on Layer10 : 13178880000  (53.05%)
[08/19 18:05:49    142s] (I)       Modeling time = 0.000 seconds
[08/19 18:05:49    142s] 
[08/19 18:05:49    142s] (I)       Number of ignored nets = 0
[08/19 18:05:49    142s] (I)       Number of fixed nets = 0.  Ignored: Yes
[08/19 18:05:49    142s] (I)       Number of clock nets = 1.  Ignored: No
[08/19 18:05:49    142s] (I)       Number of analog nets = 0.  Ignored: Yes
[08/19 18:05:49    142s] (I)       Number of special nets = 0.  Ignored: Yes
[08/19 18:05:49    142s] (I)       Number of mixed signal nets = 0.  Ignored: Yes
[08/19 18:05:49    142s] (I)       Number of skip routing nets = 0.  Ignored: Yes
[08/19 18:05:49    142s] (I)       Number of nets with ignore route flag = 0.  Ignored: No
[08/19 18:05:49    142s] (I)       Number of nets with one or no pins = 0.  Ignored: Yes
[08/19 18:05:49    142s] (I)       Number of two pin nets which has pins at the same location = 0.  Ignored: Yes
[08/19 18:05:49    142s] [NR-eGR] There are 1 clock nets ( 0 with NDR ).
[08/19 18:05:49    142s] (I)       Before initializing earlyGlobalRoute syMemory usage = 1106.0 MB
[08/19 18:05:49    142s] (I)       Ndr track 0 does not exist
[08/19 18:05:49    142s] (I)       Layer1  viaCost=200.00
[08/19 18:05:49    142s] (I)       Layer2  viaCost=200.00
[08/19 18:05:49    142s] (I)       Layer3  viaCost=100.00
[08/19 18:05:49    142s] (I)       Layer4  viaCost=100.00
[08/19 18:05:49    142s] (I)       Layer5  viaCost=100.00
[08/19 18:05:49    142s] (I)       Layer6  viaCost=100.00
[08/19 18:05:49    142s] (I)       Layer7  viaCost=100.00
[08/19 18:05:49    142s] (I)       Layer8  viaCost=100.00
[08/19 18:05:49    142s] (I)       Layer9  viaCost=100.00
[08/19 18:05:49    142s] (I)       ---------------------Grid Graph Info--------------------
[08/19 18:05:49    142s] (I)       routing area        :  (0, 0) - (160740, 154560)
[08/19 18:05:49    142s] (I)       core area           :  (10260, 10080) - (150480, 144480)
[08/19 18:05:49    142s] (I)       Site Width          :   380  (dbu)
[08/19 18:05:49    142s] (I)       Row Height          :  2800  (dbu)
[08/19 18:05:49    142s] (I)       GCell Width         :  2800  (dbu)
[08/19 18:05:49    142s] (I)       GCell Height        :  2800  (dbu)
[08/19 18:05:49    142s] (I)       grid                :    57    55    10
[08/19 18:05:49    142s] (I)       vertical capacity   :     0  2800     0  2800     0  2800     0  2800     0  2800
[08/19 18:05:49    142s] (I)       horizontal capacity :     0     0  2800     0  2800     0  2800     0  2800     0
[08/19 18:05:49    142s] (I)       Default wire width  :   140   140   140   280   280   280   800   800  1600  1600
[08/19 18:05:49    142s] (I)       Default wire space  :   130   140   140   280   280   280   800   800  1600  1600
[08/19 18:05:49    142s] (I)       Default pitch size  :   270   380   280   560   560   560  1680  1680  3200  3360
[08/19 18:05:49    142s] (I)       First Track Coord   :     0   190   140   370   700   370  1820  2050  3820  3730
[08/19 18:05:49    142s] (I)       Num tracks per GCell: 10.37  7.37 10.00  5.00  5.00  5.00  1.67  1.67  0.88  0.83
[08/19 18:05:49    142s] (I)       Total num of tracks :     0   423   552   287   275   287    91    95    47    47
[08/19 18:05:49    142s] (I)       Num of masks        :     1     1     1     1     1     1     1     1     1     1
[08/19 18:05:49    142s] (I)       Num of trim masks   :     0     0     0     0     0     0     0     0     0     0
[08/19 18:05:49    142s] (I)       --------------------------------------------------------
[08/19 18:05:49    142s] 
[08/19 18:05:49    142s] [NR-eGR] ============ Routing rule table ============
[08/19 18:05:49    142s] [NR-eGR] Rule id 0. Nets 946 
[08/19 18:05:49    142s] [NR-eGR] id=0  ndrTrackId=0  ndrViaId=-1  extraSpace=0  numShields=0  maxHorDemand=1  maxVerDemand=1
[08/19 18:05:49    142s] [NR-eGR] Pitch:  L1=270  L2=380  L3=280  L4=560  L5=560  L6=560  L7=1680  L8=1680  L9=3200  L10=3360
[08/19 18:05:49    142s] (I)       NumUsedTracks:  L1=1  L2=1  L3=1  L4=1  L5=1  L6=1  L7=1  L8=1  L9=1  L10=1
[08/19 18:05:49    142s] (I)       NumFullyUsedTracks:  L1=1  L2=1  L3=1  L4=1  L5=1  L6=1  L7=1  L8=1  L9=1  L10=1
[08/19 18:05:49    142s] [NR-eGR] ========================================
[08/19 18:05:49    142s] [NR-eGR] 
[08/19 18:05:49    142s] (I)       After initializing earlyGlobalRoute syMemory usage = 1106.0 MB
[08/19 18:05:49    142s] (I)       Loading and dumping file time : 0.02 seconds
[08/19 18:05:49    142s] (I)       ============= Initialization =============
[08/19 18:05:49    142s] (I)       totalPins=3173  totalGlobalPin=3124 (98.46%)
[08/19 18:05:49    142s] (I)       total 2D Cap : 114175 = (53664 H, 60511 V)
[08/19 18:05:49    142s] [NR-eGR] Layer group 1: route 946 net(s) in layer range [2, 10]
[08/19 18:05:49    142s] (I)       ============  Phase 1a Route ============
[08/19 18:05:49    142s] (I)       Phase 1a runs 0.00 seconds
[08/19 18:05:49    142s] (I)       Usage: 3790 = (1949 H, 1841 V) = (3.63% H, 3.04% V) = (2.729e+03um H, 2.577e+03um V)
[08/19 18:05:49    142s] (I)       
[08/19 18:05:49    142s] (I)       ============  Phase 1b Route ============
[08/19 18:05:49    142s] (I)       Usage: 3790 = (1949 H, 1841 V) = (3.63% H, 3.04% V) = (2.729e+03um H, 2.577e+03um V)
[08/19 18:05:49    142s] (I)       
[08/19 18:05:49    142s] (I)       earlyGlobalRoute overflow of layer group 1: 0.00% H + 0.00% V. EstWL: 5.306000e+03um
[08/19 18:05:49    142s] (I)       ============  Phase 1c Route ============
[08/19 18:05:49    142s] (I)       Usage: 3790 = (1949 H, 1841 V) = (3.63% H, 3.04% V) = (2.729e+03um H, 2.577e+03um V)
[08/19 18:05:49    142s] (I)       
[08/19 18:05:49    142s] (I)       ============  Phase 1d Route ============
[08/19 18:05:49    142s] (I)       Usage: 3790 = (1949 H, 1841 V) = (3.63% H, 3.04% V) = (2.729e+03um H, 2.577e+03um V)
[08/19 18:05:49    142s] (I)       
[08/19 18:05:49    142s] (I)       ============  Phase 1e Route ============
[08/19 18:05:49    142s] (I)       Phase 1e runs 0.00 seconds
[08/19 18:05:49    142s] (I)       Usage: 3790 = (1949 H, 1841 V) = (3.63% H, 3.04% V) = (2.729e+03um H, 2.577e+03um V)
[08/19 18:05:49    142s] (I)       
[08/19 18:05:49    142s] [NR-eGR] earlyGlobalRoute overflow of layer group 1: 0.00% H + 0.00% V. EstWL: 5.306000e+03um
[08/19 18:05:49    142s] [NR-eGR] 
[08/19 18:05:49    142s] (I)       ============  Phase 1l Route ============
[08/19 18:05:49    142s] (I)       Phase 1l runs 0.01 seconds
[08/19 18:05:49    142s] (I)       
[08/19 18:05:49    142s] [NR-eGR] Congestion Analysis Layer By layer: (blocked Gcells are excluded) 
[08/19 18:05:49    142s] [NR-eGR]                OverCon            
[08/19 18:05:49    142s] [NR-eGR]                 #Gcell     %Gcell
[08/19 18:05:49    142s] [NR-eGR] Layer              (0)    OverCon 
[08/19 18:05:49    142s] [NR-eGR] ------------------------------------
[08/19 18:05:49    142s] [NR-eGR] Layer1       0( 0.00%)   ( 0.00%) 
[08/19 18:05:49    142s] [NR-eGR] Layer2       0( 0.00%)   ( 0.00%) 
[08/19 18:05:49    142s] [NR-eGR] Layer3       0( 0.00%)   ( 0.00%) 
[08/19 18:05:49    142s] [NR-eGR] Layer4       0( 0.00%)   ( 0.00%) 
[08/19 18:05:49    142s] [NR-eGR] Layer5       0( 0.00%)   ( 0.00%) 
[08/19 18:05:49    142s] [NR-eGR] Layer6       0( 0.00%)   ( 0.00%) 
[08/19 18:05:49    142s] [NR-eGR] Layer7       0( 0.00%)   ( 0.00%) 
[08/19 18:05:49    142s] [NR-eGR] Layer8       0( 0.00%)   ( 0.00%) 
[08/19 18:05:49    142s] [NR-eGR] Layer9       0( 0.00%)   ( 0.00%) 
[08/19 18:05:49    142s] [NR-eGR] Layer10       0( 0.00%)   ( 0.00%) 
[08/19 18:05:49    142s] [NR-eGR] ------------------------------------
[08/19 18:05:49    142s] [NR-eGR] Total        0( 0.00%)   ( 0.00%) 
[08/19 18:05:49    142s] [NR-eGR] 
[08/19 18:05:49    142s] (I)       Total Global Routing Runtime: 0.01 seconds
[08/19 18:05:49    142s] (I)       total 2D Cap : 114472 = (53795 H, 60677 V)
[08/19 18:05:49    142s] [NR-eGR] Overflow after earlyGlobalRoute (GR compatible) 0.00% H + 0.00% V
[08/19 18:05:49    142s] [NR-eGR] Overflow after earlyGlobalRoute 0.00% H + 0.00% V
[08/19 18:05:49    142s] Early Global Route congestion estimation runtime: 0.04 seconds, mem = 1106.0M
[08/19 18:05:49    142s] [hotspot] +------------+---------------+---------------+
[08/19 18:05:49    142s] [hotspot] |            |   max hotspot | total hotspot |
[08/19 18:05:49    142s] [hotspot] +------------+---------------+---------------+
[08/19 18:05:49    142s] [hotspot] | normalized |          0.00 |          0.00 |
[08/19 18:05:49    142s] [hotspot] +------------+---------------+---------------+
[08/19 18:05:49    142s] Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
[08/19 18:05:49    142s] [hotspot] max/total 0.00/0.00, big hotspot (>10) total 0.00
[08/19 18:05:49    142s] Skipped repairing congestion.
[08/19 18:05:49    142s] Starting Early Global Route wiring: mem = 1106.0M
[08/19 18:05:49    142s] (I)       ============= track Assignment ============
[08/19 18:05:49    142s] (I)       extract Global 3D Wires
[08/19 18:05:49    142s] (I)       Extract Global WL : time=0.00
[08/19 18:05:49    142s] (I)       Initialize Greedy Track Assignment (maxPinLayer=Layer11, numCutBoxes=0)
[08/19 18:05:49    142s] (I)       Initialization real time=0.00 seconds
[08/19 18:05:49    142s] (I)       Run Multi-thread track assignment
[08/19 18:05:49    142s] (I)       merging nets...
[08/19 18:05:49    142s] (I)       merging nets done
[08/19 18:05:49    142s] (I)       Kernel real time=0.02 seconds
[08/19 18:05:49    142s] (I)       End Greedy Track Assignment
[08/19 18:05:49    142s] [NR-eGR] --------------------------------------------------------------------------
[08/19 18:05:49    142s] [NR-eGR] Layer1(metal1)(F) length: 0.000000e+00um, number of vias: 3173
[08/19 18:05:49    142s] [NR-eGR] Layer2(metal2)(V) length: 2.165245e+03um, number of vias: 3824
[08/19 18:05:49    142s] [NR-eGR] Layer3(metal3)(H) length: 2.867250e+03um, number of vias: 984
[08/19 18:05:49    142s] [NR-eGR] Layer4(metal4)(V) length: 8.489600e+02um, number of vias: 0
[08/19 18:05:49    142s] [NR-eGR] Layer5(metal5)(H) length: 0.000000e+00um, number of vias: 0
[08/19 18:05:49    142s] [NR-eGR] Layer6(metal6)(V) length: 0.000000e+00um, number of vias: 0
[08/19 18:05:49    142s] [NR-eGR] Layer7(metal7)(H) length: 0.000000e+00um, number of vias: 0
[08/19 18:05:49    142s] [NR-eGR] Layer8(metal8)(V) length: 0.000000e+00um, number of vias: 0
[08/19 18:05:49    142s] [NR-eGR] Layer9(metal9)(H) length: 0.000000e+00um, number of vias: 0
[08/19 18:05:49    142s] [NR-eGR] Layer10(metal10)(V) length: 0.000000e+00um, number of vias: 0
[08/19 18:05:49    142s] [NR-eGR] Total length: 5.881455e+03um, number of vias: 7981
[08/19 18:05:49    142s] [NR-eGR] --------------------------------------------------------------------------
[08/19 18:05:49    142s] [NR-eGR] Total clock nets wire length: 1.099290e+03um 
[08/19 18:05:49    142s] [NR-eGR] --------------------------------------------------------------------------
[08/19 18:05:49    142s] Early Global Route wiring runtime: 0.04 seconds, mem = 1100.5M
[08/19 18:05:49    142s] End of congRepair (cpu=0:00:00.1, real=0:00:00.0)
[08/19 18:05:49    142s] *** Finishing placeDesign default flow ***
[08/19 18:05:49    142s] **placeDesign ... cpu = 0: 0: 7, real = 0: 0: 9, mem = 1100.5M **
[08/19 18:05:49    142s] 
[08/19 18:05:49    142s] *** Summary of all messages that are not suppressed in this session:
[08/19 18:05:49    142s] Severity  ID               Count  Summary                                  
[08/19 18:05:49    142s] WARNING   IMPDC-1629           1  The default delay limit was set to %d. T...
[08/19 18:05:49    142s] WARNING   IMPSP-9025           1  No scan chain specified/traced.          
[08/19 18:05:49    142s] *** Message Summary: 2 warning(s), 0 error(s)
[08/19 18:05:49    142s] 
[08/19 18:06:34    148s] <CMD> pan -4.823 -6.234
[08/19 18:06:37    149s] <CMD> pan 0.824 -11.175
[08/19 18:07:53    160s] <CMD> setDrawView ameba
[08/19 18:07:56    161s] <CMD> pan 0.353 10.587
[08/19 18:07:58    161s] <CMD> deselectAll
[08/19 18:07:58    161s] <CMD> selectObject Module maprca
[08/19 18:07:59    161s] <CMD> deselectAll
[08/19 18:08:03    162s] <CMD> setDrawView place
[08/19 18:08:08    162s] <CMD> setDrawView fplan
[08/19 18:08:10    163s] <CMD> pan 1.149 6.513
[08/19 18:08:12    163s] <CMD> setDrawView place
[08/19 18:08:14    164s] <CMD> panCenter 83.599 34.304
[08/19 18:08:14    164s] <CMD> panCenter 154.183 42.541
[08/19 18:08:15    164s] <CMD> panCenter 224.767 50.778
[08/19 18:08:15    164s] <CMD> panCenter 295.351 59.014
[08/19 18:08:15    164s] <CMD> panCenter 365.935 67.251
[08/19 18:09:03    171s] <CMD> getPinAssignMode -pinEditInBatch -quiet
[08/19 18:12:58    205s] <CMD> setPinAssignMode -pinEditInBatch true
[08/19 18:12:58    205s] <CMD> editPin -fixOverlap 1 -spreadDirection clockwise -side Top -layer 1 -spreadType side -pin {{A[0]} {A[1]} {A[2]} {A[3]} {A[4]} {A[5]} {A[6]} {A[7]} {A[8]} {A[9]} {A[10]} {A[11]} {A[12]} {A[13]} {A[14]} {A[15]} {A[16]} {A[17]} {A[18]} {A[19]} {A[20]} {A[21]} {A[22]} {A[23]} {A[24]} {A[25]} {A[26]} {A[27]} {A[28]} {A[29]} {A[30]} {A[31]} {A[32]} {A[33]} {A[34]} {A[35]} {A[36]} {A[37]} {A[38]} {A[39]} {A[40]} {A[41]} {A[42]} {A[43]} {A[44]} {A[45]} {A[46]} {A[47]} {A[48]} {A[49]} {A[50]} {A[51]} {A[52]} {A[53]} {A[54]} {A[55]} {A[56]} {A[57]} {A[58]} {A[59]} {A[60]} {A[61]} {A[62]} {A[63]} {A[64]} {A[65]} {A[66]} {A[67]} {A[68]} {A[69]} {A[70]} {A[71]} {A[72]} {A[73]} {A[74]} {A[75]} {A[76]} {A[77]} {A[78]} {A[79]} {A[80]} {A[81]} {A[82]} {A[83]} {A[84]} {A[85]} {A[86]} {A[87]} {A[88]} {A[89]} {A[90]} {A[91]} {A[92]} {A[93]} {A[94]} {A[95]} {A[96]} {A[97]} {A[98]} {A[99]} {A[100]} {A[101]} {A[102]} {A[103]} {A[104]} {A[105]} {A[106]} {A[107]} {A[108]} {A[109]} {A[110]} {A[111]} {A[112]} {A[113]} {A[114]} {A[115]} {A[116]} {A[117]} {A[118]} {A[119]} {A[120]} {A[121]} {A[122]} {A[123]} {A[124]} {A[125]} {A[126]} {A[127]}}
[08/19 18:12:58    206s] Successfully spread [128] pins.
[08/19 18:12:58    206s] editPin : finished (cpu = 0:00:00.2 real = 0:00:00.0, mem = 1104.6M).
[08/19 18:12:58    206s] <CMD> setPinAssignMode -pinEditInBatch false
[08/19 18:13:00    206s] <CMD> pan -25.237 -22.877
[08/19 18:13:04    207s] <CMD> pan -1.411 15.999
[08/19 18:13:08    207s] <CMD> getPinAssignMode -pinEditInBatch -quiet
[08/19 18:13:57    215s] **ERROR: (IMPSYT-16268):	Only support 'start' and 'center' spread for single pin.
[08/19 18:13:59    216s] <CMD> setPinAssignMode -pinEditInBatch false
[08/19 18:14:02    216s] <CMD> pan 0.969 13.287
[08/19 18:14:04    217s] <CMD> selectInst {ATMP_reg[85]}
[08/19 18:14:04    217s] Set RLRP Inst: ATMP_reg[85]
[08/19 18:14:06    217s] <CMD> deselectAll
[08/19 18:14:06    217s] <CMD> selectInst {BTMP_reg[100]}
[08/19 18:14:06    217s] Set RLRP Inst: BTMP_reg[100]
[08/19 18:14:06    217s] <CMD> deselectAll
[08/19 18:14:07    217s] <CMD> selectInst {S_reg[33]}
[08/19 18:14:07    217s] Set RLRP Inst: S_reg[33]
[08/19 18:14:08    217s] <CMD> deselectAll
[08/19 18:14:08    217s] <CMD> selectWire 61.7300 2.9200 62.5300 74.3600 10 gnd
[08/19 18:14:08    217s] <CMD> deselectAll
[08/19 18:14:08    217s] <CMD> selectInst {S_reg[11]}
[08/19 18:14:08    217s] Set RLRP Inst: S_reg[11]
[08/19 18:14:09    218s] <CMD> deselectAll
[08/19 18:14:09    218s] <CMD> selectInst {S_reg[74]}
[08/19 18:14:09    218s] Set RLRP Inst: S_reg[74]
[08/19 18:14:10    218s] <CMD> deselectAll
[08/19 18:14:10    218s] <CMD> selectWire 5.1300 67.9550 75.2400 68.1250 1 gnd
[08/19 18:14:11    218s] <CMD> gui_select -rect {9.892 66.431 9.477 62.279}
[08/19 18:14:12    218s] <CMD> gui_select -rect {9.754 57.020 9.616 55.913}
[08/19 18:14:12    218s] <CMD> selectWire 5.1300 53.9550 75.2400 54.1250 1 gnd
[08/19 18:14:13    218s] <CMD> deselectAll
[08/19 18:14:15    219s] <CMD> gui_select -rect {12.383 26.434 20.273 9.964}
[08/19 18:14:15    219s] Set RLRP Inst: ATMP_reg[113]
[08/19 18:14:18    219s] <CMD> deselectAll
[08/19 18:21:33    280s] <CMD> getPinAssignMode -pinEditInBatch -quiet
[08/19 18:21:48    283s] <CMD> setPinAssignMode -pinEditInBatch true
[08/19 18:21:48    283s] <CMD> editPin -fixOverlap 1 -spreadDirection clockwise -side Left -layer 1 -spreadType side -pin {{B[0]} {B[1]} {B[2]} {B[3]} {B[4]} {B[5]} {B[6]} {B[7]} {B[8]} {B[9]} {B[10]} {B[11]} {B[12]} {B[13]} {B[14]} {B[15]} {B[16]} {B[17]} {B[18]} {B[19]} {B[20]} {B[21]} {B[22]} {B[23]} {B[24]} {B[25]} {B[26]} {B[27]} {B[28]} {B[29]} {B[30]} {B[31]} {B[32]} {B[33]} {B[34]} {B[35]} {B[36]} {B[37]} {B[38]} {B[39]} {B[40]} {B[41]} {B[42]} {B[43]} {B[44]} {B[45]} {B[46]} {B[47]} {B[48]} {B[49]} {B[50]} {B[51]} {B[52]} {B[53]} {B[54]} {B[55]} {B[56]} {B[57]} {B[58]} {B[59]} {B[60]} {B[61]} {B[62]} {B[63]} {B[64]} {B[65]} {B[66]} {B[67]} {B[68]} {B[69]} {B[70]} {B[71]} {B[72]} {B[73]} {B[74]} {B[75]} {B[76]} {B[77]} {B[78]} {B[79]} {B[80]} {B[81]} {B[82]} {B[83]} {B[84]} {B[85]} {B[86]} {B[87]} {B[88]} {B[89]} {B[90]} {B[91]} {B[92]} {B[93]} {B[94]} {B[95]} {B[96]} {B[97]} {B[98]} {B[99]} {B[100]} {B[101]} {B[102]} {B[103]} {B[104]} {B[105]} {B[106]} {B[107]} {B[108]} {B[109]} {B[110]} {B[111]} {B[112]} {B[113]} {B[114]} {B[115]} {B[116]} {B[117]} {B[118]} {B[119]} {B[120]} {B[121]} {B[122]} {B[123]} {B[124]} {B[125]} {B[126]} {B[127]}}
[08/19 18:21:48    283s] Successfully spread [128] pins.
[08/19 18:21:48    283s] editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
[08/19 18:21:53    283s] **ERROR: (IMPSYT-16268):	Only support 'start' and 'center' spread for single pin.
[08/19 18:22:15    287s] <CMD> setPinAssignMode -pinEditInBatch true
[08/19 18:22:15    287s] <CMD> editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin Ci
[08/19 18:22:15    287s] Successfully spread [1] pins.
[08/19 18:22:15    287s] editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
[08/19 18:22:23    288s] <CMD> setPinAssignMode -pinEditInBatch true
[08/19 18:22:23    288s] <CMD> editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin CLK
[08/19 18:22:23    288s] Successfully spread [1] pins.
[08/19 18:22:23    288s] editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
[08/19 18:22:23    288s] <CMD> setPinAssignMode -pinEditInBatch false
[08/19 18:22:30    289s] <CMD> getPinAssignMode -pinEditInBatch -quiet
[08/19 18:22:41    291s] <CMD> setPinAssignMode -pinEditInBatch true
[08/19 18:22:41    291s] <CMD> editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Right -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin Co
[08/19 18:22:41    291s] Successfully spread [1] pins.
[08/19 18:22:41    291s] editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
[08/19 18:22:46    292s] <CMD> setPinAssignMode -pinEditInBatch true
[08/19 18:22:46    292s] <CMD> editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType start -spacing 0.14 -start 0.0 0.0 -pin RST
[08/19 18:22:46    292s] Successfully spread [1] pins.
[08/19 18:22:46    292s] editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
[08/19 18:22:46    292s] <CMD> setPinAssignMode -pinEditInBatch false
[08/19 18:22:51    293s] <CMD> getPinAssignMode -pinEditInBatch -quiet
[08/19 18:23:00    295s] <CMD> setPinAssignMode -pinEditInBatch true
[08/19 18:23:00    295s] <CMD> editPin -fixOverlap 1 -spreadDirection clockwise -side Bottom -layer 1 -spreadType side -pin {{S[0]} {S[1]} {S[2]} {S[3]} {S[4]} {S[5]} {S[6]} {S[7]} {S[8]} {S[9]} {S[10]} {S[11]} {S[12]} {S[13]} {S[14]} {S[15]} {S[16]} {S[17]} {S[18]} {S[19]} {S[20]} {S[21]} {S[22]} {S[23]} {S[24]} {S[25]} {S[26]} {S[27]} {S[28]} {S[29]} {S[30]} {S[31]} {S[32]} {S[33]} {S[34]} {S[35]} {S[36]} {S[37]} {S[38]} {S[39]} {S[40]} {S[41]} {S[42]} {S[43]} {S[44]} {S[45]} {S[46]} {S[47]} {S[48]} {S[49]} {S[50]} {S[51]} {S[52]} {S[53]} {S[54]} {S[55]} {S[56]} {S[57]} {S[58]} {S[59]} {S[60]} {S[61]} {S[62]} {S[63]} {S[64]} {S[65]} {S[66]} {S[67]} {S[68]} {S[69]} {S[70]} {S[71]} {S[72]} {S[73]} {S[74]} {S[75]} {S[76]} {S[77]} {S[78]} {S[79]} {S[80]} {S[81]} {S[82]} {S[83]} {S[84]} {S[85]} {S[86]} {S[87]} {S[88]} {S[89]} {S[90]} {S[91]} {S[92]} {S[93]} {S[94]} {S[95]} {S[96]} {S[97]} {S[98]} {S[99]} {S[100]} {S[101]} {S[102]} {S[103]} {S[104]} {S[105]} {S[106]} {S[107]} {S[108]} {S[109]} {S[110]} {S[111]} {S[112]} {S[113]} {S[114]} {S[115]} {S[116]} {S[117]} {S[118]} {S[119]} {S[120]} {S[121]} {S[122]} {S[123]} {S[124]} {S[125]} {S[126]} {S[127]}}
[08/19 18:23:00    295s] Successfully spread [128] pins.
[08/19 18:23:00    295s] editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
[08/19 18:23:01    295s] <CMD> setPinAssignMode -pinEditInBatch true
[08/19 18:23:01    295s] <CMD> editPin -pinWidth 0.07 -pinDepth 0.07 -fixOverlap 1 -spreadDirection clockwise -side Bottom -layer 1 -spreadType side -pin {{S[0]} {S[1]} {S[2]} {S[3]} {S[4]} {S[5]} {S[6]} {S[7]} {S[8]} {S[9]} {S[10]} {S[11]} {S[12]} {S[13]} {S[14]} {S[15]} {S[16]} {S[17]} {S[18]} {S[19]} {S[20]} {S[21]} {S[22]} {S[23]} {S[24]} {S[25]} {S[26]} {S[27]} {S[28]} {S[29]} {S[30]} {S[31]} {S[32]} {S[33]} {S[34]} {S[35]} {S[36]} {S[37]} {S[38]} {S[39]} {S[40]} {S[41]} {S[42]} {S[43]} {S[44]} {S[45]} {S[46]} {S[47]} {S[48]} {S[49]} {S[50]} {S[51]} {S[52]} {S[53]} {S[54]} {S[55]} {S[56]} {S[57]} {S[58]} {S[59]} {S[60]} {S[61]} {S[62]} {S[63]} {S[64]} {S[65]} {S[66]} {S[67]} {S[68]} {S[69]} {S[70]} {S[71]} {S[72]} {S[73]} {S[74]} {S[75]} {S[76]} {S[77]} {S[78]} {S[79]} {S[80]} {S[81]} {S[82]} {S[83]} {S[84]} {S[85]} {S[86]} {S[87]} {S[88]} {S[89]} {S[90]} {S[91]} {S[92]} {S[93]} {S[94]} {S[95]} {S[96]} {S[97]} {S[98]} {S[99]} {S[100]} {S[101]} {S[102]} {S[103]} {S[104]} {S[105]} {S[106]} {S[107]} {S[108]} {S[109]} {S[110]} {S[111]} {S[112]} {S[113]} {S[114]} {S[115]} {S[116]} {S[117]} {S[118]} {S[119]} {S[120]} {S[121]} {S[122]} {S[123]} {S[124]} {S[125]} {S[126]} {S[127]}}
[08/19 18:23:01    295s] Successfully spread [128] pins.
[08/19 18:23:01    295s] editPin : finished (cpu = 0:00:00.0 real = 0:00:00.0, mem = 1104.6M).
[08/19 18:23:01    295s] <CMD> setPinAssignMode -pinEditInBatch false
[08/19 18:23:11    297s] <CMD> pan 1.075 0.459
[08/19 18:23:11    297s] <CMD> panCenter 79.942 76.674
[08/19 18:23:12    297s] <CMD> panCenter 80.523 76.530
[08/19 18:23:39    301s] <CMD> setOptMode -fixCap true -fixTran true -fixFanoutLoad false
[08/19 18:23:39    301s] <CMD> optDesign -postCTS
[08/19 18:23:39    301s] **INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
[08/19 18:23:39    301s] Core basic site is FreePDK45_38x28_10R_NP_162NW_34O
[08/19 18:23:39    301s] Layer info - lib-1st H=1, V=2.  Cell-FPin=1. Top-pin=2
[08/19 18:23:39    301s] #spOpts: mergeVia=F 
[08/19 18:23:39    301s] GigaOpt running with 1 threads.
[08/19 18:23:39    301s] Info: 1 threads available for lower-level modules during optimization.
[08/19 18:23:39    301s] #spOpts: mergeVia=F 
[08/19 18:23:39    301s] Updating RC grid for preRoute extraction ...
[08/19 18:23:39    301s] Initializing multi-corner capacitance tables ... 
[08/19 18:23:39    301s] Initializing multi-corner resistance tables ...
[08/19 18:23:39    301s] 
[08/19 18:23:39    301s] Creating Lib Analyzer ...
[08/19 18:23:39    301s] Total number of usable buffers from Lib Analyzer: 9 ( CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32)
[08/19 18:23:39    301s] Total number of usable inverters from Lib Analyzer: 6 ( INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32)
[08/19 18:23:39    301s] Total number of usable delay cells from Lib Analyzer: 0 ()
[08/19 18:23:39    301s] 
[08/19 18:23:39    302s] Creating Lib Analyzer, finished. 
[08/19 18:23:39    302s] Setting timing_disable_library_data_to_data_checks to 'true'.
[08/19 18:23:39    302s] Setting timing_disable_user_data_to_data_checks to 'true'.
[08/19 18:23:39    302s] Effort level <high> specified for reg2reg path_group
[08/19 18:23:40    302s] **optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 883.6M, totSessionCpu=0:05:03 **
[08/19 18:23:40    302s] Added -handlePreroute to trialRouteMode
[08/19 18:23:40    302s] *** optDesign -postCTS ***
[08/19 18:23:40    302s] DRC Margin: user margin 0.0; extra margin 0.2
[08/19 18:23:40    302s] Hold Target Slack: user slack 0
[08/19 18:23:40    302s] Setup Target Slack: user slack 0; extra slack 0.1
[08/19 18:23:40    302s] setUsefulSkewMode -ecoRoute false
[08/19 18:23:40    302s] No user sequential activity specified, applying default sequential activity of "0.2" for Dynamic Power reporting.
[08/19 18:23:40    302s] Multi-VT timing optimization disabled based on library information.
[08/19 18:23:40    302s] Deleting Cell Server ...
[08/19 18:23:40    302s] Deleting Lib Analyzer.
[08/19 18:23:40    302s] Creating Cell Server ...(0, 0, 0, 0)
[08/19 18:23:40    302s] Summary for sequential cells identification: 
[08/19 18:23:40    302s]   Identified SBFF number: 16
[08/19 18:23:40    302s]   Identified MBFF number: 0
[08/19 18:23:40    302s]   Identified SB Latch number: 0
[08/19 18:23:40    302s]   Identified MB Latch number: 0
[08/19 18:23:40    302s]   Not identified SBFF number: 0
[08/19 18:23:40    302s]   Not identified MBFF number: 0
[08/19 18:23:40    302s]   Not identified SB Latch number: 0
[08/19 18:23:40    302s]   Not identified MB Latch number: 0
[08/19 18:23:40    302s]   Number of sequential cells which are not FFs: 13
[08/19 18:23:40    302s] Creating Cell Server, finished. 
[08/19 18:23:40    302s] 
[08/19 18:23:40    302s] 
[08/19 18:23:40    302s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:23:40    302s]   
[08/19 18:23:40    302s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:23:40    302s]   Deleting Cell Server ...
[08/19 18:23:40    302s] Start to check current routing status for nets...
[08/19 18:23:40    302s] Net A[0] is not routed.
[08/19 18:23:40    302s] All nets will be re-routed.
[08/19 18:23:40    302s] End to check current routing status for nets (mem=1141.4M)
[08/19 18:23:40    302s] ### Creating LA Mngr. totSessionCpu=0:05:03 mem=1141.4M
[08/19 18:23:40    303s] ### Creating LA Mngr, finished. totSessionCpu=0:05:03 mem=1143.4M
[08/19 18:23:40    303s] [NR-eGR] Detected a user setting of 'setTrialRouteModePrv -handlePreroute true' which was ignored.
[08/19 18:23:40    303s] [NR-eGR] Started earlyGlobalRoute kernel
[08/19 18:23:40    303s] [NR-eGR] Initial Peak syMemory usage = 1143.4 MB
[08/19 18:23:40    303s] (I)       Reading DB...
[08/19 18:23:40    303s] (I)       before initializing RouteDB syMemory usage = 1143.4 MB
[08/19 18:23:40    303s] (I)       congestionReportName   : 
[08/19 18:23:40    303s] (I)       layerRangeFor2DCongestion : 
[08/19 18:23:40    303s] (I)       buildTerm2TermWires    : 1
[08/19 18:23:40    303s] (I)       doTrackAssignment      : 1
[08/19 18:23:40    303s] (I)       dumpBookshelfFiles     : 0
[08/19 18:23:40    303s] (I)       numThreads             : 1
[08/19 18:23:40    303s] (I)       bufferingAwareRouting  : false
[08/19 18:23:40    303s] [NR-eGR] honorMsvRouteConstraint: false
[08/19 18:23:40    303s] (I)       honorPin               : false
[08/19 18:23:40    303s] (I)       honorPinGuide          : true
[08/19 18:23:40    303s] (I)       honorPartition         : false
[08/19 18:23:40    303s] (I)       allowPartitionCrossover: false
[08/19 18:23:40    303s] (I)       honorSingleEntry       : true
[08/19 18:23:40    303s] (I)       honorSingleEntryStrong : true
[08/19 18:23:40    303s] (I)       handleViaSpacingRule   : false
[08/19 18:23:40    303s] (I)       handleEolSpacingRule   : false
[08/19 18:23:40    303s] (I)       PDConstraint           : none
[08/19 18:23:40    303s] (I)       expBetterNDRHandling   : false
[08/19 18:23:40    303s] [NR-eGR] honorClockSpecNDR      : 0
[08/19 18:23:40    303s] (I)       routingEffortLevel     : 3
[08/19 18:23:40    303s] (I)       effortLevel            : standard
[08/19 18:23:40    303s] [NR-eGR] minRouteLayer          : 2
[08/19 18:23:40    303s] [NR-eGR] maxRouteLayer          : 127
[08/19 18:23:40    303s] (I)       relaxedTopLayerCeiling : 127
[08/19 18:23:40    303s] (I)       relaxedBottomLayerFloor: 2
[08/19 18:23:40    303s] (I)       numRowsPerGCell        : 1
[08/19 18:23:40    303s] (I)       speedUpLargeDesign     : 0
[08/19 18:23:40    303s] (I)       multiThreadingTA       : 1
[08/19 18:23:40    303s] (I)       blkAwareLayerSwitching : 1
[08/19 18:23:40    303s] (I)       optimizationMode       : false
[08/19 18:23:40    303s] (I)       routeSecondPG          : false
[08/19 18:23:40    303s] (I)       scenicRatioForLayerRelax: 0.00
[08/19 18:23:40    303s] (I)       detourLimitForLayerRelax: 0.00
[08/19 18:23:40    303s] (I)       punchThroughDistance   : 500.00
[08/19 18:23:40    303s] (I)       scenicBound            : 1.15
[08/19 18:23:40    303s] (I)       maxScenicToAvoidBlk    : 100.00
[08/19 18:23:40    303s] (I)       source-to-sink ratio   : 0.00
[08/19 18:23:40    303s] (I)       targetCongestionRatioH : 1.00
[08/19 18:23:40    303s] (I)       targetCongestionRatioV : 1.00
[08/19 18:23:40    303s] (I)       layerCongestionRatio   : 0.70
[08/19 18:23:40    303s] (I)       m1CongestionRatio      : 0.10
[08/19 18:23:40    303s] (I)       m2m3CongestionRatio    : 0.70
[08/19 18:23:40    303s] (I)       localRouteEffort       : 1.00
[08/19 18:23:40    303s] (I)       numSitesBlockedByOneVia: 8.00
[08/19 18:23:40    303s] (I)       supplyScaleFactorH     : 1.00
[08/19 18:23:40    303s] (I)       supplyScaleFactorV     : 1.00
[08/19 18:23:40    303s] (I)       highlight3DOverflowFactor: 0.00
[08/19 18:23:40    303s] (I)       doubleCutViaModelingRatio: 0.00
[08/19 18:23:40    303s] (I)       routeVias              : 
[08/19 18:23:40    303s] (I)       readTROption           : true
[08/19 18:23:40    303s] (I)       extraSpacingFactor     : 1.00
[08/19 18:23:40    303s] [NR-eGR] numTracksPerClockWire  : 0
[08/19 18:23:40    303s] (I)       routeSelectedNetsOnly  : false
[08/19 18:23:40    303s] (I)       clkNetUseMaxDemand     : false
[08/19 18:23:40    303s] (I)       extraDemandForClocks   : 0
[08/19 18:23:40    303s] (I)       steinerRemoveLayers    : false
[08/19 18:23:40    303s] (I)       demoteLayerScenicScale : 1.00
[08/19 18:23:40    303s] (I)       nonpreferLayerCostScale : 100.00
[08/19 18:23:40    303s] (I)       similarTopologyRoutingFast : false
[08/19 18:23:40    303s] (I)       spanningTreeRefinement : false
[08/19 18:23:40    303s] (I)       spanningTreeRefinementAlpha : 0.50
[08/19 18:23:40    303s] (I)       starting read tracks
[08/19 18:23:40    303s] (I)       build grid graph
[08/19 18:23:40    303s] (I)       build grid graph start
[08/19 18:23:40    303s] [NR-eGR] Layer1 has no routable track
[08/19 18:23:40    303s] [NR-eGR] Layer2 has single uniform track structure
[08/19 18:23:40    303s] [NR-eGR] Layer3 has single uniform track structure
[08/19 18:23:40    303s] [NR-eGR] Layer4 has single uniform track structure
[08/19 18:23:40    303s] [NR-eGR] Layer5 has single uniform track structure
[08/19 18:23:40    303s] [NR-eGR] Layer6 has single uniform track structure
[08/19 18:23:40    303s] [NR-eGR] Layer7 has single uniform track structure
[08/19 18:23:40    303s] [NR-eGR] Layer8 has single uniform track structure
[08/19 18:23:40    303s] [NR-eGR] Layer9 has single uniform track structure
[08/19 18:23:40    303s] [NR-eGR] Layer10 has single uniform track structure
[08/19 18:23:40    303s] (I)       build grid graph end
[08/19 18:23:40    303s] (I)       numViaLayers=10
[08/19 18:23:40    303s] (I)       Reading via via1_8 for layer: 0 
[08/19 18:23:40    303s] (I)       Reading via via2_8 for layer: 1 
[08/19 18:23:40    303s] (I)       Reading via via3_2 for layer: 2 
[08/19 18:23:40    303s] (I)       Reading via via4_0 for layer: 3 
[08/19 18:23:40    303s] (I)       Reading via via5_0 for layer: 4 
[08/19 18:23:40    303s] (I)       Reading via via6_0 for layer: 5 
[08/19 18:23:40    303s] (I)       Reading via via7_0 for layer: 6 
[08/19 18:23:40    303s] (I)       Reading via via8_0 for layer: 7 
[08/19 18:23:40    303s] (I)       Reading via via9_0 for layer: 8 
[08/19 18:23:40    303s] (I)       end build via table
[08/19 18:23:40    303s] [NR-eGR] numRoutingBlks=0 numInstBlks=0 numPGBlocks=1720 numBumpBlks=0 numBoundaryFakeBlks=0
[08/19 18:23:40    303s] [NR-eGR] numPreroutedNet = 0  numPreroutedWires = 0
[08/19 18:23:40    303s] (I)       readDataFromPlaceDB
[08/19 18:23:40    303s] (I)       Read net information..
[08/19 18:23:40    303s] [NR-eGR] Read numTotalNets=1333  numIgnoredNets=0
[08/19 18:23:40    303s] (I)       Read testcase time = 0.000 seconds
[08/19 18:23:40    303s] 
[08/19 18:23:40    303s] (I)       read default dcut vias
[08/19 18:23:40    303s] (I)       Reading via via1_8 for layer: 0 
[08/19 18:23:40    303s] (I)       Reading via via2_8 for layer: 1 
[08/19 18:23:40    303s] (I)       Reading via via3_2 for layer: 2 
[08/19 18:23:40    303s] (I)       Reading via via4_0 for layer: 3 
[08/19 18:23:40    303s] (I)       Reading via via5_0 for layer: 4 
[08/19 18:23:40    303s] (I)       Reading via via6_0 for layer: 5 
[08/19 18:23:40    303s] (I)       Reading via via7_0 for layer: 6 
[08/19 18:23:40    303s] (I)       Reading via via8_0 for layer: 7 
[08/19 18:23:40    303s] (I)       Reading via via9_0 for layer: 8 
[08/19 18:23:40    303s] (I)       build grid graph start
[08/19 18:23:40    303s] (I)       build grid graph end
[08/19 18:23:40    303s] (I)       Model blockage into capacity
[08/19 18:23:40    303s] (I)       Read numBlocks=1720  numPreroutedWires=0  numCapScreens=0
[08/19 18:23:40    303s] (I)       blocked area on Layer1 : 0  (0.00%)
[08/19 18:23:40    303s] (I)       blocked area on Layer2 : 255192000  (1.03%)
[08/19 18:23:40    303s] (I)       blocked area on Layer3 : 309523200  (1.25%)
[08/19 18:23:40    303s] (I)       blocked area on Layer4 : 430416000  (1.73%)
[08/19 18:23:40    303s] (I)       blocked area on Layer5 : 499564800  (2.01%)
[08/19 18:23:40    303s] (I)       blocked area on Layer6 : 540411200  (2.18%)
[08/19 18:23:40    303s] (I)       blocked area on Layer7 : 2007040000  (8.08%)
[08/19 18:23:40    303s] (I)       blocked area on Layer8 : 2195200000  (8.84%)
[08/19 18:23:40    303s] (I)       blocked area on Layer9 : 10610688000  (42.71%)
[08/19 18:23:40    303s] (I)       blocked area on Layer10 : 13178880000  (53.05%)
[08/19 18:23:40    303s] (I)       Modeling time = 0.000 seconds
[08/19 18:23:40    303s] 
[08/19 18:23:40    303s] (I)       Number of ignored nets = 0
[08/19 18:23:40    303s] (I)       Number of fixed nets = 0.  Ignored: Yes
[08/19 18:23:40    303s] (I)       Number of clock nets = 1.  Ignored: No
[08/19 18:23:40    303s] (I)       Number of analog nets = 0.  Ignored: Yes
[08/19 18:23:40    303s] (I)       Number of special nets = 0.  Ignored: Yes
[08/19 18:23:40    303s] (I)       Number of mixed signal nets = 0.  Ignored: Yes
[08/19 18:23:40    303s] (I)       Number of skip routing nets = 0.  Ignored: Yes
[08/19 18:23:40    303s] (I)       Number of nets with ignore route flag = 0.  Ignored: No
[08/19 18:23:40    303s] (I)       Number of nets with one or no pins = 0.  Ignored: Yes
[08/19 18:23:40    303s] (I)       Number of two pin nets which has pins at the same location = 0.  Ignored: Yes
[08/19 18:23:40    303s] [NR-eGR] There are 1 clock nets ( 0 with NDR ).
[08/19 18:23:40    303s] (I)       Before initializing earlyGlobalRoute syMemory usage = 1143.4 MB
[08/19 18:23:40    303s] (I)       Ndr track 0 does not exist
[08/19 18:23:40    303s] (I)       Layer1  viaCost=200.00
[08/19 18:23:40    303s] (I)       Layer2  viaCost=200.00
[08/19 18:23:40    303s] (I)       Layer3  viaCost=100.00
[08/19 18:23:40    303s] (I)       Layer4  viaCost=100.00
[08/19 18:23:40    303s] (I)       Layer5  viaCost=100.00
[08/19 18:23:40    303s] (I)       Layer6  viaCost=100.00
[08/19 18:23:40    303s] (I)       Layer7  viaCost=100.00
[08/19 18:23:40    303s] (I)       Layer8  viaCost=100.00
[08/19 18:23:40    303s] (I)       Layer9  viaCost=100.00
[08/19 18:23:40    303s] (I)       ---------------------Grid Graph Info--------------------
[08/19 18:23:40    303s] (I)       routing area        :  (0, 0) - (160740, 154560)
[08/19 18:23:40    303s] (I)       core area           :  (10260, 10080) - (150480, 144480)
[08/19 18:23:40    303s] (I)       Site Width          :   380  (dbu)
[08/19 18:23:40    303s] (I)       Row Height          :  2800  (dbu)
[08/19 18:23:40    303s] (I)       GCell Width         :  2800  (dbu)
[08/19 18:23:40    303s] (I)       GCell Height        :  2800  (dbu)
[08/19 18:23:40    303s] (I)       grid                :    57    55    10
[08/19 18:23:40    303s] (I)       vertical capacity   :     0  2800     0  2800     0  2800     0  2800     0  2800
[08/19 18:23:40    303s] (I)       horizontal capacity :     0     0  2800     0  2800     0  2800     0  2800     0
[08/19 18:23:40    303s] (I)       Default wire width  :   140   140   140   280   280   280   800   800  1600  1600
[08/19 18:23:40    303s] (I)       Default wire space  :   130   140   140   280   280   280   800   800  1600  1600
[08/19 18:23:40    303s] (I)       Default pitch size  :   270   380   280   560   560   560  1680  1680  3200  3360
[08/19 18:23:40    303s] (I)       First Track Coord   :     0   190   140   370   700   370  1820  2050  3820  3730
[08/19 18:23:40    303s] (I)       Num tracks per GCell: 10.37  7.37 10.00  5.00  5.00  5.00  1.67  1.67  0.88  0.83
[08/19 18:23:40    303s] (I)       Total num of tracks :     0   423   552   287   275   287    91    95    47    47
[08/19 18:23:40    303s] (I)       Num of masks        :     1     1     1     1     1     1     1     1     1     1
[08/19 18:23:40    303s] (I)       Num of trim masks   :     0     0     0     0     0     0     0     0     0     0
[08/19 18:23:40    303s] (I)       --------------------------------------------------------
[08/19 18:23:40    303s] 
[08/19 18:23:40    303s] [NR-eGR] ============ Routing rule table ============
[08/19 18:23:40    303s] [NR-eGR] Rule id 0. Nets 1333 
[08/19 18:23:40    303s] [NR-eGR] id=0  ndrTrackId=0  ndrViaId=-1  extraSpace=0  numShields=0  maxHorDemand=1  maxVerDemand=1
[08/19 18:23:40    303s] [NR-eGR] Pitch:  L1=270  L2=380  L3=280  L4=560  L5=560  L6=560  L7=1680  L8=1680  L9=3200  L10=3360
[08/19 18:23:40    303s] (I)       NumUsedTracks:  L1=1  L2=1  L3=1  L4=1  L5=1  L6=1  L7=1  L8=1  L9=1  L10=1
[08/19 18:23:40    303s] (I)       NumFullyUsedTracks:  L1=1  L2=1  L3=1  L4=1  L5=1  L6=1  L7=1  L8=1  L9=1  L10=1
[08/19 18:23:40    303s] [NR-eGR] ========================================
[08/19 18:23:40    303s] [NR-eGR] 
[08/19 18:23:40    303s] (I)       After initializing earlyGlobalRoute syMemory usage = 1143.4 MB
[08/19 18:23:40    303s] (I)       Loading and dumping file time : 0.03 seconds
[08/19 18:23:40    303s] (I)       ============= Initialization =============
[08/19 18:23:40    303s] (I)       totalPins=3948  totalGlobalPin=3899 (98.76%)
[08/19 18:23:40    303s] (I)       total 2D Cap : 114175 = (53664 H, 60511 V)
[08/19 18:23:40    303s] [NR-eGR] Layer group 1: route 1333 net(s) in layer range [2, 10]
[08/19 18:23:40    303s] (I)       ============  Phase 1a Route ============
[08/19 18:23:40    303s] (I)       Phase 1a runs 0.00 seconds
[08/19 18:23:40    303s] (I)       Usage: 21120 = (9810 H, 11310 V) = (18.28% H, 18.69% V) = (1.373e+04um H, 1.583e+04um V)
[08/19 18:23:40    303s] (I)       
[08/19 18:23:40    303s] (I)       ============  Phase 1b Route ============
[08/19 18:23:40    303s] (I)       Usage: 21120 = (9810 H, 11310 V) = (18.28% H, 18.69% V) = (1.373e+04um H, 1.583e+04um V)
[08/19 18:23:40    303s] (I)       
[08/19 18:23:40    303s] (I)       earlyGlobalRoute overflow of layer group 1: 0.03% H + 0.00% V. EstWL: 2.956800e+04um
[08/19 18:23:40    303s] (I)       ============  Phase 1c Route ============
[08/19 18:23:40    303s] (I)       Usage: 21120 = (9810 H, 11310 V) = (18.28% H, 18.69% V) = (1.373e+04um H, 1.583e+04um V)
[08/19 18:23:40    303s] (I)       
[08/19 18:23:40    303s] (I)       ============  Phase 1d Route ============
[08/19 18:23:40    303s] (I)       Usage: 21120 = (9810 H, 11310 V) = (18.28% H, 18.69% V) = (1.373e+04um H, 1.583e+04um V)
[08/19 18:23:40    303s] (I)       
[08/19 18:23:40    303s] (I)       ============  Phase 1e Route ============
[08/19 18:23:40    303s] (I)       Phase 1e runs 0.00 seconds
[08/19 18:23:40    303s] (I)       Usage: 21120 = (9810 H, 11310 V) = (18.28% H, 18.69% V) = (1.373e+04um H, 1.583e+04um V)
[08/19 18:23:40    303s] (I)       
[08/19 18:23:40    303s] [NR-eGR] earlyGlobalRoute overflow of layer group 1: 0.03% H + 0.00% V. EstWL: 2.956800e+04um
[08/19 18:23:40    303s] [NR-eGR] 
[08/19 18:23:40    303s] (I)       ============  Phase 1l Route ============
[08/19 18:23:40    303s] (I)       Phase 1l runs 0.01 seconds
[08/19 18:23:40    303s] (I)       
[08/19 18:23:40    303s] [NR-eGR] Congestion Analysis Layer By layer: (blocked Gcells are excluded) 
[08/19 18:23:40    303s] [NR-eGR]                OverCon            
[08/19 18:23:40    303s] [NR-eGR]                 #Gcell     %Gcell
[08/19 18:23:40    303s] [NR-eGR] Layer              (2)    OverCon 
[08/19 18:23:40    303s] [NR-eGR] ------------------------------------
[08/19 18:23:40    303s] [NR-eGR] Layer1       0( 0.00%)   ( 0.00%) 
[08/19 18:23:40    303s] [NR-eGR] Layer2       0( 0.00%)   ( 0.00%) 
[08/19 18:23:40    303s] [NR-eGR] Layer3       2( 0.06%)   ( 0.06%) 
[08/19 18:23:40    303s] [NR-eGR] Layer4       0( 0.00%)   ( 0.00%) 
[08/19 18:23:40    303s] [NR-eGR] Layer5       5( 0.16%)   ( 0.16%) 
[08/19 18:23:40    303s] [NR-eGR] Layer6       2( 0.06%)   ( 0.06%) 
[08/19 18:23:40    303s] [NR-eGR] Layer7       0( 0.00%)   ( 0.00%) 
[08/19 18:23:40    303s] [NR-eGR] Layer8       0( 0.00%)   ( 0.00%) 
[08/19 18:23:40    303s] [NR-eGR] Layer9       0( 0.00%)   ( 0.00%) 
[08/19 18:23:40    303s] [NR-eGR] Layer10       0( 0.00%)   ( 0.00%) 
[08/19 18:23:40    303s] [NR-eGR] ------------------------------------
[08/19 18:23:40    303s] [NR-eGR] Total        9( 0.04%)   ( 0.04%) 
[08/19 18:23:40    303s] [NR-eGR] 
[08/19 18:23:40    303s] (I)       Total Global Routing Runtime: 0.02 seconds
[08/19 18:23:40    303s] (I)       total 2D Cap : 114472 = (53795 H, 60677 V)
[08/19 18:23:40    303s] [NR-eGR] Overflow after earlyGlobalRoute (GR compatible) 0.06% H + 0.00% V
[08/19 18:23:40    303s] [NR-eGR] Overflow after earlyGlobalRoute 0.08% H + 0.00% V
[08/19 18:23:40    303s] (I)       ============= track Assignment ============
[08/19 18:23:40    303s] (I)       extract Global 3D Wires
[08/19 18:23:40    303s] (I)       Extract Global WL : time=0.00
[08/19 18:23:40    303s] (I)       Initialize Greedy Track Assignment (maxPinLayer=Layer11, numCutBoxes=0)
[08/19 18:23:40    303s] (I)       Initialization real time=0.00 seconds
[08/19 18:23:40    303s] (I)       Run Multi-thread track assignment
[08/19 18:23:40    303s] (I)       merging nets...
[08/19 18:23:40    303s] (I)       merging nets done
[08/19 18:23:40    303s] (I)       Kernel real time=0.03 seconds
[08/19 18:23:40    303s] (I)       End Greedy Track Assignment
[08/19 18:23:40    303s] [NR-eGR] --------------------------------------------------------------------------
[08/19 18:23:40    303s] [NR-eGR] Layer1(metal1)(F) length: 0.000000e+00um, number of vias: 3948
[08/19 18:23:40    303s] [NR-eGR] Layer2(metal2)(V) length: 4.152410e+03um, number of vias: 4691
[08/19 18:23:40    303s] [NR-eGR] Layer3(metal3)(H) length: 9.238400e+03um, number of vias: 1648
[08/19 18:23:40    303s] [NR-eGR] Layer4(metal4)(V) length: 6.401675e+03um, number of vias: 296
[08/19 18:23:40    303s] [NR-eGR] Layer5(metal5)(H) length: 4.430010e+03um, number of vias: 292
[08/19 18:23:40    303s] [NR-eGR] Layer6(metal6)(V) length: 5.745860e+03um, number of vias: 26
[08/19 18:23:40    303s] [NR-eGR] Layer7(metal7)(H) length: 4.962600e+02um, number of vias: 12
[08/19 18:23:40    303s] [NR-eGR] Layer8(metal8)(V) length: 3.242400e+02um, number of vias: 0
[08/19 18:23:40    303s] [NR-eGR] Layer9(metal9)(H) length: 0.000000e+00um, number of vias: 0
[08/19 18:23:40    303s] [NR-eGR] Layer10(metal10)(V) length: 0.000000e+00um, number of vias: 0
[08/19 18:23:40    303s] [NR-eGR] Total length: 3.078886e+04um, number of vias: 10913
[08/19 18:23:40    303s] [NR-eGR] --------------------------------------------------------------------------
[08/19 18:23:40    303s] [NR-eGR] Total clock nets wire length: 1.131225e+03um 
[08/19 18:23:40    303s] [NR-eGR] --------------------------------------------------------------------------
[08/19 18:23:40    303s] [NR-eGR] End Peak syMemory usage = 1139.4 MB
[08/19 18:23:40    303s] [NR-eGR] Early Global Router Kernel+IO runtime : 0.10 seconds
[08/19 18:23:40    303s] ### Creating LA Mngr. totSessionCpu=0:05:03 mem=1139.4M
[08/19 18:23:40    303s] Updating RC grid for preRoute extraction ...
[08/19 18:23:40    303s] Initializing multi-corner capacitance tables ... 
[08/19 18:23:40    303s] Initializing multi-corner resistance tables ...
[08/19 18:23:41    303s] ### Creating LA Mngr, finished. totSessionCpu=0:05:04 mem=1139.4M
[08/19 18:23:41    303s] Extraction called for design 'SUM' of instances=1074 and nets=1335 using extraction engine 'preRoute' .
[08/19 18:23:41    303s] **WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
[08/19 18:23:41    303s] Type 'man IMPEXT-3530' for more detail.
[08/19 18:23:41    303s] PreRoute RC Extraction called for design SUM.
[08/19 18:23:41    303s] RC Extraction called in multi-corner(1) mode.
[08/19 18:23:41    303s] RCMode: PreRoute
[08/19 18:23:41    303s]       RC Corner Indexes            0   
[08/19 18:23:41    303s] Capacitance Scaling Factor   : 1.00000 
[08/19 18:23:41    303s] Resistance Scaling Factor    : 1.00000 
[08/19 18:23:41    303s] Clock Cap. Scaling Factor    : 1.00000 
[08/19 18:23:41    303s] Clock Res. Scaling Factor    : 1.00000 
[08/19 18:23:41    303s] Shrink Factor                : 1.00000
[08/19 18:23:41    303s] PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
[08/19 18:23:41    303s] Using capacitance table file ...
[08/19 18:23:41    303s] Updating RC grid for preRoute extraction ...
[08/19 18:23:41    303s] Initializing multi-corner capacitance tables ... 
[08/19 18:23:41    303s] Initializing multi-corner resistance tables ...
[08/19 18:23:41    303s] PreRoute RC Extraction DONE (CPU Time: 0:00:00.0  Real Time: 0:00:00.0  MEM: 1139.367M)
[08/19 18:23:41    303s] 
[08/19 18:23:41    303s] Footprint cell infomation for calculating maxBufDist
[08/19 18:23:41    303s] *info: There are 9 candidate Buffer cells
[08/19 18:23:41    303s] *info: There are 6 candidate Inverter cells
[08/19 18:23:41    303s] 
[08/19 18:23:42    304s] Compute RC Scale Done ...
[08/19 18:23:42    304s] #################################################################################
[08/19 18:23:42    304s] # Design Stage: PreRoute
[08/19 18:23:42    304s] # Design Name: SUM
[08/19 18:23:42    304s] # Design Mode: 90nm
[08/19 18:23:42    304s] # Analysis Mode: MMMC Non-OCV 
[08/19 18:23:42    304s] # Parasitics Mode: No SPEF/RCDB
[08/19 18:23:42    304s] # Signoff Settings: SI Off 
[08/19 18:23:42    304s] #################################################################################
[08/19 18:23:42    304s] Calculate delays in Single mode...
[08/19 18:23:42    304s] Topological Sorting (REAL = 0:00:00.0, MEM = 1358.7M, InitMEM = 1358.7M)
[08/19 18:23:42    304s] Start delay calculation (fullDC) (1 T). (MEM=1358.66)
[08/19 18:23:42    305s] End AAE Lib Interpolated Model. (MEM=1374.8 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:23:43    305s] Total number of fetched objects 1719
[08/19 18:23:43    305s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:23:43    305s] End delay calculation. (MEM=1382.79 CPU=0:00:00.6 REAL=0:00:01.0)
[08/19 18:23:43    305s] End delay calculation (fullDC). (MEM=1382.79 CPU=0:00:00.8 REAL=0:00:01.0)
[08/19 18:23:43    305s] *** CDM Built up (cpu=0:00:00.9  real=0:00:01.0  mem= 1382.8M) ***
[08/19 18:23:43    305s] *** Done Building Timing Graph (cpu=0:00:01.0 real=0:00:01.0 totSessionCpu=0:05:06 mem=1382.8M)
[08/19 18:23:43    305s] 
------------------------------------------------------------
             Initial Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.022  |  0.022  |  2.394  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      1 (1)       |   -0.752   |      1 (1)       |
|   max_tran     |     1 (387)      |   -1.775   |     1 (387)      |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 59.304%
------------------------------------------------------------
**optDesign ... cpu = 0:00:03, real = 0:00:03, mem = 983.6M, totSessionCpu=0:05:06 **
[08/19 18:23:43    305s] ** INFO : this run is activating low effort ccoptDesign flow
[08/19 18:23:43    305s] PhyDesignGrid: maxLocalDensity 0.98
[08/19 18:23:43    305s] ### Creating PhyDesignMc. totSessionCpu=0:05:06 mem=1240.5M
[08/19 18:23:43    305s] #spOpts: mergeVia=F 
[08/19 18:23:43    305s] ### Creating PhyDesignMc, finished. totSessionCpu=0:05:06 mem=1240.5M
[08/19 18:23:43    306s] *** Starting optimizing excluded clock nets MEM= 1241.5M) ***
[08/19 18:23:43    306s] *info: There are no clock nets marked defIn, clock nets will not be optimized.
*info: No excluded clock nets to be optimized.
*** Finished optimizing excluded clock nets (CPU Time= 0:00:00.0  MEM= 1241.5M) ***
[08/19 18:23:43    306s] *** Starting optimizing excluded clock nets MEM= 1241.5M) ***
[08/19 18:23:43    306s] *info: There are no clock nets marked defIn, clock nets will not be optimized.
*info: No excluded clock nets to be optimized.
*** Finished optimizing excluded clock nets (CPU Time= 0:00:00.0  MEM= 1241.5M) ***
[08/19 18:23:43    306s] Begin: GigaOpt DRV Optimization
[08/19 18:23:43    306s] Info: 1 clock net  excluded from IPO operation.
[08/19 18:23:43    306s] PhyDesignGrid: maxLocalDensity 0.98
[08/19 18:23:43    306s] ### Creating PhyDesignMc. totSessionCpu=0:05:06 mem=1249.5M
[08/19 18:23:43    306s] ### Creating PhyDesignMc, finished. totSessionCpu=0:05:06 mem=1249.5M
[08/19 18:23:43    306s] 
[08/19 18:23:43    306s] Creating Lib Analyzer ...
[08/19 18:23:43    306s] Total number of usable buffers from Lib Analyzer: 9 ( CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32)
[08/19 18:23:43    306s] Total number of usable inverters from Lib Analyzer: 6 ( INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32)
[08/19 18:23:43    306s] Total number of usable delay cells from Lib Analyzer: 0 ()
[08/19 18:23:43    306s] 
[08/19 18:23:44    306s] Creating Lib Analyzer, finished. 
[08/19 18:23:44    306s] 
[08/19 18:23:44    306s] #optDebug: {2, 1.000, 0.8500} {3, 0.503, 0.8431} {4, 0.503, 0.8431} {5, 0.379, 0.6885} {6, 0.130, 0.4315} {7, 0.130, 0.4315} {8, 0.043, 0.3555} {9, 0.043, 0.3555} {10, 0.022, 0.3376} 
[08/19 18:23:44    306s] ### Creating LA Mngr. totSessionCpu=0:05:07 mem=1249.5M
[08/19 18:23:44    306s] ### Creating LA Mngr, finished. totSessionCpu=0:05:07 mem=1249.5M
[08/19 18:23:45    307s] +-------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:23:45    307s] |        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
[08/19 18:23:45    307s] +-------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:23:45    307s] | nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
[08/19 18:23:45    307s] +-------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:23:45    307s] Info: violation cost 6178.323242 (cap = 15.724482, tran = 6158.598633, len = 0.000000, fanout load = 0.000000, fanout count = 4.000000, glitch 0.000000)
[08/19 18:23:45    307s] |     1|   387|    -1.81|     1|     1|    -0.76|     0|     0|     0|     0|     0.02|     0.00|       0|       0|       0|  59.30|          |         |
[08/19 18:23:45    308s] Info: violation cost 0.000000 (cap = 0.000000, tran = 0.000000, len = 0.000000, fanout load = 0.000000, fanout count = 0.000000, glitch 0.000000)
[08/19 18:23:45    308s] |     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.02|     0.00|       7|       0|       1|  59.49| 0:00:00.0|  1402.8M|
[08/19 18:23:45    308s] Info: violation cost 0.000000 (cap = 0.000000, tran = 0.000000, len = 0.000000, fanout load = 0.000000, fanout count = 0.000000, glitch 0.000000)
[08/19 18:23:45    308s] |     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.02|     0.00|       0|       0|       0|  59.49| 0:00:00.0|  1402.8M|
[08/19 18:23:45    308s] +-------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:23:45    308s] **** Begin NDR-Layer Usage Statistics ****
[08/19 18:23:45    308s] 0 Ndr or Layer constraints added by optimization 
[08/19 18:23:45    308s] **** End NDR-Layer Usage Statistics ****
[08/19 18:23:45    308s] 
[08/19 18:23:45    308s] *** Finish DRV Fixing (cpu=0:00:00.6 real=0:00:00.0 mem=1402.8M) ***
[08/19 18:23:45    308s] 
[08/19 18:23:45    308s] *** Starting refinePlace (0:05:08 mem=1418.8M) ***
[08/19 18:23:45    308s] Total net bbox length = 2.868e+04 (1.324e+04 1.543e+04) (ext = 2.469e+04)
[08/19 18:23:45    308s] Move report: placeLevelShifters moves 0 insts, mean move: 0.00 um, max move: 0.00 um
[08/19 18:23:45    308s] **WARN: (IMPSP-5140):	Global net connect rules have not been created. Added  insts would have no supply connectivity, and would fail DRC.
[08/19 18:23:45    308s] Type 'man IMPSP-5140' for more detail.
[08/19 18:23:45    308s] **WARN: (IMPSP-315):	Found 1081 instances insts with no PG Term connections.
[08/19 18:23:45    308s] Type 'man IMPSP-315' for more detail.
[08/19 18:23:45    308s] default core: bins with density >  0.75 =    0 % ( 0 / 25 )
[08/19 18:23:45    308s] Density distribution unevenness ratio = 2.378%
[08/19 18:23:45    308s] RPlace IncrNP Skipped
[08/19 18:23:45    308s] [CPU] RefinePlace/IncrNP (cpu=0:00:00.0, real=0:00:00.0, mem=1418.8MB) @(0:05:08 - 0:05:08).
[08/19 18:23:45    308s] Starting refinePlace ...
[08/19 18:23:45    308s] default core: bins with density >  0.75 =    0 % ( 0 / 25 )
[08/19 18:23:45    308s] Density distribution unevenness ratio = 2.378%
[08/19 18:23:45    308s]   Spread Effort: high, pre-route mode, useDDP on.
[08/19 18:23:45    308s] [CPU] RefinePlace/preRPlace (cpu=0:00:00.0, real=0:00:00.0, mem=1418.8MB) @(0:05:08 - 0:05:08).
[08/19 18:23:45    308s] Move report: preRPlace moves 0 insts, mean move: 0.00 um, max move: 0.00 um
[08/19 18:23:45    308s] wireLenOptFixPriorityInst 0 inst fixed
[08/19 18:23:45    308s] Move report: legalization moves 8 insts, mean move: 1.26 um, max move: 1.78 um
[08/19 18:23:45    308s] 	Max move on inst (FE_OFC2_n386): (32.49, 59.64) --> (32.87, 61.04)
[08/19 18:23:45    308s] [CPU] RefinePlace/Legalization (cpu=0:00:00.0, real=0:00:00.0, mem=1421.9MB) @(0:05:08 - 0:05:08).
[08/19 18:23:45    308s] Move report: Detail placement moves 8 insts, mean move: 1.26 um, max move: 1.78 um
[08/19 18:23:45    308s] 	Max move on inst (FE_OFC2_n386): (32.49, 59.64) --> (32.87, 61.04)
[08/19 18:23:45    308s] 	Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1421.9MB
[08/19 18:23:45    308s] Statistics of distance of Instance movement in refine placement:
[08/19 18:23:45    308s]   maximum (X+Y) =         1.78 um
[08/19 18:23:45    308s]   inst (FE_OFC2_n386) with max move: (32.49, 59.64) -> (32.87, 61.04)
[08/19 18:23:45    308s]   mean    (X+Y) =         1.26 um
[08/19 18:23:45    308s] Summary Report:
[08/19 18:23:45    308s] Instances move: 8 (out of 1081 movable)
[08/19 18:23:45    308s] Instances flipped: 0
[08/19 18:23:45    308s] Mean displacement: 1.26 um
[08/19 18:23:45    308s] Max displacement: 1.78 um (Instance: FE_OFC2_n386) (32.49, 59.64) -> (32.87, 61.04)
[08/19 18:23:45    308s] 	Length: 4 sites, height: 1 rows, site name: FreePDK45_38x28_10R_NP_162NW_34O, cell type: BUF_X2
[08/19 18:23:45    308s] Total instances moved : 8
[08/19 18:23:45    308s] Total net bbox length = 2.868e+04 (1.325e+04 1.543e+04) (ext = 2.469e+04)
[08/19 18:23:45    308s] Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1421.9MB
[08/19 18:23:45    308s] [CPU] RefinePlace/total (cpu=0:00:00.0, real=0:00:00.0, mem=1421.9MB) @(0:05:08 - 0:05:08).
[08/19 18:23:45    308s] *** Finished refinePlace (0:05:08 mem=1421.9M) ***
[08/19 18:23:45    308s] *** maximum move = 1.78 um ***
[08/19 18:23:45    308s] *** Finished re-routing un-routed nets (1421.9M) ***
[08/19 18:23:45    308s] 
[08/19 18:23:45    308s] *** Finish Physical Update (cpu=0:00:00.1 real=0:00:00.0 mem=1421.9M) ***
[08/19 18:23:45    308s] End: GigaOpt DRV Optimization
[08/19 18:23:45    308s] GigaOpt DRV: restore maxLocalDensity to 0.98
[08/19 18:23:45    308s] 
------------------------------------------------------------
     Summary (cpu=0.04min real=0.03min mem=1259.0M)                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.022  |  0.022  |  3.880  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 59.485%
Routing Overflow: 0.08% H and 0.00% V
------------------------------------------------------------
**optDesign ... cpu = 0:00:06, real = 0:00:05, mem = 996.6M, totSessionCpu=0:05:08 **
[08/19 18:23:45    308s] 
[08/19 18:23:45    308s] Active setup views:
[08/19 18:23:45    308s]  default
[08/19 18:23:45    308s]   Dominating endpoints: 0
[08/19 18:23:45    308s]   Dominating TNS: -0.000
[08/19 18:23:45    308s] 
[08/19 18:23:45    308s] *** Timing NOT met, worst failing slack is 0.022
[08/19 18:23:45    308s] *** Check timing (0:00:00.0)
[08/19 18:23:45    308s] Deleting Lib Analyzer.
[08/19 18:23:45    308s] **INFO: Flow update: Design timing is met.
[08/19 18:23:46    308s] **INFO: Flow update: Design timing is met.
[08/19 18:23:46    308s] **INFO: Flow update: Design timing is met.
[08/19 18:23:46    308s] Info: 1 clock net  excluded from IPO operation.
[08/19 18:23:46    308s] ### Creating LA Mngr. totSessionCpu=0:05:09 mem=1255.0M
[08/19 18:23:46    308s] ### Creating LA Mngr, finished. totSessionCpu=0:05:09 mem=1255.0M
[08/19 18:23:46    308s] Begin: Area Reclaim Optimization
[08/19 18:23:46    308s] 
[08/19 18:23:46    308s] Creating Lib Analyzer ...
[08/19 18:23:46    308s] Total number of usable buffers from Lib Analyzer: 9 ( CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32)
[08/19 18:23:46    308s] Total number of usable inverters from Lib Analyzer: 6 ( INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32)
[08/19 18:23:46    308s] Total number of usable delay cells from Lib Analyzer: 0 ()
[08/19 18:23:46    308s] 
[08/19 18:23:46    309s] Creating Lib Analyzer, finished. 
[08/19 18:23:46    309s] PhyDesignGrid: maxLocalDensity 0.98
[08/19 18:23:46    309s] ### Creating PhyDesignMc. totSessionCpu=0:05:09 mem=1408.5M
[08/19 18:23:46    309s] ### Creating PhyDesignMc, finished. totSessionCpu=0:05:09 mem=1408.5M
[08/19 18:23:46    309s] 
[08/19 18:23:46    309s] #optDebug: {2, 1.000, 0.8500} {3, 0.503, 0.8500} {4, 0.503, 0.8500} {5, 0.379, 0.8500} {6, 0.130, 0.5393} {7, 0.130, 0.5393} {8, 0.043, 0.4444} {9, 0.043, 0.4444} {10, 0.022, 0.4220} 
[08/19 18:23:46    309s] ### Creating LA Mngr. totSessionCpu=0:05:09 mem=1408.5M
[08/19 18:23:46    309s] ### Creating LA Mngr, finished. totSessionCpu=0:05:09 mem=1408.5M
[08/19 18:23:46    309s] Usable buffer cells for single buffer setup transform:
[08/19 18:23:46    309s] CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32 
[08/19 18:23:46    309s] Number of usable buffer cells above: 9
[08/19 18:23:46    309s] Reclaim Optimization WNS Slack 0.020  TNS Slack 0.000 Density 59.49
[08/19 18:23:46    309s] +----------+---------+--------+--------+------------+--------+
[08/19 18:23:46    309s] | Density  | Commits |  WNS   |  TNS   |    Real    |  Mem   |
[08/19 18:23:46    309s] +----------+---------+--------+--------+------------+--------+
[08/19 18:23:46    309s] |    59.49%|        -|   0.020|   0.000|   0:00:00.0| 1408.5M|
[08/19 18:23:47    309s] |    59.49%|        0|   0.020|   0.000|   0:00:01.0| 1408.5M|
[08/19 18:23:47    309s] #optDebug: <stH: 1.4000 MiSeL: 21.9310>
[08/19 18:23:47    309s] |    59.49%|        0|   0.020|   0.000|   0:00:00.0| 1408.5M|
[08/19 18:23:47    309s] |    59.49%|        0|   0.020|   0.000|   0:00:00.0| 1408.5M|
[08/19 18:23:47    309s] |    59.49%|        0|   0.020|   0.000|   0:00:00.0| 1408.5M|
[08/19 18:23:47    309s] #optDebug: <stH: 1.4000 MiSeL: 21.9310>
[08/19 18:23:47    309s] |    59.49%|        0|   0.020|   0.000|   0:00:00.0| 1408.5M|
[08/19 18:23:47    309s] +----------+---------+--------+--------+------------+--------+
[08/19 18:23:47    309s] Reclaim Optimization End WNS Slack 0.020  TNS Slack 0.000 Density 59.49
[08/19 18:23:47    309s] 
[08/19 18:23:47    309s] ** Summary: Restruct = 0 Buffer Deletion = 0 Declone = 0 Resize = 0 **
[08/19 18:23:47    309s] --------------------------------------------------------------
[08/19 18:23:47    309s] |                                   | Total     | Sequential |
[08/19 18:23:47    309s] --------------------------------------------------------------
[08/19 18:23:47    309s] | Num insts resized                 |       0  |       0    |
[08/19 18:23:47    309s] | Num insts undone                  |       0  |       0    |
[08/19 18:23:47    309s] | Num insts Downsized               |       0  |       0    |
[08/19 18:23:47    309s] | Num insts Samesized               |       0  |       0    |
[08/19 18:23:47    309s] | Num insts Upsized                 |       0  |       0    |
[08/19 18:23:47    309s] | Num multiple commits+uncommits    |       0  |       -    |
[08/19 18:23:47    309s] --------------------------------------------------------------
[08/19 18:23:47    309s] **** Begin NDR-Layer Usage Statistics ****
[08/19 18:23:47    309s] 0 Ndr or Layer constraints added by optimization 
[08/19 18:23:47    309s] **** End NDR-Layer Usage Statistics ****
[08/19 18:23:47    309s] ** Finished Core Area Reclaim Optimization (cpu = 0:00:01.1) (real = 0:00:01.0) **
[08/19 18:23:47    309s] *** Starting refinePlace (0:05:10 mem=1408.5M) ***
[08/19 18:23:47    309s] Total net bbox length = 2.868e+04 (1.325e+04 1.543e+04) (ext = 2.469e+04)
[08/19 18:23:47    309s] Move report: placeLevelShifters moves 0 insts, mean move: 0.00 um, max move: 0.00 um
[08/19 18:23:47    309s] **WARN: (IMPSP-5140):	Global net connect rules have not been created. Added  insts would have no supply connectivity, and would fail DRC.
[08/19 18:23:47    309s] Type 'man IMPSP-5140' for more detail.
[08/19 18:23:47    309s] **WARN: (IMPSP-315):	Found 1081 instances insts with no PG Term connections.
[08/19 18:23:47    309s] Type 'man IMPSP-315' for more detail.
[08/19 18:23:47    309s] Starting refinePlace ...
[08/19 18:23:47    309s] Move report: legalization moves 0 insts, mean move: 0.00 um, max move: 0.00 um
[08/19 18:23:47    309s] [CPU] RefinePlace/Legalization (cpu=0:00:00.0, real=0:00:00.0, mem=1408.5MB) @(0:05:10 - 0:05:10).
[08/19 18:23:47    309s] Move report: Detail placement moves 0 insts, mean move: 0.00 um, max move: 0.00 um
[08/19 18:23:47    309s] 	Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1408.5MB
[08/19 18:23:47    309s] Statistics of distance of Instance movement in refine placement:
[08/19 18:23:47    309s]   maximum (X+Y) =         0.00 um
[08/19 18:23:47    309s]   mean    (X+Y) =         0.00 um
[08/19 18:23:47    309s] Summary Report:
[08/19 18:23:47    309s] Instances move: 0 (out of 1081 movable)
[08/19 18:23:47    309s] Instances flipped: 0
[08/19 18:23:47    309s] Mean displacement: 0.00 um
[08/19 18:23:47    309s] Max displacement: 0.00 um 
[08/19 18:23:47    309s] Total instances moved : 0
[08/19 18:23:47    309s] Total net bbox length = 2.868e+04 (1.325e+04 1.543e+04) (ext = 2.469e+04)
[08/19 18:23:47    309s] Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1408.5MB
[08/19 18:23:47    309s] [CPU] RefinePlace/total (cpu=0:00:00.0, real=0:00:00.0, mem=1408.5MB) @(0:05:10 - 0:05:10).
[08/19 18:23:47    309s] *** Finished refinePlace (0:05:10 mem=1408.5M) ***
[08/19 18:23:47    309s] *** maximum move = 0.00 um ***
[08/19 18:23:47    309s] *** Finished re-routing un-routed nets (1408.5M) ***
[08/19 18:23:47    309s] 
[08/19 18:23:47    309s] *** Finish Physical Update (cpu=0:00:00.1 real=0:00:00.0 mem=1408.5M) ***
[08/19 18:23:47    309s] *** Finished Area Reclaim Optimization (cpu=0:00:01, real=0:00:01, mem=1258.99M, totSessionCpu=0:05:10).
[08/19 18:23:47    309s] ### Creating LA Mngr. totSessionCpu=0:05:10 mem=1259.0M
[08/19 18:23:47    309s] ### Creating LA Mngr, finished. totSessionCpu=0:05:10 mem=1259.0M
[08/19 18:23:47    309s] [NR-eGR] Detected a user setting of 'setTrialRouteModePrv -handlePreroute true' which was ignored.
[08/19 18:23:47    309s] [PSP]     Started earlyGlobalRoute kernel
[08/19 18:23:47    309s] [PSP]     Initial Peak syMemory usage = 1259.0 MB
[08/19 18:23:47    309s] (I)       Reading DB...
[08/19 18:23:47    309s] (I)       before initializing RouteDB syMemory usage = 1259.0 MB
[08/19 18:23:47    309s] (I)       congestionReportName   : 
[08/19 18:23:47    309s] (I)       layerRangeFor2DCongestion : 
[08/19 18:23:47    309s] (I)       buildTerm2TermWires    : 1
[08/19 18:23:47    309s] (I)       doTrackAssignment      : 1
[08/19 18:23:47    309s] (I)       dumpBookshelfFiles     : 0
[08/19 18:23:47    309s] (I)       numThreads             : 1
[08/19 18:23:47    309s] (I)       bufferingAwareRouting  : false
[08/19 18:23:47    309s] [NR-eGR] honorMsvRouteConstraint: false
[08/19 18:23:47    309s] (I)       honorPin               : false
[08/19 18:23:47    309s] (I)       honorPinGuide          : true
[08/19 18:23:47    309s] (I)       honorPartition         : false
[08/19 18:23:47    309s] (I)       allowPartitionCrossover: false
[08/19 18:23:47    309s] (I)       honorSingleEntry       : true
[08/19 18:23:47    309s] (I)       honorSingleEntryStrong : true
[08/19 18:23:47    309s] (I)       handleViaSpacingRule   : false
[08/19 18:23:47    309s] (I)       handleEolSpacingRule   : false
[08/19 18:23:47    309s] (I)       PDConstraint           : none
[08/19 18:23:47    309s] (I)       expBetterNDRHandling   : false
[08/19 18:23:47    309s] [NR-eGR] honorClockSpecNDR      : 0
[08/19 18:23:47    309s] (I)       routingEffortLevel     : 3
[08/19 18:23:47    309s] (I)       effortLevel            : standard
[08/19 18:23:47    309s] [NR-eGR] minRouteLayer          : 2
[08/19 18:23:47    309s] [NR-eGR] maxRouteLayer          : 127
[08/19 18:23:47    309s] (I)       relaxedTopLayerCeiling : 127
[08/19 18:23:47    309s] (I)       relaxedBottomLayerFloor: 2
[08/19 18:23:47    309s] (I)       numRowsPerGCell        : 1
[08/19 18:23:47    309s] (I)       speedUpLargeDesign     : 0
[08/19 18:23:47    309s] (I)       multiThreadingTA       : 1
[08/19 18:23:47    309s] (I)       blkAwareLayerSwitching : 1
[08/19 18:23:47    309s] (I)       optimizationMode       : false
[08/19 18:23:47    309s] (I)       routeSecondPG          : false
[08/19 18:23:47    309s] (I)       scenicRatioForLayerRelax: 0.00
[08/19 18:23:47    309s] (I)       detourLimitForLayerRelax: 0.00
[08/19 18:23:47    309s] (I)       punchThroughDistance   : 500.00
[08/19 18:23:47    309s] (I)       scenicBound            : 1.15
[08/19 18:23:47    309s] (I)       maxScenicToAvoidBlk    : 100.00
[08/19 18:23:47    309s] (I)       source-to-sink ratio   : 0.00
[08/19 18:23:47    309s] (I)       targetCongestionRatioH : 1.00
[08/19 18:23:47    309s] (I)       targetCongestionRatioV : 1.00
[08/19 18:23:47    309s] (I)       layerCongestionRatio   : 0.70
[08/19 18:23:47    309s] (I)       m1CongestionRatio      : 0.10
[08/19 18:23:47    309s] (I)       m2m3CongestionRatio    : 0.70
[08/19 18:23:47    309s] (I)       localRouteEffort       : 1.00
[08/19 18:23:47    309s] (I)       numSitesBlockedByOneVia: 8.00
[08/19 18:23:47    309s] (I)       supplyScaleFactorH     : 1.00
[08/19 18:23:47    309s] (I)       supplyScaleFactorV     : 1.00
[08/19 18:23:47    309s] (I)       highlight3DOverflowFactor: 0.00
[08/19 18:23:47    309s] (I)       doubleCutViaModelingRatio: 0.00
[08/19 18:23:47    309s] (I)       routeVias              : 
[08/19 18:23:47    309s] (I)       readTROption           : true
[08/19 18:23:47    309s] (I)       extraSpacingFactor     : 1.00
[08/19 18:23:47    309s] [NR-eGR] numTracksPerClockWire  : 0
[08/19 18:23:47    309s] (I)       routeSelectedNetsOnly  : false
[08/19 18:23:47    309s] (I)       clkNetUseMaxDemand     : false
[08/19 18:23:47    309s] (I)       extraDemandForClocks   : 0
[08/19 18:23:47    309s] (I)       steinerRemoveLayers    : false
[08/19 18:23:47    309s] (I)       demoteLayerScenicScale : 1.00
[08/19 18:23:47    309s] (I)       nonpreferLayerCostScale : 100.00
[08/19 18:23:47    309s] (I)       similarTopologyRoutingFast : false
[08/19 18:23:47    309s] (I)       spanningTreeRefinement : false
[08/19 18:23:47    309s] (I)       spanningTreeRefinementAlpha : 0.50
[08/19 18:23:47    309s] (I)       starting read tracks
[08/19 18:23:47    309s] (I)       build grid graph
[08/19 18:23:47    309s] (I)       build grid graph start
[08/19 18:23:47    309s] [NR-eGR] Layer1 has no routable track
[08/19 18:23:47    309s] [NR-eGR] Layer2 has single uniform track structure
[08/19 18:23:47    309s] [NR-eGR] Layer3 has single uniform track structure
[08/19 18:23:47    309s] [NR-eGR] Layer4 has single uniform track structure
[08/19 18:23:47    309s] [NR-eGR] Layer5 has single uniform track structure
[08/19 18:23:47    309s] [NR-eGR] Layer6 has single uniform track structure
[08/19 18:23:47    309s] [NR-eGR] Layer7 has single uniform track structure
[08/19 18:23:47    309s] [NR-eGR] Layer8 has single uniform track structure
[08/19 18:23:47    309s] [NR-eGR] Layer9 has single uniform track structure
[08/19 18:23:47    309s] [NR-eGR] Layer10 has single uniform track structure
[08/19 18:23:47    309s] (I)       build grid graph end
[08/19 18:23:47    309s] (I)       numViaLayers=10
[08/19 18:23:47    309s] (I)       Reading via via1_8 for layer: 0 
[08/19 18:23:47    309s] (I)       Reading via via2_8 for layer: 1 
[08/19 18:23:47    309s] (I)       Reading via via3_2 for layer: 2 
[08/19 18:23:47    309s] (I)       Reading via via4_0 for layer: 3 
[08/19 18:23:47    309s] (I)       Reading via via5_0 for layer: 4 
[08/19 18:23:47    309s] (I)       Reading via via6_0 for layer: 5 
[08/19 18:23:47    309s] (I)       Reading via via7_0 for layer: 6 
[08/19 18:23:47    309s] (I)       Reading via via8_0 for layer: 7 
[08/19 18:23:47    309s] (I)       Reading via via9_0 for layer: 8 
[08/19 18:23:47    309s] (I)       end build via table
[08/19 18:23:47    309s] [NR-eGR] numRoutingBlks=0 numInstBlks=0 numPGBlocks=1720 numBumpBlks=0 numBoundaryFakeBlks=0
[08/19 18:23:47    309s] [NR-eGR] numPreroutedNet = 0  numPreroutedWires = 0
[08/19 18:23:47    309s] (I)       readDataFromPlaceDB
[08/19 18:23:47    309s] (I)       Read net information..
[08/19 18:23:47    309s] [NR-eGR] Read numTotalNets=1340  numIgnoredNets=0
[08/19 18:23:47    309s] (I)       Read testcase time = 0.000 seconds
[08/19 18:23:47    309s] 
[08/19 18:23:47    309s] (I)       read default dcut vias
[08/19 18:23:47    309s] (I)       Reading via via1_8 for layer: 0 
[08/19 18:23:47    309s] (I)       Reading via via2_8 for layer: 1 
[08/19 18:23:47    309s] (I)       Reading via via3_2 for layer: 2 
[08/19 18:23:47    309s] (I)       Reading via via4_0 for layer: 3 
[08/19 18:23:47    309s] (I)       Reading via via5_0 for layer: 4 
[08/19 18:23:47    309s] (I)       Reading via via6_0 for layer: 5 
[08/19 18:23:47    309s] (I)       Reading via via7_0 for layer: 6 
[08/19 18:23:47    309s] (I)       Reading via via8_0 for layer: 7 
[08/19 18:23:47    309s] (I)       Reading via via9_0 for layer: 8 
[08/19 18:23:47    309s] (I)       build grid graph start
[08/19 18:23:47    309s] (I)       build grid graph end
[08/19 18:23:47    309s] (I)       Model blockage into capacity
[08/19 18:23:47    309s] (I)       Read numBlocks=1720  numPreroutedWires=0  numCapScreens=0
[08/19 18:23:47    309s] (I)       blocked area on Layer1 : 0  (0.00%)
[08/19 18:23:47    309s] (I)       blocked area on Layer2 : 255192000  (1.03%)
[08/19 18:23:47    309s] (I)       blocked area on Layer3 : 309523200  (1.25%)
[08/19 18:23:47    309s] (I)       blocked area on Layer4 : 430416000  (1.73%)
[08/19 18:23:47    309s] (I)       blocked area on Layer5 : 499564800  (2.01%)
[08/19 18:23:47    309s] (I)       blocked area on Layer6 : 540411200  (2.18%)
[08/19 18:23:47    309s] (I)       blocked area on Layer7 : 2007040000  (8.08%)
[08/19 18:23:47    309s] (I)       blocked area on Layer8 : 2195200000  (8.84%)
[08/19 18:23:47    309s] (I)       blocked area on Layer9 : 10610688000  (42.71%)
[08/19 18:23:47    309s] (I)       blocked area on Layer10 : 13178880000  (53.05%)
[08/19 18:23:47    309s] (I)       Modeling time = 0.000 seconds
[08/19 18:23:47    309s] 
[08/19 18:23:47    309s] (I)       Number of ignored nets = 0
[08/19 18:23:47    309s] (I)       Number of fixed nets = 0.  Ignored: Yes
[08/19 18:23:47    309s] (I)       Number of clock nets = 1.  Ignored: No
[08/19 18:23:47    309s] (I)       Number of analog nets = 0.  Ignored: Yes
[08/19 18:23:47    309s] (I)       Number of special nets = 0.  Ignored: Yes
[08/19 18:23:47    309s] (I)       Number of mixed signal nets = 0.  Ignored: Yes
[08/19 18:23:47    309s] (I)       Number of skip routing nets = 0.  Ignored: Yes
[08/19 18:23:47    309s] (I)       Number of nets with ignore route flag = 0.  Ignored: No
[08/19 18:23:47    309s] (I)       Number of nets with one or no pins = 0.  Ignored: Yes
[08/19 18:23:47    309s] (I)       Number of two pin nets which has pins at the same location = 0.  Ignored: Yes
[08/19 18:23:47    309s] [NR-eGR] There are 1 clock nets ( 0 with NDR ).
[08/19 18:23:47    309s] (I)       Before initializing earlyGlobalRoute syMemory usage = 1259.0 MB
[08/19 18:23:47    309s] (I)       Ndr track 0 does not exist
[08/19 18:23:47    309s] (I)       Layer1  viaCost=200.00
[08/19 18:23:47    309s] (I)       Layer2  viaCost=200.00
[08/19 18:23:47    309s] (I)       Layer3  viaCost=100.00
[08/19 18:23:47    309s] (I)       Layer4  viaCost=100.00
[08/19 18:23:47    309s] (I)       Layer5  viaCost=100.00
[08/19 18:23:47    309s] (I)       Layer6  viaCost=100.00
[08/19 18:23:47    309s] (I)       Layer7  viaCost=100.00
[08/19 18:23:47    309s] (I)       Layer8  viaCost=100.00
[08/19 18:23:47    309s] (I)       Layer9  viaCost=100.00
[08/19 18:23:47    310s] (I)       ---------------------Grid Graph Info--------------------
[08/19 18:23:47    310s] (I)       routing area        :  (0, 0) - (160740, 154560)
[08/19 18:23:47    310s] (I)       core area           :  (10260, 10080) - (150480, 144480)
[08/19 18:23:47    310s] (I)       Site Width          :   380  (dbu)
[08/19 18:23:47    310s] (I)       Row Height          :  2800  (dbu)
[08/19 18:23:47    310s] (I)       GCell Width         :  2800  (dbu)
[08/19 18:23:47    310s] (I)       GCell Height        :  2800  (dbu)
[08/19 18:23:47    310s] (I)       grid                :    57    55    10
[08/19 18:23:47    310s] (I)       vertical capacity   :     0  2800     0  2800     0  2800     0  2800     0  2800
[08/19 18:23:47    310s] (I)       horizontal capacity :     0     0  2800     0  2800     0  2800     0  2800     0
[08/19 18:23:47    310s] (I)       Default wire width  :   140   140   140   280   280   280   800   800  1600  1600
[08/19 18:23:47    310s] (I)       Default wire space  :   130   140   140   280   280   280   800   800  1600  1600
[08/19 18:23:47    310s] (I)       Default pitch size  :   270   380   280   560   560   560  1680  1680  3200  3360
[08/19 18:23:47    310s] (I)       First Track Coord   :     0   190   140   370   700   370  1820  2050  3820  3730
[08/19 18:23:47    310s] (I)       Num tracks per GCell: 10.37  7.37 10.00  5.00  5.00  5.00  1.67  1.67  0.88  0.83
[08/19 18:23:47    310s] (I)       Total num of tracks :     0   423   552   287   275   287    91    95    47    47
[08/19 18:23:47    310s] (I)       Num of masks        :     1     1     1     1     1     1     1     1     1     1
[08/19 18:23:47    310s] (I)       Num of trim masks   :     0     0     0     0     0     0     0     0     0     0
[08/19 18:23:47    310s] (I)       --------------------------------------------------------
[08/19 18:23:47    310s] 
[08/19 18:23:47    310s] [NR-eGR] ============ Routing rule table ============
[08/19 18:23:47    310s] [NR-eGR] Rule id 0. Nets 1340 
[08/19 18:23:47    310s] [NR-eGR] id=0  ndrTrackId=0  ndrViaId=-1  extraSpace=0  numShields=0  maxHorDemand=1  maxVerDemand=1
[08/19 18:23:47    310s] [NR-eGR] Pitch:  L1=270  L2=380  L3=280  L4=560  L5=560  L6=560  L7=1680  L8=1680  L9=3200  L10=3360
[08/19 18:23:47    310s] (I)       NumUsedTracks:  L1=1  L2=1  L3=1  L4=1  L5=1  L6=1  L7=1  L8=1  L9=1  L10=1
[08/19 18:23:47    310s] (I)       NumFullyUsedTracks:  L1=1  L2=1  L3=1  L4=1  L5=1  L6=1  L7=1  L8=1  L9=1  L10=1
[08/19 18:23:47    310s] [NR-eGR] ========================================
[08/19 18:23:47    310s] [NR-eGR] 
[08/19 18:23:47    310s] (I)       After initializing earlyGlobalRoute syMemory usage = 1259.0 MB
[08/19 18:23:47    310s] (I)       Loading and dumping file time : 0.02 seconds
[08/19 18:23:47    310s] (I)       ============= Initialization =============
[08/19 18:23:47    310s] (I)       totalPins=3962  totalGlobalPin=3913 (98.76%)
[08/19 18:23:47    310s] (I)       total 2D Cap : 114175 = (53664 H, 60511 V)
[08/19 18:23:47    310s] [NR-eGR] Layer group 1: route 1340 net(s) in layer range [2, 10]
[08/19 18:23:47    310s] (I)       ============  Phase 1a Route ============
[08/19 18:23:47    310s] (I)       Phase 1a runs 0.01 seconds
[08/19 18:23:47    310s] (I)       Usage: 21126 = (9803 H, 11323 V) = (18.27% H, 18.71% V) = (1.372e+04um H, 1.585e+04um V)
[08/19 18:23:47    310s] (I)       
[08/19 18:23:47    310s] (I)       ============  Phase 1b Route ============
[08/19 18:23:47    310s] (I)       Usage: 21126 = (9803 H, 11323 V) = (18.27% H, 18.71% V) = (1.372e+04um H, 1.585e+04um V)
[08/19 18:23:47    310s] (I)       
[08/19 18:23:47    310s] (I)       earlyGlobalRoute overflow of layer group 1: 0.03% H + 0.00% V. EstWL: 2.957640e+04um
[08/19 18:23:47    310s] (I)       ============  Phase 1c Route ============
[08/19 18:23:47    310s] (I)       Usage: 21126 = (9803 H, 11323 V) = (18.27% H, 18.71% V) = (1.372e+04um H, 1.585e+04um V)
[08/19 18:23:47    310s] (I)       
[08/19 18:23:47    310s] (I)       ============  Phase 1d Route ============
[08/19 18:23:47    310s] (I)       Usage: 21126 = (9803 H, 11323 V) = (18.27% H, 18.71% V) = (1.372e+04um H, 1.585e+04um V)
[08/19 18:23:47    310s] (I)       
[08/19 18:23:47    310s] (I)       ============  Phase 1e Route ============
[08/19 18:23:47    310s] (I)       Phase 1e runs 0.00 seconds
[08/19 18:23:47    310s] (I)       Usage: 21126 = (9803 H, 11323 V) = (18.27% H, 18.71% V) = (1.372e+04um H, 1.585e+04um V)
[08/19 18:23:47    310s] (I)       
[08/19 18:23:47    310s] [NR-eGR] earlyGlobalRoute overflow of layer group 1: 0.03% H + 0.00% V. EstWL: 2.957640e+04um
[08/19 18:23:47    310s] [NR-eGR] 
[08/19 18:23:47    310s] (I)       ============  Phase 1l Route ============
[08/19 18:23:47    310s] (I)       Phase 1l runs 0.01 seconds
[08/19 18:23:47    310s] (I)       
[08/19 18:23:47    310s] [NR-eGR] Congestion Analysis Layer By layer: (blocked Gcells are excluded) 
[08/19 18:23:47    310s] [NR-eGR]                OverCon         OverCon            
[08/19 18:23:47    310s] [NR-eGR]                 #Gcell          #Gcell     %Gcell
[08/19 18:23:47    310s] [NR-eGR] Layer              (1)             (3)    OverCon 
[08/19 18:23:47    310s] [NR-eGR] ---------------------------------------------------
[08/19 18:23:47    310s] [NR-eGR] Layer1       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[08/19 18:23:47    310s] [NR-eGR] Layer2       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[08/19 18:23:47    310s] [NR-eGR] Layer3       6( 0.19%)       0( 0.00%)   ( 0.19%) 
[08/19 18:23:47    310s] [NR-eGR] Layer4       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[08/19 18:23:47    310s] [NR-eGR] Layer5       3( 0.10%)       1( 0.03%)   ( 0.13%) 
[08/19 18:23:47    310s] [NR-eGR] Layer6       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[08/19 18:23:47    310s] [NR-eGR] Layer7       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[08/19 18:23:47    310s] [NR-eGR] Layer8       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[08/19 18:23:47    310s] [NR-eGR] Layer9       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[08/19 18:23:47    310s] [NR-eGR] Layer10       0( 0.00%)       0( 0.00%)   ( 0.00%) 
[08/19 18:23:47    310s] [NR-eGR] ---------------------------------------------------
[08/19 18:23:47    310s] [NR-eGR] Total        9( 0.04%)       1( 0.00%)   ( 0.04%) 
[08/19 18:23:47    310s] [NR-eGR] 
[08/19 18:23:47    310s] (I)       Total Global Routing Runtime: 0.03 seconds
[08/19 18:23:47    310s] (I)       total 2D Cap : 114472 = (53795 H, 60677 V)
[08/19 18:23:47    310s] [NR-eGR] Overflow after earlyGlobalRoute (GR compatible) 0.06% H + 0.00% V
[08/19 18:23:47    310s] [NR-eGR] Overflow after earlyGlobalRoute 0.08% H + 0.00% V
[08/19 18:23:47    310s] (I)       ============= track Assignment ============
[08/19 18:23:47    310s] (I)       extract Global 3D Wires
[08/19 18:23:47    310s] (I)       Extract Global WL : time=0.00
[08/19 18:23:47    310s] (I)       Initialize Greedy Track Assignment (maxPinLayer=Layer11, numCutBoxes=0)
[08/19 18:23:47    310s] (I)       Initialization real time=0.00 seconds
[08/19 18:23:47    310s] (I)       Run Multi-thread track assignment
[08/19 18:23:47    310s] (I)       merging nets...
[08/19 18:23:47    310s] (I)       merging nets done
[08/19 18:23:47    310s] (I)       Kernel real time=0.02 seconds
[08/19 18:23:47    310s] (I)       End Greedy Track Assignment
[08/19 18:23:47    310s] [NR-eGR] --------------------------------------------------------------------------
[08/19 18:23:47    310s] [NR-eGR] Layer1(metal1)(F) length: 0.000000e+00um, number of vias: 3962
[08/19 18:23:47    310s] [NR-eGR] Layer2(metal2)(V) length: 4.013356e+03um, number of vias: 4702
[08/19 18:23:47    310s] [NR-eGR] Layer3(metal3)(H) length: 9.215950e+03um, number of vias: 1651
[08/19 18:23:47    310s] [NR-eGR] Layer4(metal4)(V) length: 6.507235e+03um, number of vias: 296
[08/19 18:23:47    310s] [NR-eGR] Layer5(metal5)(H) length: 4.434170e+03um, number of vias: 290
[08/19 18:23:47    310s] [NR-eGR] Layer6(metal6)(V) length: 5.799690e+03um, number of vias: 26
[08/19 18:23:47    310s] [NR-eGR] Layer7(metal7)(H) length: 5.076900e+02um, number of vias: 12
[08/19 18:23:47    310s] [NR-eGR] Layer8(metal8)(V) length: 3.309600e+02um, number of vias: 0
[08/19 18:23:47    310s] [NR-eGR] Layer9(metal9)(H) length: 0.000000e+00um, number of vias: 0
[08/19 18:23:47    310s] [NR-eGR] Layer10(metal10)(V) length: 0.000000e+00um, number of vias: 0
[08/19 18:23:47    310s] [NR-eGR] Total length: 3.080905e+04um, number of vias: 10939
[08/19 18:23:47    310s] [NR-eGR] --------------------------------------------------------------------------
[08/19 18:23:47    310s] [NR-eGR] Total clock nets wire length: 1.130475e+03um 
[08/19 18:23:47    310s] [NR-eGR] --------------------------------------------------------------------------
[08/19 18:23:47    310s] [NR-eGR] End Peak syMemory usage = 1239.3 MB
[08/19 18:23:47    310s] [NR-eGR] Early Global Router Kernel+IO runtime : 0.11 seconds
[08/19 18:23:47    310s] Extraction called for design 'SUM' of instances=1081 and nets=1342 using extraction engine 'preRoute' .
[08/19 18:23:47    310s] **WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
[08/19 18:23:47    310s] Type 'man IMPEXT-3530' for more detail.
[08/19 18:23:47    310s] PreRoute RC Extraction called for design SUM.
[08/19 18:23:47    310s] RC Extraction called in multi-corner(1) mode.
[08/19 18:23:47    310s] RCMode: PreRoute
[08/19 18:23:47    310s]       RC Corner Indexes            0   
[08/19 18:23:47    310s] Capacitance Scaling Factor   : 1.00000 
[08/19 18:23:47    310s] Resistance Scaling Factor    : 1.00000 
[08/19 18:23:47    310s] Clock Cap. Scaling Factor    : 1.00000 
[08/19 18:23:47    310s] Clock Res. Scaling Factor    : 1.00000 
[08/19 18:23:47    310s] Shrink Factor                : 1.00000
[08/19 18:23:47    310s] PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
[08/19 18:23:47    310s] Using capacitance table file ...
[08/19 18:23:47    310s] Updating RC grid for preRoute extraction ...
[08/19 18:23:47    310s] Initializing multi-corner capacitance tables ... 
[08/19 18:23:47    310s] Initializing multi-corner resistance tables ...
[08/19 18:23:47    310s] PreRoute RC Extraction DONE (CPU Time: 0:00:00.0  Real Time: 0:00:00.0  MEM: 1239.332M)
[08/19 18:23:47    310s] Compute RC Scale Done ...
[08/19 18:23:47    310s] [hotspot] +------------+---------------+---------------+
[08/19 18:23:47    310s] [hotspot] |            |   max hotspot | total hotspot |
[08/19 18:23:47    310s] [hotspot] +------------+---------------+---------------+
[08/19 18:23:47    310s] [hotspot] | normalized |          0.00 |          0.00 |
[08/19 18:23:47    310s] [hotspot] +------------+---------------+---------------+
[08/19 18:23:47    310s] Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
[08/19 18:23:47    310s] [hotspot] max/total 0.00/0.00, big hotspot (>10) total 0.00
[08/19 18:23:47    310s] #################################################################################
[08/19 18:23:47    310s] # Design Stage: PreRoute
[08/19 18:23:47    310s] # Design Name: SUM
[08/19 18:23:47    310s] # Design Mode: 90nm
[08/19 18:23:47    310s] # Analysis Mode: MMMC Non-OCV 
[08/19 18:23:47    310s] # Parasitics Mode: No SPEF/RCDB
[08/19 18:23:47    310s] # Signoff Settings: SI Off 
[08/19 18:23:47    310s] #################################################################################
[08/19 18:23:47    310s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:23:47    310s] Calculate delays in Single mode...
[08/19 18:23:47    310s] Topological Sorting (REAL = 0:00:00.0, MEM = 1292.6M, InitMEM = 1292.6M)
[08/19 18:23:47    310s] Start delay calculation (fullDC) (1 T). (MEM=1292.57)
[08/19 18:23:48    310s] End AAE Lib Interpolated Model. (MEM=1308.7 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:23:48    311s] Total number of fetched objects 1726
[08/19 18:23:48    311s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:23:48    311s] End delay calculation. (MEM=1327.78 CPU=0:00:00.6 REAL=0:00:00.0)
[08/19 18:23:48    311s] End delay calculation (fullDC). (MEM=1327.78 CPU=0:00:00.8 REAL=0:00:01.0)
[08/19 18:23:48    311s] *** CDM Built up (cpu=0:00:00.9  real=0:00:01.0  mem= 1327.8M) ***
[08/19 18:23:48    311s] Begin: GigaOpt postEco DRV Optimization
[08/19 18:23:48    311s] Info: 1 clock net  excluded from IPO operation.
[08/19 18:23:48    311s] PhyDesignGrid: maxLocalDensity 0.98
[08/19 18:23:48    311s] ### Creating PhyDesignMc. totSessionCpu=0:05:11 mem=1327.8M
[08/19 18:23:48    311s] Core basic site is FreePDK45_38x28_10R_NP_162NW_34O
[08/19 18:23:48    311s] Layer info - lib-1st H=1, V=2.  Cell-FPin=1. Top-pin=2
[08/19 18:23:48    311s] ### Creating PhyDesignMc, finished. totSessionCpu=0:05:11 mem=1327.8M
[08/19 18:23:48    311s] 
[08/19 18:23:48    311s] #optDebug: {2, 1.000, 0.8500} {3, 0.503, 0.8431} {4, 0.503, 0.8431} {5, 0.379, 0.6885} {6, 0.130, 0.4315} {7, 0.130, 0.4315} {8, 0.043, 0.3555} {9, 0.043, 0.3555} {10, 0.022, 0.3376} 
[08/19 18:23:48    311s] ### Creating LA Mngr. totSessionCpu=0:05:11 mem=1327.8M
[08/19 18:23:48    311s] ### Creating LA Mngr, finished. totSessionCpu=0:05:11 mem=1327.8M
[08/19 18:23:49    312s] +-------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:23:49    312s] |        max-tran       |        max-cap        |  max-fanout |  max-length |       setup       |        |        |        |       |          |         |
[08/19 18:23:49    312s] +-------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:23:49    312s] | nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
[08/19 18:23:49    312s] +-------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:23:49    312s] Info: violation cost 0.000000 (cap = 0.000000, tran = 0.000000, len = 0.000000, fanout load = 0.000000, fanout count = 0.000000, glitch 0.000000)
[08/19 18:23:49    312s] |     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.02|     0.00|       0|       0|       0|  59.49|          |         |
[08/19 18:23:49    312s] Info: violation cost 0.000000 (cap = 0.000000, tran = 0.000000, len = 0.000000, fanout load = 0.000000, fanout count = 0.000000, glitch 0.000000)
[08/19 18:23:49    312s] |     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0.02|     0.00|       0|       0|       0|  59.49| 0:00:00.0|  1404.1M|
[08/19 18:23:49    312s] +-------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:23:49    312s] **** Begin NDR-Layer Usage Statistics ****
[08/19 18:23:49    312s] 0 Ndr or Layer constraints added by optimization 
[08/19 18:23:49    312s] **** End NDR-Layer Usage Statistics ****
[08/19 18:23:49    312s] 
[08/19 18:23:49    312s] *** Finish DRV Fixing (cpu=0:00:00.1 real=0:00:00.0 mem=1404.1M) ***
[08/19 18:23:49    312s] 
[08/19 18:23:49    312s] End: GigaOpt postEco DRV Optimization
[08/19 18:23:49    312s] **INFO: Flow update: Design timing is met.
[08/19 18:23:49    312s] **INFO: Flow update: Design timing is met.
[08/19 18:23:49    312s] **INFO: Flow update: Design timing is met.
[08/19 18:23:49    312s] *** Steiner Routed Nets: 0.000%; Threshold: 100; Threshold for Hold: 100
[08/19 18:23:49    312s] ### Creating LA Mngr. totSessionCpu=0:05:12 mem=1385.0M
[08/19 18:23:49    312s] ### Creating LA Mngr, finished. totSessionCpu=0:05:12 mem=1385.0M
[08/19 18:23:49    312s] Re-routed 0 nets
[08/19 18:23:49    312s] 
[08/19 18:23:49    312s] Active setup views:
[08/19 18:23:49    312s]  default
[08/19 18:23:49    312s]   Dominating endpoints: 0
[08/19 18:23:49    312s]   Dominating TNS: -0.000
[08/19 18:23:49    312s] 
[08/19 18:23:49    312s] Extraction called for design 'SUM' of instances=1081 and nets=1342 using extraction engine 'preRoute' .
[08/19 18:23:49    312s] **WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
[08/19 18:23:49    312s] Type 'man IMPEXT-3530' for more detail.
[08/19 18:23:49    312s] PreRoute RC Extraction called for design SUM.
[08/19 18:23:49    312s] RC Extraction called in multi-corner(1) mode.
[08/19 18:23:49    312s] RCMode: PreRoute
[08/19 18:23:49    312s]       RC Corner Indexes            0   
[08/19 18:23:49    312s] Capacitance Scaling Factor   : 1.00000 
[08/19 18:23:49    312s] Resistance Scaling Factor    : 1.00000 
[08/19 18:23:49    312s] Clock Cap. Scaling Factor    : 1.00000 
[08/19 18:23:49    312s] Clock Res. Scaling Factor    : 1.00000 
[08/19 18:23:49    312s] Shrink Factor                : 1.00000
[08/19 18:23:49    312s] PreRoute extraction is honoring NDR/Shielding/ExtraSpace for clock nets.
[08/19 18:23:49    312s] Using capacitance table file ...
[08/19 18:23:49    312s] Initializing multi-corner capacitance tables ... 
[08/19 18:23:49    312s] Initializing multi-corner resistance tables ...
[08/19 18:23:49    312s] PreRoute RC Extraction DONE (CPU Time: 0:00:00.0  Real Time: 0:00:00.0  MEM: 1235.824M)
[08/19 18:23:49    312s] #################################################################################
[08/19 18:23:49    312s] # Design Stage: PreRoute
[08/19 18:23:49    312s] # Design Name: SUM
[08/19 18:23:49    312s] # Design Mode: 90nm
[08/19 18:23:49    312s] # Analysis Mode: MMMC Non-OCV 
[08/19 18:23:49    312s] # Parasitics Mode: No SPEF/RCDB
[08/19 18:23:49    312s] # Signoff Settings: SI Off 
[08/19 18:23:49    312s] #################################################################################
[08/19 18:23:49    312s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:23:49    312s] Calculate delays in Single mode...
[08/19 18:23:49    312s] Topological Sorting (REAL = 0:00:00.0, MEM = 1239.3M, InitMEM = 1239.3M)
[08/19 18:23:49    312s] Start delay calculation (fullDC) (1 T). (MEM=1239.35)
[08/19 18:23:50    312s] End AAE Lib Interpolated Model. (MEM=1255.48 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:23:50    313s] Total number of fetched objects 1726
[08/19 18:23:50    313s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:23:50    313s] End delay calculation. (MEM=1314.71 CPU=0:00:00.6 REAL=0:00:00.0)
[08/19 18:23:50    313s] End delay calculation (fullDC). (MEM=1314.71 CPU=0:00:00.8 REAL=0:00:01.0)
[08/19 18:23:50    313s] *** CDM Built up (cpu=0:00:00.9  real=0:00:01.0  mem= 1314.7M) ***
[08/19 18:23:50    313s] *** Done Building Timing Graph (cpu=0:00:01.1 real=0:00:01.0 totSessionCpu=0:05:13 mem=1314.7M)
[08/19 18:23:50    313s] Reported timing to dir ./timingReports
[08/19 18:23:50    313s] **optDesign ... cpu = 0:00:11, real = 0:00:10, mem = 997.9M, totSessionCpu=0:05:13 **
[08/19 18:23:52    314s] 
------------------------------------------------------------
     optDesign Final Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.021  |  0.021  |  3.895  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 59.485%
Routing Overflow: 0.08% H and 0.00% V
------------------------------------------------------------
**optDesign ... cpu = 0:00:12, real = 0:00:12, mem = 999.3M, totSessionCpu=0:05:15 **
[08/19 18:23:52    314s] *** Finished optDesign ***
[08/19 18:23:52    314s] 
[08/19 18:23:52    314s] 	OPT_RUNTIME:          optDesign (count =  3): (cpu=0:00:19.2 real=0:00:19.4)
[08/19 18:23:52    314s] 	OPT_RUNTIME:            reclaim (count =  1): (cpu=0:00:01.3 real=0:00:01.2)
[08/19 18:23:52    314s] 	OPT_RUNTIME:          postTROpt (count =  1): (cpu=0:00:01.9 real=0:00:01.9)
[08/19 18:23:52    314s] Info: pop threads available for lower-level modules during optimization.
[08/19 18:23:52    314s] Deleting Lib Analyzer.
[08/19 18:23:52    314s] Info: Destroy the CCOpt slew target map.
[08/19 18:23:52    314s] <CMD> optDesign -postCTS -hold
[08/19 18:23:52    314s] **INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
[08/19 18:23:52    314s] GigaOpt running with 1 threads.
[08/19 18:23:52    314s] Info: 1 threads available for lower-level modules during optimization.
[08/19 18:23:52    314s] Core basic site is FreePDK45_38x28_10R_NP_162NW_34O
[08/19 18:23:52    314s] Layer info - lib-1st H=1, V=2.  Cell-FPin=1. Top-pin=2
[08/19 18:23:52    314s] #spOpts: mergeVia=F 
[08/19 18:23:52    314s] #spOpts: mergeVia=F 
[08/19 18:23:52    314s] 
[08/19 18:23:52    314s] Creating Lib Analyzer ...
[08/19 18:23:52    315s] Total number of usable buffers from Lib Analyzer: 9 ( CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32)
[08/19 18:23:52    315s] Total number of usable inverters from Lib Analyzer: 6 ( INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32)
[08/19 18:23:52    315s] Total number of usable delay cells from Lib Analyzer: 0 ()
[08/19 18:23:52    315s] 
[08/19 18:23:53    315s] Creating Lib Analyzer, finished. 
[08/19 18:23:53    315s] **optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 920.0M, totSessionCpu=0:05:16 **
[08/19 18:23:53    315s] *** optDesign -postCTS ***
[08/19 18:23:53    315s] DRC Margin: user margin 0.0
[08/19 18:23:53    315s] Hold Target Slack: user slack 0
[08/19 18:23:53    315s] Setup Target Slack: user slack 0;
[08/19 18:23:53    315s] setUsefulSkewMode -ecoRoute false
[08/19 18:23:53    315s] Deleting Cell Server ...
[08/19 18:23:53    315s] Deleting Lib Analyzer.
[08/19 18:23:53    315s] Creating Cell Server ...(0, 0, 0, 0)
[08/19 18:23:53    315s] Summary for sequential cells identification: 
[08/19 18:23:53    315s]   Identified SBFF number: 16
[08/19 18:23:53    315s]   Identified MBFF number: 0
[08/19 18:23:53    315s]   Identified SB Latch number: 0
[08/19 18:23:53    315s]   Identified MB Latch number: 0
[08/19 18:23:53    315s]   Not identified SBFF number: 0
[08/19 18:23:53    315s]   Not identified MBFF number: 0
[08/19 18:23:53    315s]   Not identified SB Latch number: 0
[08/19 18:23:53    315s]   Not identified MB Latch number: 0
[08/19 18:23:53    315s]   Number of sequential cells which are not FFs: 13
[08/19 18:23:53    315s] Creating Cell Server, finished. 
[08/19 18:23:53    315s] 
[08/19 18:23:53    315s] Deleting Cell Server ...
[08/19 18:23:53    315s] Start to check current routing status for nets...
[08/19 18:23:53    315s] All nets are already routed correctly.
[08/19 18:23:53    315s] End to check current routing status for nets (mem=1183.6M)
[08/19 18:23:53    315s] ### Creating LA Mngr. totSessionCpu=0:05:16 mem=1250.4M
[08/19 18:23:53    316s] ### Creating LA Mngr, finished. totSessionCpu=0:05:16 mem=1250.4M
[08/19 18:23:54    316s] Compute RC Scale Done ...
[08/19 18:23:54    316s] *info: All cells identified as Buffer and Delay cells:
[08/19 18:23:54    316s] *info:   with footprint "BUF_X1" or "BUF_X1": 
[08/19 18:23:54    316s] *info: ------------------------------------------------------------------
[08/19 18:23:54    316s] *info: (dly) CLKBUF_X1           -  NangateOpenCellLibrary
[08/19 18:23:54    316s] *info: (dly) BUF_X1              -  NangateOpenCellLibrary
[08/19 18:23:54    316s] *info: (dly) CLKBUF_X2           -  NangateOpenCellLibrary
[08/19 18:23:54    316s] *info: (dly) BUF_X2              -  NangateOpenCellLibrary
[08/19 18:23:54    316s] *info: (dly) CLKBUF_X3           -  NangateOpenCellLibrary
[08/19 18:23:54    316s] *info: (dly) BUF_X4              -  NangateOpenCellLibrary
[08/19 18:23:54    316s] *info: (dly) BUF_X8              -  NangateOpenCellLibrary
[08/19 18:23:54    316s] *info: (dly) BUF_X16             -  NangateOpenCellLibrary
[08/19 18:23:54    316s] *info: (dly) BUF_X32             -  NangateOpenCellLibrary
[08/19 18:23:54    316s] PhyDesignGrid: maxLocalDensity 0.98
[08/19 18:23:54    316s] ### Creating PhyDesignMc. totSessionCpu=0:05:17 mem=1398.6M
[08/19 18:23:54    316s] #spOpts: mergeVia=F 
[08/19 18:23:54    316s] Core basic site is FreePDK45_38x28_10R_NP_162NW_34O
[08/19 18:23:54    316s] Layer info - lib-1st H=1, V=2.  Cell-FPin=1. Top-pin=2
[08/19 18:23:54    316s] ### Creating PhyDesignMc, finished. totSessionCpu=0:05:17 mem=1398.6M
[08/19 18:23:54    316s] GigaOpt Hold Optimizer is used
[08/19 18:23:54    316s] End AAE Lib Interpolated Model. (MEM=1398.64 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:23:54    316s] Starting initialization (fixHold) cpu=0:00:00.0 real=0:00:00.0 totSessionCpu=0:05:17 mem=1398.6M ***
[08/19 18:23:54    316s] ### Creating LA Mngr. totSessionCpu=0:05:17 mem=1398.6M
[08/19 18:23:54    316s] ### Creating LA Mngr, finished. totSessionCpu=0:05:17 mem=1398.6M
[08/19 18:23:54    316s] 
[08/19 18:23:54    316s] Creating Lib Analyzer ...
[08/19 18:23:54    316s] Total number of usable buffers from Lib Analyzer: 9 ( CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32)
[08/19 18:23:54    316s] Total number of usable inverters from Lib Analyzer: 6 ( INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32)
[08/19 18:23:54    316s] Total number of usable delay cells from Lib Analyzer: 0 ()
[08/19 18:23:54    316s] 
[08/19 18:23:55    317s] Creating Lib Analyzer, finished. 
[08/19 18:23:55    317s] gigaOpt Hold fixing search radius: 56.000000 Microns (40 stdCellHgt)
[08/19 18:23:55    317s] *info: Run optDesign holdfix with 1 thread.
[08/19 18:23:55    317s] Effort level <high> specified for reg2reg path_group
[08/19 18:23:55    317s] End AAE Lib Interpolated Model. (MEM=1417.72 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:23:55    317s] **INFO: Starting Blocking QThread with 1 CPU
[08/19 18:23:55    317s]  
   ____________________________________________________________________
__/ message from Blocking QThread
[08/19 18:23:55    317s] #################################################################################
[08/19 18:23:55    317s] # Design Stage: PreRoute
[08/19 18:23:55    317s] # Design Name: SUM
[08/19 18:23:55    317s] # Design Mode: 90nm
[08/19 18:23:55    317s] # Analysis Mode: MMMC Non-OCV 
[08/19 18:23:55    317s] # Parasitics Mode: No SPEF/RCDB
[08/19 18:23:55    317s] # Signoff Settings: SI Off 
[08/19 18:23:55    317s] #################################################################################
[08/19 18:23:55    317s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:23:55    317s] Calculate delays in Single mode...
[08/19 18:23:55    317s] Topological Sorting (REAL = 0:00:00.0, MEM = 0.0M, InitMEM = 0.0M)
[08/19 18:23:55    317s] Start delay calculation (fullDC) (1 T). (MEM=0)
[08/19 18:23:55    317s] End AAE Lib Interpolated Model. (MEM=0.722656 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:23:55    317s] Total number of fetched objects 1726
[08/19 18:23:55    317s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:23:55    317s] End delay calculation. (MEM=0 CPU=0:00:00.6 REAL=0:00:01.0)
[08/19 18:23:55    317s] End delay calculation (fullDC). (MEM=0 CPU=0:00:00.6 REAL=0:00:01.0)
[08/19 18:23:55    317s] *** CDM Built up (cpu=0:00:00.7  real=0:00:01.0  mem= 0.0M) ***
[08/19 18:23:55    317s] *** Done Building Timing Graph (cpu=0:00:00.8 real=0:00:01.0 totSessionCpu=0:00:01.0 mem=0.0M)
[08/19 18:23:55    317s] 
[08/19 18:23:55    317s] Active hold views:
[08/19 18:23:55    317s]  default
[08/19 18:23:55    317s]   Dominating endpoints: 0
[08/19 18:23:55    317s]   Dominating TNS: -0.000
[08/19 18:23:55    317s] 
[08/19 18:23:55    317s] Done building cte hold timing graph (fixHold) cpu=0:00:01.0 real=0:00:01.0 totSessionCpu=0:00:01.0 mem=0.0M ***
[08/19 18:23:55    317s] Done building hold timer [3074 node(s), 4459 edge(s), 1 view(s)] (fixHold) cpu=0:00:01.3 real=0:00:01.0 totSessionCpu=0:00:01.3 mem=0.0M ***
[08/19 18:23:56    318s]  
_______________________________________________________________________
[08/19 18:23:56    318s] Done building cte setup timing graph (fixHold) cpu=0:00:01.9 real=0:00:02.0 totSessionCpu=0:05:19 mem=1417.7M ***
[08/19 18:23:56    318s] *info: category slack lower bound [L 0.0] default
[08/19 18:23:56    318s] *info: category slack lower bound [H 0.0] reg2reg 
[08/19 18:23:56    318s] --------------------------------------------------- 
[08/19 18:23:56    318s]    Setup Violation Summary with Target Slack (0.000 ns)
[08/19 18:23:56    318s] --------------------------------------------------- 
[08/19 18:23:56    318s]          WNS    reg2regWNS
[08/19 18:23:56    318s]     0.021 ns      0.021 ns
[08/19 18:23:56    318s] --------------------------------------------------- 
[08/19 18:23:56    318s] Restoring autoHoldViews:  default
[08/19 18:23:56    318s] 
------------------------------------------------------------
             Initial Summary                             
------------------------------------------------------------

Setup views included:
 default
Hold  views included:
 default

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.021  |  0.021  |  3.895  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+--------------------+---------+---------+---------+
|     Hold mode      |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):| -0.190  |  0.107  | -0.190  |
|           TNS (ns):| -8.667  |  0.000  | -8.667  |
|    Violating Paths:|   358   |    0    |   358   |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 59.485%
Routing Overflow: 0.08% H and 0.00% V
------------------------------------------------------------
Deleting Cell Server ...
[08/19 18:23:56    318s] Deleting Lib Analyzer.
[08/19 18:23:56    318s] Creating Cell Server ...(0, 0, 0, 0)
[08/19 18:23:56    318s] Summary for sequential cells identification: 
[08/19 18:23:56    318s]   Identified SBFF number: 16
[08/19 18:23:56    318s]   Identified MBFF number: 0
[08/19 18:23:56    318s]   Identified SB Latch number: 0
[08/19 18:23:56    318s]   Identified MB Latch number: 0
[08/19 18:23:56    318s]   Not identified SBFF number: 0
[08/19 18:23:56    318s]   Not identified MBFF number: 0
[08/19 18:23:56    318s]   Not identified SB Latch number: 0
[08/19 18:23:56    318s]   Not identified MB Latch number: 0
[08/19 18:23:56    318s]   Number of sequential cells which are not FFs: 13
[08/19 18:23:56    318s] Creating Cell Server, finished. 
[08/19 18:23:56    318s] 
[08/19 18:23:56    318s] Deleting Cell Server ...
[08/19 18:23:56    318s] 
[08/19 18:23:56    318s] Creating Lib Analyzer ...
[08/19 18:23:56    318s] Creating Cell Server ...(0, 0, 0, 0)
[08/19 18:23:56    318s] Summary for sequential cells identification: 
[08/19 18:23:56    318s]   Identified SBFF number: 16
[08/19 18:23:56    318s]   Identified MBFF number: 0
[08/19 18:23:56    318s]   Identified SB Latch number: 0
[08/19 18:23:56    318s]   Identified MB Latch number: 0
[08/19 18:23:56    318s]   Not identified SBFF number: 0
[08/19 18:23:56    318s]   Not identified MBFF number: 0
[08/19 18:23:56    318s]   Not identified SB Latch number: 0
[08/19 18:23:56    318s]   Not identified MB Latch number: 0
[08/19 18:23:56    318s]   Number of sequential cells which are not FFs: 13
[08/19 18:23:56    318s] Creating Cell Server, finished. 
[08/19 18:23:56    318s] 
[08/19 18:23:56    319s] 
[08/19 18:23:56    319s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:23:56    319s]   
[08/19 18:23:56    319s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:23:56    319s]   Total number of usable buffers from Lib Analyzer: 9 ( CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32)
[08/19 18:23:56    319s] Total number of usable inverters from Lib Analyzer: 6 ( INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32)
[08/19 18:23:56    319s] Total number of usable delay cells from Lib Analyzer: 0 ()
[08/19 18:23:56    319s] 
[08/19 18:23:57    319s] Creating Lib Analyzer, finished. 
[08/19 18:23:57    319s] 
[08/19 18:23:57    319s] *Info: minBufDelay = 21.9 ps, libStdDelay = 10.1 ps, minBufSize = 3192000 (3.0)
[08/19 18:23:57    319s] *Info: worst delay setup view: default
[08/19 18:23:57    319s] Footprint list for hold buffering (delay unit: ps)
[08/19 18:23:57    319s] =================================================================
[08/19 18:23:57    319s] *Info:  holdDelay delayRatio IGArea drvRes cellname(iterm,oterm)
[08/19 18:23:57    319s] ------------------------------------------------------------------
[08/19 18:23:57    319s] *Info:       22.1       1.00    3.0  18.56 BUF_X1 (A,Z)
[08/19 18:23:57    319s] *Info:       29.7       1.00    3.0  25.53 CLKBUF_X1 (A,Z)
[08/19 18:23:57    319s] *Info:       23.3       1.00    4.0   9.27 BUF_X2 (A,Z)
[08/19 18:23:57    319s] *Info:       25.5       1.00    4.0  12.75 CLKBUF_X2 (A,Z)
[08/19 18:23:57    319s] *Info:       28.7       1.00    5.0   8.58 CLKBUF_X3 (A,Z)
[08/19 18:23:57    319s] *Info:       21.9       1.00    7.0   4.64 BUF_X4 (A,Z)
[08/19 18:23:57    319s] *Info:       22.6       1.00   13.0   2.33 BUF_X8 (A,Z)
[08/19 18:23:57    319s] *Info:       22.8       1.00   25.0   1.17 BUF_X16 (A,Z)
[08/19 18:23:57    319s] *Info:       23.7       1.00   49.0   0.61 BUF_X32 (A,Z)
[08/19 18:23:57    319s] =================================================================
[08/19 18:23:57    319s] **optDesign ... cpu = 0:00:04, real = 0:00:04, mem = 1006.2M, totSessionCpu=0:05:20 **
[08/19 18:23:57    319s] Info: 1 clock net  excluded from IPO operation.
[08/19 18:23:57    319s] --------------------------------------------------- 
[08/19 18:23:57    319s]    Hold Timing Summary  - Initial 
[08/19 18:23:57    319s] --------------------------------------------------- 
[08/19 18:23:57    319s]  Target slack: 0.000 ns
[08/19 18:23:57    319s] View: default 
[08/19 18:23:57    319s] 	WNS: -0.190 
[08/19 18:23:57    319s] 	TNS: -8.664 
[08/19 18:23:57    319s] 	VP: 358 
[08/19 18:23:57    319s] 	Worst hold path end point: ATMP_reg[88]/RN 
[08/19 18:23:57    319s] --------------------------------------------------- 
[08/19 18:23:57    319s]    Setup Timing Summary  - Initial 
[08/19 18:23:57    319s] --------------------------------------------------- 
[08/19 18:23:57    319s]  Target slack: 0.000 ns
[08/19 18:23:57    319s] View: default 
[08/19 18:23:57    319s] 	WNS: 0.021 
[08/19 18:23:57    319s] 	TNS: 0.000 
[08/19 18:23:57    319s] 	VP: 0 
[08/19 18:23:57    319s] 	Worst setup path end point:S_reg[127]/D 
[08/19 18:23:57    319s] --------------------------------------------------- 
[08/19 18:23:57    319s] PhyDesignGrid: maxLocalDensity 0.98
[08/19 18:23:57    319s] ### Creating PhyDesignMc. totSessionCpu=0:05:20 mem=1409.0M
[08/19 18:23:57    319s] #spOpts: mergeVia=F 
[08/19 18:23:57    319s] ### Creating PhyDesignMc, finished. totSessionCpu=0:05:20 mem=1409.0M
[08/19 18:23:57    319s] 
[08/19 18:23:57    319s] *** Starting Core Fixing (fixHold) cpu=0:00:02.8 real=0:00:03.0 totSessionCpu=0:05:20 mem=1409.0M density=59.485% ***
[08/19 18:23:57    319s] Optimizer Target Slack 0.000 StdDelay is 0.010  
[08/19 18:23:57    319s] 
[08/19 18:23:57    319s] #optDebug: {2, 1.000, 0.8500} {3, 0.503, 0.8500} {4, 0.503, 0.8500} {5, 0.379, 0.8500} {6, 0.130, 0.5393} {7, 0.130, 0.5393} {8, 0.043, 0.4444} {9, 0.043, 0.4444} {10, 0.022, 0.4220} 
[08/19 18:23:57    319s] 
[08/19 18:23:57    319s] Phase I ......
[08/19 18:23:57    319s] *info: Multithread Hold Batch Commit is enabled
[08/19 18:23:57    319s] *info: Levelized Batch Commit is enabled
[08/19 18:23:57    319s] Executing transform: ECO Safe Resize
[08/19 18:23:57    319s] +-----------------------------------------------------------------------------------------------+
[08/19 18:23:57    319s] |Iter|  WNS   |  TNS    |  #VP   |  #Buffer  |  #Resize(F/F)  | Density  | Real Time  |   Mem   |
[08/19 18:23:57    319s] +-----------------------------------------------------------------------------------------------+
[08/19 18:23:57    319s] Worst hold path end point:
[08/19 18:23:57    319s]   ATMP_reg[88]/RN
[08/19 18:23:57    319s]     net: n386 (nrTerm=43)
[08/19 18:23:57    319s] |   0|  -0.190|    -8.66|     358|          0|       0(     0)|    59.49%|   0:00:03.0|  1409.0M|
[08/19 18:23:57    319s] Worst hold path end point:
[08/19 18:23:57    319s]   ATMP_reg[88]/RN
[08/19 18:23:57    319s]     net: n386 (nrTerm=43)
[08/19 18:23:57    319s] |   1|  -0.190|    -8.66|     358|          0|       0(     0)|    59.49%|   0:00:03.0|  1409.0M|
[08/19 18:23:57    319s] +-----------------------------------------------------------------------------------------------+
[08/19 18:23:57    319s] Executing transform: AddBuffer + LegalResize
[08/19 18:23:57    319s] +-----------------------------------------------------------------------------------------------+
[08/19 18:23:57    319s] |Iter|  WNS   |  TNS    |  #VP   |  #Buffer  |  #Resize(F/F)  | Density  | Real Time  |   Mem   |
[08/19 18:23:57    319s] +-----------------------------------------------------------------------------------------------+
[08/19 18:23:57    319s] Worst hold path end point:
[08/19 18:23:57    319s]   ATMP_reg[88]/RN
[08/19 18:23:57    319s]     net: n386 (nrTerm=43)
[08/19 18:23:57    319s] |   0|  -0.190|    -8.66|     358|          0|       0(     0)|    59.49%|   0:00:03.0|  1409.0M|
[08/19 18:24:00    322s] Worst hold path end point:
[08/19 18:24:00    322s]   ATMP_reg[88]/RN
[08/19 18:24:00    322s]     net: n386 (nrTerm=43)
[08/19 18:24:00    322s] |   1|  -0.161|    -6.30|      41|        258|       0(     0)|    63.86%|   0:00:06.0|  1420.6M|
[08/19 18:24:00    322s] Worst hold path end point:
[08/19 18:24:00    322s]   ATMP_reg[88]/RN
[08/19 18:24:00    322s]     net: n386 (nrTerm=43)
[08/19 18:24:00    322s] |   2|  -0.127|    -4.94|      41|          1|       0(     0)|    63.87%|   0:00:06.0|  1420.6M|
[08/19 18:24:00    322s] Worst hold path end point:
[08/19 18:24:00    322s]   ATMP_reg[88]/RN
[08/19 18:24:00    322s]     net: n386 (nrTerm=43)
[08/19 18:24:00    322s] |   3|  -0.099|    -3.77|      41|          1|       0(     0)|    63.89%|   0:00:06.0|  1420.6M|
[08/19 18:24:00    322s] Worst hold path end point:
[08/19 18:24:00    322s]   ATMP_reg[88]/RN
[08/19 18:24:00    322s]     net: n386 (nrTerm=43)
[08/19 18:24:00    322s] |   4|  -0.072|    -2.67|      41|          1|       0(     0)|    63.91%|   0:00:06.0|  1420.6M|
[08/19 18:24:00    322s] Worst hold path end point:
[08/19 18:24:00    322s]   ATMP_reg[88]/RN
[08/19 18:24:00    322s]     net: n386 (nrTerm=43)
[08/19 18:24:00    322s] |   5|  -0.048|    -1.68|      41|          1|       0(     0)|    63.92%|   0:00:06.0|  1420.6M|
[08/19 18:24:00    322s] Worst hold path end point:
[08/19 18:24:00    322s]   ATMP_reg[88]/RN
[08/19 18:24:00    322s]     net: n386 (nrTerm=43)
[08/19 18:24:00    322s] |   6|  -0.023|    -0.67|      41|          1|       0(     0)|    63.94%|   0:00:06.0|  1420.6M|
[08/19 18:24:00    322s] Worst hold path end point:
[08/19 18:24:00    322s]   ATMP_reg[88]/RN
[08/19 18:24:00    322s]     net: n386 (nrTerm=43)
[08/19 18:24:00    322s] |   7|   0.001|     0.00|       0|          1|       0(     0)|    63.96%|   0:00:06.0|  1420.6M|
[08/19 18:24:00    322s] +-----------------------------------------------------------------------------------------------+
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] *info:    Total 264 cells added for Phase I
[08/19 18:24:00    322s] --------------------------------------------------- 
[08/19 18:24:00    322s]    Hold Timing Summary  - Phase I 
[08/19 18:24:00    322s] --------------------------------------------------- 
[08/19 18:24:00    322s]  Target slack: 0.000 ns
[08/19 18:24:00    322s] View: default 
[08/19 18:24:00    322s] 	WNS: 0.001 
[08/19 18:24:00    322s] 	TNS: 0.000 
[08/19 18:24:00    322s] 	VP: 0 
[08/19 18:24:00    322s] 	Worst hold path end point: ATMP_reg[88]/RN 
[08/19 18:24:00    322s] --------------------------------------------------- 
[08/19 18:24:00    322s]    Setup Timing Summary  - Phase I 
[08/19 18:24:00    322s] --------------------------------------------------- 
[08/19 18:24:00    322s]  Target slack: 0.000 ns
[08/19 18:24:00    322s] View: default 
[08/19 18:24:00    322s] 	WNS: 0.021 
[08/19 18:24:00    322s] 	TNS: 0.000 
[08/19 18:24:00    322s] 	VP: 0 
[08/19 18:24:00    322s] 	Worst setup path end point:S_reg[127]/D 
[08/19 18:24:00    322s] --------------------------------------------------- 
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] *** Finished Core Fixing (fixHold) cpu=0:00:05.7 real=0:00:06.0 totSessionCpu=0:05:23 mem=1420.6M density=63.957% ***
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] *info:
[08/19 18:24:00    322s] *info: Added a total of 264 cells to fix/reduce hold violation
[08/19 18:24:00    322s] *info:          in which 217 termBuffering
[08/19 18:24:00    322s] *info:
[08/19 18:24:00    322s] *info: Summary: 
[08/19 18:24:00    322s] *info:          257 cells of type 'BUF_X1' (3.0, 	18.560) used
[08/19 18:24:00    322s] *info:            7 cells of type 'CLKBUF_X1' (3.0, 	25.535) used
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] *** Starting refinePlace (0:05:23 mem=1420.6M) ***
[08/19 18:24:00    322s] Total net bbox length = 2.896e+04 (1.337e+04 1.559e+04) (ext = 2.220e+04)
[08/19 18:24:00    322s] Move report: placeLevelShifters moves 0 insts, mean move: 0.00 um, max move: 0.00 um
[08/19 18:24:00    322s] **WARN: (IMPSP-5140):	Global net connect rules have not been created. Added  insts would have no supply connectivity, and would fail DRC.
[08/19 18:24:00    322s] Type 'man IMPSP-5140' for more detail.
[08/19 18:24:00    322s] **WARN: (IMPSP-315):	Found 1345 instances insts with no PG Term connections.
[08/19 18:24:00    322s] Type 'man IMPSP-315' for more detail.
[08/19 18:24:00    322s] Starting refinePlace ...
[08/19 18:24:00    322s] default core: bins with density >  0.75 =    0 % ( 0 / 25 )
[08/19 18:24:00    322s] Density distribution unevenness ratio = 2.225%
[08/19 18:24:00    322s]   Spread Effort: high, pre-route mode, useDDP on.
[08/19 18:24:00    322s] [CPU] RefinePlace/preRPlace (cpu=0:00:00.0, real=0:00:00.0, mem=1420.6MB) @(0:05:23 - 0:05:23).
[08/19 18:24:00    322s] Move report: preRPlace moves 0 insts, mean move: 0.00 um, max move: 0.00 um
[08/19 18:24:00    322s] wireLenOptFixPriorityInst 0 inst fixed
[08/19 18:24:00    322s] Move report: legalization moves 0 insts, mean move: 0.00 um, max move: 0.00 um
[08/19 18:24:00    322s] [CPU] RefinePlace/Legalization (cpu=0:00:00.0, real=0:00:00.0, mem=1420.6MB) @(0:05:23 - 0:05:23).
[08/19 18:24:00    322s] Move report: Detail placement moves 0 insts, mean move: 0.00 um, max move: 0.00 um
[08/19 18:24:00    322s] 	Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1420.6MB
[08/19 18:24:00    322s] Statistics of distance of Instance movement in refine placement:
[08/19 18:24:00    322s]   maximum (X+Y) =         0.00 um
[08/19 18:24:00    322s]   mean    (X+Y) =         0.00 um
[08/19 18:24:00    322s] Summary Report:
[08/19 18:24:00    322s] Instances move: 0 (out of 1345 movable)
[08/19 18:24:00    322s] Instances flipped: 0
[08/19 18:24:00    322s] Mean displacement: 0.00 um
[08/19 18:24:00    322s] Max displacement: 0.00 um 
[08/19 18:24:00    322s] Total instances moved : 0
[08/19 18:24:00    322s] Total net bbox length = 2.896e+04 (1.337e+04 1.559e+04) (ext = 2.220e+04)
[08/19 18:24:00    322s] Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1420.6MB
[08/19 18:24:00    322s] [CPU] RefinePlace/total (cpu=0:00:00.0, real=0:00:00.0, mem=1420.6MB) @(0:05:23 - 0:05:23).
[08/19 18:24:00    322s] *** Finished refinePlace (0:05:23 mem=1420.6M) ***
[08/19 18:24:00    322s] *** maximum move = 0.00 um ***
[08/19 18:24:00    322s] *** Finished re-routing un-routed nets (1420.6M) ***
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] *** Finish Physical Update (cpu=0:00:00.1 real=0:00:00.0 mem=1420.6M) ***
[08/19 18:24:00    322s] *** Finish Post CTS Hold Fixing (cpu=0:00:05.8 real=0:00:06.0 totSessionCpu=0:05:23 mem=1420.6M density=63.957%) ***
[08/19 18:24:00    322s] *** Steiner Routed Nets: 32.544%; Threshold: 100; Threshold for Hold: 100
[08/19 18:24:00    322s] ### Creating LA Mngr. totSessionCpu=0:05:23 mem=1265.0M
[08/19 18:24:00    322s] ### Creating LA Mngr, finished. totSessionCpu=0:05:23 mem=1265.0M
[08/19 18:24:00    322s] Re-routed 0 nets
[08/19 18:24:00    322s] GigaOpt_HOLD: Recover setup timing after hold fixing
[08/19 18:24:00    322s] Deleting Cell Server ...
[08/19 18:24:00    322s] Deleting Lib Analyzer.
[08/19 18:24:00    322s] Creating Cell Server ...(0, 0, 0, 0)
[08/19 18:24:00    322s] Summary for sequential cells identification: 
[08/19 18:24:00    322s]   Identified SBFF number: 16
[08/19 18:24:00    322s]   Identified MBFF number: 0
[08/19 18:24:00    322s]   Identified SB Latch number: 0
[08/19 18:24:00    322s]   Identified MB Latch number: 0
[08/19 18:24:00    322s]   Not identified SBFF number: 0
[08/19 18:24:00    322s]   Not identified MBFF number: 0
[08/19 18:24:00    322s]   Not identified SB Latch number: 0
[08/19 18:24:00    322s]   Not identified MB Latch number: 0
[08/19 18:24:00    322s]   Number of sequential cells which are not FFs: 13
[08/19 18:24:00    322s] Creating Cell Server, finished. 
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:24:00    322s]   
[08/19 18:24:00    322s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:24:00    322s]   Deleting Cell Server ...
[08/19 18:24:00    322s] Creating Cell Server ...(0, 0, 0, 0)
[08/19 18:24:00    322s] Summary for sequential cells identification: 
[08/19 18:24:00    322s]   Identified SBFF number: 16
[08/19 18:24:00    322s]   Identified MBFF number: 0
[08/19 18:24:00    322s]   Identified SB Latch number: 0
[08/19 18:24:00    322s]   Identified MB Latch number: 0
[08/19 18:24:00    322s]   Not identified SBFF number: 0
[08/19 18:24:00    322s]   Not identified MBFF number: 0
[08/19 18:24:00    322s]   Not identified SB Latch number: 0
[08/19 18:24:00    322s]   Not identified MB Latch number: 0
[08/19 18:24:00    322s]   Number of sequential cells which are not FFs: 13
[08/19 18:24:00    322s] Creating Cell Server, finished. 
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:24:00    322s]   
[08/19 18:24:00    322s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:24:00    322s]   GigaOpt: WNS changes after routing: 0.000 -> 0.000 (bump = 0.0)
[08/19 18:24:00    322s] GigaOpt: Skipping postEco optimization
[08/19 18:24:00    322s] GigaOpt: WNS changes after postEco optimization: 0.000 -> 0.000 (bump = 0.0)
[08/19 18:24:00    322s] GigaOpt: Skipping nonLegal postEco optimization
[08/19 18:24:00    322s] *** Steiner Routed Nets: 32.544%; Threshold: 100; Threshold for Hold: 100
[08/19 18:24:00    322s] ### Creating LA Mngr. totSessionCpu=0:05:23 mem=1265.0M
[08/19 18:24:00    322s] ### Creating LA Mngr, finished. totSessionCpu=0:05:23 mem=1265.0M
[08/19 18:24:00    322s] Re-routed 0 nets
[08/19 18:24:00    322s] GigaOpt: WNS changes after postEco optimization: 0.000 -> 0.000 (bump = 0.0, threshold = 0.00505)
[08/19 18:24:00    322s] GigaOpt: Skipping post-eco TNS optimization
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] Active setup views:
[08/19 18:24:00    322s]  default
[08/19 18:24:00    322s]   Dominating endpoints: 0
[08/19 18:24:00    322s]   Dominating TNS: -0.000
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] [NR-eGR] Detected a user setting of 'setTrialRouteModePrv -handlePreroute true' which was ignored.
[08/19 18:24:00    322s] [PSP]     Started earlyGlobalRoute kernel
[08/19 18:24:00    322s] [PSP]     Initial Peak syMemory usage = 1265.0 MB
[08/19 18:24:00    322s] (I)       Reading DB...
[08/19 18:24:00    322s] (I)       before initializing RouteDB syMemory usage = 1265.0 MB
[08/19 18:24:00    322s] (I)       congestionReportName   : 
[08/19 18:24:00    322s] (I)       layerRangeFor2DCongestion : 
[08/19 18:24:00    322s] (I)       buildTerm2TermWires    : 0
[08/19 18:24:00    322s] (I)       doTrackAssignment      : 1
[08/19 18:24:00    322s] (I)       dumpBookshelfFiles     : 0
[08/19 18:24:00    322s] (I)       numThreads             : 1
[08/19 18:24:00    322s] (I)       bufferingAwareRouting  : false
[08/19 18:24:00    322s] [NR-eGR] honorMsvRouteConstraint: false
[08/19 18:24:00    322s] (I)       honorPin               : false
[08/19 18:24:00    322s] (I)       honorPinGuide          : true
[08/19 18:24:00    322s] (I)       honorPartition         : false
[08/19 18:24:00    322s] (I)       allowPartitionCrossover: false
[08/19 18:24:00    322s] (I)       honorSingleEntry       : true
[08/19 18:24:00    322s] (I)       honorSingleEntryStrong : true
[08/19 18:24:00    322s] (I)       handleViaSpacingRule   : false
[08/19 18:24:00    322s] (I)       handleEolSpacingRule   : false
[08/19 18:24:00    322s] (I)       PDConstraint           : none
[08/19 18:24:00    322s] (I)       expBetterNDRHandling   : false
[08/19 18:24:00    322s] [NR-eGR] honorClockSpecNDR      : 0
[08/19 18:24:00    322s] (I)       routingEffortLevel     : 3
[08/19 18:24:00    322s] (I)       effortLevel            : standard
[08/19 18:24:00    322s] [NR-eGR] minRouteLayer          : 2
[08/19 18:24:00    322s] [NR-eGR] maxRouteLayer          : 127
[08/19 18:24:00    322s] (I)       relaxedTopLayerCeiling : 127
[08/19 18:24:00    322s] (I)       relaxedBottomLayerFloor: 2
[08/19 18:24:00    322s] (I)       numRowsPerGCell        : 1
[08/19 18:24:00    322s] (I)       speedUpLargeDesign     : 0
[08/19 18:24:00    322s] (I)       multiThreadingTA       : 1
[08/19 18:24:00    322s] (I)       blkAwareLayerSwitching : 1
[08/19 18:24:00    322s] (I)       optimizationMode       : false
[08/19 18:24:00    322s] (I)       routeSecondPG          : false
[08/19 18:24:00    322s] (I)       scenicRatioForLayerRelax: 0.00
[08/19 18:24:00    322s] (I)       detourLimitForLayerRelax: 0.00
[08/19 18:24:00    322s] (I)       punchThroughDistance   : 500.00
[08/19 18:24:00    322s] (I)       scenicBound            : 1.15
[08/19 18:24:00    322s] (I)       maxScenicToAvoidBlk    : 100.00
[08/19 18:24:00    322s] (I)       source-to-sink ratio   : 0.00
[08/19 18:24:00    322s] (I)       targetCongestionRatioH : 1.00
[08/19 18:24:00    322s] (I)       targetCongestionRatioV : 1.00
[08/19 18:24:00    322s] (I)       layerCongestionRatio   : 0.70
[08/19 18:24:00    322s] (I)       m1CongestionRatio      : 0.10
[08/19 18:24:00    322s] (I)       m2m3CongestionRatio    : 0.70
[08/19 18:24:00    322s] (I)       localRouteEffort       : 1.00
[08/19 18:24:00    322s] (I)       numSitesBlockedByOneVia: 8.00
[08/19 18:24:00    322s] (I)       supplyScaleFactorH     : 1.00
[08/19 18:24:00    322s] (I)       supplyScaleFactorV     : 1.00
[08/19 18:24:00    322s] (I)       highlight3DOverflowFactor: 0.00
[08/19 18:24:00    322s] (I)       doubleCutViaModelingRatio: 0.00
[08/19 18:24:00    322s] (I)       routeVias              : 
[08/19 18:24:00    322s] (I)       readTROption           : true
[08/19 18:24:00    322s] (I)       extraSpacingFactor     : 1.00
[08/19 18:24:00    322s] [NR-eGR] numTracksPerClockWire  : 0
[08/19 18:24:00    322s] (I)       routeSelectedNetsOnly  : false
[08/19 18:24:00    322s] (I)       clkNetUseMaxDemand     : false
[08/19 18:24:00    322s] (I)       extraDemandForClocks   : 0
[08/19 18:24:00    322s] (I)       steinerRemoveLayers    : false
[08/19 18:24:00    322s] (I)       demoteLayerScenicScale : 1.00
[08/19 18:24:00    322s] (I)       nonpreferLayerCostScale : 100.00
[08/19 18:24:00    322s] (I)       similarTopologyRoutingFast : false
[08/19 18:24:00    322s] (I)       spanningTreeRefinement : false
[08/19 18:24:00    322s] (I)       spanningTreeRefinementAlpha : 0.50
[08/19 18:24:00    322s] (I)       starting read tracks
[08/19 18:24:00    322s] (I)       build grid graph
[08/19 18:24:00    322s] (I)       build grid graph start
[08/19 18:24:00    322s] [NR-eGR] Layer1 has no routable track
[08/19 18:24:00    322s] [NR-eGR] Layer2 has single uniform track structure
[08/19 18:24:00    322s] [NR-eGR] Layer3 has single uniform track structure
[08/19 18:24:00    322s] [NR-eGR] Layer4 has single uniform track structure
[08/19 18:24:00    322s] [NR-eGR] Layer5 has single uniform track structure
[08/19 18:24:00    322s] [NR-eGR] Layer6 has single uniform track structure
[08/19 18:24:00    322s] [NR-eGR] Layer7 has single uniform track structure
[08/19 18:24:00    322s] [NR-eGR] Layer8 has single uniform track structure
[08/19 18:24:00    322s] [NR-eGR] Layer9 has single uniform track structure
[08/19 18:24:00    322s] [NR-eGR] Layer10 has single uniform track structure
[08/19 18:24:00    322s] (I)       build grid graph end
[08/19 18:24:00    322s] (I)       numViaLayers=10
[08/19 18:24:00    322s] (I)       Reading via via1_8 for layer: 0 
[08/19 18:24:00    322s] (I)       Reading via via2_8 for layer: 1 
[08/19 18:24:00    322s] (I)       Reading via via3_2 for layer: 2 
[08/19 18:24:00    322s] (I)       Reading via via4_0 for layer: 3 
[08/19 18:24:00    322s] (I)       Reading via via5_0 for layer: 4 
[08/19 18:24:00    322s] (I)       Reading via via6_0 for layer: 5 
[08/19 18:24:00    322s] (I)       Reading via via7_0 for layer: 6 
[08/19 18:24:00    322s] (I)       Reading via via8_0 for layer: 7 
[08/19 18:24:00    322s] (I)       Reading via via9_0 for layer: 8 
[08/19 18:24:00    322s] (I)       end build via table
[08/19 18:24:00    322s] [NR-eGR] numRoutingBlks=0 numInstBlks=0 numPGBlocks=1720 numBumpBlks=0 numBoundaryFakeBlks=0
[08/19 18:24:00    322s] [NR-eGR] numPreroutedNet = 0  numPreroutedWires = 0
[08/19 18:24:00    322s] (I)       readDataFromPlaceDB
[08/19 18:24:00    322s] (I)       Read net information..
[08/19 18:24:00    322s] [NR-eGR] Read numTotalNets=1604  numIgnoredNets=0
[08/19 18:24:00    322s] (I)       Read testcase time = 0.000 seconds
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] (I)       read default dcut vias
[08/19 18:24:00    322s] (I)       Reading via via1_8 for layer: 0 
[08/19 18:24:00    322s] (I)       Reading via via2_8 for layer: 1 
[08/19 18:24:00    322s] (I)       Reading via via3_2 for layer: 2 
[08/19 18:24:00    322s] (I)       Reading via via4_0 for layer: 3 
[08/19 18:24:00    322s] (I)       Reading via via5_0 for layer: 4 
[08/19 18:24:00    322s] (I)       Reading via via6_0 for layer: 5 
[08/19 18:24:00    322s] (I)       Reading via via7_0 for layer: 6 
[08/19 18:24:00    322s] (I)       Reading via via8_0 for layer: 7 
[08/19 18:24:00    322s] (I)       Reading via via9_0 for layer: 8 
[08/19 18:24:00    322s] (I)       build grid graph start
[08/19 18:24:00    322s] (I)       build grid graph end
[08/19 18:24:00    322s] (I)       Model blockage into capacity
[08/19 18:24:00    322s] (I)       Read numBlocks=1720  numPreroutedWires=0  numCapScreens=0
[08/19 18:24:00    322s] (I)       blocked area on Layer1 : 0  (0.00%)
[08/19 18:24:00    322s] (I)       blocked area on Layer2 : 255192000  (1.03%)
[08/19 18:24:00    322s] (I)       blocked area on Layer3 : 309523200  (1.25%)
[08/19 18:24:00    322s] (I)       blocked area on Layer4 : 430416000  (1.73%)
[08/19 18:24:00    322s] (I)       blocked area on Layer5 : 499564800  (2.01%)
[08/19 18:24:00    322s] (I)       blocked area on Layer6 : 540411200  (2.18%)
[08/19 18:24:00    322s] (I)       blocked area on Layer7 : 2007040000  (8.08%)
[08/19 18:24:00    322s] (I)       blocked area on Layer8 : 2195200000  (8.84%)
[08/19 18:24:00    322s] (I)       blocked area on Layer9 : 10610688000  (42.71%)
[08/19 18:24:00    322s] (I)       blocked area on Layer10 : 13178880000  (53.05%)
[08/19 18:24:00    322s] (I)       Modeling time = 0.000 seconds
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] (I)       Number of ignored nets = 0
[08/19 18:24:00    322s] (I)       Number of fixed nets = 0.  Ignored: Yes
[08/19 18:24:00    322s] (I)       Number of clock nets = 1.  Ignored: No
[08/19 18:24:00    322s] (I)       Number of analog nets = 0.  Ignored: Yes
[08/19 18:24:00    322s] (I)       Number of special nets = 0.  Ignored: Yes
[08/19 18:24:00    322s] (I)       Number of mixed signal nets = 0.  Ignored: Yes
[08/19 18:24:00    322s] (I)       Number of skip routing nets = 0.  Ignored: Yes
[08/19 18:24:00    322s] (I)       Number of nets with ignore route flag = 0.  Ignored: No
[08/19 18:24:00    322s] (I)       Number of nets with one or no pins = 0.  Ignored: Yes
[08/19 18:24:00    322s] (I)       Number of two pin nets which has pins at the same location = 0.  Ignored: Yes
[08/19 18:24:00    322s] [NR-eGR] There are 1 clock nets ( 0 with NDR ).
[08/19 18:24:00    322s] (I)       Before initializing earlyGlobalRoute syMemory usage = 1265.0 MB
[08/19 18:24:00    322s] (I)       Ndr track 0 does not exist
[08/19 18:24:00    322s] (I)       Layer1  viaCost=200.00
[08/19 18:24:00    322s] (I)       Layer2  viaCost=200.00
[08/19 18:24:00    322s] (I)       Layer3  viaCost=100.00
[08/19 18:24:00    322s] (I)       Layer4  viaCost=100.00
[08/19 18:24:00    322s] (I)       Layer5  viaCost=100.00
[08/19 18:24:00    322s] (I)       Layer6  viaCost=100.00
[08/19 18:24:00    322s] (I)       Layer7  viaCost=100.00
[08/19 18:24:00    322s] (I)       Layer8  viaCost=100.00
[08/19 18:24:00    322s] (I)       Layer9  viaCost=100.00
[08/19 18:24:00    322s] (I)       ---------------------Grid Graph Info--------------------
[08/19 18:24:00    322s] (I)       routing area        :  (0, 0) - (160740, 154560)
[08/19 18:24:00    322s] (I)       core area           :  (10260, 10080) - (150480, 144480)
[08/19 18:24:00    322s] (I)       Site Width          :   380  (dbu)
[08/19 18:24:00    322s] (I)       Row Height          :  2800  (dbu)
[08/19 18:24:00    322s] (I)       GCell Width         :  2800  (dbu)
[08/19 18:24:00    322s] (I)       GCell Height        :  2800  (dbu)
[08/19 18:24:00    322s] (I)       grid                :    57    55    10
[08/19 18:24:00    322s] (I)       vertical capacity   :     0  2800     0  2800     0  2800     0  2800     0  2800
[08/19 18:24:00    322s] (I)       horizontal capacity :     0     0  2800     0  2800     0  2800     0  2800     0
[08/19 18:24:00    322s] (I)       Default wire width  :   140   140   140   280   280   280   800   800  1600  1600
[08/19 18:24:00    322s] (I)       Default wire space  :   130   140   140   280   280   280   800   800  1600  1600
[08/19 18:24:00    322s] (I)       Default pitch size  :   270   380   280   560   560   560  1680  1680  3200  3360
[08/19 18:24:00    322s] (I)       First Track Coord   :     0   190   140   370   700   370  1820  2050  3820  3730
[08/19 18:24:00    322s] (I)       Num tracks per GCell: 10.37  7.37 10.00  5.00  5.00  5.00  1.67  1.67  0.88  0.83
[08/19 18:24:00    322s] (I)       Total num of tracks :     0   423   552   287   275   287    91    95    47    47
[08/19 18:24:00    322s] (I)       Num of masks        :     1     1     1     1     1     1     1     1     1     1
[08/19 18:24:00    322s] (I)       Num of trim masks   :     0     0     0     0     0     0     0     0     0     0
[08/19 18:24:00    322s] (I)       --------------------------------------------------------
[08/19 18:24:00    322s] 
[08/19 18:24:00    322s] [NR-eGR] ============ Routing rule table ============
[08/19 18:24:00    322s] [NR-eGR] Rule id 0. Nets 1604 
[08/19 18:24:00    322s] [NR-eGR] id=0  ndrTrackId=0  ndrViaId=-1  extraSpace=0  numShields=0  maxHorDemand=1  maxVerDemand=1
[08/19 18:24:00    322s] [NR-eGR] Pitch:  L1=270  L2=380  L3=280  L4=560  L5=560  L6=560  L7=1680  L8=1680  L9=3200  L10=3360
[08/19 18:24:00    322s] (I)       NumUsedTracks:  L1=1  L2=1  L3=1  L4=1  L5=1  L6=1  L7=1  L8=1  L9=1  L10=1
[08/19 18:24:00    322s] (I)       NumFullyUsedTracks:  L1=1  L2=1  L3=1  L4=1  L5=1  L6=1  L7=1  L8=1  L9=1  L10=1
[08/19 18:24:00    322s] [NR-eGR] ========================================
[08/19 18:24:00    322s] [NR-eGR] 
[08/19 18:24:00    322s] (I)       After initializing earlyGlobalRoute syMemory usage = 1265.0 MB
[08/19 18:24:00    322s] (I)       Loading and dumping file time : 0.02 seconds
[08/19 18:24:00    322s] (I)       ============= Initialization =============
[08/19 18:24:00    322s] (I)       totalPins=4490  totalGlobalPin=4291 (95.57%)
[08/19 18:24:00    322s] (I)       total 2D Cap : 114175 = (53664 H, 60511 V)
[08/19 18:24:00    322s] [NR-eGR] Layer group 1: route 1604 net(s) in layer range [2, 10]
[08/19 18:24:00    322s] (I)       ============  Phase 1a Route ============
[08/19 18:24:00    322s] (I)       Phase 1a runs 0.01 seconds
[08/19 18:24:00    322s] (I)       Usage: 21275 = (9895 H, 11380 V) = (18.44% H, 18.81% V) = (1.385e+04um H, 1.593e+04um V)
[08/19 18:24:00    322s] (I)       
[08/19 18:24:00    322s] (I)       ============  Phase 1b Route ============
[08/19 18:24:00    322s] (I)       Usage: 21275 = (9895 H, 11380 V) = (18.44% H, 18.81% V) = (1.385e+04um H, 1.593e+04um V)
[08/19 18:24:00    322s] (I)       
[08/19 18:24:00    322s] (I)       earlyGlobalRoute overflow of layer group 1: 0.00% H + 0.00% V. EstWL: 2.978500e+04um
[08/19 18:24:00    322s] (I)       ============  Phase 1c Route ============
[08/19 18:24:00    322s] (I)       Usage: 21275 = (9895 H, 11380 V) = (18.44% H, 18.81% V) = (1.385e+04um H, 1.593e+04um V)
[08/19 18:24:00    322s] (I)       
[08/19 18:24:00    322s] (I)       ============  Phase 1d Route ============
[08/19 18:24:00    322s] (I)       Usage: 21275 = (9895 H, 11380 V) = (18.44% H, 18.81% V) = (1.385e+04um H, 1.593e+04um V)
[08/19 18:24:00    322s] (I)       
[08/19 18:24:00    322s] (I)       ============  Phase 1e Route ============
[08/19 18:24:00    322s] (I)       Phase 1e runs 0.00 seconds
[08/19 18:24:00    322s] (I)       Usage: 21275 = (9895 H, 11380 V) = (18.44% H, 18.81% V) = (1.385e+04um H, 1.593e+04um V)
[08/19 18:24:00    322s] (I)       
[08/19 18:24:00    322s] [NR-eGR] earlyGlobalRoute overflow of layer group 1: 0.00% H + 0.00% V. EstWL: 2.978500e+04um
[08/19 18:24:00    322s] [NR-eGR] 
[08/19 18:24:00    322s] (I)       ============  Phase 1l Route ============
[08/19 18:24:00    322s] (I)       Phase 1l runs 0.02 seconds
[08/19 18:24:00    322s] (I)       
[08/19 18:24:00    322s] [NR-eGR] Congestion Analysis Layer By layer: (blocked Gcells are excluded) 
[08/19 18:24:00    322s] [NR-eGR]                OverCon            
[08/19 18:24:00    322s] [NR-eGR]                 #Gcell     %Gcell
[08/19 18:24:00    322s] [NR-eGR] Layer              (1)    OverCon 
[08/19 18:24:00    322s] [NR-eGR] ------------------------------------
[08/19 18:24:00    322s] [NR-eGR] Layer1       0( 0.00%)   ( 0.00%) 
[08/19 18:24:00    322s] [NR-eGR] Layer2       0( 0.00%)   ( 0.00%) 
[08/19 18:24:00    322s] [NR-eGR] Layer3       1( 0.03%)   ( 0.03%) 
[08/19 18:24:00    322s] [NR-eGR] Layer4       1( 0.03%)   ( 0.03%) 
[08/19 18:24:00    322s] [NR-eGR] Layer5       5( 0.16%)   ( 0.16%) 
[08/19 18:24:00    322s] [NR-eGR] Layer6       0( 0.00%)   ( 0.00%) 
[08/19 18:24:00    322s] [NR-eGR] Layer7       0( 0.00%)   ( 0.00%) 
[08/19 18:24:00    322s] [NR-eGR] Layer8       0( 0.00%)   ( 0.00%) 
[08/19 18:24:00    322s] [NR-eGR] Layer9       0( 0.00%)   ( 0.00%) 
[08/19 18:24:00    322s] [NR-eGR] Layer10       0( 0.00%)   ( 0.00%) 
[08/19 18:24:00    322s] [NR-eGR] ------------------------------------
[08/19 18:24:00    322s] [NR-eGR] Total        7( 0.03%)   ( 0.03%) 
[08/19 18:24:00    322s] [NR-eGR] 
[08/19 18:24:00    322s] (I)       Total Global Routing Runtime: 0.03 seconds
[08/19 18:24:00    322s] (I)       total 2D Cap : 114472 = (53795 H, 60677 V)
[08/19 18:24:00    322s] [NR-eGR] Overflow after earlyGlobalRoute (GR compatible) 0.00% H + 0.00% V
[08/19 18:24:00    322s] [NR-eGR] Overflow after earlyGlobalRoute 0.00% H + 0.00% V
[08/19 18:24:00    322s] [NR-eGR] End Peak syMemory usage = 1265.0 MB
[08/19 18:24:00    322s] [NR-eGR] Early Global Router Kernel+IO runtime : 0.05 seconds
[08/19 18:24:00    322s] [hotspot] +------------+---------------+---------------+
[08/19 18:24:00    322s] [hotspot] |            |   max hotspot | total hotspot |
[08/19 18:24:00    322s] [hotspot] +------------+---------------+---------------+
[08/19 18:24:00    322s] [hotspot] | normalized |          0.00 |          0.00 |
[08/19 18:24:00    322s] [hotspot] +------------+---------------+---------------+
[08/19 18:24:00    322s] Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
[08/19 18:24:00    322s] [hotspot] max/total 0.00/0.00, big hotspot (>10) total 0.00
[08/19 18:24:00    322s] Reported timing to dir ./timingReports
[08/19 18:24:00    322s] **optDesign ... cpu = 0:00:07, real = 0:00:07, mem = 969.8M, totSessionCpu=0:05:23 **
[08/19 18:24:00    322s] End AAE Lib Interpolated Model. (MEM=1242.84 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:24:00    322s] **INFO: Starting Blocking QThread with 1 CPU
[08/19 18:24:00    322s]  
   ____________________________________________________________________
__/ message from Blocking QThread
[08/19 18:24:00    322s] #################################################################################
[08/19 18:24:00    322s] # Design Stage: PreRoute
[08/19 18:24:00    322s] # Design Name: SUM
[08/19 18:24:00    322s] # Design Mode: 90nm
[08/19 18:24:00    322s] # Analysis Mode: MMMC Non-OCV 
[08/19 18:24:00    322s] # Parasitics Mode: No SPEF/RCDB
[08/19 18:24:00    322s] # Signoff Settings: SI Off 
[08/19 18:24:00    322s] #################################################################################
[08/19 18:24:00    322s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:24:00    322s] Calculate delays in Single mode...
[08/19 18:24:00    322s] Topological Sorting (REAL = 0:00:00.0, MEM = 0.0M, InitMEM = 0.0M)
[08/19 18:24:00    322s] Start delay calculation (fullDC) (1 T). (MEM=0)
[08/19 18:24:00    322s] End AAE Lib Interpolated Model. (MEM=14.7305 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:24:00    322s] Total number of fetched objects 1990
[08/19 18:24:00    322s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:24:00    322s] End delay calculation. (MEM=0 CPU=0:00:00.6 REAL=0:00:00.0)
[08/19 18:24:00    322s] End delay calculation (fullDC). (MEM=0 CPU=0:00:00.7 REAL=0:00:00.0)
[08/19 18:24:00    322s] *** CDM Built up (cpu=0:00:00.7  real=0:00:00.0  mem= 0.0M) ***
[08/19 18:24:00    322s] *** Done Building Timing Graph (cpu=0:00:00.8 real=0:00:00.0 totSessionCpu=0:00:02.0 mem=0.0M)
[08/19 18:24:02    323s]  
_______________________________________________________________________
[08/19 18:24:02    323s] #################################################################################
[08/19 18:24:02    323s] # Design Stage: PreRoute
[08/19 18:24:02    323s] # Design Name: SUM
[08/19 18:24:02    323s] # Design Mode: 90nm
[08/19 18:24:02    323s] # Analysis Mode: MMMC Non-OCV 
[08/19 18:24:02    323s] # Parasitics Mode: No SPEF/RCDB
[08/19 18:24:02    323s] # Signoff Settings: SI Off 
[08/19 18:24:02    323s] #################################################################################
[08/19 18:24:02    324s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:24:02    324s] Calculate delays in Single mode...
[08/19 18:24:02    324s] Topological Sorting (REAL = 0:00:00.0, MEM = 1238.8M, InitMEM = 1238.8M)
[08/19 18:24:02    324s] Start delay calculation (fullDC) (1 T). (MEM=1238.84)
[08/19 18:24:02    324s] End AAE Lib Interpolated Model. (MEM=1254.97 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:24:03    324s] Total number of fetched objects 1990
[08/19 18:24:03    324s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:24:03    324s] End delay calculation. (MEM=1314.21 CPU=0:00:00.7 REAL=0:00:01.0)
[08/19 18:24:03    324s] End delay calculation (fullDC). (MEM=1314.21 CPU=0:00:00.7 REAL=0:00:01.0)
[08/19 18:24:03    324s] *** CDM Built up (cpu=0:00:00.8  real=0:00:01.0  mem= 1314.2M) ***
[08/19 18:24:03    324s] *** Done Building Timing Graph (cpu=0:00:01.0 real=0:00:01.0 totSessionCpu=0:05:25 mem=1314.2M)
[08/19 18:24:04    326s] 
------------------------------------------------------------
     optDesign Final Summary                             
------------------------------------------------------------

Setup views included:
 default 
Hold  views included:
 default

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.021  |  0.021  |  3.703  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+--------------------+---------+---------+---------+
|     Hold mode      |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.001  |  0.107  |  0.001  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
Routing Overflow: 0.00% H and 0.00% V
------------------------------------------------------------
*** Final Summary (holdfix) CPU=0:00:03.6, REAL=0:00:04.0, MEM=1259.0M
[08/19 18:24:04    326s] **optDesign ... cpu = 0:00:11, real = 0:00:11, mem = 996.1M, totSessionCpu=0:05:26 **
[08/19 18:24:04    326s] *** Finished optDesign ***
[08/19 18:24:04    326s] 
[08/19 18:24:04    326s] 	OPT_RUNTIME:          optDesign (count =  2): (cpu=0:00:11.5 real=0:00:12.2)
[08/19 18:24:04    326s] Info: pop threads available for lower-level modules during optimization.
[08/19 18:24:04    326s] Info: Destroy the CCOpt slew target map.
[08/19 18:25:26    337s] <CMD> getFillerMode -quiet
[08/19 18:25:48    341s] <CMD> addFiller -cell FILLCELL_X8 FILLCELL_X32 FILLCELL_X4 FILLCELL_X2 FILLCELL_X16 FILLCELL_X1 -prefix FILLER
[08/19 18:25:48    341s] Core basic site is FreePDK45_38x28_10R_NP_162NW_34O
[08/19 18:25:48    341s] Layer info - lib-1st H=1, V=2.  Cell-FPin=1. Top-pin=2
[08/19 18:25:48    341s]   Signal wire search tree: 0 elements. (cpu=0:00:00.0, mem=0.0M)
[08/19 18:25:48    341s] *INFO: Adding fillers to top-module.
[08/19 18:25:48    341s] *INFO:   Added 1 filler inst  (cell FILLCELL_X32 / prefix FILLER).
[08/19 18:25:48    341s] *INFO:   Added 46 filler insts (cell FILLCELL_X16 / prefix FILLER).
[08/19 18:25:48    341s] *INFO:   Added 181 filler insts (cell FILLCELL_X8 / prefix FILLER).
[08/19 18:25:48    341s] *INFO:   Added 650 filler insts (cell FILLCELL_X4 / prefix FILLER).
[08/19 18:25:48    341s] *INFO:   Added 1568 filler insts (cell FILLCELL_X1 / prefix FILLER).
[08/19 18:25:48    341s] *INFO:   Added 0 filler inst  (cell FILLCELL_X2 / prefix FILLER).
[08/19 18:25:48    341s] *INFO: Total 2446 filler insts added - prefix FILLER (CPU: 0:00:00.1).
[08/19 18:25:48    341s] For 2446 new insts, *** Applied 0 GNC rules (cpu = 0:00:00.0)
[08/19 18:25:50    341s] <CMD> pan 8.537 1.111
[08/19 18:26:15    345s] **WARN: (IMPTCM-77):	Option "-drouteStartIteration" for command getNanoRouteMode is obsolete and will be removed in a future release. The obsolete option still works in this release but to avoid this warning and to ensure compatibility with future releases, remove the obsolete option from your script.
[08/19 18:27:08    353s] <CMD> setNanoRouteMode -quiet -timingEngine {}
[08/19 18:27:08    353s] <CMD> setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
[08/19 18:27:08    353s] **WARN: (IMPTCM-77):	Option "-drouteStartIteration" for command getNanoRouteMode is obsolete and will be removed in a future release. The obsolete option still works in this release but to avoid this warning and to ensure compatibility with future releases, remove the obsolete option from your script.
[08/19 18:27:08    353s] <CMD> setNanoRouteMode -quiet -drouteStartIteration default
[08/19 18:27:08    353s] **WARN: (IMPTCM-77):	Option "-drouteStartIteration" for command setNanoRouteMode is obsolete and will be removed in a future release. The obsolete option still works in this release but to avoid this warning and to ensure compatibility with future releases, remove the obsolete option from your script.
[08/19 18:27:08    353s] <CMD> setNanoRouteMode -quiet -routeTopRoutingLayer default
[08/19 18:27:08    353s] <CMD> setNanoRouteMode -quiet -routeBottomRoutingLayer default
[08/19 18:27:08    353s] <CMD> setNanoRouteMode -quiet -drouteEndIteration default
[08/19 18:27:08    353s] **WARN: (IMPTCM-77):	Option "-routeEcoOnlyInLayers" for command getNanoRouteMode is obsolete and will be removed in a future release. The obsolete option still works in this release but to avoid this warning and to ensure compatibility with future releases, remove the obsolete option from your script.
[08/19 18:27:08    353s] <CMD> setNanoRouteMode -quiet -routeWithTimingDriven false
[08/19 18:27:08    353s] <CMD> setNanoRouteMode -quiet -routeWithSiDriven false
[08/19 18:27:08    353s] Running Native NanoRoute ...
[08/19 18:27:08    353s] <CMD> routeDesign -globalDetail
[08/19 18:27:08    353s] #routeDesign: cpu time = 00:00:00, elapsed time = 00:00:00, memory = 998.38 (MB), peak = 1022.11 (MB)
[08/19 18:27:08    353s] #WARNING (NRIG-96) Selected single pass global detail route "-globalDetail". Clock eco and post optimizations will not be run. See "man NRIG-96" for more details.
[08/19 18:27:08    353s] #**INFO: setDesignMode -flowEffort standard
[08/19 18:27:08    353s] #**INFO: mulit-cut via swapping is disabled by user.
[08/19 18:27:08    353s] #**INFO: All auto set options tuned by routeDesign will be restored to their original settings on command completion.
[08/19 18:27:08    353s] #**INFO: auto set of routeReserveSpaceForMultiCut to true
[08/19 18:27:08    353s] #**INFO: auto set of routeConcurrentMinimizeViaCountEffort to high
[08/19 18:27:08    353s] Core basic site is FreePDK45_38x28_10R_NP_162NW_34O
[08/19 18:27:08    353s] Layer info - lib-1st H=1, V=2.  Cell-FPin=1. Top-pin=2
[08/19 18:27:08    353s] Begin checking placement ... (start mem=1257.0M, init mem=1257.0M)
[08/19 18:27:08    353s] *info: Placed = 3791          
[08/19 18:27:08    353s] *info: Unplaced = 0           
[08/19 18:27:08    353s] Placement Density:100.00%(4711/4711)
[08/19 18:27:08    353s] Placement Density (including fixed std cells):100.00%(4711/4711)
[08/19 18:27:08    353s] Finished checkPlace (cpu: total=0:00:00.0, vio checks=0:00:00.0; mem=1257.0M)
[08/19 18:27:08    353s] #**INFO: honoring user setting for routeWithTimingDriven set to false
[08/19 18:27:08    353s] #**INFO: honoring user setting for routeWithSiDriven set to false
[08/19 18:27:08    353s] **WARN: (IMPCK-8086):	The command changeUseClockNetStatus is obsolete and will be removed in the next release. This command still works in this release, but by the next release you must transition to the CCOpt-based CTS flow.
[08/19 18:27:08    353s] 
[08/19 18:27:08    353s] changeUseClockNetStatus Option :  -noFixedNetWires 
[08/19 18:27:08    353s] *** Changed status on (0) nets in Clock.
[08/19 18:27:08    353s] *** End changeUseClockNetStatus (cpu=0:00:00.0, real=0:00:00.0, mem=1257.0M) ***
[08/19 18:27:08    353s] 
[08/19 18:27:08    353s] globalDetailRoute
[08/19 18:27:08    353s] 
[08/19 18:27:08    353s] #setNanoRouteMode -routeConcurrentMinimizeViaCountEffort "high"
[08/19 18:27:08    353s] #setNanoRouteMode -routeReserveSpaceForMultiCut true
[08/19 18:27:08    353s] #setNanoRouteMode -routeWithSiDriven false
[08/19 18:27:08    353s] #setNanoRouteMode -routeWithTimingDriven false
[08/19 18:27:08    353s] #Start globalDetailRoute on Wed Aug 19 18:27:08 2020
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] ### Net info: total nets: 1606
[08/19 18:27:08    353s] ### Net info: dirty nets: 522
[08/19 18:27:08    353s] ### Net info: marked as disconnected nets: 0
[08/19 18:27:08    353s] ### Net info: fully routed nets: 0
[08/19 18:27:08    353s] ### Net info: trivial (single pin) nets: 0
[08/19 18:27:08    353s] ### Net info: unrouted nets: 1606
[08/19 18:27:08    353s] ### Net info: re-extraction nets: 0
[08/19 18:27:08    353s] ### Net info: ignored nets: 0
[08/19 18:27:08    353s] ### Net info: skip routing nets: 0
[08/19 18:27:08    353s] ### import route signature (0) = 1096513643
[08/19 18:27:08    353s] #WARNING (NRDB-2005) SPECIAL_NET vdd has special wires but no definitions for instance pins or top level pins. This will cause routability problems later.
[08/19 18:27:08    353s] #WARNING (NRDB-2005) SPECIAL_NET gnd has special wires but no definitions for instance pins or top level pins. This will cause routability problems later.
[08/19 18:27:08    353s] #NanoRoute Version 17.11-s080_1 NR170721-2155/17_11-UB
[08/19 18:27:08    353s] #RTESIG:78da8dcecd0e8230100460cf3ec5a670a889e02eb4945e4dbcaa31ea9560527e1202495b
[08/19 18:27:08    353s] #       de5f8c5714f63a5f6627089fa71b30523151e430c782e07c23852aa12821290fa48a297a
[08/19 18:27:08    353s] #       1cd936082fd77b4a0808bcedbda98dddc3e88c0567bc6ffb7af7255996425576ce007f0d
[08/19 18:27:08    353s] #       43376bb4144018137e0e78d50da59f8584942cb611a102d6b475c3803b6fa764dea55a80
[08/19 18:27:08    353s] #       b7e3df2e91ebe58742d31ab462ba4c24b09fb3376fe95c7b05
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #RTESIG:78da8dcecd0e8230100460cf3ec5a670a889e02eb4945e4dbcaa31ea9560527e1202495b
[08/19 18:27:08    353s] #       de5f8c5714f63a5f6627089fa71b30523151e430c782e07c23852aa12821290fa48a297a
[08/19 18:27:08    353s] #       1cd936082fd77b4a0808bcedbda98dddc3e88c0567bc6ffb7af7255996425576ce007f0d
[08/19 18:27:08    353s] #       43376bb4144018137e0e78d50da59f8584942cb611a102d6b475c3803b6fa764dea55a80
[08/19 18:27:08    353s] #       b7e3df2e91ebe58742d31ab462ba4c24b09fb3376fe95c7b05
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #Start routing data preparation on Wed Aug 19 18:27:08 2020
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal1 is not specified for width 0.0700.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal2 is not specified for width 0.0700.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal1 is not specified for width 0.0700.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal2 is not specified for width 0.0700.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal2 is not specified for width 0.0700.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal3 is not specified for width 0.0700.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal2 is not specified for width 0.0700.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal3 is not specified for width 0.0700.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal3 is not specified for width 0.0700.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal4 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal3 is not specified for width 0.0700.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal4 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal4 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal5 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal4 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal5 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal5 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal6 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal5 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal6 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal6 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal7 is not specified for width 0.4000.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal6 is not specified for width 0.1400.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal7 is not specified for width 0.4000.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal7 is not specified for width 0.4000.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal8 is not specified for width 0.4000.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal7 is not specified for width 0.4000.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal8 is not specified for width 0.4000.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal8 is not specified for width 0.4000.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal9 is not specified for width 0.8000.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal8 is not specified for width 0.4000.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal9 is not specified for width 0.8000.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal9 is not specified for width 0.8000.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal10 is not specified for width 0.8000.
[08/19 18:27:08    353s] #WARNING (NRDB-2077) The below via enclosure for LAYER metal9 is not specified for width 0.8000.
[08/19 18:27:08    353s] #WARNING (NRDB-2078) The above via enclosure for LAYER metal10 is not specified for width 0.8000.
[08/19 18:27:08    353s] #Minimum voltage of a net in the design = 0.000.
[08/19 18:27:08    353s] #Maximum voltage of a net in the design = 1.100.
[08/19 18:27:08    353s] #Voltage range [0.000 - 0.000] has 1 net.
[08/19 18:27:08    353s] #Voltage range [1.100 - 1.100] has 1 net.
[08/19 18:27:08    353s] #Voltage range [0.000 - 1.100] has 1604 nets.
[08/19 18:27:08    353s] # metal1       H   Track-Pitch = 0.1400    Line-2-Via Pitch = 0.1350
[08/19 18:27:08    353s] # metal2       V   Track-Pitch = 0.1900    Line-2-Via Pitch = 0.1400
[08/19 18:27:08    353s] # metal3       H   Track-Pitch = 0.1400    Line-2-Via Pitch = 0.1400
[08/19 18:27:08    353s] # metal4       V   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
[08/19 18:27:08    353s] # metal5       H   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
[08/19 18:27:08    353s] # metal6       V   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
[08/19 18:27:08    353s] # metal7       H   Track-Pitch = 0.8400    Line-2-Via Pitch = 0.8000
[08/19 18:27:08    353s] # metal8       V   Track-Pitch = 0.8400    Line-2-Via Pitch = 0.8000
[08/19 18:27:08    353s] # metal9       H   Track-Pitch = 1.6000    Line-2-Via Pitch = 1.6000
[08/19 18:27:08    353s] # metal10      V   Track-Pitch = 1.6800    Line-2-Via Pitch = 1.6000
[08/19 18:27:08    353s] #Regenerating Ggrids automatically.
[08/19 18:27:08    353s] #Auto generating G-grids with size=15 tracks, using layer metal3's pitch = 0.1400.
[08/19 18:27:08    353s] #Using automatically generated G-grids.
[08/19 18:27:08    353s] #Done routing data preparation.
[08/19 18:27:08    353s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 927.16 (MB), peak = 1022.11 (MB)
[08/19 18:27:08    353s] #Merging special wires...
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #Finished routing data preparation on Wed Aug 19 18:27:08 2020
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #Cpu time = 00:00:00
[08/19 18:27:08    353s] #Elapsed time = 00:00:00
[08/19 18:27:08    353s] #Increased memory = 7.25 (MB)
[08/19 18:27:08    353s] #Total memory = 927.32 (MB)
[08/19 18:27:08    353s] #Peak memory = 1022.11 (MB)
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #Start global routing on Wed Aug 19 18:27:08 2020
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #Number of eco nets is 0
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #Start global routing data preparation on Wed Aug 19 18:27:08 2020
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #Start routing resource analysis on Wed Aug 19 18:27:08 2020
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #Routing resource analysis is done on Wed Aug 19 18:27:08 2020
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #  Resource Analysis:
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #               Routing  #Avail      #Track     #Total     %Gcell
[08/19 18:27:08    353s] #  Layer      Direction   Track     Blocked      Gcell    Blocked
[08/19 18:27:08    353s] #  --------------------------------------------------------------
[08/19 18:27:08    353s] #  metal1         H         552           0        1406    61.95%
[08/19 18:27:08    353s] #  metal2         V         423           0        1406     0.00%
[08/19 18:27:08    353s] #  metal3         H         552           0        1406     0.00%
[08/19 18:27:08    353s] #  metal4         V         286           0        1406     0.00%
[08/19 18:27:08    353s] #  metal5         H         275           0        1406     0.00%
[08/19 18:27:08    353s] #  metal6         V         286           0        1406     0.00%
[08/19 18:27:08    353s] #  metal7         H          91           0        1406     0.00%
[08/19 18:27:08    353s] #  metal8         V          95           0        1406     4.62%
[08/19 18:27:08    353s] #  metal9         H          33           4        1406    20.06%
[08/19 18:27:08    353s] #  metal10        V          29           9        1406    25.75%
[08/19 18:27:08    353s] #  --------------------------------------------------------------
[08/19 18:27:08    353s] #  Total                   2622       3.45%       14060    11.24%
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #Global routing data preparation is done on Wed Aug 19 18:27:08 2020
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 927.83 (MB), peak = 1022.11 (MB)
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 927.85 (MB), peak = 1022.11 (MB)
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #start global routing iteration 1...
[08/19 18:27:08    353s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 930.31 (MB), peak = 1022.11 (MB)
[08/19 18:27:08    353s] #
[08/19 18:27:08    353s] #start global routing iteration 2...
[08/19 18:27:09    354s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 934.22 (MB), peak = 1022.11 (MB)
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #start global routing iteration 3...
[08/19 18:27:09    354s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 934.85 (MB), peak = 1022.11 (MB)
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #Total number of trivial nets (e.g. < 2 pins) = 2 (skipped).
[08/19 18:27:09    354s] #Total number of routable nets = 1604.
[08/19 18:27:09    354s] #Total number of nets in the design = 1606.
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #1604 routable nets have only global wires.
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #Routed nets constraints summary:
[08/19 18:27:09    354s] #-----------------------------
[08/19 18:27:09    354s] #        Rules   Unconstrained  
[08/19 18:27:09    354s] #-----------------------------
[08/19 18:27:09    354s] #      Default            1604  
[08/19 18:27:09    354s] #-----------------------------
[08/19 18:27:09    354s] #        Total            1604  
[08/19 18:27:09    354s] #-----------------------------
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #Routing constraints summary of the whole design:
[08/19 18:27:09    354s] #-----------------------------
[08/19 18:27:09    354s] #        Rules   Unconstrained  
[08/19 18:27:09    354s] #-----------------------------
[08/19 18:27:09    354s] #      Default            1604  
[08/19 18:27:09    354s] #-----------------------------
[08/19 18:27:09    354s] #        Total            1604  
[08/19 18:27:09    354s] #-----------------------------
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #  Congestion Analysis: (blocked Gcells are excluded)
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #                 OverCon          
[08/19 18:27:09    354s] #                  #Gcell    %Gcell
[08/19 18:27:09    354s] #     Layer           (1)   OverCon
[08/19 18:27:09    354s] #  --------------------------------
[08/19 18:27:09    354s] #  metal1        0(0.00%)   (0.00%)
[08/19 18:27:09    354s] #  metal2        3(0.21%)   (0.21%)
[08/19 18:27:09    354s] #  metal3        0(0.00%)   (0.00%)
[08/19 18:27:09    354s] #  metal4        0(0.00%)   (0.00%)
[08/19 18:27:09    354s] #  metal5        0(0.00%)   (0.00%)
[08/19 18:27:09    354s] #  metal6        0(0.00%)   (0.00%)
[08/19 18:27:09    354s] #  metal7        0(0.00%)   (0.00%)
[08/19 18:27:09    354s] #  metal8        0(0.00%)   (0.00%)
[08/19 18:27:09    354s] #  metal9        0(0.00%)   (0.00%)
[08/19 18:27:09    354s] #  metal10       0(0.00%)   (0.00%)
[08/19 18:27:09    354s] #  --------------------------------
[08/19 18:27:09    354s] #     Total      3(0.02%)   (0.02%)
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #  The worst congested Gcell overcon (routing demand over resource in number of tracks) = 1
[08/19 18:27:09    354s] #  Overflow after GR: 0.00% H + 0.04% V
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] [hotspot] +------------+---------------+---------------+
[08/19 18:27:09    354s] [hotspot] |            |   max hotspot | total hotspot |
[08/19 18:27:09    354s] [hotspot] +------------+---------------+---------------+
[08/19 18:27:09    354s] [hotspot] | normalized |          0.00 |          0.00 |
[08/19 18:27:09    354s] [hotspot] +------------+---------------+---------------+
[08/19 18:27:09    354s] Local HotSpot Analysis: normalized max congestion hotspot area = 0.00, normalized total congestion hotspot area = 0.00 (area is in unit of 4 std-cell row bins)
[08/19 18:27:09    354s] [hotspot] max/total 0.00/0.00, big hotspot (>10) total 0.00
[08/19 18:27:09    354s] #Complete Global Routing.
[08/19 18:27:09    354s] #Total wire length = 29552 um.
[08/19 18:27:09    354s] #Total half perimeter of net bounding box = 30227 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal1 = 660 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal2 = 8288 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal3 = 11806 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal4 = 7080 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal5 = 1292 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal6 = 426 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal7 = 0 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal8 = 0 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal9 = 0 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal10 = 0 um.
[08/19 18:27:09    354s] #Total number of vias = 7491
[08/19 18:27:09    354s] #Up-Via Summary (total 7491):
[08/19 18:27:09    354s] #           
[08/19 18:27:09    354s] #-----------------------
[08/19 18:27:09    354s] # metal1           4339
[08/19 18:27:09    354s] # metal2           2674
[08/19 18:27:09    354s] # metal3            384
[08/19 18:27:09    354s] # metal4             70
[08/19 18:27:09    354s] # metal5             24
[08/19 18:27:09    354s] #-----------------------
[08/19 18:27:09    354s] #                  7491 
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #Max overcon = 1 tracks.
[08/19 18:27:09    354s] #Total overcon = 0.02%.
[08/19 18:27:09    354s] #Worst layer Gcell overcon rate = 0.00%.
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #Global routing statistics:
[08/19 18:27:09    354s] #Cpu time = 00:00:01
[08/19 18:27:09    354s] #Elapsed time = 00:00:01
[08/19 18:27:09    354s] #Increased memory = 8.07 (MB)
[08/19 18:27:09    354s] #Total memory = 935.43 (MB)
[08/19 18:27:09    354s] #Peak memory = 1022.11 (MB)
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #Finished global routing on Wed Aug 19 18:27:09 2020
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] ### route signature (4) =  545090770
[08/19 18:27:09    354s] ### violation signature (2) = 1905142130
[08/19 18:27:09    354s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 932.89 (MB), peak = 1022.11 (MB)
[08/19 18:27:09    354s] #Start Track Assignment.
[08/19 18:27:09    354s] #Done with 1856 horizontal wires in 1 hboxes and 1995 vertical wires in 1 hboxes.
[08/19 18:27:09    354s] #Done with 393 horizontal wires in 1 hboxes and 446 vertical wires in 1 hboxes.
[08/19 18:27:09    354s] #Done with 1 horizontal wires in 1 hboxes and 1 vertical wires in 1 hboxes.
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #Track assignment summary:
[08/19 18:27:09    354s] # layer   (wire length)   (overlap)     (long ovlp)	(with obs/pg/clk)  
[08/19 18:27:09    354s] #------------------------------------------------------------------------
[08/19 18:27:09    354s] # metal1       670.69 	  0.13%  	  0.00% 	  0.10%
[08/19 18:27:09    354s] # metal2      8291.05 	  0.05%  	  0.00% 	  0.00%
[08/19 18:27:09    354s] # metal3     11725.58 	  0.02%  	  0.00% 	  0.00%
[08/19 18:27:09    354s] # metal4      7123.07 	  0.00%  	  0.00% 	  0.00%
[08/19 18:27:09    354s] # metal5      1311.67 	  0.00%  	  0.00% 	  0.00%
[08/19 18:27:09    354s] # metal6       426.30 	  0.00%  	  0.00% 	  0.00%
[08/19 18:27:09    354s] # metal7         0.00 	  0.00%  	  0.00% 	  0.00%
[08/19 18:27:09    354s] # metal8         0.00 	  0.00%  	  0.00% 	  0.00%
[08/19 18:27:09    354s] # metal9         0.00 	  0.00%  	  0.00% 	  0.00%
[08/19 18:27:09    354s] # metal10        0.00 	  0.00%  	  0.00% 	  0.00%
[08/19 18:27:09    354s] #------------------------------------------------------------------------
[08/19 18:27:09    354s] # All       29548.35  	  0.03% 	  0.00% 	  0.00%
[08/19 18:27:09    354s] #Complete Track Assignment.
[08/19 18:27:09    354s] #Total wire length = 30451 um.
[08/19 18:27:09    354s] #Total half perimeter of net bounding box = 30227 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal1 = 1266 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal2 = 8275 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal3 = 12067 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal4 = 7106 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal5 = 1309 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal6 = 428 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal7 = 0 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal8 = 0 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal9 = 0 um.
[08/19 18:27:09    354s] #Total wire length on LAYER metal10 = 0 um.
[08/19 18:27:09    354s] #Total number of vias = 7491
[08/19 18:27:09    354s] #Up-Via Summary (total 7491):
[08/19 18:27:09    354s] #           
[08/19 18:27:09    354s] #-----------------------
[08/19 18:27:09    354s] # metal1           4339
[08/19 18:27:09    354s] # metal2           2674
[08/19 18:27:09    354s] # metal3            384
[08/19 18:27:09    354s] # metal4             70
[08/19 18:27:09    354s] # metal5             24
[08/19 18:27:09    354s] #-----------------------
[08/19 18:27:09    354s] #                  7491 
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] ### route signature (8) = 1808215826
[08/19 18:27:09    354s] ### violation signature (6) = 1905142130
[08/19 18:27:09    354s] #cpu time = 00:00:01, elapsed time = 00:00:01, memory = 936.27 (MB), peak = 1022.11 (MB)
[08/19 18:27:09    354s] #
[08/19 18:27:09    354s] #Routing data preparation, pin analysis, global routing and track assignment statistics:
[08/19 18:27:09    354s] #Cpu time = 00:00:01
[08/19 18:27:09    354s] #Elapsed time = 00:00:01
[08/19 18:27:09    354s] #Increased memory = 16.31 (MB)
[08/19 18:27:09    354s] #Total memory = 936.35 (MB)
[08/19 18:27:09    354s] #Peak memory = 1022.11 (MB)
[08/19 18:27:09    354s] ### max drc and si pitch = 4600 (  2.3000 um) MT-safe pitch = 3360 (  1.6800 um) patch pitch = 14000 (  7.0000 um)
[08/19 18:27:10    354s] #
[08/19 18:27:10    354s] #Start Detail Routing..
[08/19 18:27:10    354s] #start initial detail routing ...
[08/19 18:27:19    363s] #   number of violations = 1
[08/19 18:27:19    363s] #
[08/19 18:27:19    363s] #    By Layer and Type :
[08/19 18:27:19    363s] #	          Short   Totals
[08/19 18:27:19    363s] #	metal1        1        1
[08/19 18:27:19    363s] #	Totals        1        1
[08/19 18:27:19    363s] #cpu time = 00:00:09, elapsed time = 00:00:09, memory = 968.00 (MB), peak = 1022.11 (MB)
[08/19 18:27:19    363s] #start 1st optimization iteration ...
[08/19 18:27:19    363s] #   number of violations = 0
[08/19 18:27:19    363s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 968.37 (MB), peak = 1022.11 (MB)
[08/19 18:27:19    363s] #Complete Detail Routing.
[08/19 18:27:19    363s] #Total wire length = 30698 um.
[08/19 18:27:19    363s] #Total half perimeter of net bounding box = 30227 um.
[08/19 18:27:19    363s] #Total wire length on LAYER metal1 = 2183 um.
[08/19 18:27:19    363s] #Total wire length on LAYER metal2 = 8953 um.
[08/19 18:27:19    363s] #Total wire length on LAYER metal3 = 10567 um.
[08/19 18:27:19    363s] #Total wire length on LAYER metal4 = 7181 um.
[08/19 18:27:19    363s] #Total wire length on LAYER metal5 = 1373 um.
[08/19 18:27:19    363s] #Total wire length on LAYER metal6 = 441 um.
[08/19 18:27:19    363s] #Total wire length on LAYER metal7 = 0 um.
[08/19 18:27:19    363s] #Total wire length on LAYER metal8 = 0 um.
[08/19 18:27:19    363s] #Total wire length on LAYER metal9 = 0 um.
[08/19 18:27:19    363s] #Total wire length on LAYER metal10 = 0 um.
[08/19 18:27:19    363s] #Total number of vias = 7736
[08/19 18:27:19    363s] #Up-Via Summary (total 7736):
[08/19 18:27:19    363s] #           
[08/19 18:27:19    363s] #-----------------------
[08/19 18:27:19    363s] # metal1           4536
[08/19 18:27:19    363s] # metal2           2692
[08/19 18:27:19    363s] # metal3            416
[08/19 18:27:19    363s] # metal4             68
[08/19 18:27:19    363s] # metal5             24
[08/19 18:27:19    363s] #-----------------------
[08/19 18:27:19    363s] #                  7736 
[08/19 18:27:19    363s] #
[08/19 18:27:19    363s] #Total number of DRC violations = 0
[08/19 18:27:19    363s] ### route signature (15) = 1147995012
[08/19 18:27:19    363s] ### violation signature (13) = 1905142130
[08/19 18:27:19    363s] #Cpu time = 00:00:09
[08/19 18:27:19    363s] #Elapsed time = 00:00:09
[08/19 18:27:19    363s] #Increased memory = -2.63 (MB)
[08/19 18:27:19    363s] #Total memory = 933.72 (MB)
[08/19 18:27:19    363s] #Peak memory = 1022.11 (MB)
[08/19 18:27:19    363s] ### max drc and si pitch = 4600 (  2.3000 um) MT-safe pitch = 3360 (  1.6800 um) patch pitch = 14000 (  7.0000 um)
[08/19 18:27:19    364s] #
[08/19 18:27:19    364s] #Start Post Route wire spreading..
[08/19 18:27:19    364s] ### max drc and si pitch = 4600 (  2.3000 um) MT-safe pitch = 3360 (  1.6800 um) patch pitch = 14000 (  7.0000 um)
[08/19 18:27:19    364s] #
[08/19 18:27:19    364s] #Start DRC checking..
[08/19 18:27:20    365s] #   number of violations = 0
[08/19 18:27:20    365s] #cpu time = 00:00:01, elapsed time = 00:00:01, memory = 964.91 (MB), peak = 1022.11 (MB)
[08/19 18:27:20    365s] #CELL_VIEW SUM,init has no DRC violation.
[08/19 18:27:20    365s] #Total number of DRC violations = 0
[08/19 18:27:20    365s] ### route signature (21) =   19138996
[08/19 18:27:20    365s] ### violation signature (19) = 1905142130
[08/19 18:27:20    365s] #
[08/19 18:27:20    365s] #Start data preparation for wire spreading...
[08/19 18:27:20    365s] #
[08/19 18:27:20    365s] #Data preparation is done on Wed Aug 19 18:27:20 2020
[08/19 18:27:20    365s] #
[08/19 18:27:20    365s] #
[08/19 18:27:20    365s] #Start Post Route Wire Spread.
[08/19 18:27:20    365s] #Done with 868 horizontal wires in 1 hboxes and 880 vertical wires in 1 hboxes.
[08/19 18:27:20    365s] #Complete Post Route Wire Spread.
[08/19 18:27:20    365s] #
[08/19 18:27:20    365s] #Total wire length = 31335 um.
[08/19 18:27:20    365s] #Total half perimeter of net bounding box = 30227 um.
[08/19 18:27:20    365s] #Total wire length on LAYER metal1 = 2215 um.
[08/19 18:27:20    365s] #Total wire length on LAYER metal2 = 9221 um.
[08/19 18:27:20    365s] #Total wire length on LAYER metal3 = 10822 um.
[08/19 18:27:20    365s] #Total wire length on LAYER metal4 = 7262 um.
[08/19 18:27:20    365s] #Total wire length on LAYER metal5 = 1375 um.
[08/19 18:27:20    365s] #Total wire length on LAYER metal6 = 441 um.
[08/19 18:27:20    365s] #Total wire length on LAYER metal7 = 0 um.
[08/19 18:27:20    365s] #Total wire length on LAYER metal8 = 0 um.
[08/19 18:27:20    365s] #Total wire length on LAYER metal9 = 0 um.
[08/19 18:27:20    365s] #Total wire length on LAYER metal10 = 0 um.
[08/19 18:27:20    365s] #Total number of vias = 7736
[08/19 18:27:20    365s] #Up-Via Summary (total 7736):
[08/19 18:27:20    365s] #           
[08/19 18:27:20    365s] #-----------------------
[08/19 18:27:20    365s] # metal1           4536
[08/19 18:27:20    365s] # metal2           2692
[08/19 18:27:20    365s] # metal3            416
[08/19 18:27:20    365s] # metal4             68
[08/19 18:27:20    365s] # metal5             24
[08/19 18:27:20    365s] #-----------------------
[08/19 18:27:20    365s] #                  7736 
[08/19 18:27:20    365s] #
[08/19 18:27:20    365s] ### route signature (24) = 1229428164
[08/19 18:27:20    365s] ### violation signature (22) = 1905142130
[08/19 18:27:20    365s] ### max drc and si pitch = 4600 (  2.3000 um) MT-safe pitch = 3360 (  1.6800 um) patch pitch = 14000 (  7.0000 um)
[08/19 18:27:20    365s] #
[08/19 18:27:20    365s] #Start DRC checking..
[08/19 18:27:22    366s] #   number of violations = 0
[08/19 18:27:22    366s] #cpu time = 00:00:01, elapsed time = 00:00:01, memory = 962.68 (MB), peak = 1022.11 (MB)
[08/19 18:27:22    366s] #CELL_VIEW SUM,init has no DRC violation.
[08/19 18:27:22    366s] #Total number of DRC violations = 0
[08/19 18:27:22    366s] ### route signature (29) =  675303088
[08/19 18:27:22    366s] ### violation signature (27) = 1905142130
[08/19 18:27:22    366s] #   number of violations = 0
[08/19 18:27:22    366s] #cpu time = 00:00:02, elapsed time = 00:00:02, memory = 938.82 (MB), peak = 1022.11 (MB)
[08/19 18:27:22    366s] #CELL_VIEW SUM,init has no DRC violation.
[08/19 18:27:22    366s] #Total number of DRC violations = 0
[08/19 18:27:22    366s] #Post Route wire spread is done.
[08/19 18:27:22    366s] #Total wire length = 31335 um.
[08/19 18:27:22    366s] #Total half perimeter of net bounding box = 30227 um.
[08/19 18:27:22    366s] #Total wire length on LAYER metal1 = 2215 um.
[08/19 18:27:22    366s] #Total wire length on LAYER metal2 = 9221 um.
[08/19 18:27:22    366s] #Total wire length on LAYER metal3 = 10822 um.
[08/19 18:27:22    366s] #Total wire length on LAYER metal4 = 7262 um.
[08/19 18:27:22    366s] #Total wire length on LAYER metal5 = 1375 um.
[08/19 18:27:22    366s] #Total wire length on LAYER metal6 = 441 um.
[08/19 18:27:22    366s] #Total wire length on LAYER metal7 = 0 um.
[08/19 18:27:22    366s] #Total wire length on LAYER metal8 = 0 um.
[08/19 18:27:22    366s] #Total wire length on LAYER metal9 = 0 um.
[08/19 18:27:22    366s] #Total wire length on LAYER metal10 = 0 um.
[08/19 18:27:22    366s] #Total number of vias = 7736
[08/19 18:27:22    366s] #Up-Via Summary (total 7736):
[08/19 18:27:22    366s] #           
[08/19 18:27:22    366s] #-----------------------
[08/19 18:27:22    366s] # metal1           4536
[08/19 18:27:22    366s] # metal2           2692
[08/19 18:27:22    366s] # metal3            416
[08/19 18:27:22    366s] # metal4             68
[08/19 18:27:22    366s] # metal5             24
[08/19 18:27:22    366s] #-----------------------
[08/19 18:27:22    366s] #                  7736 
[08/19 18:27:22    366s] #
[08/19 18:27:22    366s] ### route signature (31) =  675303088
[08/19 18:27:22    366s] ### violation signature (29) = 1905142130
[08/19 18:27:22    366s] #detailRoute Statistics:
[08/19 18:27:22    366s] #Cpu time = 00:00:12
[08/19 18:27:22    366s] #Elapsed time = 00:00:12
[08/19 18:27:22    366s] #Increased memory = 0.35 (MB)
[08/19 18:27:22    366s] #Total memory = 936.70 (MB)
[08/19 18:27:22    366s] #Peak memory = 1022.11 (MB)
[08/19 18:27:22    366s] ### export route signature (32) =  675303088
[08/19 18:27:22    367s] ### export violation signature (30) = 1905142130
[08/19 18:27:22    367s] #
[08/19 18:27:22    367s] #globalDetailRoute statistics:
[08/19 18:27:22    367s] #Cpu time = 00:00:14
[08/19 18:27:22    367s] #Elapsed time = 00:00:14
[08/19 18:27:22    367s] #Increased memory = -70.03 (MB)
[08/19 18:27:22    367s] #Total memory = 928.81 (MB)
[08/19 18:27:22    367s] #Peak memory = 1022.11 (MB)
[08/19 18:27:22    367s] #Number of warnings = 38
[08/19 18:27:22    367s] #Total number of warnings = 39
[08/19 18:27:22    367s] #Number of fails = 0
[08/19 18:27:22    367s] #Total number of fails = 0
[08/19 18:27:22    367s] #Complete globalDetailRoute on Wed Aug 19 18:27:22 2020
[08/19 18:27:22    367s] #
[08/19 18:27:22    367s] #routeDesign: cpu time = 00:00:14, elapsed time = 00:00:14, memory = 917.93 (MB), peak = 1022.11 (MB)
[08/19 18:27:22    367s] 
[08/19 18:27:22    367s] *** Summary of all messages that are not suppressed in this session:
[08/19 18:27:22    367s] Severity  ID               Count  Summary                                  
[08/19 18:27:22    367s] WARNING   IMPCK-8086           1  The command %s is obsolete and will be r...
[08/19 18:27:22    367s] *** Message Summary: 1 warning(s), 0 error(s)
[08/19 18:27:22    367s] 
[08/19 18:27:22    367s] ### 
[08/19 18:27:22    367s] ###   Scalability Statistics
[08/19 18:27:22    367s] ### 
[08/19 18:27:22    367s] ### ------------------------+----------------+----------------+----------------+
[08/19 18:27:22    367s] ###   routeDesign           |        cpu time|    elapsed time|     scalability|
[08/19 18:27:22    367s] ### ------------------------+----------------+----------------+----------------+
[08/19 18:27:22    367s] ###   Data Preparation      |        00:00:00|        00:00:00|             1.0|
[08/19 18:27:22    367s] ###   Global Routing        |        00:00:01|        00:00:01|             1.0|
[08/19 18:27:22    367s] ###   Track Assignment      |        00:00:01|        00:00:01|             1.0|
[08/19 18:27:22    367s] ###   Detail Routing        |        00:00:09|        00:00:09|             1.0|
[08/19 18:27:22    367s] ###   Total                 |        00:00:14|        00:00:14|             1.0|
[08/19 18:27:22    367s] ### ------------------------+----------------+----------------+----------------+
[08/19 18:27:22    367s] ### 
[08/19 18:28:51    379s] <CMD> setAnalysisMode -analysisType onChipVariation
[08/19 18:29:19    383s] <CMD> setOptMode -fixCap true -fixTran true -fixFanoutLoad false
[08/19 18:29:19    383s] <CMD> optDesign -postRoute
[08/19 18:29:19    383s] **INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
[08/19 18:29:19    383s] Disable merging buffers from different footprints for postRoute code for non-MSV designs
[08/19 18:29:19    383s] Core basic site is FreePDK45_38x28_10R_NP_162NW_34O
[08/19 18:29:19    383s] Layer info - lib-1st H=1, V=2.  Cell-FPin=1. Top-pin=2
[08/19 18:29:19    383s] #spOpts: mergeVia=F 
[08/19 18:29:19    383s] Switching SI Aware to true by default in postroute mode   
[08/19 18:29:19    383s] GigaOpt running with 1 threads.
[08/19 18:29:19    383s] Info: 1 threads available for lower-level modules during optimization.
[08/19 18:29:19    383s] #spOpts: mergeVia=F 
[08/19 18:29:19    384s] Updating RC grid for preRoute extraction ...
[08/19 18:29:19    384s] Initializing multi-corner capacitance tables ... 
[08/19 18:29:19    384s] Initializing multi-corner resistance tables ...
[08/19 18:29:19    384s] 
[08/19 18:29:19    384s] Creating Lib Analyzer ...
[08/19 18:29:19    384s] Total number of usable buffers from Lib Analyzer: 9 ( CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32)
[08/19 18:29:19    384s] Total number of usable inverters from Lib Analyzer: 6 ( INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32)
[08/19 18:29:19    384s] Total number of usable delay cells from Lib Analyzer: 0 ()
[08/19 18:29:19    384s] 
[08/19 18:29:19    384s] Creating Lib Analyzer, finished. 
[08/19 18:29:19    384s] Effort level <high> specified for reg2reg path_group
[08/19 18:29:19    384s] **optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 932.8M, totSessionCpu=0:06:25 **
[08/19 18:29:19    384s] #Created 135 library cell signatures
[08/19 18:29:19    384s] #Created 1606 NETS and 0 SPECIALNETS signatures
[08/19 18:29:19    384s] #Created 3791 instance signatures
[08/19 18:29:19    384s] #Build design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 932.92 (MB), peak = 1022.11 (MB)
[08/19 18:29:19    384s] #Save design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 932.93 (MB), peak = 1022.11 (MB)
[08/19 18:29:19    384s] Begin checking placement ... (start mem=1193.3M, init mem=1193.3M)
[08/19 18:29:19    384s] *info: Placed = 3791          
[08/19 18:29:19    384s] *info: Unplaced = 0           
[08/19 18:29:19    384s] Placement Density:100.00%(4711/4711)
[08/19 18:29:19    384s] Placement Density (including fixed std cells):100.00%(4711/4711)
[08/19 18:29:19    384s] Finished checkPlace (cpu: total=0:00:00.0, vio checks=0:00:00.0; mem=1193.3M)
[08/19 18:29:19    384s]  Initial DC engine is -> aae
[08/19 18:29:19    384s]  
[08/19 18:29:19    384s]  AAE-Opt:: Current number of nets in RC Memory -> 100 K
[08/19 18:29:19    384s]  
[08/19 18:29:19    384s]  
[08/19 18:29:19    384s]  AAE-Opt:: New number of nets in RC Memory -> 100 K
[08/19 18:29:19    384s]  
[08/19 18:29:19    384s] Reset EOS DB
[08/19 18:29:19    384s] Ignoring AAE DB Resetting ...
[08/19 18:29:19    384s]  Set Options for AAE Based Opt flow 
[08/19 18:29:19    384s] *** optDesign -postRoute ***
[08/19 18:29:19    384s] DRC Margin: user margin 0.0; extra margin 0
[08/19 18:29:19    384s] Setup Target Slack: user slack 0
[08/19 18:29:19    384s] Hold Target Slack: user slack 0
[08/19 18:29:19    384s] Opt: RC extraction mode changed to 'detail'
[08/19 18:29:19    384s] Multi-VT timing optimization disabled based on library information.
[08/19 18:29:19    384s] Deleting Cell Server ...
[08/19 18:29:19    384s] Deleting Lib Analyzer.
[08/19 18:29:19    384s] Creating Cell Server ...(0, 0, 0, 0)
[08/19 18:29:19    384s] Summary for sequential cells identification: 
[08/19 18:29:19    384s]   Identified SBFF number: 16
[08/19 18:29:19    384s]   Identified MBFF number: 0
[08/19 18:29:19    384s]   Identified SB Latch number: 0
[08/19 18:29:19    384s]   Identified MB Latch number: 0
[08/19 18:29:19    384s]   Not identified SBFF number: 0
[08/19 18:29:19    384s]   Not identified MBFF number: 0
[08/19 18:29:19    384s]   Not identified SB Latch number: 0
[08/19 18:29:19    384s]   Not identified MB Latch number: 0
[08/19 18:29:19    384s]   Number of sequential cells which are not FFs: 13
[08/19 18:29:19    384s] Creating Cell Server, finished. 
[08/19 18:29:19    384s] 
[08/19 18:29:19    384s] 
[08/19 18:29:19    384s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:29:19    384s]   
[08/19 18:29:19    384s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:29:19    384s]   Deleting Cell Server ...
[08/19 18:29:19    384s] ** INFO : this run is activating 'postRoute' automaton
[08/19 18:29:19    384s] Extraction called for design 'SUM' of instances=3791 and nets=1606 using extraction engine 'postRoute' at effort level 'low' .
[08/19 18:29:19    384s] **WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
[08/19 18:29:19    384s] Type 'man IMPEXT-3530' for more detail.
[08/19 18:29:19    384s] PostRoute (effortLevel low) RC Extraction called for design SUM.
[08/19 18:29:19    384s] RC Extraction called in multi-corner(1) mode.
[08/19 18:29:19    384s] Process corner(s) are loaded.
[08/19 18:29:19    384s]  Corner: standard
[08/19 18:29:19    384s] extractDetailRC Option : -outfile /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d  -extended
[08/19 18:29:19    384s] RC Mode: PostRoute -effortLevel low [Extended CapTable, RC Table Resistances]
[08/19 18:29:19    384s]       RC Corner Indexes            0   
[08/19 18:29:19    384s] Capacitance Scaling Factor   : 1.00000 
[08/19 18:29:19    384s] Coupling Cap. Scaling Factor : 1.00000 
[08/19 18:29:19    384s] Resistance Scaling Factor    : 1.00000 
[08/19 18:29:19    384s] Clock Cap. Scaling Factor    : 1.00000 
[08/19 18:29:19    384s] Clock Res. Scaling Factor    : 1.00000 
[08/19 18:29:19    384s] Shrink Factor                : 1.00000
[08/19 18:29:20    384s] Initializing multi-corner capacitance tables ... 
[08/19 18:29:20    384s] Initializing multi-corner resistance tables ...
[08/19 18:29:20    384s] Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1187.2M)
[08/19 18:29:20    384s] Creating parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for storing RC.
[08/19 18:29:20    384s] Extracted 10.0065% (CPU Time= 0:00:00.1  MEM= 1226.3M)
[08/19 18:29:20    384s] Extracted 20.0071% (CPU Time= 0:00:00.1  MEM= 1250.3M)
[08/19 18:29:20    384s] Extracted 30.0077% (CPU Time= 0:00:00.1  MEM= 1250.3M)
[08/19 18:29:20    384s] Extracted 40.0082% (CPU Time= 0:00:00.1  MEM= 1250.3M)
[08/19 18:29:20    385s] Extracted 50.0088% (CPU Time= 0:00:00.1  MEM= 1250.3M)
[08/19 18:29:20    385s] Extracted 60.0094% (CPU Time= 0:00:00.1  MEM= 1250.3M)
[08/19 18:29:20    385s] Extracted 70.01% (CPU Time= 0:00:00.2  MEM= 1250.3M)
[08/19 18:29:20    385s] Extracted 80.0106% (CPU Time= 0:00:00.2  MEM= 1250.3M)
[08/19 18:29:20    385s] Extracted 90.0112% (CPU Time= 0:00:00.2  MEM= 1250.3M)
[08/19 18:29:20    385s] Extracted 100% (CPU Time= 0:00:00.3  MEM= 1250.3M)
[08/19 18:29:20    385s] Number of Extracted Resistors     : 24725
[08/19 18:29:20    385s] Number of Extracted Ground Cap.   : 26329
[08/19 18:29:20    385s] Number of Extracted Coupling Cap. : 45656
[08/19 18:29:20    385s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for reading.
[08/19 18:29:20    385s] Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
[08/19 18:29:20    385s]  Corner: standard
[08/19 18:29:20    385s] Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1210.3M)
[08/19 18:29:20    385s] Creating parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb_Filter.rcdb.d' for storing RC.
[08/19 18:29:20    385s] Closing parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d'. 1604 times net's RC data read were performed.
[08/19 18:29:20    385s] Lumped Parasitic Loading Started (total cpu=0:00:00.0, real=0:00:00.0, current mem=1218.328M)
[08/19 18:29:20    385s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for reading.
[08/19 18:29:20    385s] processing rcdb (/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d) for hinst (top) of cell (SUM);
[08/19 18:29:20    385s] Lumped Parasitic Loading Completed (total cpu=0:00:00.0, real=0:00:00.0, current mem=1218.328M)
[08/19 18:29:20    385s] PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.4  Real Time: 0:00:01.0  MEM: 1218.328M)
[08/19 18:29:20    385s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for reading.
[08/19 18:29:20    385s] RC Database In Completed (CPU Time= 0:00:00.0  Real Time=0:00:00.0  MEM= 1218.3M)
[08/19 18:29:20    385s] Initializing multi-corner capacitance tables ... 
[08/19 18:29:20    385s] Initializing multi-corner resistance tables ...
[08/19 18:29:20    385s] Unfixed 0 ViaPillar Nets
[08/19 18:29:20    385s] End AAE Lib Interpolated Model. (MEM=1218.33 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:20    385s] **INFO: Starting Blocking QThread with 1 CPU
[08/19 18:29:20    385s]  
   ____________________________________________________________________
__/ message from Blocking QThread
[08/19 18:29:20    385s] #################################################################################
[08/19 18:29:20    385s] # Design Stage: PostRoute
[08/19 18:29:20    385s] # Design Name: SUM
[08/19 18:29:20    385s] # Design Mode: 90nm
[08/19 18:29:20    385s] # Analysis Mode: MMMC OCV 
[08/19 18:29:20    385s] # Parasitics Mode: SPEF/RCDB
[08/19 18:29:20    385s] # Signoff Settings: SI Off 
[08/19 18:29:20    385s] #################################################################################
[08/19 18:29:20    385s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:20    385s] Calculate late delays in OCV mode...
[08/19 18:29:20    385s] Calculate early delays in OCV mode...
[08/19 18:29:20    385s] Topological Sorting (REAL = 0:00:00.0, MEM = 0.0M, InitMEM = 0.0M)
[08/19 18:29:20    385s] Start delay calculation (fullDC) (1 T). (MEM=0)
[08/19 18:29:20    385s] End AAE Lib Interpolated Model. (MEM=22.5312 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:20    385s] Total number of fetched objects 1990
[08/19 18:29:20    385s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:20    385s] End delay calculation. (MEM=0 CPU=0:00:00.7 REAL=0:00:00.0)
[08/19 18:29:20    385s] End delay calculation (fullDC). (MEM=0 CPU=0:00:00.7 REAL=0:00:01.0)
[08/19 18:29:20    385s] *** CDM Built up (cpu=0:00:00.7  real=0:00:01.0  mem= 0.0M) ***
[08/19 18:29:20    385s] *** Done Building Timing Graph (cpu=0:00:00.9 real=0:00:01.0 totSessionCpu=0:00:03.0 mem=0.0M)
[08/19 18:29:20    385s] Done building cte hold timing graph (HoldAware) cpu=0:00:01.0 real=0:00:01.0 totSessionCpu=0:00:03.0 mem=0.0M ***
[08/19 18:29:21    386s]  
_______________________________________________________________________
[08/19 18:29:22    386s] Starting SI iteration 1 using Infinite Timing Windows
[08/19 18:29:22    386s] Begin IPO call back ...
[08/19 18:29:22    386s] End IPO call back ...
[08/19 18:29:22    386s] #################################################################################
[08/19 18:29:22    386s] # Design Stage: PostRoute
[08/19 18:29:22    386s] # Design Name: SUM
[08/19 18:29:22    386s] # Design Mode: 90nm
[08/19 18:29:22    386s] # Analysis Mode: MMMC OCV 
[08/19 18:29:22    386s] # Parasitics Mode: SPEF/RCDB
[08/19 18:29:22    386s] # Signoff Settings: SI On 
[08/19 18:29:22    386s] #################################################################################
[08/19 18:29:22    387s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:22    387s] Setting infinite Tws ...
[08/19 18:29:22    387s] First Iteration Infinite Tw... 
[08/19 18:29:22    387s] Calculate early delays in OCV mode...
[08/19 18:29:22    387s] Calculate late delays in OCV mode...
[08/19 18:29:22    387s] Topological Sorting (REAL = 0:00:00.0, MEM = 1216.3M, InitMEM = 1216.3M)
[08/19 18:29:22    387s] Start delay calculation (fullDC) (1 T). (MEM=1216.33)
[08/19 18:29:22    387s] End AAE Lib Interpolated Model. (MEM=1232.48 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:23    388s] Total number of fetched objects 1990
[08/19 18:29:23    388s] AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
[08/19 18:29:23    388s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:23    388s] End delay calculation. (MEM=1270.63 CPU=0:00:01.0 REAL=0:00:01.0)
[08/19 18:29:23    388s] End delay calculation (fullDC). (MEM=1270.63 CPU=0:00:01.3 REAL=0:00:01.0)
[08/19 18:29:23    388s] *** CDM Built up (cpu=0:00:01.3  real=0:00:01.0  mem= 1270.6M) ***
[08/19 18:29:23    388s] Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1270.6M)
[08/19 18:29:23    388s] Add other clocks and setupCteToAAEClockMapping during iter 1
[08/19 18:29:23    388s] Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1270.6M)
[08/19 18:29:23    388s] 
[08/19 18:29:23    388s] Executing IPO callback for view pruning ..
[08/19 18:29:23    388s] Starting SI iteration 2
[08/19 18:29:24    388s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:24    388s] Calculate early delays in OCV mode...
[08/19 18:29:24    388s] Calculate late delays in OCV mode...
[08/19 18:29:24    388s] Start delay calculation (fullDC) (1 T). (MEM=1278.68)
[08/19 18:29:24    388s] End AAE Lib Interpolated Model. (MEM=1278.68 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:24    388s] Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
[08/19 18:29:24    388s] Glitch Analysis: View default -- Total Number of Nets Analyzed = 1990. 
[08/19 18:29:24    388s] Total number of fetched objects 1990
[08/19 18:29:24    388s] AAE_INFO-618: Total number of nets in the design is 1606,  1.6 percent of the nets selected for SI analysis
[08/19 18:29:24    388s] End delay calculation. (MEM=1246.67 CPU=0:00:00.1 REAL=0:00:00.0)
[08/19 18:29:24    388s] End delay calculation (fullDC). (MEM=1246.67 CPU=0:00:00.2 REAL=0:00:00.0)
[08/19 18:29:24    388s] *** CDM Built up (cpu=0:00:00.2  real=0:00:00.0  mem= 1246.7M) ***
[08/19 18:29:24    388s] *** Done Building Timing Graph (cpu=0:00:02.3 real=0:00:03.0 totSessionCpu=0:06:29 mem=1246.7M)
[08/19 18:29:24    388s] End AAE Lib Interpolated Model. (MEM=1246.67 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:24    389s] 
------------------------------------------------------------
     Initial SI Timing Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
**optDesign ... cpu = 0:00:04, real = 0:00:05, mem = 963.7M, totSessionCpu=0:06:29 **
[08/19 18:29:24    389s] Setting latch borrow mode to budget during optimization.
[08/19 18:29:24    389s] Glitch fixing enabled
[08/19 18:29:24    389s] **INFO: Start fixing DRV (Mem = 1243.23M) ...
[08/19 18:29:24    389s] Begin: GigaOpt DRV Optimization
[08/19 18:29:24    389s] Glitch fixing enabled
[08/19 18:29:24    389s] Info: 1 clock net  excluded from IPO operation.
[08/19 18:29:24    389s] End AAE Lib Interpolated Model. (MEM=1243.23 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:24    389s] PhyDesignGrid: maxLocalDensity 0.96
[08/19 18:29:24    389s] ### Creating PhyDesignMc. totSessionCpu=0:06:29 mem=1243.2M
[08/19 18:29:24    389s] #spOpts: mergeVia=F 
[08/19 18:29:24    389s] ### Creating PhyDesignMc, finished. totSessionCpu=0:06:29 mem=1243.2M
[08/19 18:29:24    389s] ### Creating LA Mngr. totSessionCpu=0:06:29 mem=1243.2M
[08/19 18:29:25    389s] ### Creating LA Mngr, finished. totSessionCpu=0:06:30 mem=1265.2M
[08/19 18:29:25    390s] ### Creating LA Mngr. totSessionCpu=0:06:30 mem=1426.2M
[08/19 18:29:25    390s] ### Creating LA Mngr, finished. totSessionCpu=0:06:30 mem=1426.2M
[08/19 18:29:25    390s] 
[08/19 18:29:25    390s] Creating Lib Analyzer ...
[08/19 18:29:25    390s] Total number of usable buffers from Lib Analyzer: 9 ( CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32)
[08/19 18:29:25    390s] Total number of usable inverters from Lib Analyzer: 6 ( INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32)
[08/19 18:29:25    390s] Total number of usable delay cells from Lib Analyzer: 0 ()
[08/19 18:29:25    390s] 
[08/19 18:29:26    390s] Creating Lib Analyzer, finished. 
[08/19 18:29:27    391s] DRV pessimism of 5.00% is used for tran, 5.00% for cap, 5.00% for fanout, on top of margin 0.00%
[08/19 18:29:27    391s] +---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:29:27    391s] |        max-tran       |        max-cap        |  max-fanout |  max-length |    glitch   |       setup       |        |        |        |       |          |         |
[08/19 18:29:27    391s] +---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:29:27    391s] | nets | terms|  wViol  | nets | terms|  wViol  | nets | terms| nets | terms| nets | terms|   WNS   |   TNS   |  #Buf  |  #Inv  | #Resize|Density|   Real   |   Mem   |
[08/19 18:29:27    391s] +---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:29:27    391s] Info: violation cost 0.000000 (cap = 0.000000, tran = 0.000000, len = 0.000000, fanout load = 0.000000, fanout count = 0.000000, glitch 0.000000)
[08/19 18:29:27    391s] |     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0|     0|     0.08|     0.00|       0|       0|       0| 100.00|          |         |
[08/19 18:29:27    391s] Info: violation cost 0.000000 (cap = 0.000000, tran = 0.000000, len = 0.000000, fanout load = 0.000000, fanout count = 0.000000, glitch 0.000000)
[08/19 18:29:27    391s] |     0|     0|     0.00|     0|     0|     0.00|     0|     0|     0|     0|     0|     0|     0.08|     0.00|       0|       0|       0| 100.00| 0:00:00.0|  1483.4M|
[08/19 18:29:27    391s] +---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
[08/19 18:29:27    391s] **** Begin NDR-Layer Usage Statistics ****
[08/19 18:29:27    391s] 0 Ndr or Layer constraints added by optimization 
[08/19 18:29:27    391s] **** End NDR-Layer Usage Statistics ****
[08/19 18:29:27    391s] 
[08/19 18:29:27    391s] *** Finish DRV Fixing (cpu=0:00:00.1 real=0:00:00.0 mem=1483.4M) ***
[08/19 18:29:27    391s] 
[08/19 18:29:27    391s] Begin: glitch net info
[08/19 18:29:27    391s] glitch slack range: number of glitch nets
[08/19 18:29:27    391s] glitch slack < -0.32 : 0
[08/19 18:29:27    391s] -0.32 < glitch slack < -0.28 : 0
[08/19 18:29:27    391s] -0.28 < glitch slack < -0.24 : 0
[08/19 18:29:27    391s] -0.24 < glitch slack < -0.2 : 0
[08/19 18:29:27    391s] -0.2 < glitch slack < -0.16 : 0
[08/19 18:29:27    391s] -0.16 < glitch slack < -0.12 : 0
[08/19 18:29:27    391s] -0.12 < glitch slack < -0.08 : 0
[08/19 18:29:27    391s] -0.08 < glitch slack < -0.04 : 0
[08/19 18:29:27    391s] -0.04 < glitch slack : 0
[08/19 18:29:27    391s] End: glitch net info
[08/19 18:29:27    391s] drv optimizer changes nothing and skips refinePlace
[08/19 18:29:27    391s] End: GigaOpt DRV Optimization
[08/19 18:29:27    391s] **optDesign ... cpu = 0:00:07, real = 0:00:08, mem = 1051.1M, totSessionCpu=0:06:32 **
[08/19 18:29:27    391s] *info:
[08/19 18:29:27    391s] **INFO: Completed fixing DRV (CPU Time = 0:00:03, Mem = 1344.26M).
[08/19 18:29:27    392s] 
------------------------------------------------------------
     SI Timing Summary (cpu=0.04min real=0.05min mem=1344.3M)                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
**optDesign ... cpu = 0:00:07, real = 0:00:08, mem = 1051.3M, totSessionCpu=0:06:32 **
[08/19 18:29:27    392s]   DRV Snapshot: (REF)
[08/19 18:29:27    392s]          Tran DRV: 0
[08/19 18:29:27    392s]           Cap DRV: 0
[08/19 18:29:27    392s]        Fanout DRV: 0
[08/19 18:29:27    392s]            Glitch: 0
[08/19 18:29:27    392s] *** Timing Is met
[08/19 18:29:27    392s] *** Check timing (0:00:00.0)
[08/19 18:29:27    392s] *** Setup timing is met (target slack 0ns)
[08/19 18:29:27    392s]   Timing Snapshot: (REF)
[08/19 18:29:27    392s]      Weighted WNS: 0.000
[08/19 18:29:27    392s]       All  PG WNS: 0.000
[08/19 18:29:27    392s]       High PG WNS: 0.000
[08/19 18:29:27    392s]       All  PG TNS: 0.000
[08/19 18:29:27    392s]       High PG TNS: 0.000
[08/19 18:29:27    392s]    Category Slack: { [L, 0.082] [H, 0.082] }
[08/19 18:29:27    392s] 
[08/19 18:29:27    392s] Running postRoute recovery in preEcoRoute mode
[08/19 18:29:27    392s] **optDesign ... cpu = 0:00:07, real = 0:00:08, mem = 1051.5M, totSessionCpu=0:06:32 **
[08/19 18:29:27    392s]   DRV Snapshot: (TGT)
[08/19 18:29:27    392s]          Tran DRV: 0
[08/19 18:29:27    392s]           Cap DRV: 0
[08/19 18:29:27    392s]        Fanout DRV: 0
[08/19 18:29:27    392s]            Glitch: 0
[08/19 18:29:27    392s] Checking DRV degradation...
[08/19 18:29:27    392s] 
[08/19 18:29:27    392s] Recovery Manager:
[08/19 18:29:27    392s]     Tran DRV degradation : 0 (0 -> 0, Margin 10) - Skip
[08/19 18:29:27    392s]      Cap DRV degradation : 0 (0 -> 0, Margin 10) - Skip
[08/19 18:29:27    392s]   Fanout DRV degradation : 0 (0 -> 0, Margin 10) - Skip
[08/19 18:29:27    392s]       Glitch degradation : 0 (0 -> 0, Margin 10) - Skip
[08/19 18:29:27    392s] 
[08/19 18:29:27    392s] **INFO: Skipping DRV recovery as drv did not degrade beyond margin
[08/19 18:29:27    392s] *** Finish postRoute recovery in preEcoRoute mode (cpu=0:00:00, real=0:00:00, mem=1277.49M, totSessionCpu=0:06:32).
[08/19 18:29:27    392s] **optDesign ... cpu = 0:00:07, real = 0:00:08, mem = 1051.5M, totSessionCpu=0:06:32 **
[08/19 18:29:27    392s] 
[08/19 18:29:27    392s]   Timing/DRV Snapshot: (REF)
[08/19 18:29:27    392s]      Weighted WNS: 0.000
[08/19 18:29:27    392s]       All  PG WNS: 0.000
[08/19 18:29:27    392s]       High PG WNS: 0.000
[08/19 18:29:27    392s]       All  PG TNS: 0.000
[08/19 18:29:27    392s]       High PG TNS: 0.000
[08/19 18:29:27    392s]          Tran DRV: 0
[08/19 18:29:27    392s]           Cap DRV: 0
[08/19 18:29:27    392s]        Fanout DRV: 0
[08/19 18:29:27    392s]            Glitch: 0
[08/19 18:29:27    392s]    Category Slack: { [L, 0.082] [H, 0.082] }
[08/19 18:29:27    392s] 
[08/19 18:29:27    392s] ### Creating LA Mngr. totSessionCpu=0:06:32 mem=1277.5M
[08/19 18:29:27    392s] ### Creating LA Mngr, finished. totSessionCpu=0:06:32 mem=1277.5M
[08/19 18:29:27    392s] Default Rule : ""
[08/19 18:29:27    392s] Non Default Rules :
[08/19 18:29:27    392s] Worst Slack : 0.082 ns
[08/19 18:29:27    392s] Total 0 nets layer assigned (0.0).
[08/19 18:29:27    392s] GigaOpt: setting up router preferences
[08/19 18:29:27    392s] GigaOpt: 0 nets assigned router directives
[08/19 18:29:27    392s] 
[08/19 18:29:27    392s] Start Assign Priority Nets ...
[08/19 18:29:27    392s] TargetSlk(0.200ns) MaxAssign(3%) minLen(50um)
[08/19 18:29:27    392s] Existing Priority Nets 0 (0.0%)
[08/19 18:29:27    392s] Assigned Priority Nets 0 (0.0%)
[08/19 18:29:27    392s] ### Creating LA Mngr. totSessionCpu=0:06:32 mem=1334.7M
[08/19 18:29:27    392s] ### Creating LA Mngr, finished. totSessionCpu=0:06:32 mem=1334.7M
[08/19 18:29:27    392s] ### Creating LA Mngr. totSessionCpu=0:06:32 mem=1334.7M
[08/19 18:29:27    392s] ### Creating LA Mngr, finished. totSessionCpu=0:06:32 mem=1334.7M
[08/19 18:29:27    392s] Default Rule : ""
[08/19 18:29:27    392s] Non Default Rules :
[08/19 18:29:27    392s] Worst Slack : 0.082 ns
[08/19 18:29:27    392s] Total 0 nets layer assigned (0.3).
[08/19 18:29:27    392s] GigaOpt: setting up router preferences
[08/19 18:29:27    392s] GigaOpt: 0 nets assigned router directives
[08/19 18:29:27    392s] 
[08/19 18:29:27    392s] Start Assign Priority Nets ...
[08/19 18:29:27    392s] TargetSlk(0.200ns) MaxAssign(3%) minLen(50um)
[08/19 18:29:27    392s] Existing Priority Nets 0 (0.0%)
[08/19 18:29:27    392s] Assigned Priority Nets 0 (0.0%)
[08/19 18:29:28    392s] 
------------------------------------------------------------
        Pre-ecoRoute Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
**optDesign ... cpu = 0:00:08, real = 0:00:09, mem = 973.5M, totSessionCpu=0:06:33 **
[08/19 18:29:28    392s] *** Starting refinePlace (0:06:33 mem=1205.6M) ***
[08/19 18:29:28    392s] Total net bbox length = 2.896e+04 (1.337e+04 1.559e+04) (ext = 2.220e+04)
[08/19 18:29:28    392s] **ERROR: (IMPSP-2002):	Density too high (100.0%), stopping detail placement.
Type 'man IMPSP-2002' for more detail.
[08/19 18:29:28    392s] **WARN: (IMPSP-5140):	Global net connect rules have not been created. Added  insts would have no supply connectivity, and would fail DRC.
[08/19 18:29:28    392s] Type 'man IMPSP-5140' for more detail.
[08/19 18:29:28    392s] **WARN: (IMPSP-315):	Found 3791 instances insts with no PG Term connections.
[08/19 18:29:28    392s] Type 'man IMPSP-315' for more detail.
[08/19 18:29:28    392s] Total net bbox length = 2.896e+04 (1.337e+04 1.559e+04) (ext = 2.220e+04)
[08/19 18:29:28    392s] Runtime: CPU: 0:00:00.0 REAL: 0:00:00.0 MEM: 1205.6MB
[08/19 18:29:28    392s] [CPU] RefinePlace/total (cpu=0:00:00.0, real=0:00:00.0, mem=1205.6MB) @(0:06:33 - 0:06:33).
[08/19 18:29:28    392s] *** Finished refinePlace (0:06:33 mem=1205.6M) ***
[08/19 18:29:28    392s] **ERROR: (IMPSP-9022):	Command 'refinePlace' completed with some error(s).
-routeWithEco false                       # bool, default=false
[08/19 18:29:28    392s] -routeWithEco true                        # bool, default=false, user setting
[08/19 18:29:28    392s] -routeSelectedNetOnly false               # bool, default=false
[08/19 18:29:28    392s] -routeWithTimingDriven false              # bool, default=false, user setting
[08/19 18:29:28    392s] -routeWithSiDriven false                  # bool, default=false, user setting
[08/19 18:29:28    392s] 
[08/19 18:29:28    392s] globalDetailRoute
[08/19 18:29:28    392s] 
[08/19 18:29:28    392s] #setNanoRouteMode -routeWithEco true
[08/19 18:29:28    392s] #setNanoRouteMode -routeWithSiDriven false
[08/19 18:29:28    392s] #setNanoRouteMode -routeWithTimingDriven false
[08/19 18:29:28    392s] #Start globalDetailRoute on Wed Aug 19 18:29:28 2020
[08/19 18:29:28    392s] #
[08/19 18:29:28    392s] Closing parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d'. 1604 times net's RC data read were performed.
[08/19 18:29:28    392s] ### Net info: total nets: 1606
[08/19 18:29:28    392s] ### Net info: dirty nets: 0
[08/19 18:29:28    392s] ### Net info: marked as disconnected nets: 0
[08/19 18:29:28    392s] ### Net info: fully routed nets: 1604
[08/19 18:29:28    392s] ### Net info: trivial (single pin) nets: 0
[08/19 18:29:28    392s] ### Net info: unrouted nets: 2
[08/19 18:29:28    392s] ### Net info: re-extraction nets: 0
[08/19 18:29:28    392s] ### Net info: ignored nets: 0
[08/19 18:29:28    392s] ### Net info: skip routing nets: 0
[08/19 18:29:28    392s] ### import route signature (33) = 2059559342
[08/19 18:29:28    392s] #WARNING (NRDB-2005) SPECIAL_NET vdd has special wires but no definitions for instance pins or top level pins. This will cause routability problems later.
[08/19 18:29:28    392s] #WARNING (NRDB-2005) SPECIAL_NET gnd has special wires but no definitions for instance pins or top level pins. This will cause routability problems later.
[08/19 18:29:28    392s] #NanoRoute Version 17.11-s080_1 NR170721-2155/17_11-UB
[08/19 18:29:28    392s] #RTESIG:78da8dcf410b82401005e0cefd8a61f56090366fdd75dd6bd0b522aaab18680492e0aeff
[08/19 18:29:28    392s] #       3fa35b44eb1cdf7c3c66a2f8ba3b9180c980d471c915687f826123914a68bd81a9a6d565
[08/19 18:29:28    392s] #       2b96517c389e8b22a7b6ee5c43c9adefbb358dae19c835de3f9ef7d5c758ad089c81df43
[08/19 18:29:28    392s] #       49dbf5b5ff09c190c136c852911fc6bf26870e1a55f20c63c307298b70919df199969a84
[08/19 18:29:28    392s] #       a0c4f9614abfcde2054a7b7a31
[08/19 18:29:28    392s] #
[08/19 18:29:28    392s] #Loading the last recorded routing design signature
[08/19 18:29:28    392s] #No placement changes detected since last routing
[08/19 18:29:28    392s] #RTESIG:78da8dcf410b82401005e0cefd8a61f56090366fdd75dd6bd0b522aaab18680492e0aeff
[08/19 18:29:28    392s] #       3fa35b44eb1cdf7c3c66a2f8ba3b9180c980d471c915687f826123914a68bd81a9a6d565
[08/19 18:29:28    392s] #       2b96517c389e8b22a7b6ee5c43c9adefbb358dae19c835de3f9ef7d5c758ad089c81df43
[08/19 18:29:28    392s] #       49dbf5b5ff09c190c136c852911fc6bf26870e1a55f20c63c307298b70919df199969a84
[08/19 18:29:28    392s] #       a0c4f9614abfcde2054a7b7a31
[08/19 18:29:28    392s] #
[08/19 18:29:28    392s] #Start routing data preparation on Wed Aug 19 18:29:28 2020
[08/19 18:29:28    392s] #
[08/19 18:29:28    392s] #Minimum voltage of a net in the design = 0.000.
[08/19 18:29:28    392s] #Maximum voltage of a net in the design = 1.100.
[08/19 18:29:28    392s] #Voltage range [0.000 - 0.000] has 1 net.
[08/19 18:29:28    392s] #Voltage range [1.100 - 1.100] has 1 net.
[08/19 18:29:28    392s] #Voltage range [0.000 - 1.100] has 1604 nets.
[08/19 18:29:28    392s] # metal1       H   Track-Pitch = 0.1400    Line-2-Via Pitch = 0.1350
[08/19 18:29:28    392s] # metal2       V   Track-Pitch = 0.1900    Line-2-Via Pitch = 0.1400
[08/19 18:29:28    392s] # metal3       H   Track-Pitch = 0.1400    Line-2-Via Pitch = 0.1400
[08/19 18:29:28    392s] # metal4       V   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
[08/19 18:29:28    392s] # metal5       H   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
[08/19 18:29:28    392s] # metal6       V   Track-Pitch = 0.2800    Line-2-Via Pitch = 0.2800
[08/19 18:29:28    392s] # metal7       H   Track-Pitch = 0.8400    Line-2-Via Pitch = 0.8000
[08/19 18:29:28    392s] # metal8       V   Track-Pitch = 0.8400    Line-2-Via Pitch = 0.8000
[08/19 18:29:28    392s] # metal9       H   Track-Pitch = 1.6000    Line-2-Via Pitch = 1.6000
[08/19 18:29:28    392s] # metal10      V   Track-Pitch = 1.6800    Line-2-Via Pitch = 1.6000
[08/19 18:29:28    392s] #Regenerating Ggrids automatically.
[08/19 18:29:28    392s] #Auto generating G-grids with size=15 tracks, using layer metal3's pitch = 0.1400.
[08/19 18:29:28    392s] #Using automatically generated G-grids.
[08/19 18:29:28    392s] #Done routing data preparation.
[08/19 18:29:28    392s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 974.63 (MB), peak = 1069.11 (MB)
[08/19 18:29:28    392s] #Merging special wires...
[08/19 18:29:28    392s] #Found 0 nets for post-route si or timing fixing.
[08/19 18:29:28    392s] #
[08/19 18:29:28    392s] #Finished routing data preparation on Wed Aug 19 18:29:28 2020
[08/19 18:29:28    392s] #
[08/19 18:29:28    392s] #Cpu time = 00:00:00
[08/19 18:29:28    392s] #Elapsed time = 00:00:00
[08/19 18:29:28    392s] #Increased memory = 3.98 (MB)
[08/19 18:29:28    392s] #Total memory = 974.63 (MB)
[08/19 18:29:28    392s] #Peak memory = 1069.11 (MB)
[08/19 18:29:28    392s] #
[08/19 18:29:28    392s] #
[08/19 18:29:28    392s] #Start global routing on Wed Aug 19 18:29:28 2020
[08/19 18:29:28    392s] #
[08/19 18:29:28    392s] #WARNING (NRGR-22) Design is already detail routed.
[08/19 18:29:28    392s] ### route signature (36) =  677327295
[08/19 18:29:28    392s] ### violation signature (33) = 1905142130
[08/19 18:29:28    392s] ### route signature (39) =  944022535
[08/19 18:29:28    392s] ### violation signature (36) = 1905142130
[08/19 18:29:28    392s] #Routing data preparation, pin analysis, global routing and track assignment statistics:
[08/19 18:29:28    392s] #Cpu time = 00:00:00
[08/19 18:29:28    392s] #Elapsed time = 00:00:00
[08/19 18:29:28    392s] #Increased memory = 3.99 (MB)
[08/19 18:29:28    392s] #Total memory = 974.64 (MB)
[08/19 18:29:28    392s] #Peak memory = 1069.11 (MB)
[08/19 18:29:28    392s] ### max drc and si pitch = 4600 (  2.3000 um) MT-safe pitch = 3360 (  1.6800 um) patch pitch = 14000 (  7.0000 um)
[08/19 18:29:28    393s] #
[08/19 18:29:28    393s] #Start Detail Routing..
[08/19 18:29:28    393s] #start initial detail routing ...
[08/19 18:29:28    393s] #   number of violations = 0
[08/19 18:29:28    393s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 976.76 (MB), peak = 1069.11 (MB)
[08/19 18:29:28    393s] #start 1st optimization iteration ...
[08/19 18:29:28    393s] #   number of violations = 0
[08/19 18:29:28    393s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 976.76 (MB), peak = 1069.11 (MB)
[08/19 18:29:28    393s] #Complete Detail Routing.
[08/19 18:29:28    393s] #Total wire length = 31335 um.
[08/19 18:29:28    393s] #Total half perimeter of net bounding box = 30227 um.
[08/19 18:29:28    393s] #Total wire length on LAYER metal1 = 2215 um.
[08/19 18:29:28    393s] #Total wire length on LAYER metal2 = 9221 um.
[08/19 18:29:28    393s] #Total wire length on LAYER metal3 = 10822 um.
[08/19 18:29:28    393s] #Total wire length on LAYER metal4 = 7262 um.
[08/19 18:29:28    393s] #Total wire length on LAYER metal5 = 1375 um.
[08/19 18:29:28    393s] #Total wire length on LAYER metal6 = 441 um.
[08/19 18:29:28    393s] #Total wire length on LAYER metal7 = 0 um.
[08/19 18:29:28    393s] #Total wire length on LAYER metal8 = 0 um.
[08/19 18:29:28    393s] #Total wire length on LAYER metal9 = 0 um.
[08/19 18:29:28    393s] #Total wire length on LAYER metal10 = 0 um.
[08/19 18:29:28    393s] #Total number of vias = 7736
[08/19 18:29:28    393s] #Up-Via Summary (total 7736):
[08/19 18:29:28    393s] #           
[08/19 18:29:28    393s] #-----------------------
[08/19 18:29:28    393s] # metal1           4536
[08/19 18:29:28    393s] # metal2           2692
[08/19 18:29:28    393s] # metal3            416
[08/19 18:29:28    393s] # metal4             68
[08/19 18:29:28    393s] # metal5             24
[08/19 18:29:28    393s] #-----------------------
[08/19 18:29:28    393s] #                  7736 
[08/19 18:29:28    393s] #
[08/19 18:29:28    393s] #Total number of DRC violations = 0
[08/19 18:29:28    393s] ### route signature (44) =  944022535
[08/19 18:29:28    393s] ### violation signature (41) = 1905142130
[08/19 18:29:28    393s] #Cpu time = 00:00:00
[08/19 18:29:28    393s] #Elapsed time = 00:00:00
[08/19 18:29:28    393s] #Increased memory = 0.00 (MB)
[08/19 18:29:28    393s] #Total memory = 974.64 (MB)
[08/19 18:29:28    393s] #Peak memory = 1069.11 (MB)
[08/19 18:29:28    393s] ### max drc and si pitch = 4600 (  2.3000 um) MT-safe pitch = 3360 (  1.6800 um) patch pitch = 14000 (  7.0000 um)
[08/19 18:29:28    393s] #
[08/19 18:29:28    393s] #Start Post Route wire spreading..
[08/19 18:29:28    393s] #
[08/19 18:29:28    393s] #Start data preparation for wire spreading...
[08/19 18:29:28    393s] #
[08/19 18:29:28    393s] #Data preparation is done on Wed Aug 19 18:29:28 2020
[08/19 18:29:28    393s] #
[08/19 18:29:28    393s] #
[08/19 18:29:28    393s] #Start Post Route Wire Spread.
[08/19 18:29:29    393s] #Done with 231 horizontal wires in 1 hboxes and 164 vertical wires in 1 hboxes.
[08/19 18:29:29    393s] #Complete Post Route Wire Spread.
[08/19 18:29:29    393s] #
[08/19 18:29:29    393s] #Total wire length = 31431 um.
[08/19 18:29:29    393s] #Total half perimeter of net bounding box = 30227 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal1 = 2218 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal2 = 9269 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal3 = 10859 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal4 = 7269 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal5 = 1375 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal6 = 441 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal7 = 0 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal8 = 0 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal9 = 0 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal10 = 0 um.
[08/19 18:29:29    393s] #Total number of vias = 7736
[08/19 18:29:29    393s] #Up-Via Summary (total 7736):
[08/19 18:29:29    393s] #           
[08/19 18:29:29    393s] #-----------------------
[08/19 18:29:29    393s] # metal1           4536
[08/19 18:29:29    393s] # metal2           2692
[08/19 18:29:29    393s] # metal3            416
[08/19 18:29:29    393s] # metal4             68
[08/19 18:29:29    393s] # metal5             24
[08/19 18:29:29    393s] #-----------------------
[08/19 18:29:29    393s] #                  7736 
[08/19 18:29:29    393s] #
[08/19 18:29:29    393s] ### route signature (48) = 1968054823
[08/19 18:29:29    393s] ### violation signature (45) = 1905142130
[08/19 18:29:29    393s] #   number of violations = 0
[08/19 18:29:29    393s] #cpu time = 00:00:00, elapsed time = 00:00:00, memory = 981.58 (MB), peak = 1069.11 (MB)
[08/19 18:29:29    393s] #CELL_VIEW SUM,init has no DRC violation.
[08/19 18:29:29    393s] #Total number of DRC violations = 0
[08/19 18:29:29    393s] #Post Route wire spread is done.
[08/19 18:29:29    393s] #Total wire length = 31431 um.
[08/19 18:29:29    393s] #Total half perimeter of net bounding box = 30227 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal1 = 2218 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal2 = 9269 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal3 = 10859 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal4 = 7269 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal5 = 1375 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal6 = 441 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal7 = 0 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal8 = 0 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal9 = 0 um.
[08/19 18:29:29    393s] #Total wire length on LAYER metal10 = 0 um.
[08/19 18:29:29    393s] #Total number of vias = 7736
[08/19 18:29:29    393s] #Up-Via Summary (total 7736):
[08/19 18:29:29    393s] #           
[08/19 18:29:29    393s] #-----------------------
[08/19 18:29:29    393s] # metal1           4536
[08/19 18:29:29    393s] # metal2           2692
[08/19 18:29:29    393s] # metal3            416
[08/19 18:29:29    393s] # metal4             68
[08/19 18:29:29    393s] # metal5             24
[08/19 18:29:29    393s] #-----------------------
[08/19 18:29:29    393s] #                  7736 
[08/19 18:29:29    393s] #
[08/19 18:29:29    393s] ### route signature (50) = 1968054823
[08/19 18:29:29    393s] ### violation signature (47) = 1905142130
[08/19 18:29:29    393s] #detailRoute Statistics:
[08/19 18:29:29    393s] #Cpu time = 00:00:01
[08/19 18:29:29    393s] #Elapsed time = 00:00:01
[08/19 18:29:29    393s] #Increased memory = 0.15 (MB)
[08/19 18:29:29    393s] #Total memory = 974.79 (MB)
[08/19 18:29:29    393s] #Peak memory = 1069.11 (MB)
[08/19 18:29:29    393s] #Updating routing design signature
[08/19 18:29:29    393s] #Created 135 library cell signatures
[08/19 18:29:29    393s] #Created 1606 NETS and 0 SPECIALNETS signatures
[08/19 18:29:29    393s] #Created 3791 instance signatures
[08/19 18:29:29    393s] #Build design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 974.79 (MB), peak = 1069.11 (MB)
[08/19 18:29:29    393s] #Save design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 974.80 (MB), peak = 1069.11 (MB)
[08/19 18:29:29    393s] ### export route signature (51) = 1968054823
[08/19 18:29:29    393s] #
[08/19 18:29:29    393s] #globalDetailRoute statistics:
[08/19 18:29:29    393s] #Cpu time = 00:00:01
[08/19 18:29:29    393s] #Elapsed time = 00:00:01
[08/19 18:29:29    393s] #Increased memory = 0.77 (MB)
[08/19 18:29:29    393s] #Total memory = 974.30 (MB)
[08/19 18:29:29    393s] #Peak memory = 1069.11 (MB)
[08/19 18:29:29    393s] #Number of warnings = 3
[08/19 18:29:29    393s] #Total number of warnings = 42
[08/19 18:29:29    393s] #Number of fails = 0
[08/19 18:29:29    393s] #Total number of fails = 0
[08/19 18:29:29    393s] #Complete globalDetailRoute on Wed Aug 19 18:29:29 2020
[08/19 18:29:29    393s] #
[08/19 18:29:29    393s] ### 
[08/19 18:29:29    393s] ###   Scalability Statistics
[08/19 18:29:29    393s] ### 
[08/19 18:29:29    393s] ### ------------------------+----------------+----------------+----------------+
[08/19 18:29:29    393s] ###   globalDetailRoute     |        cpu time|    elapsed time|     scalability|
[08/19 18:29:29    393s] ### ------------------------+----------------+----------------+----------------+
[08/19 18:29:29    393s] ###   Data Preparation      |        00:00:00|        00:00:00|             1.0|
[08/19 18:29:29    393s] ###   Global Routing        |        00:00:00|        00:00:00|             1.0|
[08/19 18:29:29    393s] ###   Detail Routing        |        00:00:00|        00:00:00|             1.0|
[08/19 18:29:29    393s] ###   Total                 |        00:00:01|        00:00:01|             1.0|
[08/19 18:29:29    393s] ### ------------------------+----------------+----------------+----------------+
[08/19 18:29:29    393s] ### 
[08/19 18:29:29    393s] **optDesign ... cpu = 0:00:09, real = 0:00:10, mem = 974.3M, totSessionCpu=0:06:34 **
[08/19 18:29:29    393s] -routeWithEco false                       # bool, default=false
[08/19 18:29:29    393s] -routeSelectedNetOnly false               # bool, default=false
[08/19 18:29:29    393s] -routeWithTimingDriven false              # bool, default=false, user setting
[08/19 18:29:29    393s] -routeWithSiDriven false                  # bool, default=false, user setting
[08/19 18:29:29    393s] Extraction called for design 'SUM' of instances=3791 and nets=1606 using extraction engine 'postRoute' at effort level 'low' .
[08/19 18:29:29    393s] **WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
[08/19 18:29:29    393s] Type 'man IMPEXT-3530' for more detail.
[08/19 18:29:29    393s] PostRoute (effortLevel low) RC Extraction called for design SUM.
[08/19 18:29:29    393s] RC Extraction called in multi-corner(1) mode.
[08/19 18:29:29    393s] Process corner(s) are loaded.
[08/19 18:29:29    393s]  Corner: standard
[08/19 18:29:29    393s] extractDetailRC Option : -outfile /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d -maxResLength 200  -extended
[08/19 18:29:29    393s] RC Mode: PostRoute -effortLevel low [Extended CapTable, RC Table Resistances]
[08/19 18:29:29    393s]       RC Corner Indexes            0   
[08/19 18:29:29    393s] Capacitance Scaling Factor   : 1.00000 
[08/19 18:29:29    393s] Coupling Cap. Scaling Factor : 1.00000 
[08/19 18:29:29    393s] Resistance Scaling Factor    : 1.00000 
[08/19 18:29:29    393s] Clock Cap. Scaling Factor    : 1.00000 
[08/19 18:29:29    393s] Clock Res. Scaling Factor    : 1.00000 
[08/19 18:29:29    393s] Shrink Factor                : 1.00000
[08/19 18:29:29    393s] Initializing multi-corner capacitance tables ... 
[08/19 18:29:29    393s] Initializing multi-corner resistance tables ...
[08/19 18:29:29    393s] Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1207.4M)
[08/19 18:29:29    393s] Creating parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for storing RC.
[08/19 18:29:29    393s] Extracted 10.0078% (CPU Time= 0:00:00.1  MEM= 1243.4M)
[08/19 18:29:29    393s] Extracted 20.0101% (CPU Time= 0:00:00.1  MEM= 1268.4M)
[08/19 18:29:29    393s] Extracted 30.0067% (CPU Time= 0:00:00.1  MEM= 1268.4M)
[08/19 18:29:29    393s] Extracted 40.009% (CPU Time= 0:00:00.1  MEM= 1268.4M)
[08/19 18:29:29    393s] Extracted 50.0112% (CPU Time= 0:00:00.1  MEM= 1268.4M)
[08/19 18:29:29    393s] Extracted 60.0078% (CPU Time= 0:00:00.1  MEM= 1268.4M)
[08/19 18:29:29    393s] Extracted 70.0101% (CPU Time= 0:00:00.2  MEM= 1268.4M)
[08/19 18:29:29    393s] Extracted 80.0067% (CPU Time= 0:00:00.2  MEM= 1268.4M)
[08/19 18:29:29    394s] Extracted 90.009% (CPU Time= 0:00:00.2  MEM= 1268.4M)
[08/19 18:29:29    394s] Extracted 100% (CPU Time= 0:00:00.3  MEM= 1268.4M)
[08/19 18:29:29    394s] Number of Extracted Resistors     : 25612
[08/19 18:29:29    394s] Number of Extracted Ground Cap.   : 27216
[08/19 18:29:29    394s] Number of Extracted Coupling Cap. : 46936
[08/19 18:29:29    394s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for reading.
[08/19 18:29:29    394s] Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
[08/19 18:29:29    394s]  Corner: standard
[08/19 18:29:29    394s] Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1245.4M)
[08/19 18:29:29    394s] Creating parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb_Filter.rcdb.d' for storing RC.
[08/19 18:29:29    394s] Closing parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d'. 1604 times net's RC data read were performed.
[08/19 18:29:29    394s] Lumped Parasitic Loading Started (total cpu=0:00:00.0, real=0:00:00.0, current mem=1253.406M)
[08/19 18:29:29    394s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for reading.
[08/19 18:29:29    394s] processing rcdb (/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d) for hinst (top) of cell (SUM);
[08/19 18:29:29    394s] Lumped Parasitic Loading Completed (total cpu=0:00:00.0, real=0:00:00.0, current mem=1253.406M)
[08/19 18:29:29    394s] PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.4  Real Time: 0:00:00.0  MEM: 1253.406M)
[08/19 18:29:29    394s] **optDesign ... cpu = 0:00:10, real = 0:00:10, mem = 941.7M, totSessionCpu=0:06:34 **
[08/19 18:29:29    394s] Starting SI iteration 1 using Infinite Timing Windows
[08/19 18:29:29    394s] Begin IPO call back ...
[08/19 18:29:30    394s] End IPO call back ...
[08/19 18:29:30    394s] #################################################################################
[08/19 18:29:30    394s] # Design Stage: PostRoute
[08/19 18:29:30    394s] # Design Name: SUM
[08/19 18:29:30    394s] # Design Mode: 90nm
[08/19 18:29:30    394s] # Analysis Mode: MMMC OCV 
[08/19 18:29:30    394s] # Parasitics Mode: SPEF/RCDB
[08/19 18:29:30    394s] # Signoff Settings: SI On 
[08/19 18:29:30    394s] #################################################################################
[08/19 18:29:30    394s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:30    394s] Setting infinite Tws ...
[08/19 18:29:30    394s] First Iteration Infinite Tw... 
[08/19 18:29:30    394s] Calculate early delays in OCV mode...
[08/19 18:29:30    394s] Calculate late delays in OCV mode...
[08/19 18:29:30    394s] Topological Sorting (REAL = 0:00:00.0, MEM = 1197.4M, InitMEM = 1197.4M)
[08/19 18:29:30    394s] Start delay calculation (fullDC) (1 T). (MEM=1197.43)
[08/19 18:29:30    394s] Initializing multi-corner capacitance tables ... 
[08/19 18:29:30    394s] Initializing multi-corner resistance tables ...
[08/19 18:29:30    395s] End AAE Lib Interpolated Model. (MEM=1213.59 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:30    395s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for reading.
[08/19 18:29:30    395s] RC Database In Completed (CPU Time= 0:00:00.0  Real Time=0:00:00.0  MEM= 1215.6M)
[08/19 18:29:30    395s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:31    396s] Total number of fetched objects 1990
[08/19 18:29:31    396s] AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
[08/19 18:29:31    396s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:31    396s] End delay calculation. (MEM=1282.35 CPU=0:00:01.1 REAL=0:00:01.0)
[08/19 18:29:31    396s] End delay calculation (fullDC). (MEM=1282.35 CPU=0:00:01.4 REAL=0:00:01.0)
[08/19 18:29:31    396s] *** CDM Built up (cpu=0:00:01.5  real=0:00:01.0  mem= 1282.3M) ***
[08/19 18:29:32    396s] Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1282.3M)
[08/19 18:29:32    396s] Add other clocks and setupCteToAAEClockMapping during iter 1
[08/19 18:29:32    396s] Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1282.3M)
[08/19 18:29:32    396s] Starting SI iteration 2
[08/19 18:29:32    396s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:32    396s] Calculate early delays in OCV mode...
[08/19 18:29:32    396s] Calculate late delays in OCV mode...
[08/19 18:29:32    396s] Start delay calculation (fullDC) (1 T). (MEM=1290.39)
[08/19 18:29:32    396s] End AAE Lib Interpolated Model. (MEM=1290.39 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:32    396s] Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
[08/19 18:29:32    396s] Glitch Analysis: View default -- Total Number of Nets Analyzed = 1990. 
[08/19 18:29:32    396s] Total number of fetched objects 1990
[08/19 18:29:32    396s] AAE_INFO-618: Total number of nets in the design is 1606,  1.6 percent of the nets selected for SI analysis
[08/19 18:29:32    396s] End delay calculation. (MEM=1258.39 CPU=0:00:00.1 REAL=0:00:00.0)
[08/19 18:29:32    396s] End delay calculation (fullDC). (MEM=1258.39 CPU=0:00:00.1 REAL=0:00:00.0)
[08/19 18:29:32    396s] *** CDM Built up (cpu=0:00:00.1  real=0:00:00.0  mem= 1258.4M) ***
[08/19 18:29:32    396s] *** Done Building Timing Graph (cpu=0:00:02.7 real=0:00:03.0 totSessionCpu=0:06:37 mem=1258.4M)
[08/19 18:29:32    396s] **optDesign ... cpu = 0:00:12, real = 0:00:13, mem = 976.4M, totSessionCpu=0:06:37 **
[08/19 18:29:32    396s] Executing marking Critical Nets1
[08/19 18:29:32    397s] Footprint XOR2_X1 has at least 2 pins...
[08/19 18:29:32    397s] Footprint XNOR2_X1 has at least 3 pins...
[08/19 18:29:32    397s] Footprint TLAT_X1 has at least 4 pins...
[08/19 18:29:32    397s] Footprint SDFF_X1 has at least 5 pins...
[08/19 18:29:32    397s] *** Number of Vt Cells Partition = 1
[08/19 18:29:32    397s] Running postRoute recovery in postEcoRoute mode
[08/19 18:29:32    397s] **optDesign ... cpu = 0:00:12, real = 0:00:13, mem = 976.4M, totSessionCpu=0:06:37 **
[08/19 18:29:32    397s]   Timing/DRV Snapshot: (TGT)
[08/19 18:29:32    397s]      Weighted WNS: 0.000
[08/19 18:29:32    397s]       All  PG WNS: 0.000
[08/19 18:29:32    397s]       High PG WNS: 0.000
[08/19 18:29:32    397s]       All  PG TNS: 0.000
[08/19 18:29:32    397s]       High PG TNS: 0.000
[08/19 18:29:32    397s]          Tran DRV: 0
[08/19 18:29:32    397s]           Cap DRV: 0
[08/19 18:29:32    397s]        Fanout DRV: 0
[08/19 18:29:32    397s]            Glitch: 0
[08/19 18:29:32    397s]    Category Slack: { [L, 0.082] [H, 0.082] }
[08/19 18:29:32    397s] 
[08/19 18:29:32    397s] Checking setup slack degradation ...
[08/19 18:29:32    397s] 
[08/19 18:29:32    397s] Recovery Manager:
[08/19 18:29:32    397s]   Low  Effort WNS Jump: 0.000 (REF: 0.000, TGT: 0.000, Threshold: 0.101) - Skip
[08/19 18:29:32    397s]   High Effort WNS Jump: 0.000 (REF: 0.000, TGT: 0.000, Threshold: 0.051) - Skip
[08/19 18:29:32    397s]   Low  Effort TNS Jump: 0.000 (REF: 0.000, TGT: 0.000, Threshold: 50.000) - Skip
[08/19 18:29:32    397s]   High Effort TNS Jump: 0.000 (REF: 0.000, TGT: 0.000, Threshold: 25.000) - Skip
[08/19 18:29:32    397s] 
[08/19 18:29:32    397s] Checking DRV degradation...
[08/19 18:29:32    397s] 
[08/19 18:29:32    397s] Recovery Manager:
[08/19 18:29:32    397s]     Tran DRV degradation : 0 (0 -> 0, Margin 20) - Skip
[08/19 18:29:32    397s]      Cap DRV degradation : 0 (0 -> 0, Margin 20) - Skip
[08/19 18:29:32    397s]   Fanout DRV degradation : 0 (0 -> 0, Margin 20) - Skip
[08/19 18:29:32    397s]       Glitch degradation : 0 (0 -> 0, Margin 20) - Skip
[08/19 18:29:32    397s] 
[08/19 18:29:32    397s] **INFO: Skipping DRV recovery as drv did not degrade beyond margin
[08/19 18:29:32    397s] *** Finish postRoute recovery in postEcoRoute mode (cpu=0:00:00, real=0:00:00, mem=1193.62M, totSessionCpu=0:06:37).
[08/19 18:29:32    397s] **optDesign ... cpu = 0:00:12, real = 0:00:13, mem = 976.6M, totSessionCpu=0:06:37 **
[08/19 18:29:32    397s] 
[08/19 18:29:32    397s] Latch borrow mode reset to max_borrow
[08/19 18:29:32    397s] Reported timing to dir ./timingReports
[08/19 18:29:32    397s] **optDesign ... cpu = 0:00:13, real = 0:00:13, mem = 976.6M, totSessionCpu=0:06:37 **
[08/19 18:29:32    397s] End AAE Lib Interpolated Model. (MEM=1193.62 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:32    397s] Begin: glitch net info
[08/19 18:29:32    397s] glitch slack range: number of glitch nets
[08/19 18:29:32    397s] glitch slack < -0.32 : 0
[08/19 18:29:32    397s] -0.32 < glitch slack < -0.28 : 0
[08/19 18:29:32    397s] -0.28 < glitch slack < -0.24 : 0
[08/19 18:29:32    397s] -0.24 < glitch slack < -0.2 : 0
[08/19 18:29:32    397s] -0.2 < glitch slack < -0.16 : 0
[08/19 18:29:32    397s] -0.16 < glitch slack < -0.12 : 0
[08/19 18:29:32    397s] -0.12 < glitch slack < -0.08 : 0
[08/19 18:29:32    397s] -0.08 < glitch slack < -0.04 : 0
[08/19 18:29:32    397s] -0.04 < glitch slack : 0
[08/19 18:29:32    397s] End: glitch net info
[08/19 18:29:34    398s] 
------------------------------------------------------------
     optDesign Final SI Timing Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
**optDesign ... cpu = 0:00:14, real = 0:00:15, mem = 976.7M, totSessionCpu=0:06:39 **
[08/19 18:29:34    398s]  ReSet Options after AAE Based Opt flow 
[08/19 18:29:34    398s] Opt: RC extraction mode changed to 'detail'
[08/19 18:29:34    398s] *** Finished optDesign ***
[08/19 18:29:34    398s] 
[08/19 18:29:34    398s] 	OPT_RUNTIME:          optDesign (count =  3): (cpu=0:00:15.1 real=0:00:15.6)
[08/19 18:29:34    398s] 	OPT_RUNTIME:               Init (count =  1): (cpu=0:00:00.0 real=0:00:00.0)
[08/19 18:29:34    398s] 	OPT_RUNTIME:         Extraction (count =  2): (cpu=0:00:00.9 real=0:00:01.1)
[08/19 18:29:34    398s] 	OPT_RUNTIME:        TimingGraph (count =  1): (cpu=0:00:03.9 real=0:00:04.1)
[08/19 18:29:34    398s] 	OPT_RUNTIME:        fixClockDrv (count =  1): (cpu=0:00:00.0 real=0:00:00.0)
[08/19 18:29:34    398s] 	OPT_RUNTIME:        fixClockDrv (count =  1): (cpu=0:00:00.0 real=0:00:00.0)
[08/19 18:29:34    398s] 	OPT_RUNTIME:             DRVOpt (count =  1): (cpu=0:00:02.8 real=0:00:02.8)
[08/19 18:29:34    398s] 	OPT_RUNTIME:           setupOpt (count =  1): (cpu=0:00:00.1 real=0:00:00.1)
[08/19 18:29:34    398s] 	OPT_RUNTIME:   RouterDirectives (count =  1): (cpu=0:00:00.5 real=0:00:00.5)
[08/19 18:29:34    398s] 	OPT_RUNTIME:           ecoRoute (count =  1): (cpu=0:00:01.1 real=0:00:01.2)
[08/19 18:29:34    398s] 	OPT_RUNTIME:        TimingGraph (count =  1): (cpu=0:00:02.7 real=0:00:02.8)
[08/19 18:29:34    398s] 	OPT_RUNTIME:         LefSafeOpt (count =  1): (cpu=0:00:00.0 real=0:00:00.0)
[08/19 18:29:34    398s] 	OPT_RUNTIME:           Recovery (count =  1): (cpu=0:00:00.3 real=0:00:00.3)
[08/19 18:29:34    398s] 	OPT_RUNTIME:              Final (count =  0): (cpu=0:00:00.0 real=0:00:00.0)
[08/19 18:29:34    398s] Info: pop threads available for lower-level modules during optimization.
[08/19 18:29:34    398s] Deleting Lib Analyzer.
[08/19 18:29:34    398s] Info: Destroy the CCOpt slew target map.
[08/19 18:29:34    398s] <CMD> optDesign -postRoute -hold
[08/19 18:29:34    398s] **INFO: setDesignMode -flowEffort standard -> setting 'setOptMode -allEndPoints true' for the duration of this command.
[08/19 18:29:34    398s] Disable merging buffers from different footprints for postRoute code for non-MSV designs
[08/19 18:29:34    398s] GigaOpt running with 1 threads.
[08/19 18:29:34    398s] Info: 1 threads available for lower-level modules during optimization.
[08/19 18:29:34    398s] #spOpts: mergeVia=F 
[08/19 18:29:34    398s] Core basic site is FreePDK45_38x28_10R_NP_162NW_34O
[08/19 18:29:34    398s] Layer info - lib-1st H=1, V=2.  Cell-FPin=1. Top-pin=2
[08/19 18:29:34    398s] #spOpts: mergeVia=F 
[08/19 18:29:34    399s] #spOpts: mergeVia=F 
[08/19 18:29:34    399s] 
[08/19 18:29:34    399s] Creating Lib Analyzer ...
[08/19 18:29:34    399s] Total number of usable buffers from Lib Analyzer: 9 ( CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32)
[08/19 18:29:34    399s] Total number of usable inverters from Lib Analyzer: 6 ( INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32)
[08/19 18:29:34    399s] Total number of usable delay cells from Lib Analyzer: 0 ()
[08/19 18:29:34    399s] 
[08/19 18:29:35    399s] Creating Lib Analyzer, finished. 
[08/19 18:29:35    399s] **optDesign ... cpu = 0:00:00, real = 0:00:00, mem = 978.6M, totSessionCpu=0:06:40 **
[08/19 18:29:35    399s] #Created 135 library cell signatures
[08/19 18:29:35    399s] #Created 1606 NETS and 0 SPECIALNETS signatures
[08/19 18:29:35    399s] #Created 3791 instance signatures
[08/19 18:29:35    399s] #Build design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 978.61 (MB), peak = 1069.11 (MB)
[08/19 18:29:35    399s] #Save design signature : cpu time = 00:00:00, elapsed time = 00:00:00, memory = 978.80 (MB), peak = 1069.11 (MB)
[08/19 18:29:35    399s] Begin checking placement ... (start mem=1209.6M, init mem=1209.6M)
[08/19 18:29:35    399s] *info: Placed = 3791          
[08/19 18:29:35    399s] *info: Unplaced = 0           
[08/19 18:29:35    399s] Placement Density:100.00%(4711/4711)
[08/19 18:29:35    399s] Placement Density (including fixed std cells):100.00%(4711/4711)
[08/19 18:29:35    399s] Finished checkPlace (cpu: total=0:00:00.0, vio checks=0:00:00.0; mem=1209.6M)
[08/19 18:29:35    399s]  Initial DC engine is -> aae
[08/19 18:29:35    399s]  
[08/19 18:29:35    399s]  AAE-Opt:: Current number of nets in RC Memory -> 100 K
[08/19 18:29:35    399s]  
[08/19 18:29:35    399s]  
[08/19 18:29:35    399s]  AAE-Opt:: New number of nets in RC Memory -> 100 K
[08/19 18:29:35    399s]  
[08/19 18:29:35    399s] Reset EOS DB
[08/19 18:29:35    399s] Ignoring AAE DB Resetting ...
[08/19 18:29:35    399s]  Set Options for AAE Based Opt flow 
[08/19 18:29:35    399s] *** optDesign -postRoute ***
[08/19 18:29:35    399s] DRC Margin: user margin 0.0; extra margin 0
[08/19 18:29:35    399s] Setup Target Slack: user slack 0
[08/19 18:29:35    399s] Hold Target Slack: user slack 0
[08/19 18:29:35    399s] Deleting Cell Server ...
[08/19 18:29:35    399s] Deleting Lib Analyzer.
[08/19 18:29:35    399s] Creating Cell Server ...(0, 0, 0, 0)
[08/19 18:29:35    399s] Summary for sequential cells identification: 
[08/19 18:29:35    399s]   Identified SBFF number: 16
[08/19 18:29:35    399s]   Identified MBFF number: 0
[08/19 18:29:35    399s]   Identified SB Latch number: 0
[08/19 18:29:35    399s]   Identified MB Latch number: 0
[08/19 18:29:35    399s]   Not identified SBFF number: 0
[08/19 18:29:35    399s]   Not identified MBFF number: 0
[08/19 18:29:35    399s]   Not identified SB Latch number: 0
[08/19 18:29:35    399s]   Not identified MB Latch number: 0
[08/19 18:29:35    399s]   Number of sequential cells which are not FFs: 13
[08/19 18:29:35    399s] Creating Cell Server, finished. 
[08/19 18:29:35    399s] 
[08/19 18:29:35    399s] Deleting Cell Server ...
[08/19 18:29:35    399s] ** INFO : this run is activating 'postRoute' automaton
[08/19 18:29:35    399s] Closing parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d'. 1604 times net's RC data read were performed.
[08/19 18:29:35    399s] Extraction called for design 'SUM' of instances=3791 and nets=1606 using extraction engine 'postRoute' at effort level 'low' .
[08/19 18:29:35    399s] **WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
[08/19 18:29:35    399s] Type 'man IMPEXT-3530' for more detail.
[08/19 18:29:35    399s] PostRoute (effortLevel low) RC Extraction called for design SUM.
[08/19 18:29:35    399s] RC Extraction called in multi-corner(1) mode.
[08/19 18:29:35    399s] Process corner(s) are loaded.
[08/19 18:29:35    399s]  Corner: standard
[08/19 18:29:35    399s] extractDetailRC Option : -outfile /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d -maxResLength 200  -extended
[08/19 18:29:35    399s] RC Mode: PostRoute -effortLevel low [Extended CapTable, RC Table Resistances]
[08/19 18:29:35    399s]       RC Corner Indexes            0   
[08/19 18:29:35    399s] Capacitance Scaling Factor   : 1.00000 
[08/19 18:29:35    399s] Coupling Cap. Scaling Factor : 1.00000 
[08/19 18:29:35    399s] Resistance Scaling Factor    : 1.00000 
[08/19 18:29:35    399s] Clock Cap. Scaling Factor    : 1.00000 
[08/19 18:29:35    399s] Clock Res. Scaling Factor    : 1.00000 
[08/19 18:29:35    399s] Shrink Factor                : 1.00000
[08/19 18:29:35    399s] Initializing multi-corner capacitance tables ... 
[08/19 18:29:35    399s] Initializing multi-corner resistance tables ...
[08/19 18:29:35    399s] Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1201.6M)
[08/19 18:29:35    399s] Creating parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for storing RC.
[08/19 18:29:35    399s] Extracted 10.0078% (CPU Time= 0:00:00.1  MEM= 1237.6M)
[08/19 18:29:35    399s] Extracted 20.0101% (CPU Time= 0:00:00.1  MEM= 1262.6M)
[08/19 18:29:35    399s] Extracted 30.0067% (CPU Time= 0:00:00.1  MEM= 1262.6M)
[08/19 18:29:35    399s] Extracted 40.009% (CPU Time= 0:00:00.1  MEM= 1262.6M)
[08/19 18:29:35    399s] Extracted 50.0112% (CPU Time= 0:00:00.1  MEM= 1262.6M)
[08/19 18:29:35    399s] Extracted 60.0078% (CPU Time= 0:00:00.2  MEM= 1262.6M)
[08/19 18:29:35    399s] Extracted 70.0101% (CPU Time= 0:00:00.2  MEM= 1262.6M)
[08/19 18:29:35    399s] Extracted 80.0067% (CPU Time= 0:00:00.2  MEM= 1262.6M)
[08/19 18:29:35    400s] Extracted 90.009% (CPU Time= 0:00:00.3  MEM= 1262.6M)
[08/19 18:29:35    400s] Extracted 100% (CPU Time= 0:00:00.3  MEM= 1262.6M)
[08/19 18:29:35    400s] Number of Extracted Resistors     : 25612
[08/19 18:29:35    400s] Number of Extracted Ground Cap.   : 27216
[08/19 18:29:35    400s] Number of Extracted Coupling Cap. : 46936
[08/19 18:29:35    400s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for reading.
[08/19 18:29:35    400s] Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
[08/19 18:29:35    400s]  Corner: standard
[08/19 18:29:35    400s] Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1239.6M)
[08/19 18:29:35    400s] Creating parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb_Filter.rcdb.d' for storing RC.
[08/19 18:29:35    400s] Closing parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d'. 1604 times net's RC data read were performed.
[08/19 18:29:35    400s] Lumped Parasitic Loading Started (total cpu=0:00:00.0, real=0:00:00.0, current mem=1243.633M)
[08/19 18:29:35    400s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for reading.
[08/19 18:29:35    400s] processing rcdb (/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d) for hinst (top) of cell (SUM);
[08/19 18:29:35    400s] Lumped Parasitic Loading Completed (total cpu=0:00:00.0, real=0:00:00.0, current mem=1243.633M)
[08/19 18:29:35    400s] PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.5  Real Time: 0:00:00.0  MEM: 1243.633M)
[08/19 18:29:35    400s] Unfixed 0 ViaPillar Nets
[08/19 18:29:36    400s] **ERROR: (IMPOPT-310):	Design density (100.00%) exceeds/equals limit (95.00%).
[08/19 18:29:36    400s] *info: All cells identified as Buffer and Delay cells:
[08/19 18:29:36    400s] *info:   with footprint "BUF_X1" or "BUF_X1": 
[08/19 18:29:36    400s] *info: ------------------------------------------------------------------
[08/19 18:29:36    400s] *info: (dly) CLKBUF_X1           -  NangateOpenCellLibrary
[08/19 18:29:36    400s] *info: (dly) BUF_X1              -  NangateOpenCellLibrary
[08/19 18:29:36    400s] *info: (dly) CLKBUF_X2           -  NangateOpenCellLibrary
[08/19 18:29:36    400s] *info: (dly) BUF_X2              -  NangateOpenCellLibrary
[08/19 18:29:36    400s] *info: (dly) CLKBUF_X3           -  NangateOpenCellLibrary
[08/19 18:29:36    400s] *info: (dly) BUF_X4              -  NangateOpenCellLibrary
[08/19 18:29:36    400s] *info: (dly) BUF_X8              -  NangateOpenCellLibrary
[08/19 18:29:36    400s] *info: (dly) BUF_X16             -  NangateOpenCellLibrary
[08/19 18:29:36    400s] *info: (dly) BUF_X32             -  NangateOpenCellLibrary
[08/19 18:29:36    400s] Unfixed 0 ViaPillar Nets
[08/19 18:29:36    400s] **ERROR: (IMPOPT-310):	Design density (100.00%) exceeds/equals limit (95.00%).
[08/19 18:29:36    400s] GigaOpt Hold Optimizer is used
[08/19 18:29:36    400s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for reading.
[08/19 18:29:36    400s] RC Database In Completed (CPU Time= 0:00:00.0  Real Time=0:00:00.0  MEM= 1221.4M)
[08/19 18:29:36    400s] Initializing multi-corner capacitance tables ... 
[08/19 18:29:36    400s] Initializing multi-corner resistance tables ...
[08/19 18:29:36    400s] End AAE Lib Interpolated Model. (MEM=1221.43 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:36    400s] Starting initialization (fixHold) cpu=0:00:00.0 real=0:00:00.0 totSessionCpu=0:06:40 mem=1221.4M ***
[08/19 18:29:36    400s] ### Creating LA Mngr. totSessionCpu=0:06:41 mem=1221.4M
[08/19 18:29:36    401s] ### Creating LA Mngr, finished. totSessionCpu=0:06:41 mem=1221.4M
[08/19 18:29:37    401s] ### Creating LA Mngr. totSessionCpu=0:06:41 mem=1366.7M
[08/19 18:29:37    401s] ### Creating LA Mngr, finished. totSessionCpu=0:06:41 mem=1366.7M
[08/19 18:29:37    401s] 
[08/19 18:29:37    401s] Creating Lib Analyzer ...
[08/19 18:29:37    401s] Total number of usable buffers from Lib Analyzer: 9 ( CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32)
[08/19 18:29:37    401s] Total number of usable inverters from Lib Analyzer: 6 ( INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32)
[08/19 18:29:37    401s] Total number of usable delay cells from Lib Analyzer: 0 ()
[08/19 18:29:37    401s] 
[08/19 18:29:37    401s] Creating Lib Analyzer, finished. 
[08/19 18:29:37    401s] gigaOpt Hold fixing search radius: 56.000000 Microns (40 stdCellHgt)
[08/19 18:29:37    401s] *info: Run optDesign holdfix with 1 thread.
[08/19 18:29:37    401s] Effort level <high> specified for reg2reg path_group
[08/19 18:29:37    401s] End AAE Lib Interpolated Model. (MEM=1443.05 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:37    401s] **INFO: Starting Blocking QThread with 1 CPU
[08/19 18:29:37    401s]  
   ____________________________________________________________________
__/ message from Blocking QThread
[08/19 18:29:37    402s] Starting SI iteration 1 using Infinite Timing Windows
[08/19 18:29:37    402s] Begin IPO call back ...
[08/19 18:29:37    402s] End IPO call back ...
[08/19 18:29:37    402s] #################################################################################
[08/19 18:29:37    402s] # Design Stage: PostRoute
[08/19 18:29:37    402s] # Design Name: SUM
[08/19 18:29:37    402s] # Design Mode: 90nm
[08/19 18:29:37    402s] # Analysis Mode: MMMC OCV 
[08/19 18:29:37    402s] # Parasitics Mode: SPEF/RCDB
[08/19 18:29:37    402s] # Signoff Settings: SI On 
[08/19 18:29:37    402s] #################################################################################
[08/19 18:29:37    402s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:37    402s] Setting infinite Tws ...
[08/19 18:29:37    402s] First Iteration Infinite Tw... 
[08/19 18:29:37    402s] Calculate late delays in OCV mode...
[08/19 18:29:37    402s] Calculate early delays in OCV mode...
[08/19 18:29:37    402s] Topological Sorting (REAL = 0:00:00.0, MEM = 0.0M, InitMEM = 0.0M)
[08/19 18:29:37    402s] Start delay calculation (fullDC) (1 T). (MEM=0)
[08/19 18:29:37    402s] End AAE Lib Interpolated Model. (MEM=14.207 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:37    402s] Total number of fetched objects 1990
[08/19 18:29:37    402s] AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
[08/19 18:29:37    402s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:37    402s] End delay calculation. (MEM=0 CPU=0:00:01.0 REAL=0:00:01.0)
[08/19 18:29:37    402s] End delay calculation (fullDC). (MEM=0 CPU=0:00:01.3 REAL=0:00:01.0)
[08/19 18:29:37    402s] *** CDM Built up (cpu=0:00:01.4  real=0:00:01.0  mem= 0.0M) ***
[08/19 18:29:37    402s] Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 0.0M)
[08/19 18:29:37    402s] Add other clocks and setupCteToAAEClockMapping during iter 1
[08/19 18:29:37    402s] Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 0.0M)
[08/19 18:29:37    402s] 
[08/19 18:29:37    402s] Executing IPO callback for view pruning ..
[08/19 18:29:37    402s] Starting SI iteration 2
[08/19 18:29:37    402s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:37    402s] Calculate late delays in OCV mode...
[08/19 18:29:37    402s] Calculate early delays in OCV mode...
[08/19 18:29:37    402s] Start delay calculation (fullDC) (1 T). (MEM=0)
[08/19 18:29:37    402s] End AAE Lib Interpolated Model. (MEM=0 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:37    402s] Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
[08/19 18:29:37    402s] Glitch Analysis: View default -- Total Number of Nets Analyzed = 0. 
[08/19 18:29:37    402s] Total number of fetched objects 1990
[08/19 18:29:37    402s] AAE_INFO-618: Total number of nets in the design is 1606,  10.7 percent of the nets selected for SI analysis
[08/19 18:29:37    402s] End delay calculation. (MEM=0 CPU=0:00:00.2 REAL=0:00:00.0)
[08/19 18:29:37    402s] End delay calculation (fullDC). (MEM=0 CPU=0:00:00.2 REAL=0:00:00.0)
[08/19 18:29:37    402s] *** CDM Built up (cpu=0:00:00.2  real=0:00:00.0  mem= 0.0M) ***
[08/19 18:29:37    402s] *** Done Building Timing Graph (cpu=0:00:02.6 real=0:00:03.0 totSessionCpu=0:00:05.7 mem=0.0M)
[08/19 18:29:37    402s] Done building cte hold timing graph (fixHold) cpu=0:00:02.7 real=0:00:03.0 totSessionCpu=0:00:05.7 mem=0.0M ***
[08/19 18:29:37    402s] Done building hold timer [3545 node(s), 4102 edge(s), 1 view(s)] (fixHold) cpu=0:00:03.0 real=0:00:03.0 totSessionCpu=0:00:06.0 mem=0.0M ***
[08/19 18:29:37    402s] Timing Data dump into file /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/coe_eosdata_hgEHde/default.twf, for view: default 
[08/19 18:29:37    402s] 	 Dumping view 0 default 
[08/19 18:29:40    404s]  
_______________________________________________________________________
[08/19 18:29:40    404s] Starting SI iteration 1 using Infinite Timing Windows
[08/19 18:29:40    404s] Begin IPO call back ...
[08/19 18:29:41    404s] End IPO call back ...
[08/19 18:29:41    404s] #################################################################################
[08/19 18:29:41    404s] # Design Stage: PostRoute
[08/19 18:29:41    404s] # Design Name: SUM
[08/19 18:29:41    404s] # Design Mode: 90nm
[08/19 18:29:41    404s] # Analysis Mode: MMMC OCV 
[08/19 18:29:41    404s] # Parasitics Mode: SPEF/RCDB
[08/19 18:29:41    404s] # Signoff Settings: SI On 
[08/19 18:29:41    404s] #################################################################################
[08/19 18:29:41    404s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:41    404s] Setting infinite Tws ...
[08/19 18:29:41    404s] First Iteration Infinite Tw... 
[08/19 18:29:41    404s] Calculate early delays in OCV mode...
[08/19 18:29:41    404s] Calculate late delays in OCV mode...
[08/19 18:29:41    404s] Topological Sorting (REAL = 0:00:00.0, MEM = 1441.1M, InitMEM = 1441.1M)
[08/19 18:29:41    404s] Start delay calculation (fullDC) (1 T). (MEM=1441.05)
[08/19 18:29:41    404s] End AAE Lib Interpolated Model. (MEM=1457.21 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:42    405s] Total number of fetched objects 1990
[08/19 18:29:42    405s] AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
[08/19 18:29:42    405s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:42    405s] End delay calculation. (MEM=1530.44 CPU=0:00:01.1 REAL=0:00:01.0)
[08/19 18:29:42    405s] End delay calculation (fullDC). (MEM=1530.44 CPU=0:00:01.3 REAL=0:00:01.0)
[08/19 18:29:42    405s] *** CDM Built up (cpu=0:00:01.3  real=0:00:01.0  mem= 1530.4M) ***
[08/19 18:29:43    406s] Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1530.4M)
[08/19 18:29:43    406s] Add other clocks and setupCteToAAEClockMapping during iter 1
[08/19 18:29:43    406s] Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1530.4M)
[08/19 18:29:43    406s] 
[08/19 18:29:43    406s] Executing IPO callback for view pruning ..
[08/19 18:29:43    406s] Starting SI iteration 2
[08/19 18:29:43    406s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:43    406s] Calculate early delays in OCV mode...
[08/19 18:29:43    406s] Calculate late delays in OCV mode...
[08/19 18:29:43    406s] Start delay calculation (fullDC) (1 T). (MEM=1538.48)
[08/19 18:29:43    406s] End AAE Lib Interpolated Model. (MEM=1538.48 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:43    406s] Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
[08/19 18:29:43    406s] Glitch Analysis: View default -- Total Number of Nets Analyzed = 1990. 
[08/19 18:29:43    406s] Total number of fetched objects 1990
[08/19 18:29:43    406s] AAE_INFO-618: Total number of nets in the design is 1606,  1.6 percent of the nets selected for SI analysis
[08/19 18:29:43    406s] End delay calculation. (MEM=1506.48 CPU=0:00:00.1 REAL=0:00:00.0)
[08/19 18:29:43    406s] End delay calculation (fullDC). (MEM=1506.48 CPU=0:00:00.1 REAL=0:00:00.0)
[08/19 18:29:43    406s] *** CDM Built up (cpu=0:00:00.1  real=0:00:00.0  mem= 1506.5M) ***
[08/19 18:29:43    406s] *** Done Building Timing Graph (cpu=0:00:02.4 real=0:00:03.0 totSessionCpu=0:06:46 mem=1506.5M)
[08/19 18:29:43    406s] Done building cte setup timing graph (fixHold) cpu=0:00:06.1 real=0:00:07.0 totSessionCpu=0:06:47 mem=1506.5M ***
[08/19 18:29:43    406s] Setting latch borrow mode to budget during optimization.
[08/19 18:29:43    406s] *info: category slack lower bound [L 0.0] default
[08/19 18:29:43    406s] *info: category slack lower bound [H 0.0] reg2reg 
[08/19 18:29:43    406s] --------------------------------------------------- 
[08/19 18:29:43    406s]    Setup Violation Summary with Target Slack (0.000 ns)
[08/19 18:29:43    406s] --------------------------------------------------- 
[08/19 18:29:43    406s]          WNS    reg2regWNS
[08/19 18:29:43    406s]     0.082 ns      0.082 ns
[08/19 18:29:43    406s] --------------------------------------------------- 
[08/19 18:29:43    406s]   Timing Snapshot: (REF)
[08/19 18:29:43    406s]      Weighted WNS: 0.000
[08/19 18:29:43    406s]       All  PG WNS: 0.000
[08/19 18:29:43    406s]       High PG WNS: 0.000
[08/19 18:29:43    406s]       All  PG TNS: 0.000
[08/19 18:29:43    406s]       High PG TNS: 0.000
[08/19 18:29:43    406s]    Category Slack: { [L, 0.082] [H, 0.082] }
[08/19 18:29:43    406s] 
[08/19 18:29:43    406s] Loading timing data from /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/coe_eosdata_hgEHde/default.twf 
[08/19 18:29:43    406s] 	 Loading view 0 default 
[08/19 18:29:43    406s] 
------------------------------------------------------------
             Initial Summary                             
------------------------------------------------------------

Setup views included:
 default
Hold  views included:
 default

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+--------------------+---------+---------+---------+
|     Hold mode      |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):| -0.001  |  0.107  | -0.001  |
|           TNS (ns):| -0.001  |  0.000  | -0.001  |
|    Violating Paths:|    2    |    0    |    2    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
------------------------------------------------------------
Deleting Cell Server ...
[08/19 18:29:43    406s] Deleting Lib Analyzer.
[08/19 18:29:43    406s] Creating Cell Server ...(0, 0, 0, 0)
[08/19 18:29:43    406s] Summary for sequential cells identification: 
[08/19 18:29:43    406s]   Identified SBFF number: 16
[08/19 18:29:43    406s]   Identified MBFF number: 0
[08/19 18:29:43    406s]   Identified SB Latch number: 0
[08/19 18:29:43    406s]   Identified MB Latch number: 0
[08/19 18:29:43    406s]   Not identified SBFF number: 0
[08/19 18:29:43    406s]   Not identified MBFF number: 0
[08/19 18:29:43    406s]   Not identified SB Latch number: 0
[08/19 18:29:43    406s]   Not identified MB Latch number: 0
[08/19 18:29:43    406s]   Number of sequential cells which are not FFs: 13
[08/19 18:29:43    406s] Creating Cell Server, finished. 
[08/19 18:29:43    406s] 
[08/19 18:29:43    406s] Deleting Cell Server ...
[08/19 18:29:43    406s] 
[08/19 18:29:43    406s] Creating Lib Analyzer ...
[08/19 18:29:43    406s] Creating Cell Server ...(0, 0, 0, 0)
[08/19 18:29:43    406s] Summary for sequential cells identification: 
[08/19 18:29:43    406s]   Identified SBFF number: 16
[08/19 18:29:43    406s]   Identified MBFF number: 0
[08/19 18:29:43    406s]   Identified SB Latch number: 0
[08/19 18:29:43    406s]   Identified MB Latch number: 0
[08/19 18:29:43    406s]   Not identified SBFF number: 0
[08/19 18:29:43    406s]   Not identified MBFF number: 0
[08/19 18:29:43    406s]   Not identified SB Latch number: 0
[08/19 18:29:43    406s]   Not identified MB Latch number: 0
[08/19 18:29:43    406s]   Number of sequential cells which are not FFs: 13
[08/19 18:29:43    406s] Creating Cell Server, finished. 
[08/19 18:29:43    406s] 
[08/19 18:29:43    406s] 
[08/19 18:29:43    406s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:29:43    406s]   
[08/19 18:29:43    406s]  View default  Weighted 0 StdDelay unweighted 10.10, weightedFactor 1.000 
[08/19 18:29:43    406s]   Total number of usable buffers from Lib Analyzer: 9 ( CLKBUF_X1 BUF_X1 CLKBUF_X2 BUF_X2 CLKBUF_X3 BUF_X4 BUF_X8 BUF_X16 BUF_X32)
[08/19 18:29:43    406s] Total number of usable inverters from Lib Analyzer: 6 ( INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32)
[08/19 18:29:43    406s] Total number of usable delay cells from Lib Analyzer: 0 ()
[08/19 18:29:43    406s] 
[08/19 18:29:44    407s] Creating Lib Analyzer, finished. 
[08/19 18:29:44    407s] 
[08/19 18:29:44    407s] *Info: minBufDelay = 21.9 ps, libStdDelay = 10.1 ps, minBufSize = 3192000 (3.0)
[08/19 18:29:44    407s] *Info: worst delay setup view: default
[08/19 18:29:44    407s] Footprint list for hold buffering (delay unit: ps)
[08/19 18:29:44    407s] =================================================================
[08/19 18:29:44    407s] *Info:  holdDelay delayRatio IGArea drvRes cellname(iterm,oterm)
[08/19 18:29:44    407s] ------------------------------------------------------------------
[08/19 18:29:44    407s] *Info:       22.1       1.00    3.0  18.56 BUF_X1 (A,Z)
[08/19 18:29:44    407s] *Info:       29.7       1.00    3.0  25.53 CLKBUF_X1 (A,Z)
[08/19 18:29:44    407s] *Info:       23.3       1.00    4.0   9.27 BUF_X2 (A,Z)
[08/19 18:29:44    407s] *Info:       25.5       1.00    4.0  12.75 CLKBUF_X2 (A,Z)
[08/19 18:29:44    407s] *Info:       28.7       1.00    5.0   8.58 CLKBUF_X3 (A,Z)
[08/19 18:29:44    407s] *Info:       21.9       1.00    7.0   4.64 BUF_X4 (A,Z)
[08/19 18:29:44    407s] *Info:       22.6       1.00   13.0   2.33 BUF_X8 (A,Z)
[08/19 18:29:44    407s] *Info:       22.8       1.00   25.0   1.17 BUF_X16 (A,Z)
[08/19 18:29:44    407s] *Info:       23.7       1.00   49.0   0.61 BUF_X32 (A,Z)
[08/19 18:29:44    407s] =================================================================
[08/19 18:29:44    407s] **optDesign ... cpu = 0:00:08, real = 0:00:09, mem = 1072.7M, totSessionCpu=0:06:48 **
[08/19 18:29:44    407s] Info: 1 clock net  excluded from IPO operation.
[08/19 18:29:44    407s] --------------------------------------------------- 
[08/19 18:29:44    407s]    Hold Timing Summary  - Initial 
[08/19 18:29:44    407s] --------------------------------------------------- 
[08/19 18:29:44    407s]  Target slack: 0.000 ns
[08/19 18:29:44    407s] View: default 
[08/19 18:29:44    407s] 	WNS: -0.001 
[08/19 18:29:44    407s] 	TNS: -0.001 
[08/19 18:29:44    407s] 	VP: 2 
[08/19 18:29:44    407s] 	Worst hold path end point: S_reg[26]/RN 
[08/19 18:29:44    407s] --------------------------------------------------- 
[08/19 18:29:44    407s]    Setup Timing Summary  - Initial 
[08/19 18:29:44    407s] --------------------------------------------------- 
[08/19 18:29:44    407s]  Target slack: 0.000 ns
[08/19 18:29:44    407s] View: default 
[08/19 18:29:44    407s] 	WNS: 0.082 
[08/19 18:29:44    407s] 	TNS: 0.000 
[08/19 18:29:44    407s] 	VP: 0 
[08/19 18:29:44    407s] 	Worst setup path end point:S_reg[127]/D 
[08/19 18:29:44    407s] --------------------------------------------------- 
[08/19 18:29:44    407s] PhyDesignGrid: maxLocalDensity 0.98
[08/19 18:29:44    407s] ### Creating PhyDesignMc. totSessionCpu=0:06:48 mem=1440.6M
[08/19 18:29:44    407s] #spOpts: mergeVia=F 
[08/19 18:29:44    407s] ### Creating PhyDesignMc, finished. totSessionCpu=0:06:48 mem=1440.6M
[08/19 18:29:44    407s] 
[08/19 18:29:44    407s] *** Starting Core Fixing (fixHold) cpu=0:00:07.3 real=0:00:08.0 totSessionCpu=0:06:48 mem=1440.6M density=100.000% ***
[08/19 18:29:44    407s] Optimizer Target Slack 0.000 StdDelay is 0.010  
[08/19 18:29:44    407s] 
[08/19 18:29:44    407s] Phase I ......
[08/19 18:29:44    407s] *info: Multithread Hold Batch Commit is enabled
[08/19 18:29:44    407s] *info: Levelized Batch Commit is enabled
[08/19 18:29:44    407s] Executing transform: ECO Safe Resize
[08/19 18:29:44    407s] +-----------------------------------------------------------------------------------------------+
[08/19 18:29:44    407s] |Iter|  WNS   |  TNS    |  #VP   |  #Buffer  |  #Resize(F/F)  | Density  | Real Time  |   Mem   |
[08/19 18:29:44    407s] +-----------------------------------------------------------------------------------------------+
[08/19 18:29:44    407s] Worst hold path end point:
[08/19 18:29:44    407s]   S_reg[26]/RN
[08/19 18:29:44    407s]     net: n386 (nrTerm=43)
[08/19 18:29:44    407s] **Info: Stopping hold fixing due to density exceeding max design density 95.000%
[08/19 18:29:44    407s] |   0|  -0.001|    -0.00|       2|          0|       0(     0)|   100.00%|   0:00:08.0|  1440.6M|
[08/19 18:29:44    407s] +-----------------------------------------------------------------------------------------------+
[08/19 18:29:44    407s] Executing transform: AddBuffer + LegalResize
[08/19 18:29:44    407s] +-----------------------------------------------------------------------------------------------+
[08/19 18:29:44    407s] |Iter|  WNS   |  TNS    |  #VP   |  #Buffer  |  #Resize(F/F)  | Density  | Real Time  |   Mem   |
[08/19 18:29:44    407s] +-----------------------------------------------------------------------------------------------+
[08/19 18:29:44    407s] Worst hold path end point:
[08/19 18:29:44    407s]   S_reg[26]/RN
[08/19 18:29:44    407s]     net: n386 (nrTerm=43)
[08/19 18:29:44    407s] **Info: Stopping hold fixing due to density exceeding max design density 95.000%
[08/19 18:29:44    407s] |   0|  -0.001|    -0.00|       2|          0|       0(     0)|   100.00%|   0:00:08.0|  1440.6M|
[08/19 18:29:44    407s] +-----------------------------------------------------------------------------------------------+
[08/19 18:29:44    407s] --------------------------------------------------- 
[08/19 18:29:44    407s]    Hold Timing Summary  - Phase I 
[08/19 18:29:44    407s] --------------------------------------------------- 
[08/19 18:29:44    407s]  Target slack: 0.000 ns
[08/19 18:29:44    407s] View: default 
[08/19 18:29:44    407s] 	WNS: -0.001 
[08/19 18:29:44    407s] 	TNS: -0.001 
[08/19 18:29:44    407s] 	VP: 2 
[08/19 18:29:44    407s] 	Worst hold path end point: S_reg[26]/RN 
[08/19 18:29:44    407s] --------------------------------------------------- 
[08/19 18:29:44    407s]    Setup Timing Summary  - Phase I 
[08/19 18:29:44    407s] --------------------------------------------------- 
[08/19 18:29:44    407s]  Target slack: 0.000 ns
[08/19 18:29:44    407s] View: default 
[08/19 18:29:44    407s] 	WNS: 0.082 
[08/19 18:29:44    407s] 	TNS: 0.000 
[08/19 18:29:44    407s] 	VP: 0 
[08/19 18:29:44    407s] 	Worst setup path end point:S_reg[127]/D 
[08/19 18:29:44    407s] --------------------------------------------------- 
[08/19 18:29:44    407s] 
[08/19 18:29:44    407s] 
[08/19 18:29:44    407s] =======================================================================
[08/19 18:29:44    407s]                 Reasons for remaining hold violations
[08/19 18:29:44    407s] =======================================================================
[08/19 18:29:44    407s] *info: Total 9 net(s) have violated hold timing slacks.
[08/19 18:29:44    407s] 
[08/19 18:29:44    407s] Buffering failure reasons
[08/19 18:29:44    407s] ------------------------------------------------
[08/19 18:29:44    407s] *info:     9 net(s): Could not be fixed because of internal reason: UnknownReason.
[08/19 18:29:44    407s] 
[08/19 18:29:44    407s] Resizing failure reasons
[08/19 18:29:44    407s] ------------------------------------------------
[08/19 18:29:44    407s] *info:     9 net(s): Could not be fixed because of internal reason: UnknownReason.
[08/19 18:29:44    407s] 
[08/19 18:29:44    407s] 
[08/19 18:29:44    407s] *** Finished Core Fixing (fixHold) cpu=0:00:07.4 real=0:00:08.0 totSessionCpu=0:06:48 mem=1440.6M density=100.000% ***
[08/19 18:29:44    407s] 
[08/19 18:29:44    407s] 
[08/19 18:29:44    407s] *** Finish Post Route Hold Fixing (cpu=0:00:07.4 real=0:00:08.0 totSessionCpu=0:06:48 mem=1440.6M density=100.000%) ***
[08/19 18:29:44    407s] Latch borrow mode reset to max_borrow
[08/19 18:29:44    407s] Reported timing to dir ./timingReports
[08/19 18:29:44    407s] **optDesign ... cpu = 0:00:08, real = 0:00:09, mem = 1066.7M, totSessionCpu=0:06:48 **
[08/19 18:29:44    407s] End AAE Lib Interpolated Model. (MEM=1307.02 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:44    407s] Begin: glitch net info
[08/19 18:29:44    407s] glitch slack range: number of glitch nets
[08/19 18:29:44    407s] glitch slack < -0.32 : 0
[08/19 18:29:44    407s] -0.32 < glitch slack < -0.28 : 0
[08/19 18:29:44    407s] -0.28 < glitch slack < -0.24 : 0
[08/19 18:29:44    407s] -0.24 < glitch slack < -0.2 : 0
[08/19 18:29:44    407s] -0.2 < glitch slack < -0.16 : 0
[08/19 18:29:44    407s] -0.16 < glitch slack < -0.12 : 0
[08/19 18:29:44    407s] -0.12 < glitch slack < -0.08 : 0
[08/19 18:29:44    407s] -0.08 < glitch slack < -0.04 : 0
[08/19 18:29:44    407s] -0.04 < glitch slack : 0
[08/19 18:29:44    407s] End: glitch net info
[08/19 18:29:44    407s] End AAE Lib Interpolated Model. (MEM=1364.26 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:44    407s] **INFO: Starting Blocking QThread with 1 CPU
[08/19 18:29:44    407s]  
   ____________________________________________________________________
__/ message from Blocking QThread
[08/19 18:29:44    407s] Starting SI iteration 1 using Infinite Timing Windows
[08/19 18:29:44    407s] Begin IPO call back ...
[08/19 18:29:44    407s] End IPO call back ...
[08/19 18:29:44    407s] #################################################################################
[08/19 18:29:44    407s] # Design Stage: PostRoute
[08/19 18:29:44    407s] # Design Name: SUM
[08/19 18:29:44    407s] # Design Mode: 90nm
[08/19 18:29:44    407s] # Analysis Mode: MMMC OCV 
[08/19 18:29:44    407s] # Parasitics Mode: SPEF/RCDB
[08/19 18:29:44    407s] # Signoff Settings: SI On 
[08/19 18:29:44    407s] #################################################################################
[08/19 18:29:44    407s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:44    407s] Setting infinite Tws ...
[08/19 18:29:44    407s] First Iteration Infinite Tw... 
[08/19 18:29:44    407s] Calculate late delays in OCV mode...
[08/19 18:29:44    407s] Calculate early delays in OCV mode...
[08/19 18:29:44    407s] Topological Sorting (REAL = 0:00:00.0, MEM = 0.0M, InitMEM = 0.0M)
[08/19 18:29:44    407s] Start delay calculation (fullDC) (1 T). (MEM=0)
[08/19 18:29:44    407s] End AAE Lib Interpolated Model. (MEM=0 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:44    407s] Total number of fetched objects 1990
[08/19 18:29:44    407s] AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
[08/19 18:29:44    407s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:44    407s] End delay calculation. (MEM=0 CPU=0:00:01.0 REAL=0:00:01.0)
[08/19 18:29:44    407s] End delay calculation (fullDC). (MEM=0 CPU=0:00:01.3 REAL=0:00:01.0)
[08/19 18:29:44    407s] *** CDM Built up (cpu=0:00:01.3  real=0:00:01.0  mem= 0.0M) ***
[08/19 18:29:44    407s] Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 0.0M)
[08/19 18:29:44    407s] Add other clocks and setupCteToAAEClockMapping during iter 1
[08/19 18:29:44    407s] Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 0.0M)
[08/19 18:29:44    407s] Starting SI iteration 2
[08/19 18:29:44    407s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:29:44    407s] Calculate late delays in OCV mode...
[08/19 18:29:44    407s] Calculate early delays in OCV mode...
[08/19 18:29:44    407s] Start delay calculation (fullDC) (1 T). (MEM=0)
[08/19 18:29:44    407s] End AAE Lib Interpolated Model. (MEM=0 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:29:44    407s] Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
[08/19 18:29:44    407s] Glitch Analysis: View default -- Total Number of Nets Analyzed = 0. 
[08/19 18:29:44    407s] Total number of fetched objects 1990
[08/19 18:29:44    407s] AAE_INFO-618: Total number of nets in the design is 1606,  10.7 percent of the nets selected for SI analysis
[08/19 18:29:44    407s] End delay calculation. (MEM=0 CPU=0:00:00.2 REAL=0:00:00.0)
[08/19 18:29:44    407s] End delay calculation (fullDC). (MEM=0 CPU=0:00:00.2 REAL=0:00:00.0)
[08/19 18:29:44    407s] *** CDM Built up (cpu=0:00:00.2  real=0:00:00.0  mem= 0.0M) ***
[08/19 18:29:44    407s] *** Done Building Timing Graph (cpu=0:00:02.5 real=0:00:02.0 totSessionCpu=0:00:07.7 mem=0.0M)
[08/19 18:29:47    410s]  
_______________________________________________________________________
[08/19 18:29:49    411s] 
------------------------------------------------------------
     optDesign Final SI Timing Summary                             
------------------------------------------------------------

Setup views included:
 default 
Hold  views included:
 default

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+--------------------+---------+---------+---------+
|     Hold mode      |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):| -0.001  |  0.107  | -0.001  |
|           TNS (ns):| -0.001  |  0.000  | -0.001  |
|    Violating Paths:|    2    |    0    |    2    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
*** Final Summary (holdfix) CPU=0:00:03.7, REAL=0:00:05.0, MEM=1309.0M
[08/19 18:29:49    411s] **optDesign ... cpu = 0:00:12, real = 0:00:14, mem = 1061.0M, totSessionCpu=0:06:52 **
[08/19 18:29:49    411s]  ReSet Options after AAE Based Opt flow 
[08/19 18:29:49    411s] *** Finished optDesign ***
[08/19 18:29:49    411s] 
[08/19 18:29:49    411s] 	OPT_RUNTIME:          optDesign (count =  3): (cpu=0:00:12.8 real=0:00:15.0)
[08/19 18:29:49    411s] 	OPT_RUNTIME:               Init (count =  1): (cpu=0:00:00.0 real=0:00:00.0)
[08/19 18:29:49    411s] 	OPT_RUNTIME:         Extraction (count =  1): (cpu=0:00:00.5 real=0:00:00.6)
[08/19 18:29:49    411s] 	OPT_RUNTIME:        TimingGraph (count =  1): (cpu=0:00:00.0 real=0:00:00.0)
[08/19 18:29:49    411s] 	OPT_RUNTIME:            holdOpt (count =  1): (cpu=0:00:07.6 real=0:00:08.7)
[08/19 18:29:49    411s] 	OPT_RUNTIME:              Final (count =  0): (cpu=0:00:00.0 real=0:00:00.0)
[08/19 18:29:49    411s] Info: pop threads available for lower-level modules during optimization.
[08/19 18:29:49    411s] Deleting Lib Analyzer.
[08/19 18:29:49    411s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d' for reading.
[08/19 18:29:49    411s] Closing parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_RsKv83.rcdb.d'. 1604 times net's RC data read were performed.
[08/19 18:29:49    411s] RC Database In Completed (CPU Time= 0:00:00.0  Real Time=0:00:00.0  MEM= 1307.0M)
[08/19 18:29:49    411s] Info: Destroy the CCOpt slew target map.
[08/19 18:30:37    420s] <CMD> saveDesign SUM_saved
[08/19 18:30:37    420s] The in-memory database contained RC information but was not saved. To save 
[08/19 18:30:37    420s] the RC information, use saveDesign's -rc option. Note: Saving RC information can be quite large, 
[08/19 18:30:37    420s] so it should only be saved when it is really desired.
[08/19 18:30:37    420s] #% Begin save design ... (date=08/19 18:30:37, mem=1061.9M)
[08/19 18:30:38    420s] % Begin Save netlist data ... (date=08/19 18:30:38, mem=1062.5M)
[08/19 18:30:38    420s] Writing Binary DB to SUM_saved.dat/SUM.v.bin in single-threaded mode...
[08/19 18:30:38    420s] % End Save netlist data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1062.6M, current mem=1062.6M)
[08/19 18:30:38    420s] % Begin Save AAE data ... (date=08/19 18:30:38, mem=1062.6M)
[08/19 18:30:38    420s] Saving AAE Data ...
[08/19 18:30:38    420s] % End Save AAE data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1062.6M, current mem=1062.6M)
[08/19 18:30:38    420s] % Begin Save clock tree data ... (date=08/19 18:30:38, mem=1062.8M)
[08/19 18:30:38    420s] % End Save clock tree data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1062.8M, current mem=1062.8M)
[08/19 18:30:38    420s] Saving preference file SUM_saved.dat/gui.pref.tcl ...
[08/19 18:30:38    420s] Saving mode setting ...
[08/19 18:30:38    420s] Saving global file ...
[08/19 18:30:38    420s] % Begin Save floorplan data ... (date=08/19 18:30:38, mem=1063.0M)
[08/19 18:30:38    420s] Saving floorplan file ...
[08/19 18:30:38    420s] % End Save floorplan data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1063.1M, current mem=1063.1M)
[08/19 18:30:38    420s] Saving Drc markers ...
[08/19 18:30:38    420s] ... No Drc file written since there is no markers found.
[08/19 18:30:38    420s] % Begin Save placement data ... (date=08/19 18:30:38, mem=1063.1M)
[08/19 18:30:38    420s] ** Saving stdCellPlacement_binary (version# 1) ...
[08/19 18:30:38    420s] *** Completed savePlace (cpu=0:00:00.0 real=0:00:00.0 mem=1307.0M) ***
[08/19 18:30:38    420s] % End Save placement data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1063.1M, current mem=1063.1M)
[08/19 18:30:38    420s] % Begin Save routing data ... (date=08/19 18:30:38, mem=1063.1M)
[08/19 18:30:38    420s] Saving route file ...
[08/19 18:30:38    420s] *** Completed saveRoute (cpu=0:00:00.0 real=0:00:00.0 mem=1307.0M) ***
[08/19 18:30:38    420s] % End Save routing data ... (date=08/19 18:30:38, total cpu=0:00:00.1, real=0:00:00.0, peak res=1064.1M, current mem=1064.1M)
[08/19 18:30:38    420s] Saving property file SUM_saved.dat/SUM.prop
[08/19 18:30:38    420s] *** Completed saveProperty (cpu=0:00:00.0 real=0:00:00.0 mem=1307.0M) ***
[08/19 18:30:38    420s] #Saving pin access info...
[08/19 18:30:38    420s] #
[08/19 18:30:38    420s] % Begin Save power constraints data ... (date=08/19 18:30:38, mem=1066.3M)
[08/19 18:30:38    420s] % End Save power constraints data ... (date=08/19 18:30:38, total cpu=0:00:00.0, real=0:00:00.0, peak res=1066.4M, current mem=1066.4M)
[08/19 18:30:38    420s] Generated self-contained design SUM_saved.dat
[08/19 18:30:38    420s] #% End save design ... (date=08/19 18:30:38, total cpu=0:00:00.7, real=0:00:01.0, peak res=1066.4M, current mem=982.4M)
[08/19 18:30:38    420s] *** Message Summary: 0 warning(s), 0 error(s)
[08/19 18:30:38    420s] 
[08/19 18:32:04    434s] <CMD> set_analysis_view -setup {default} -hold {default}
[08/19 18:32:04    434s] The system is switching to MMMC mode. Existing timing, extraction and delay/sdf information from single mode will be reset. Please respecify spef for specific RC corners and/or sdf information for specific views.
[08/19 18:32:04    434s] Extraction setup Started 
[08/19 18:32:04    434s] Initializing multi-corner RC extraction with 1 active RC Corners ...
[08/19 18:32:04    434s] Reading Capacitance Table File /software/dk/nangate45/lef/captables/NCSU_FreePDK_45nm.capTbl ...
[08/19 18:32:04    434s] Cap table was created using Encounter 08.10-p004_1.
[08/19 18:32:04    434s] Process name: master_techFreePDK45.
[08/19 18:32:04    434s] Importing multi-corner RC tables ... 
[08/19 18:32:04    434s] Summary of Active RC-Corners : 
[08/19 18:32:04    434s]  
[08/19 18:32:04    434s]  Analysis View: default
[08/19 18:32:04    434s]     RC-Corner Name        : standard
[08/19 18:32:04    434s]     RC-Corner Index       : 0
[08/19 18:32:04    434s]     RC-Corner Temperature : 300 Celsius
[08/19 18:32:04    434s]     RC-Corner Cap Table   : '/software/dk/nangate45/lef/captables/NCSU_FreePDK_45nm.capTbl'
[08/19 18:32:04    434s]     RC-Corner PreRoute Res Factor         : 1
[08/19 18:32:04    434s]     RC-Corner PreRoute Cap Factor         : 1
[08/19 18:32:04    434s]     RC-Corner PostRoute Res Factor        : 1 {1 1 1}
[08/19 18:32:04    434s]     RC-Corner PostRoute Cap Factor        : 1 {1 1 1}
[08/19 18:32:04    434s]     RC-Corner PostRoute XCap Factor       : 1 {1 1 1}
[08/19 18:32:04    434s]     RC-Corner PreRoute Clock Res Factor   : 1	[Derived from postRoute_res (effortLevel low)]
[08/19 18:32:04    434s]     RC-Corner PreRoute Clock Cap Factor   : 1	[Derived from postRoute_cap (effortLevel low)]
[08/19 18:32:04    434s]     RC-Corner PostRoute Clock Cap Factor  : 1 {1 1 1} 	[Derived from postRoute_cap (effortLevel low)]
[08/19 18:32:04    434s]     RC-Corner PostRoute Clock Res Factor  : 1 {1 1 1} 	[Derived from postRoute_res (effortLevel low)]
[08/19 18:32:04    434s] set_analysis_view/update_rc_corner called to change MMMC setup. RC Corner setup information has remained the same. Therefore, parasitic data in the tool brought as per the previous MMMC setup is being maintained.
[08/19 18:32:04    434s] Reading timing constraints file 'SUM.sdc' ...
[08/19 18:32:04    434s] Current (total cpu=0:07:15, real=0:39:18, peak res=1215.7M, current mem=927.9M)
[08/19 18:32:04    434s] INFO (CTE): Constraints read successfully.
[08/19 18:32:04    434s] Ending "Constraint file reading stats" (total cpu=0:00:00.1, real=0:00:00.0, peak res=928.2M, current mem=928.2M)
[08/19 18:32:04    434s] Current (total cpu=0:07:15, real=0:39:18, peak res=1215.7M, current mem=928.2M)
[08/19 18:32:04    434s] Deleting Cell Server ...
[08/19 18:32:04    434s] Creating Cell Server ...(0, 1, 1, 1)
[08/19 18:32:04    434s] Summary for sequential cells identification: 
[08/19 18:32:04    434s]   Identified SBFF number: 16
[08/19 18:32:04    434s]   Identified MBFF number: 0
[08/19 18:32:04    434s]   Identified SB Latch number: 0
[08/19 18:32:04    434s]   Identified MB Latch number: 0
[08/19 18:32:04    434s]   Not identified SBFF number: 0
[08/19 18:32:04    434s]   Not identified MBFF number: 0
[08/19 18:32:04    434s]   Not identified SB Latch number: 0
[08/19 18:32:04    434s]   Not identified MB Latch number: 0
[08/19 18:32:04    434s]   Number of sequential cells which are not FFs: 13
[08/19 18:32:04    434s] Total number of combinational cells: 99
[08/19 18:32:04    434s] Total number of sequential cells: 29
[08/19 18:32:04    434s] Total number of tristate cells: 6
[08/19 18:32:04    434s] Total number of level shifter cells: 0
[08/19 18:32:04    434s] Total number of power gating cells: 0
[08/19 18:32:04    434s] Total number of isolation cells: 0
[08/19 18:32:04    434s] Total number of power switch cells: 0
[08/19 18:32:04    434s] Total number of pulse generator cells: 0
[08/19 18:32:04    434s] Total number of always on buffers: 0
[08/19 18:32:04    434s] Total number of retention cells: 0
[08/19 18:32:04    434s] List of usable buffers: BUF_X1 BUF_X2 BUF_X4 BUF_X8 BUF_X16 BUF_X32 CLKBUF_X1 CLKBUF_X2 CLKBUF_X3
[08/19 18:32:04    434s] Total number of usable buffers: 9
[08/19 18:32:04    434s] List of unusable buffers:
[08/19 18:32:04    434s] Total number of unusable buffers: 0
[08/19 18:32:04    434s] List of usable inverters: INV_X1 INV_X2 INV_X4 INV_X8 INV_X16 INV_X32
[08/19 18:32:04    434s] Total number of usable inverters: 6
[08/19 18:32:04    434s] List of unusable inverters:
[08/19 18:32:04    434s] Total number of unusable inverters: 0
[08/19 18:32:04    434s] List of identified usable delay cells:
[08/19 18:32:04    434s] Total number of identified usable delay cells: 0
[08/19 18:32:04    434s] List of identified unusable delay cells:
[08/19 18:32:04    434s] Total number of identified unusable delay cells: 0
[08/19 18:32:04    434s] Creating Cell Server, finished. 
[08/19 18:32:04    434s] 
[08/19 18:32:04    434s] No delay cells were detected in the set of buffers. Buffers will be used to fix hold violations.
[08/19 18:32:04    434s] Deleting Cell Server ...
[08/19 18:32:27    438s] <CMD> reset_parasitics
[08/19 18:32:28    438s] Performing RC Extraction ...
[08/19 18:32:28    438s] <CMD> extractRC
[08/19 18:32:28    438s] Extraction called for design 'SUM' of instances=3791 and nets=1606 using extraction engine 'postRoute' at effort level 'low' .
[08/19 18:32:28    438s] **WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
[08/19 18:32:28    438s] Type 'man IMPEXT-3530' for more detail.
[08/19 18:32:28    438s] PostRoute (effortLevel low) RC Extraction called for design SUM.
[08/19 18:32:28    438s] RC Extraction called in multi-corner(1) mode.
[08/19 18:32:28    438s] Process corner(s) are loaded.
[08/19 18:32:28    438s]  Corner: standard
[08/19 18:32:28    438s] extractDetailRC Option : -outfile /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d -maxResLength 200  -extended
[08/19 18:32:28    438s] RC Mode: PostRoute -effortLevel low [Extended CapTable, RC Table Resistances]
[08/19 18:32:28    438s]       RC Corner Indexes            0   
[08/19 18:32:28    438s] Capacitance Scaling Factor   : 1.00000 
[08/19 18:32:28    438s] Coupling Cap. Scaling Factor : 1.00000 
[08/19 18:32:28    438s] Resistance Scaling Factor    : 1.00000 
[08/19 18:32:28    438s] Clock Cap. Scaling Factor    : 1.00000 
[08/19 18:32:28    438s] Clock Res. Scaling Factor    : 1.00000 
[08/19 18:32:28    438s] Shrink Factor                : 1.00000
[08/19 18:32:28    438s] Initializing multi-corner capacitance tables ... 
[08/19 18:32:28    438s] Initializing multi-corner resistance tables ...
[08/19 18:32:28    438s] Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1164.3M)
[08/19 18:32:28    438s] Creating parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d' for storing RC.
[08/19 18:32:28    438s] Extracted 10.0078% (CPU Time= 0:00:00.1  MEM= 1180.9M)
[08/19 18:32:28    438s] Extracted 20.0101% (CPU Time= 0:00:00.1  MEM= 1204.9M)
[08/19 18:32:28    438s] Extracted 30.0067% (CPU Time= 0:00:00.1  MEM= 1204.9M)
[08/19 18:32:28    438s] Extracted 40.009% (CPU Time= 0:00:00.1  MEM= 1204.9M)
[08/19 18:32:28    438s] Extracted 50.0112% (CPU Time= 0:00:00.1  MEM= 1204.9M)
[08/19 18:32:28    438s] Extracted 60.0078% (CPU Time= 0:00:00.1  MEM= 1204.9M)
[08/19 18:32:28    438s] Extracted 70.0101% (CPU Time= 0:00:00.1  MEM= 1204.9M)
[08/19 18:32:28    438s] Extracted 80.0067% (CPU Time= 0:00:00.2  MEM= 1204.9M)
[08/19 18:32:28    438s] Extracted 90.009% (CPU Time= 0:00:00.2  MEM= 1204.9M)
[08/19 18:32:28    438s] Extracted 100% (CPU Time= 0:00:00.3  MEM= 1204.9M)
[08/19 18:32:28    438s] Number of Extracted Resistors     : 25612
[08/19 18:32:28    438s] Number of Extracted Ground Cap.   : 27216
[08/19 18:32:28    438s] Number of Extracted Coupling Cap. : 46936
[08/19 18:32:28    438s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d' for reading.
[08/19 18:32:28    438s] Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
[08/19 18:32:28    438s]  Corner: standard
[08/19 18:32:28    438s] Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1188.9M)
[08/19 18:32:28    438s] Creating parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb_Filter.rcdb.d' for storing RC.
[08/19 18:32:28    438s] Closing parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d'. 1604 times net's RC data read were performed.
[08/19 18:32:28    438s] Lumped Parasitic Loading Started (total cpu=0:00:00.0, real=0:00:00.0, current mem=1192.891M)
[08/19 18:32:28    438s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d' for reading.
[08/19 18:32:28    438s] processing rcdb (/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d) for hinst (top) of cell (SUM);
[08/19 18:32:28    438s] Lumped Parasitic Loading Completed (total cpu=0:00:00.0, real=0:00:00.0, current mem=1192.891M)
[08/19 18:32:28    438s] PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.4  Real Time: 0:00:00.0  MEM: 1192.891M)
[08/19 18:33:25    447s] <CMD> redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
[08/19 18:33:25    447s] <CMD> timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix SUM_postRoute -outDir timingReports
[08/19 18:33:25    447s]  Reset EOS DB
[08/19 18:33:25    447s] Ignoring AAE DB Resetting ...
[08/19 18:33:25    447s] Extraction called for design 'SUM' of instances=3791 and nets=1606 using extraction engine 'postRoute' at effort level 'low' .
[08/19 18:33:25    447s] **WARN: (IMPEXT-3530):	The process node is not set. Use the command setDesignMode -process <process node> prior to extraction for maximum accuracy and optimal automatic threshold setting.
[08/19 18:33:25    447s] Type 'man IMPEXT-3530' for more detail.
[08/19 18:33:25    447s] PostRoute (effortLevel low) RC Extraction called for design SUM.
[08/19 18:33:25    447s] RC Extraction called in multi-corner(1) mode.
[08/19 18:33:25    447s] Process corner(s) are loaded.
[08/19 18:33:25    447s]  Corner: standard
[08/19 18:33:25    447s] extractDetailRC Option : -outfile /tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d -maxResLength 200  -extended
[08/19 18:33:25    447s] RC Mode: PostRoute -effortLevel low [Extended CapTable, RC Table Resistances]
[08/19 18:33:25    447s]       RC Corner Indexes            0   
[08/19 18:33:25    447s] Capacitance Scaling Factor   : 1.00000 
[08/19 18:33:25    447s] Coupling Cap. Scaling Factor : 1.00000 
[08/19 18:33:25    447s] Resistance Scaling Factor    : 1.00000 
[08/19 18:33:25    447s] Clock Cap. Scaling Factor    : 1.00000 
[08/19 18:33:25    447s] Clock Res. Scaling Factor    : 1.00000 
[08/19 18:33:25    447s] Shrink Factor                : 1.00000
[08/19 18:33:25    447s] Initializing multi-corner capacitance tables ... 
[08/19 18:33:25    447s] Initializing multi-corner resistance tables ...
[08/19 18:33:25    447s] Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1164.8M)
[08/19 18:33:25    447s] Creating parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d' for storing RC.
[08/19 18:33:25    447s] Extracted 10.0078% (CPU Time= 0:00:00.1  MEM= 1179.9M)
[08/19 18:33:25    447s] Extracted 20.0101% (CPU Time= 0:00:00.1  MEM= 1203.9M)
[08/19 18:33:25    447s] Extracted 30.0067% (CPU Time= 0:00:00.1  MEM= 1203.9M)
[08/19 18:33:25    447s] Extracted 40.009% (CPU Time= 0:00:00.1  MEM= 1203.9M)
[08/19 18:33:25    447s] Extracted 50.0112% (CPU Time= 0:00:00.1  MEM= 1203.9M)
[08/19 18:33:25    447s] Extracted 60.0078% (CPU Time= 0:00:00.2  MEM= 1203.9M)
[08/19 18:33:25    447s] Extracted 70.0101% (CPU Time= 0:00:00.2  MEM= 1203.9M)
[08/19 18:33:25    447s] Extracted 80.0067% (CPU Time= 0:00:00.2  MEM= 1203.9M)
[08/19 18:33:25    447s] Extracted 90.009% (CPU Time= 0:00:00.3  MEM= 1203.9M)
[08/19 18:33:25    447s] Extracted 100% (CPU Time= 0:00:00.3  MEM= 1203.9M)
[08/19 18:33:25    447s] Number of Extracted Resistors     : 25612
[08/19 18:33:25    447s] Number of Extracted Ground Cap.   : 27216
[08/19 18:33:25    447s] Number of Extracted Coupling Cap. : 46936
[08/19 18:33:25    447s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d' for reading.
[08/19 18:33:25    447s] Filtering XCap in 'relativeOnly' mode using values relative_c_threshold=0.03 and total_c_threshold=5fF.
[08/19 18:33:25    447s]  Corner: standard
[08/19 18:33:25    447s] Checking LVS Completed (CPU Time= 0:00:00.0  MEM= 1188.9M)
[08/19 18:33:25    447s] Creating parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb_Filter.rcdb.d' for storing RC.
[08/19 18:33:25    447s] Closing parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d'. 1604 times net's RC data read were performed.
[08/19 18:33:25    447s] Lumped Parasitic Loading Started (total cpu=0:00:00.0, real=0:00:00.0, current mem=1192.891M)
[08/19 18:33:25    447s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d' for reading.
[08/19 18:33:25    447s] processing rcdb (/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d) for hinst (top) of cell (SUM);
[08/19 18:33:25    447s] Lumped Parasitic Loading Completed (total cpu=0:00:00.0, real=0:00:00.0, current mem=1192.891M)
[08/19 18:33:25    447s] PostRoute (effortLevel low) RC Extraction DONE (CPU Time: 0:00:00.5  Real Time: 0:00:00.0  MEM: 1192.891M)
[08/19 18:33:25    447s] AAE DB initialization (MEM=1224.22 CPU=0:00:00.1 REAL=0:00:00.0) 
[08/19 18:33:25    447s] Starting SI iteration 1 using Infinite Timing Windows
[08/19 18:33:25    447s] Begin IPO call back ...
[08/19 18:33:26    448s] End IPO call back ...
[08/19 18:33:26    448s] #################################################################################
[08/19 18:33:26    448s] # Design Stage: PostRoute
[08/19 18:33:26    448s] # Design Name: SUM
[08/19 18:33:26    448s] # Design Mode: 90nm
[08/19 18:33:26    448s] # Analysis Mode: MMMC OCV 
[08/19 18:33:26    448s] # Parasitics Mode: SPEF/RCDB
[08/19 18:33:26    448s] # Signoff Settings: SI On 
[08/19 18:33:26    448s] #################################################################################
[08/19 18:33:26    448s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:33:26    448s] Setting infinite Tws ...
[08/19 18:33:26    448s] First Iteration Infinite Tw... 
[08/19 18:33:26    448s] Calculate early delays in OCV mode...
[08/19 18:33:26    448s] Calculate late delays in OCV mode...
[08/19 18:33:26    448s] Topological Sorting (REAL = 0:00:00.0, MEM = 1224.2M, InitMEM = 1224.2M)
[08/19 18:33:26    448s] Start delay calculation (fullDC) (1 T). (MEM=1224.22)
[08/19 18:33:26    448s] Initializing multi-corner capacitance tables ... 
[08/19 18:33:26    448s] Initializing multi-corner resistance tables ...
[08/19 18:33:26    448s] Start AAE Lib Loading. (MEM=1240.38)
[08/19 18:33:26    448s] End AAE Lib Loading. (MEM=1431.12 CPU=0:00:00.0 Real=0:00:00.0)
[08/19 18:33:26    448s] End AAE Lib Interpolated Model. (MEM=1431.12 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:33:26    448s] Opening parasitic data file '/tmp/innovus_temp_19172_localhost.localdomain_ms20.50_Rakza9/SUM_19172_y2ClNC.rcdb.d' for reading.
[08/19 18:33:26    448s] RC Database In Completed (CPU Time= 0:00:00.0  Real Time=0:00:00.0  MEM= 1431.1M)
[08/19 18:33:26    448s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:33:28    450s] Total number of fetched objects 1990
[08/19 18:33:28    450s] AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
[08/19 18:33:28    450s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:33:28    450s] End delay calculation. (MEM=1499.88 CPU=0:00:01.1 REAL=0:00:01.0)
[08/19 18:33:28    450s] End delay calculation (fullDC). (MEM=1402.51 CPU=0:00:01.6 REAL=0:00:02.0)
[08/19 18:33:28    450s] *** CDM Built up (cpu=0:00:01.7  real=0:00:02.0  mem= 1402.5M) ***
[08/19 18:33:28    450s] Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1402.5M)
[08/19 18:33:28    450s] Add other clocks and setupCteToAAEClockMapping during iter 1
[08/19 18:33:28    450s] Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1402.5M)
[08/19 18:33:28    450s] Starting SI iteration 2
[08/19 18:33:28    450s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:33:28    450s] Calculate early delays in OCV mode...
[08/19 18:33:28    450s] Calculate late delays in OCV mode...
[08/19 18:33:28    450s] Start delay calculation (fullDC) (1 T). (MEM=1410.55)
[08/19 18:33:28    450s] End AAE Lib Interpolated Model. (MEM=1410.55 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:33:28    450s] Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
[08/19 18:33:28    450s] Glitch Analysis: View default -- Total Number of Nets Analyzed = 1990. 
[08/19 18:33:28    450s] Total number of fetched objects 1990
[08/19 18:33:28    450s] AAE_INFO-618: Total number of nets in the design is 1606,  1.6 percent of the nets selected for SI analysis
[08/19 18:33:28    450s] End delay calculation. (MEM=1378.55 CPU=0:00:00.1 REAL=0:00:00.0)
[08/19 18:33:28    450s] End delay calculation (fullDC). (MEM=1378.55 CPU=0:00:00.2 REAL=0:00:00.0)
[08/19 18:33:28    450s] *** CDM Built up (cpu=0:00:00.2  real=0:00:00.0  mem= 1378.6M) ***
[08/19 18:33:28    450s] Effort level <high> specified for reg2reg path_group
[08/19 18:33:28    450s] End AAE Lib Interpolated Model. (MEM=1313.78 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:33:28    450s] Begin: glitch net info
[08/19 18:33:28    450s] glitch slack range: number of glitch nets
[08/19 18:33:28    450s] glitch slack < -0.32 : 0
[08/19 18:33:28    450s] -0.32 < glitch slack < -0.28 : 0
[08/19 18:33:28    450s] -0.28 < glitch slack < -0.24 : 0
[08/19 18:33:28    450s] -0.24 < glitch slack < -0.2 : 0
[08/19 18:33:28    450s] -0.2 < glitch slack < -0.16 : 0
[08/19 18:33:28    450s] -0.16 < glitch slack < -0.12 : 0
[08/19 18:33:28    450s] -0.12 < glitch slack < -0.08 : 0
[08/19 18:33:28    450s] -0.08 < glitch slack < -0.04 : 0
[08/19 18:33:28    450s] -0.04 < glitch slack : 0
[08/19 18:33:28    450s] End: glitch net info
[08/19 18:33:30    452s] 
------------------------------------------------------------
          timeDesign Summary                             
------------------------------------------------------------

Setup views included:
 default 

+--------------------+---------+---------+---------+
|     Setup mode     |   all   | reg2reg | default |
+--------------------+---------+---------+---------+
|           WNS (ns):|  0.082  |  0.082  |  3.730  |
|           TNS (ns):|  0.000  |  0.000  |  0.000  |
|    Violating Paths:|    0    |    0    |    0    |
|          All Paths:|   772   |   129   |   643   |
+--------------------+---------+---------+---------+

+----------------+-------------------------------+------------------+
|                |              Real             |       Total      |
|    DRVs        +------------------+------------+------------------|
|                |  Nr nets(terms)  | Worst Vio  |  Nr nets(terms)  |
+----------------+------------------+------------+------------------+
|   max_cap      |      0 (0)       |   0.000    |      0 (0)       |
|   max_tran     |      0 (0)       |   0.000    |      0 (0)       |
|   max_fanout   |      0 (0)       |     0      |      0 (0)       |
|   max_length   |      0 (0)       |     0      |      0 (0)       |
+----------------+------------------+------------+------------------+

Density: 63.957%
       (100.000% with Fillers)
Total number of glitch violations: 0
------------------------------------------------------------
Reported timing to dir timingReports
[08/19 18:33:30    452s] Total CPU time: 5.19 sec
[08/19 18:33:30    452s] Total Real time: 5.0 sec
[08/19 18:33:30    452s] Total Memory Usage: 1311.777344 Mbytes
[08/19 18:33:30    452s] Reset AAE Options
[08/19 18:33:35    453s] <CMD> get_time_unit
[08/19 18:33:35    453s] <CMD> report_timing -machine_readable -max_paths 10000 -max_slack 0.75 -path_exceptions all > top.mtarpt
[08/19 18:33:36    453s] <CMD> load_timing_debug_report -name default_report top.mtarpt
[08/19 18:33:36    453s] Parsing file top.mtarpt...
[08/19 18:34:20    461s] <CMD> verifyConnectivity -type all -error 1000 -warning 50
[08/19 18:34:20    461s] VERIFY_CONNECTIVITY use new engine.
[08/19 18:34:20    461s] 
[08/19 18:34:20    461s] ******** Start: VERIFY CONNECTIVITY ********
[08/19 18:34:20    461s] Start Time: Wed Aug 19 18:34:20 2020
[08/19 18:34:20    461s] 
[08/19 18:34:20    461s] Design Name: SUM
[08/19 18:34:20    461s] Database Units: 2000
[08/19 18:34:20    461s] Design Boundary: (0.0000, 0.0000) (80.3700, 77.2800)
[08/19 18:34:20    461s] Error Limit = 1000; Warning Limit = 50
[08/19 18:34:20    461s] Check all nets
[08/19 18:34:20    461s] 
[08/19 18:34:20    461s] Begin Summary 
[08/19 18:34:20    461s]   Found no problems or warnings.
[08/19 18:34:20    461s] End Summary
[08/19 18:34:20    461s] 
[08/19 18:34:20    461s] End Time: Wed Aug 19 18:34:20 2020
[08/19 18:34:20    461s] Time Elapsed: 0:00:00.0
[08/19 18:34:20    461s] 
[08/19 18:34:20    461s] ******** End: VERIFY CONNECTIVITY ********
[08/19 18:34:20    461s]   Verification Complete : 0 Viols.  0 Wrngs.
[08/19 18:34:20    461s]   (CPU Time: 0:00:00.1  MEM: 0.000M)
[08/19 18:34:20    461s] 
[08/19 18:34:26    462s] <CMD> setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
[08/19 18:34:26    462s] <CMD> verifyGeometry
[08/19 18:34:26    462s]  *** Starting Verify Geometry (MEM: 1321.8) ***
[08/19 18:34:26    462s] 
[08/19 18:34:26    462s] **WARN: (IMPVFG-257):	verifyGeometry command is replaced by verify_drc command. It still works in this release but will be removed in future release. Please update your script to use the new command.
[08/19 18:34:26    462s]   VERIFY GEOMETRY ...... Starting Verification
[08/19 18:34:26    462s]   VERIFY GEOMETRY ...... Initializing
[08/19 18:34:26    462s]   VERIFY GEOMETRY ...... Deleting Existing Violations
[08/19 18:34:26    462s]   VERIFY GEOMETRY ...... Creating Sub-Areas
[08/19 18:34:26    462s]                   ...... bin size: 2160
[08/19 18:34:26    462s]   VERIFY GEOMETRY ...... SubArea : 1 of 1
[08/19 18:34:26    463s] **WARN: (IMPVFG-47):	This warning message means the PG pin of macro/macros is not connected to relevant PG net in the design. If we query the particular PG pin 'net:NULL' will be displayed in the Innovus GUI.
[08/19 18:34:26    463s] 
[08/19 18:34:27    463s]   VERIFY GEOMETRY ...... Cells          :  0 Viols.
[08/19 18:34:27    463s]   VERIFY GEOMETRY ...... SameNet        :  0 Viols.
[08/19 18:34:27    463s]   VERIFY GEOMETRY ...... Wiring         :  0 Viols.
[08/19 18:34:27    463s]   VERIFY GEOMETRY ...... Antenna        :  0 Viols.
[08/19 18:34:27    463s]   VERIFY GEOMETRY ...... Sub-Area : 1 complete 0 Viols. 0 Wrngs.
[08/19 18:34:27    463s] VG: elapsed time: 1.00
[08/19 18:34:27    463s] Begin Summary ...
[08/19 18:34:27    463s]   Cells       : 0
[08/19 18:34:27    463s]   SameNet     : 0
[08/19 18:34:27    463s]   Wiring      : 0
[08/19 18:34:27    463s]   Antenna     : 0
[08/19 18:34:27    463s]   Short       : 0
[08/19 18:34:27    463s]   Overlap     : 0
[08/19 18:34:27    463s] End Summary
[08/19 18:34:27    463s] 
[08/19 18:34:27    463s]   Verification Complete : 0 Viols.  0 Wrngs.
[08/19 18:34:27    463s] 
[08/19 18:34:27    463s] **********End: VERIFY GEOMETRY**********
[08/19 18:34:27    463s]  *** verify geometry (CPU: 0:00:01.0  MEM: 126.4M)
[08/19 18:34:27    463s] 
[08/19 18:34:27    463s] <CMD> setVerifyGeometryMode -area { 0 0 0 0 }
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -disable_rules -quiet
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -quiet -area
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -quiet -layer_range
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -check_implant -quiet
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -check_implant_across_rows -quiet
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -check_ndr_spacing -quiet
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -check_only -quiet
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -check_same_via_cell -quiet
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -exclude_pg_net -quiet
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -ignore_trial_route -quiet
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -max_wrong_way_halo -quiet
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
[08/19 18:34:47    466s] <CMD> get_verify_drc_mode -limit -quiet
[08/19 18:34:49    467s] <CMD> set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -report SUM.drc.rpt -limit 1000
[08/19 18:34:49    467s] <CMD> verify_drc
[08/19 18:34:49    467s] #-report SUM.drc.rpt                     # string, default="", user setting
[08/19 18:34:49    467s]  *** Starting Verify DRC (MEM: 1448.2) ***
[08/19 18:34:49    467s] 
[08/19 18:34:49    467s]   VERIFY DRC ...... Starting Verification
[08/19 18:34:49    467s]   VERIFY DRC ...... Initializing
[08/19 18:34:49    467s]   VERIFY DRC ...... Deleting Existing Violations
[08/19 18:34:49    467s]   VERIFY DRC ...... Creating Sub-Areas
[08/19 18:34:49    467s]   VERIFY DRC ...... Using new threading
[08/19 18:34:49    467s]   VERIFY DRC ...... Sub-Area: {0.000 0.000 80.370 77.280} 1 of 1
[08/19 18:34:49    467s]   VERIFY DRC ...... Sub-Area : 1 complete 49 Viols.
[08/19 18:34:49    467s] 
[08/19 18:34:49    467s]   Verification Complete : 49 Viols.
[08/19 18:34:49    467s] 
[08/19 18:34:49    467s]  *** End Verify DRC (CPU: 0:00:00.5  ELAPSED TIME: 0.00  MEM: 0.0M) ***
[08/19 18:34:49    467s] 
[08/19 18:34:49    467s] <CMD> set_verify_drc_mode -area {0 0 0 0}
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -disable_rules -quiet
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -quiet -area
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -quiet -layer_range
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -check_implant -quiet
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -check_implant_across_rows -quiet
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -check_ndr_spacing -quiet
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -check_only -quiet
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -check_same_via_cell -quiet
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -exclude_pg_net -quiet
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -ignore_trial_route -quiet
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -max_wrong_way_halo -quiet
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
[08/19 18:35:34    474s] <CMD> get_verify_drc_mode -limit -quiet
[08/19 18:35:41    475s] <CMD> zoomBox 108.078 45.590 108.078 46.005
[08/19 18:35:42    475s] <CMD> panCenter 108.171 45.934
[08/19 18:35:42    475s] <CMD> panCenter 108.264 46.071
[08/19 18:35:51    477s] <CMD> zoomSelected
[08/19 18:35:55    477s] <CMD> zoomSelected
[08/19 18:35:56    478s] <CMD> gui_select -rect {108.065 46.179 108.167 46.111}
[08/19 18:35:57    478s] <CMD> zoomOut
[08/19 18:35:57    478s] <CMD> zoomOut
[08/19 18:35:58    478s] <CMD> zoomIn
[08/19 18:36:00    478s] <CMD> panCenter 107.639 45.896
[08/19 18:36:00    478s] <CMD> panCenter 107.014 45.721
[08/19 18:36:36    484s] <CMD> reportGateCount -level 5 -limit 100 -outfile SUM.gateCount
[08/19 18:36:36    484s] Gate area 0.7980 um^2
[08/19 18:36:36    484s] [0] SUM Gates=3776 Cells=1345 Area=3013.2 um^2
[08/19 18:36:36    484s] [1] maprca Gates=927 Cells=687 Area=740.0 um^2
[08/19 18:36:41    485s] <CMD> saveNetlist SUM.v
[08/19 18:36:41    485s] Writing Netlist "SUM.v" ...
[08/19 18:36:53    486s] <CMD> all_hold_analysis_views 
[08/19 18:36:53    486s] <CMD> all_setup_analysis_views 
[08/19 18:36:56    487s] <CMD> write_sdf  -ideal_clock_network SUM.sdf
[08/19 18:36:57    487s] **WARN: (SDF-808):	The software is currently operating in a high performance mode which optimizes the handling of multiple timing arcs between input and output pin pairs. With the current settings, the SDF file generated will contain the same delay information for all of these arcs. To have the SDF recalculated with explicit pin pair data, you should use the option '-recompute_parallel_arcs'. This setting is recommended for generating SDF for functional  simulation applications.
[08/19 18:36:57    487s] Starting SI iteration 1 using Infinite Timing Windows
[08/19 18:36:57    487s] #################################################################################
[08/19 18:36:57    487s] # Design Stage: PostRoute
[08/19 18:36:57    487s] # Design Name: SUM
[08/19 18:36:57    487s] # Design Mode: 90nm
[08/19 18:36:57    487s] # Analysis Mode: MMMC OCV 
[08/19 18:36:57    487s] # Parasitics Mode: SPEF/RCDB
[08/19 18:36:57    487s] # Signoff Settings: SI On 
[08/19 18:36:57    487s] #################################################################################
[08/19 18:36:57    487s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:36:57    487s] Setting infinite Tws ...
[08/19 18:36:57    487s] First Iteration Infinite Tw... 
[08/19 18:36:57    487s] Topological Sorting (REAL = 0:00:00.0, MEM = 1424.0M, InitMEM = 1424.0M)
[08/19 18:36:57    487s] Start delay calculation (fullDC) (1 T). (MEM=1424)
[08/19 18:36:57    487s] End AAE Lib Interpolated Model. (MEM=1432.07 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:36:58    488s] Total number of fetched objects 1990
[08/19 18:36:58    488s] AAE_INFO-618: Total number of nets in the design is 1606,  100.0 percent of the nets selected for SI analysis
[08/19 18:36:58    488s] End Timing Check Calculation. (CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:36:58    488s] End delay calculation. (MEM=1483.15 CPU=0:00:01.0 REAL=0:00:01.0)
[08/19 18:36:58    488s] End delay calculation (fullDC). (MEM=1483.15 CPU=0:00:01.2 REAL=0:00:01.0)
[08/19 18:36:58    488s] *** CDM Built up (cpu=0:00:01.4  real=0:00:01.0  mem= 1483.1M) ***
[08/19 18:36:58    489s] Loading CTE timing window with TwFlowType 0...(CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1483.1M)
[08/19 18:36:58    489s] Add other clocks and setupCteToAAEClockMapping during iter 1
[08/19 18:36:58    489s] Loading CTE timing window is completed (CPU = 0:00:00.0, REAL = 0:00:00.0, MEM = 1483.1M)
[08/19 18:36:58    489s] Starting SI iteration 2
[08/19 18:36:58    489s] AAE_INFO: 1 threads acquired from CTE.
[08/19 18:36:58    489s] Start delay calculation (fullDC) (1 T). (MEM=1483.15)
[08/19 18:36:58    489s] End AAE Lib Interpolated Model. (MEM=1483.15 CPU Time=0:00:00.0, Real Time=0:00:00.0)
[08/19 18:36:59    489s] Glitch Analysis: View default -- Total Number of Nets Skipped = 0. 
[08/19 18:36:59    489s] Glitch Analysis: View default -- Total Number of Nets Analyzed = 1990. 
[08/19 18:36:59    489s] Total number of fetched objects 1990
[08/19 18:36:59    489s] AAE_INFO-618: Total number of nets in the design is 1606,  10.8 percent of the nets selected for SI analysis
[08/19 18:36:59    489s] End delay calculation. (MEM=1451.14 CPU=0:00:00.2 REAL=0:00:01.0)
[08/19 18:36:59    489s] End delay calculation (fullDC). (MEM=1451.14 CPU=0:00:00.2 REAL=0:00:01.0)
[08/19 18:36:59    489s] *** CDM Built up (cpu=0:00:00.2  real=0:00:01.0  mem= 1451.1M) ***
[08/19 17:53:28      0s] 
[08/19 17:53:28      0s] Cadence Innovus(TM) Implementation System.
[08/19 17:53:28      0s] Copyright 2017 Cadence Design Systems, Inc. All rights reserved worldwide.
[08/19 17:53:28      0s] 
[08/19 17:53:28      0s] Version:	v17.11-s080_1, built Fri Aug 4 11:13:11 PDT 2017
[08/19 17:53:28      0s] Options:	help 
[08/19 17:53:28      0s] Date:		Wed Aug 19 17:53:28 2020
[08/19 17:53:28      0s] Host:		localhost.localdomain (x86_64 w/Linux 3.10.0-1062.12.1.el7.x86_64) (1core*8cpus*Westmere E56xx/L56xx/X56xx (Nehalem-C) 4096KB)
[08/19 17:53:28      0s] OS:		CentOS Linux release 7.7.1908 (Core)
[08/19 17:53:28      0s] 
[08/19 17:53:28      0s] License:
[08/19 17:53:28      0s] **ERROR: (IMPLIC-68):	Unknown argument: help.
	Run "innovus -help" for valid option/argument.
