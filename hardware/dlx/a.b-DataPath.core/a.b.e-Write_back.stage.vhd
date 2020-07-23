--------------------------------------------------------------------------------
-- Title       : write back stage of datapath 
-- Project     : DLX for Microelectronic Systems
--------------------------------------------------------------------------------
-- File        : a.b.e-Write_back.stage.vhd
-- Author      : Francesco Angione <s262620@studenti.polito.it> franout@github.com
-- Company     : Politecnico di Torino, Italy
-- Created     : Wed Jul 22 23:00:39 2020
-- Last update : Thu Jul 23 21:31:12 2020
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
	use work.global_components.MUX_zbit_nbit;

entity write_back_stage is
generic (
	N: integer:=32
);
  port (
  	-- datapath
	data_from_memory: in std_logic_vector(N-1 downto 0);
	data_from_alu: in std_logic_vector(N-1 downto 0);
	data_to_rf: out std_logic_vector(N-1 downto 0);
	-- control signals from cu
	select_wb: in std_logic_vector(1 downto 0)
  ) ;
end entity ; -- write_back_stage

architecture structural of write_back_stage is

begin

-- instatiate write back multiplexer
-- definition of component is in the global_components package
wb_mux: MUX_zbit_nbit generic map (
	N=>N,
	Z=>1 -- log2 of number of input signals
)
port map (
	inputs=> data_from_memory & data_from_alu, --- sel =0 , sel =1 
	sel=>select_wb,
	y=>data_to_rf
);

end architecture ; -- structural