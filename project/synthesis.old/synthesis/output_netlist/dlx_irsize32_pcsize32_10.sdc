###################################################################

# Created by write_sdc on Mon Aug 31 16:31:18 2020

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[31]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[30]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[29]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[28]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[27]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[26]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[25]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[24]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[23]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[22]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[21]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[20]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[19]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[18]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[17]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[16]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[15]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[14]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[13]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[12]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[11]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[10]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[9]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[8]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[7]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[6]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[5]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[4]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[3]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[2]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[1]}]
set_max_transition 0.08 [get_ports {IRAM_ADDRESS[0]}]
set_max_transition 0.08 [get_ports IRAM_ENABLE]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[31]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[30]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[29]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[28]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[27]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[26]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[25]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[24]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[23]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[22]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[21]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[20]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[19]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[18]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[17]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[16]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[15]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[14]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[13]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[12]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[11]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[10]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[9]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[8]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[7]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[6]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[5]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[4]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[3]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[2]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[1]}]
set_max_transition 0.08 [get_ports {DRAM_ADDRESS[0]}]
set_max_transition 0.08 [get_ports DRAM_ENABLE]
set_max_transition 0.08 [get_ports DRAM_READNOTWRITE]
set_max_transition 0.08 [get_ports {DRAM_DATA[31]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[30]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[29]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[28]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[27]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[26]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[25]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[24]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[23]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[22]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[21]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[20]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[19]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[18]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[17]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[16]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[15]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[14]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[13]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[12]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[11]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[10]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[9]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[8]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[7]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[6]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[5]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[4]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[3]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[2]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[1]}]
set_max_transition 0.08 [get_ports {DRAM_DATA[0]}]
create_clock -name clk  -period 18.1597  -waveform {0 9.07986}
set_max_delay 18.1597  -from [list [get_ports CLK] [get_ports RST] [get_ports IRAM_READY] [get_ports \
{IRAM_DATA[31]}] [get_ports {IRAM_DATA[30]}] [get_ports {IRAM_DATA[29]}]       \
[get_ports {IRAM_DATA[28]}] [get_ports {IRAM_DATA[27]}] [get_ports             \
{IRAM_DATA[26]}] [get_ports {IRAM_DATA[25]}] [get_ports {IRAM_DATA[24]}]       \
[get_ports {IRAM_DATA[23]}] [get_ports {IRAM_DATA[22]}] [get_ports             \
{IRAM_DATA[21]}] [get_ports {IRAM_DATA[20]}] [get_ports {IRAM_DATA[19]}]       \
[get_ports {IRAM_DATA[18]}] [get_ports {IRAM_DATA[17]}] [get_ports             \
{IRAM_DATA[16]}] [get_ports {IRAM_DATA[15]}] [get_ports {IRAM_DATA[14]}]       \
[get_ports {IRAM_DATA[13]}] [get_ports {IRAM_DATA[12]}] [get_ports             \
{IRAM_DATA[11]}] [get_ports {IRAM_DATA[10]}] [get_ports {IRAM_DATA[9]}]        \
[get_ports {IRAM_DATA[8]}] [get_ports {IRAM_DATA[7]}] [get_ports               \
{IRAM_DATA[6]}] [get_ports {IRAM_DATA[5]}] [get_ports {IRAM_DATA[4]}]          \
[get_ports {IRAM_DATA[3]}] [get_ports {IRAM_DATA[2]}] [get_ports               \
{IRAM_DATA[1]}] [get_ports {IRAM_DATA[0]}] [get_ports DRAM_READY] [get_ports   \
{DRAM_DATA[31]}] [get_ports {DRAM_DATA[30]}] [get_ports {DRAM_DATA[29]}]       \
[get_ports {DRAM_DATA[28]}] [get_ports {DRAM_DATA[27]}] [get_ports             \
{DRAM_DATA[26]}] [get_ports {DRAM_DATA[25]}] [get_ports {DRAM_DATA[24]}]       \
[get_ports {DRAM_DATA[23]}] [get_ports {DRAM_DATA[22]}] [get_ports             \
{DRAM_DATA[21]}] [get_ports {DRAM_DATA[20]}] [get_ports {DRAM_DATA[19]}]       \
[get_ports {DRAM_DATA[18]}] [get_ports {DRAM_DATA[17]}] [get_ports             \
{DRAM_DATA[16]}] [get_ports {DRAM_DATA[15]}] [get_ports {DRAM_DATA[14]}]       \
[get_ports {DRAM_DATA[13]}] [get_ports {DRAM_DATA[12]}] [get_ports             \
{DRAM_DATA[11]}] [get_ports {DRAM_DATA[10]}] [get_ports {DRAM_DATA[9]}]        \
[get_ports {DRAM_DATA[8]}] [get_ports {DRAM_DATA[7]}] [get_ports               \
{DRAM_DATA[6]}] [get_ports {DRAM_DATA[5]}] [get_ports {DRAM_DATA[4]}]          \
[get_ports {DRAM_DATA[3]}] [get_ports {DRAM_DATA[2]}] [get_ports               \
{DRAM_DATA[1]}] [get_ports {DRAM_DATA[0]}]]  -to [list [get_ports {IRAM_ADDRESS[31]}] [get_ports {IRAM_ADDRESS[30]}]       \
[get_ports {IRAM_ADDRESS[29]}] [get_ports {IRAM_ADDRESS[28]}] [get_ports       \
{IRAM_ADDRESS[27]}] [get_ports {IRAM_ADDRESS[26]}] [get_ports                  \
{IRAM_ADDRESS[25]}] [get_ports {IRAM_ADDRESS[24]}] [get_ports                  \
{IRAM_ADDRESS[23]}] [get_ports {IRAM_ADDRESS[22]}] [get_ports                  \
{IRAM_ADDRESS[21]}] [get_ports {IRAM_ADDRESS[20]}] [get_ports                  \
{IRAM_ADDRESS[19]}] [get_ports {IRAM_ADDRESS[18]}] [get_ports                  \
{IRAM_ADDRESS[17]}] [get_ports {IRAM_ADDRESS[16]}] [get_ports                  \
{IRAM_ADDRESS[15]}] [get_ports {IRAM_ADDRESS[14]}] [get_ports                  \
{IRAM_ADDRESS[13]}] [get_ports {IRAM_ADDRESS[12]}] [get_ports                  \
{IRAM_ADDRESS[11]}] [get_ports {IRAM_ADDRESS[10]}] [get_ports                  \
{IRAM_ADDRESS[9]}] [get_ports {IRAM_ADDRESS[8]}] [get_ports {IRAM_ADDRESS[7]}] \
[get_ports {IRAM_ADDRESS[6]}] [get_ports {IRAM_ADDRESS[5]}] [get_ports         \
{IRAM_ADDRESS[4]}] [get_ports {IRAM_ADDRESS[3]}] [get_ports {IRAM_ADDRESS[2]}] \
[get_ports {IRAM_ADDRESS[1]}] [get_ports {IRAM_ADDRESS[0]}] [get_ports         \
IRAM_ENABLE] [get_ports {DRAM_ADDRESS[31]}] [get_ports {DRAM_ADDRESS[30]}]     \
[get_ports {DRAM_ADDRESS[29]}] [get_ports {DRAM_ADDRESS[28]}] [get_ports       \
{DRAM_ADDRESS[27]}] [get_ports {DRAM_ADDRESS[26]}] [get_ports                  \
{DRAM_ADDRESS[25]}] [get_ports {DRAM_ADDRESS[24]}] [get_ports                  \
{DRAM_ADDRESS[23]}] [get_ports {DRAM_ADDRESS[22]}] [get_ports                  \
{DRAM_ADDRESS[21]}] [get_ports {DRAM_ADDRESS[20]}] [get_ports                  \
{DRAM_ADDRESS[19]}] [get_ports {DRAM_ADDRESS[18]}] [get_ports                  \
{DRAM_ADDRESS[17]}] [get_ports {DRAM_ADDRESS[16]}] [get_ports                  \
{DRAM_ADDRESS[15]}] [get_ports {DRAM_ADDRESS[14]}] [get_ports                  \
{DRAM_ADDRESS[13]}] [get_ports {DRAM_ADDRESS[12]}] [get_ports                  \
{DRAM_ADDRESS[11]}] [get_ports {DRAM_ADDRESS[10]}] [get_ports                  \
{DRAM_ADDRESS[9]}] [get_ports {DRAM_ADDRESS[8]}] [get_ports {DRAM_ADDRESS[7]}] \
[get_ports {DRAM_ADDRESS[6]}] [get_ports {DRAM_ADDRESS[5]}] [get_ports         \
{DRAM_ADDRESS[4]}] [get_ports {DRAM_ADDRESS[3]}] [get_ports {DRAM_ADDRESS[2]}] \
[get_ports {DRAM_ADDRESS[1]}] [get_ports {DRAM_ADDRESS[0]}] [get_ports         \
DRAM_ENABLE] [get_ports DRAM_READNOTWRITE] [get_ports {DRAM_DATA[31]}]         \
[get_ports {DRAM_DATA[30]}] [get_ports {DRAM_DATA[29]}] [get_ports             \
{DRAM_DATA[28]}] [get_ports {DRAM_DATA[27]}] [get_ports {DRAM_DATA[26]}]       \
[get_ports {DRAM_DATA[25]}] [get_ports {DRAM_DATA[24]}] [get_ports             \
{DRAM_DATA[23]}] [get_ports {DRAM_DATA[22]}] [get_ports {DRAM_DATA[21]}]       \
[get_ports {DRAM_DATA[20]}] [get_ports {DRAM_DATA[19]}] [get_ports             \
{DRAM_DATA[18]}] [get_ports {DRAM_DATA[17]}] [get_ports {DRAM_DATA[16]}]       \
[get_ports {DRAM_DATA[15]}] [get_ports {DRAM_DATA[14]}] [get_ports             \
{DRAM_DATA[13]}] [get_ports {DRAM_DATA[12]}] [get_ports {DRAM_DATA[11]}]       \
[get_ports {DRAM_DATA[10]}] [get_ports {DRAM_DATA[9]}] [get_ports              \
{DRAM_DATA[8]}] [get_ports {DRAM_DATA[7]}] [get_ports {DRAM_DATA[6]}]          \
[get_ports {DRAM_DATA[5]}] [get_ports {DRAM_DATA[4]}] [get_ports               \
{DRAM_DATA[3]}] [get_ports {DRAM_DATA[2]}] [get_ports {DRAM_DATA[1]}]          \
[get_ports {DRAM_DATA[0]}]]
set_min_delay 0.03  -from [list [get_ports CLK] [get_ports RST] [get_ports IRAM_READY] [get_ports \
{IRAM_DATA[31]}] [get_ports {IRAM_DATA[30]}] [get_ports {IRAM_DATA[29]}]       \
[get_ports {IRAM_DATA[28]}] [get_ports {IRAM_DATA[27]}] [get_ports             \
{IRAM_DATA[26]}] [get_ports {IRAM_DATA[25]}] [get_ports {IRAM_DATA[24]}]       \
[get_ports {IRAM_DATA[23]}] [get_ports {IRAM_DATA[22]}] [get_ports             \
{IRAM_DATA[21]}] [get_ports {IRAM_DATA[20]}] [get_ports {IRAM_DATA[19]}]       \
[get_ports {IRAM_DATA[18]}] [get_ports {IRAM_DATA[17]}] [get_ports             \
{IRAM_DATA[16]}] [get_ports {IRAM_DATA[15]}] [get_ports {IRAM_DATA[14]}]       \
[get_ports {IRAM_DATA[13]}] [get_ports {IRAM_DATA[12]}] [get_ports             \
{IRAM_DATA[11]}] [get_ports {IRAM_DATA[10]}] [get_ports {IRAM_DATA[9]}]        \
[get_ports {IRAM_DATA[8]}] [get_ports {IRAM_DATA[7]}] [get_ports               \
{IRAM_DATA[6]}] [get_ports {IRAM_DATA[5]}] [get_ports {IRAM_DATA[4]}]          \
[get_ports {IRAM_DATA[3]}] [get_ports {IRAM_DATA[2]}] [get_ports               \
{IRAM_DATA[1]}] [get_ports {IRAM_DATA[0]}] [get_ports DRAM_READY] [get_ports   \
{DRAM_DATA[31]}] [get_ports {DRAM_DATA[30]}] [get_ports {DRAM_DATA[29]}]       \
[get_ports {DRAM_DATA[28]}] [get_ports {DRAM_DATA[27]}] [get_ports             \
{DRAM_DATA[26]}] [get_ports {DRAM_DATA[25]}] [get_ports {DRAM_DATA[24]}]       \
[get_ports {DRAM_DATA[23]}] [get_ports {DRAM_DATA[22]}] [get_ports             \
{DRAM_DATA[21]}] [get_ports {DRAM_DATA[20]}] [get_ports {DRAM_DATA[19]}]       \
[get_ports {DRAM_DATA[18]}] [get_ports {DRAM_DATA[17]}] [get_ports             \
{DRAM_DATA[16]}] [get_ports {DRAM_DATA[15]}] [get_ports {DRAM_DATA[14]}]       \
[get_ports {DRAM_DATA[13]}] [get_ports {DRAM_DATA[12]}] [get_ports             \
{DRAM_DATA[11]}] [get_ports {DRAM_DATA[10]}] [get_ports {DRAM_DATA[9]}]        \
[get_ports {DRAM_DATA[8]}] [get_ports {DRAM_DATA[7]}] [get_ports               \
{DRAM_DATA[6]}] [get_ports {DRAM_DATA[5]}] [get_ports {DRAM_DATA[4]}]          \
[get_ports {DRAM_DATA[3]}] [get_ports {DRAM_DATA[2]}] [get_ports               \
{DRAM_DATA[1]}] [get_ports {DRAM_DATA[0]}]]  -to [list [get_ports {IRAM_ADDRESS[31]}] [get_ports {IRAM_ADDRESS[30]}]       \
[get_ports {IRAM_ADDRESS[29]}] [get_ports {IRAM_ADDRESS[28]}] [get_ports       \
{IRAM_ADDRESS[27]}] [get_ports {IRAM_ADDRESS[26]}] [get_ports                  \
{IRAM_ADDRESS[25]}] [get_ports {IRAM_ADDRESS[24]}] [get_ports                  \
{IRAM_ADDRESS[23]}] [get_ports {IRAM_ADDRESS[22]}] [get_ports                  \
{IRAM_ADDRESS[21]}] [get_ports {IRAM_ADDRESS[20]}] [get_ports                  \
{IRAM_ADDRESS[19]}] [get_ports {IRAM_ADDRESS[18]}] [get_ports                  \
{IRAM_ADDRESS[17]}] [get_ports {IRAM_ADDRESS[16]}] [get_ports                  \
{IRAM_ADDRESS[15]}] [get_ports {IRAM_ADDRESS[14]}] [get_ports                  \
{IRAM_ADDRESS[13]}] [get_ports {IRAM_ADDRESS[12]}] [get_ports                  \
{IRAM_ADDRESS[11]}] [get_ports {IRAM_ADDRESS[10]}] [get_ports                  \
{IRAM_ADDRESS[9]}] [get_ports {IRAM_ADDRESS[8]}] [get_ports {IRAM_ADDRESS[7]}] \
[get_ports {IRAM_ADDRESS[6]}] [get_ports {IRAM_ADDRESS[5]}] [get_ports         \
{IRAM_ADDRESS[4]}] [get_ports {IRAM_ADDRESS[3]}] [get_ports {IRAM_ADDRESS[2]}] \
[get_ports {IRAM_ADDRESS[1]}] [get_ports {IRAM_ADDRESS[0]}] [get_ports         \
IRAM_ENABLE] [get_ports {DRAM_ADDRESS[31]}] [get_ports {DRAM_ADDRESS[30]}]     \
[get_ports {DRAM_ADDRESS[29]}] [get_ports {DRAM_ADDRESS[28]}] [get_ports       \
{DRAM_ADDRESS[27]}] [get_ports {DRAM_ADDRESS[26]}] [get_ports                  \
{DRAM_ADDRESS[25]}] [get_ports {DRAM_ADDRESS[24]}] [get_ports                  \
{DRAM_ADDRESS[23]}] [get_ports {DRAM_ADDRESS[22]}] [get_ports                  \
{DRAM_ADDRESS[21]}] [get_ports {DRAM_ADDRESS[20]}] [get_ports                  \
{DRAM_ADDRESS[19]}] [get_ports {DRAM_ADDRESS[18]}] [get_ports                  \
{DRAM_ADDRESS[17]}] [get_ports {DRAM_ADDRESS[16]}] [get_ports                  \
{DRAM_ADDRESS[15]}] [get_ports {DRAM_ADDRESS[14]}] [get_ports                  \
{DRAM_ADDRESS[13]}] [get_ports {DRAM_ADDRESS[12]}] [get_ports                  \
{DRAM_ADDRESS[11]}] [get_ports {DRAM_ADDRESS[10]}] [get_ports                  \
{DRAM_ADDRESS[9]}] [get_ports {DRAM_ADDRESS[8]}] [get_ports {DRAM_ADDRESS[7]}] \
[get_ports {DRAM_ADDRESS[6]}] [get_ports {DRAM_ADDRESS[5]}] [get_ports         \
{DRAM_ADDRESS[4]}] [get_ports {DRAM_ADDRESS[3]}] [get_ports {DRAM_ADDRESS[2]}] \
[get_ports {DRAM_ADDRESS[1]}] [get_ports {DRAM_ADDRESS[0]}] [get_ports         \
DRAM_ENABLE] [get_ports DRAM_READNOTWRITE] [get_ports {DRAM_DATA[31]}]         \
[get_ports {DRAM_DATA[30]}] [get_ports {DRAM_DATA[29]}] [get_ports             \
{DRAM_DATA[28]}] [get_ports {DRAM_DATA[27]}] [get_ports {DRAM_DATA[26]}]       \
[get_ports {DRAM_DATA[25]}] [get_ports {DRAM_DATA[24]}] [get_ports             \
{DRAM_DATA[23]}] [get_ports {DRAM_DATA[22]}] [get_ports {DRAM_DATA[21]}]       \
[get_ports {DRAM_DATA[20]}] [get_ports {DRAM_DATA[19]}] [get_ports             \
{DRAM_DATA[18]}] [get_ports {DRAM_DATA[17]}] [get_ports {DRAM_DATA[16]}]       \
[get_ports {DRAM_DATA[15]}] [get_ports {DRAM_DATA[14]}] [get_ports             \
{DRAM_DATA[13]}] [get_ports {DRAM_DATA[12]}] [get_ports {DRAM_DATA[11]}]       \
[get_ports {DRAM_DATA[10]}] [get_ports {DRAM_DATA[9]}] [get_ports              \
{DRAM_DATA[8]}] [get_ports {DRAM_DATA[7]}] [get_ports {DRAM_DATA[6]}]          \
[get_ports {DRAM_DATA[5]}] [get_ports {DRAM_DATA[4]}] [get_ports               \
{DRAM_DATA[3]}] [get_ports {DRAM_DATA[2]}] [get_ports {DRAM_DATA[1]}]          \
[get_ports {DRAM_DATA[0]}]]
set_input_delay -clock clk  0.07  [get_ports CLK]
set_input_delay -clock clk  0.07  [get_ports RST]
set_input_delay -clock clk  0.07  [get_ports IRAM_READY]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[31]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[30]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[29]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[28]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[27]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[26]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[25]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[24]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[23]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[22]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[21]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[20]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[19]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[18]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[17]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[16]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[15]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[14]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[13]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[12]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[11]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[10]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[9]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[8]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[7]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[6]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[5]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[4]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[3]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[2]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[1]}]
set_input_delay -clock clk  0.07  [get_ports {IRAM_DATA[0]}]
set_input_delay -clock clk  0.07  [get_ports DRAM_READY]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[31]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[30]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[29]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[28]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[27]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[26]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[25]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[24]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[23]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[22]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[21]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[20]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[19]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[18]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[17]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[16]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[15]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[14]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[13]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[12]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[11]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[10]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[9]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[8]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[7]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[6]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[5]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[4]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[3]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[2]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[1]}]
set_input_delay -clock clk  0.07  [get_ports {DRAM_DATA[0]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[31]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[30]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[29]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[28]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[27]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[26]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[25]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[24]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[23]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[22]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[21]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[20]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[19]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[18]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[17]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[16]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[15]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[14]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[13]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[12]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[11]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[10]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[9]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[8]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[7]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[6]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[5]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[4]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[3]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[2]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[1]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_DATA[0]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[31]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[30]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[29]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[28]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[27]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[26]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[25]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[24]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[23]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[22]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[21]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[20]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[19]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[18]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[17]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[16]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[15]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[14]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[13]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[12]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[11]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[10]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[9]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[8]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[7]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[6]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[5]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[4]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[3]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[2]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[1]}]
set_output_delay -clock clk  0.07  [get_ports {IRAM_ADDRESS[0]}]
set_output_delay -clock clk  0.07  [get_ports IRAM_ENABLE]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[31]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[30]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[29]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[28]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[27]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[26]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[25]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[24]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[23]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[22]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[21]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[20]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[19]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[18]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[17]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[16]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[15]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[14]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[13]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[12]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[11]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[10]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[9]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[8]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[7]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[6]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[5]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[4]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[3]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[2]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[1]}]
set_output_delay -clock clk  0.07  [get_ports {DRAM_ADDRESS[0]}]
set_output_delay -clock clk  0.07  [get_ports DRAM_ENABLE]
set_output_delay -clock clk  0.07  [get_ports DRAM_READNOTWRITE]
