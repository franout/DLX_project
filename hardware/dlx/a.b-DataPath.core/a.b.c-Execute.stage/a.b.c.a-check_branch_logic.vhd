--------------------------------------------------------------------------------
-- Title       : check branch logic
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.c.a-check_branch_logic.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Sat Aug  1 22:21:49 2020
-- Last update : Sat Aug  8 15:01:35 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: check branch logic for branches in dlx
--------------------------------------------------------------------------------
library ieee ;
use ieee.std_logic_1164.all ;
entity check_branch_logic is
	generic (
		N : integer := 32
	);
	port(
		input_val : in  std_logic_vector(N-1 downto 0);
		enable    : in  std_logic;
		decision  : out std_logic
	);
end entity check_branch_logic;

architecture behavioural of check_branch_logic is

begin


	logic        : process( input_val,enable )
		variable tmp : std_logic := '1';
	begin
		if(enable='1') then
			check_logic : for i in 0 to N-1 loop
				tmp := tmp and not(input_val(i));
			end loop ; -- check_logic
			decision <= tmp;
		end if;
	end process ; -- logic

end architecture behavioural;
	