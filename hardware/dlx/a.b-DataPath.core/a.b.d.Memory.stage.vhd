--------------------------------------------------------------------------------
-- Title       : memory stage of datapath
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.d.Memory.stage.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 23:00:17 2020
-- Last update : Thu Jul 23 21:30:51 2020
-- Platform    : Default Part Number
-- Standard    : VHDL-2008 
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Politecnico di Torino, Italy
-------------------------------------------------------------------------------
-- Description: 
--------------------------------------------------------------------------------


library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;
	use work.global_components.reg_nbit;
	use work.global_components.MUX_zbit_nbit;
entity memory_stage is
  generic (
  	N: integer:=32
  );
  port (
	clk: in std_logic_vector
  ) ;
end entity ; -- memory_stage

architecture structural of memory_stage is

begin


-- mux for update the PC	
branch_mux: MUX_zbit_nbit generic map (
	N=>N,
	Z=>1 -- log2 of number of input signals
)
port map (
	inputs=>, --- sel =0 , sel =1 
	sel=>,
	y=>
);



lmd: regN generic map (
	N=> N
) 
port map (
	clk=>,
	reset=>,
	d=> ,
	Q=>
);

end architecture ; -- structural