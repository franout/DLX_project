###################################################################

# Created by write_sdc on Sun Sep 13 01:44:14 2020

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
create_clock [get_ports CLK]  -name clk
