--------------------------------------------------------------------------------
-- Title       : sign extention
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.b.a-sign_extension.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Sat Aug  1 22:29:22 2020
-- Last update : Sat Aug  1 22:33:00 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: logic for sign extention of dlx
--------------------------------------------------------------------------------
library ieee ;
use ieee.std_logic_1164.all ;
entity sign_extension is
	generic (
		N: integer :=32
	);
	port  (
		val_to_exetend: in std_logic_vector(N/2-1 downto 0);
		enable: in std_logic;
		extended_val: out std_logic_vector(N-1 downto 0)
	);
end entity sign_extension;

architecture behavioural of sign_extension is

begin


	sign_extension_logic : process( enable,val_to_exetend )
	begin
		if(enable = '1') then
			if(val_to_exetend(N/2-1)='1') then
				extended_val <= (N-1 downto N/2 => '0') & val_to_exetend(N/2-1 downto 0) ;
			else -- == zero
				extended_val <= (N-1 downto N/2 => '1') & val_to_exetend(N/2-1 downto 0) ;
			end if;
		end if;
	end process sign_extension_logic;

	
end architecture behavioural;