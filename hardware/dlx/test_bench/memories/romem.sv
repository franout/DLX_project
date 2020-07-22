//
//					\\\ Sapere Aude ///
//
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2020 All rights reserved
// -----------------------------------------------------------------------------
// Author : Angione Francesco s262620@studenti.polito.it franout@Github.com
// File   : romem.sv
// Create : 2020-07-21 19:00:01
// Revise : 2020-07-22 20:17:52
// Editor : sublime text3, tab size (4)
// Description: 
// -----------------------------------------------------------------------------
`timescale 1ps/1ns

interface romem_interface (
	input logic  [WORD_SIZE-1:0] ADDRESS,
	input logic  ENABLE,
	output logic  DATA_READY,
	output logic  [2*WORD_SIZE-1:0]DATA
	);
endinterface

module romem
#(parameter FILE_PATH="",	// ROM data file
ENTRIES		= 128,		 	// Number of lines in the ROM
WORD_SIZE	= 32,		 	// Number of bits per word
DATA_DELAY	= 2			 	// Delay ( in # of clock cycles )
)
 (
	input clk,    // Clock
	input rst,  // reset active low
	romem_interface
);


logic ram [0:ENTRIES-1];

 
// This process is in charge of filling the Instruction RAM with the firmware
 initial begin
 	if (FILE_PATH=="") begin 
 		$display("ERROR! PATH for read only memory is not defined!",);
 		exit(-1);
 	end else begin  // path are defined 
 		// 1. Declare an integer variable to hold the file descriptor
  	int fd;

  	// 2. Open a file called "note.txt" in the current folder with a "read" permission
  	// If the file does not exist, then fd will be zero
    fd = $fopen ("./note.txt", "r");
    if (fd)  $display("File was opened successfully : %0d", fd);
    else     $display("File was NOT opened successfully : %0d", fd);

    // 2. Open a file called "note.txt" in the current folder with a "write" permission
    //    "fd" now points to the same file, but in write mode
    fd = $fopen ("./note.txt", "w");
    if (fd)  $display("File was opened successfully : %0d", fd);
    else     $display("File was NOT opened successfully : %0d", fd);

    // 3. Close the file descriptor
    $fclose(fd);

 	end
 end 



endmodule
rary ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.ROCACHE_PKG.all;

-- Instruction memory for DLX
-- Memory filled by a process which reads from a file
-- file name is "test.asm.mem"
entity ROMEM is
	generic (
		file_path	: -- string(1 to 37) := "C://DLX//dlx-master//rocache//hex.txt";
					string;
		ENTRIES		: integer := 128;
		WORD_SIZE	: integer := 32;
		data_delay	: natural := 2
	);
	port (
		CLK					: in std_logic;
		RST					: in std_logic;
		ADDRESS				: in std_logic_vector(WORD_SIZE - 1 downto 0);
		ENABLE				: in std_logic;
		DATA_READY			: out std_logic;
		DATA				: out std_logic_vector(2*WORD_SIZE - 1 downto 0)
	);
end ROMEM;

architecture Behavioral of ROMEM is
	type RAM is array (0 to ENTRIES-1) of integer;
	signal Memory : RAM;
	signal valid : std_logic;
	signal idout : std_logic_vector(2*WORD_SIZE-1 downto 0);
	signal count: integer range 0 to (data_delay + 1);

begin

	-- purpose: This process is in charge of filling the Instruction RAM with the firmware
	FILL_MEM_P: process (RST,CLK,ENABLE,ADDRESS)
		file mem_fp: text;
		variable file_line : line;
		variable index : integer := 0;
		variable tmp_data_u : std_logic_vector(WORD_SIZE-1 downto 0);
	begin  -- process FILL_MEM_P
		if (Rst = '1') then
			file_open(
				mem_fp,
				file_path,
				READ_MODE
			);

			while (not endfile(mem_fp)) loop
				readline(mem_fp,file_line);
				hread(file_line,tmp_data_u);
				Memory(index) <= conv_integer(unsigned(tmp_data_u));
				index := index + 1;
			end loop;

			file_close(mem_fp);

			count <= 0;
		elsif CLK'event and clk= '1' then
			if (ENABLE = '1' ) then
				count <= count + 1;
				if (count = data_delay) then
					count <= 0;
					valid <= '1';
					idout <=
					conv_std_logic_vector(Memory(conv_integer(unsigned(ADDRESS))+1),WORD_SIZE) &
					conv_std_logic_vector(Memory(conv_integer(unsigned(ADDRESS))),WORD_SIZE
					);
				end if;
			else
				count <= 0;
				valid <= '0';
			end if;
		end if;
end process FILL_MEM_P;

	DATA_READY <= valid;
	DATA <= idout when valid = '1' else (others => 'Z');

end Behavioral;
