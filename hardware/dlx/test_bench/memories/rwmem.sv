//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : rwmem.sv
// Create : 2020-07-21 19:00:09
// Revise : 2020-07-22 20:18:09
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ns/1ps
interface rwmem_interface (
input logic  [WORD_SIZE - 1:0]ADDRESS,
input logic  ENABLE,
input logic  READNOTWRITE,
output logic  DATA_READY,
			INOUT_DATA			: inout std_logic_vector(2*WORD_SIZE-1 downto 0)
	);
endinterface


module rwmem
#(parameter FILE_PATH="",		// RAM output data file
			FILE_PATH_INIT="",	// RAM initialization data file
			WORD_SIZE= 32,		// Number of bits per word
			ENTRIES= 128,		// Number of lines in the ROM
			DATA_DELAY= 2		// Delay ( in # of clock cycles )
			)
			 (
	input clk,    // Clock
	input rst,  //  reset active low
	
);

endmodule



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity RWMEM is
	generic(
			file_path: string;
			file_path_init: string;
			Data_size : natural := 64;
			Instr_size: natural := 32;
			RAM_DEPTH: 	natural := 128;
			data_delay: natural := 2
		);
	port (
			CLK   				: in std_logic;
			RST					: in std_logic;
			ADDR				: in std_logic_vector(Instr_size - 1 downto 0);
			ENABLE				: in std_logic;
			READNOTWRITE		: in std_logic;
			DATA_READY			: out std_logic;
			INOUT_DATA			: inout std_logic_vector(Data_size-1 downto 0)
		);
end RWMEM;

architecture beh of RWMEM is
	type DRAMtype is array (0 to RAM_DEPTH - 1) of std_logic_vector(instr_size - 1 downto 0);
	signal DRAM_mem : DRAMtype;
	signal tmp_data: std_logic_vector(Data_size - 1 downto 0);
	signal int_data_ready,mem_ready: std_logic;
	signal counter: natural:=0;

	procedure rewrite_contenent(data: in DRAMtype; path_file: string) is
		variable index: natural range 0 to RAM_DEPTH;
		file wr_file: text;
		variable line_in: line;
	begin
		index:=0;
		file_open(wr_file,path_file,WRITE_MODE);
		while index < RAM_DEPTH loop
			hwrite(line_in,data(index));
			writeline(wr_file,line_in);
			index := index + 1;
		end loop;
	end rewrite_contenent;



begin  -- beh
	--write_process
	WR_PROCESS:
	process (CLK, RST,READNOTWRITE)
		file mem_fp: text;
		variable index: integer range 0 to RAM_DEPTH;
		variable file_line : line;
		variable tmp_data_u : std_logic_vector(INSTR_SIZE-1 downto 0);
	begin  -- process
		if RST = '1' then  	 -- asynchronous reset (active low)
--			while index < RAM_DEPTH loop
--				DRAM_mem(index) <= std_logic_vector(to_unsigned(index,instr_size));
--				index := index + 1;
--			end loop;

			file_open(
				mem_fp,
				file_path_init,
				READ_MODE
			);

			while (not endfile(mem_fp)) loop
				readline(mem_fp,file_line);
				hread(file_line,tmp_data_u);
				DRAM_mem(index) <= tmp_data_u;
				index := index + 1;
			end loop;

			file_close(mem_fp);

			int_data_ready <= '0';
			mem_ready <= '0';
		elsif CLK'event and CLK = '1' then  -- rising clock edge
			if(ENABLE = '1') then
				counter <= counter + 1;
				if (counter = data_delay) then
					counter <= 0;
					if (READNOTWRITE = '0') then
						DRAM_Mem(to_integer(unsigned(ADDR))+1) <= INOUT_DATA(Instr_size - 1 downto 0);
						DRAM_Mem(to_integer(unsigned(ADDR))) <= INOUT_DATA(Data_size - 1 downto Instr_size); 
						mem_ready <= '1';
					else
						tmp_data <=DRAM_mem(to_integer(unsigned(ADDR))+1) & DRAM_mem(to_integer(unsigned(ADDR)));
						int_data_ready <= '1';
					end if;
				else
					mem_ready <= '0';
					int_data_ready <= '0';
				end if;
			else
				counter <= 0;
			end if;
		end if;
	end process;

	rewrite_contenent(DRAM_mem,file_path); -- refresh the file
	INOUT_DATA <= tmp_data when int_data_ready='1' else (others=>'Z'); -- to cache
	data_ready <= int_data_ready or mem_ready;--delay add

end beh;
