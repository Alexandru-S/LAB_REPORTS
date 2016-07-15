--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: register_file_synthesis.vhd
-- /___/   /\     Timestamp: Sun Feb 14 18:51:32 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm register_file -w -dir netgen/synthesis -ofmt vhdl -sim register_file.ngc register_file_synthesis.vhd 
-- Device	: xc3s700a-4-fg484
-- Input file	: register_file.ngc
-- Output file	: C:\Users\owner\Desktop\VHDL\LAB1\netgen\synthesis\register_file_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: register_file
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity register_file is
  port (
    Clk : in STD_LOGIC := 'X'; 
    des_A0 : in STD_LOGIC := 'X'; 
    des_A1 : in STD_LOGIC := 'X'; 
    des_A2 : in STD_LOGIC := 'X'; 
    src_S0 : in STD_LOGIC := 'X'; 
    src_S1 : in STD_LOGIC := 'X'; 
    data_src : in STD_LOGIC := 'X'; 
    src_S2 : in STD_LOGIC := 'X'; 
    reg0 : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    reg1 : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    reg2 : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    reg3 : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    reg4 : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    reg5 : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    reg6 : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    reg7 : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    data : in STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end register_file;

architecture Structure of register_file is
  signal Clk_BUFGP_1 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N17 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N19 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal N23 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal N25 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal N27 : STD_LOGIC; 
  signal N28 : STD_LOGIC; 
  signal N29 : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal N31 : STD_LOGIC; 
  signal N32 : STD_LOGIC; 
  signal N33 : STD_LOGIC; 
  signal N34 : STD_LOGIC; 
  signal N35 : STD_LOGIC; 
  signal N36 : STD_LOGIC; 
  signal N37 : STD_LOGIC; 
  signal N38 : STD_LOGIC; 
  signal N39 : STD_LOGIC; 
  signal N40 : STD_LOGIC; 
  signal N41 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N43 : STD_LOGIC; 
  signal N44 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N47 : STD_LOGIC; 
  signal N48 : STD_LOGIC; 
  signal N49 : STD_LOGIC; 
  signal N50 : STD_LOGIC; 
  signal N51 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal N53 : STD_LOGIC; 
  signal N54 : STD_LOGIC; 
  signal N55 : STD_LOGIC; 
  signal N56 : STD_LOGIC; 
  signal N57 : STD_LOGIC; 
  signal N58 : STD_LOGIC; 
  signal N59 : STD_LOGIC; 
  signal N60 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal N62 : STD_LOGIC; 
  signal N63 : STD_LOGIC; 
  signal N64 : STD_LOGIC; 
  signal N65 : STD_LOGIC; 
  signal N66 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal N68 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal N71 : STD_LOGIC; 
  signal N72 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N74 : STD_LOGIC; 
  signal N75 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal N77 : STD_LOGIC; 
  signal N78 : STD_LOGIC; 
  signal N79 : STD_LOGIC; 
  signal data_0_IBUF_98 : STD_LOGIC; 
  signal data_10_IBUF_99 : STD_LOGIC; 
  signal data_11_IBUF_100 : STD_LOGIC; 
  signal data_12_IBUF_101 : STD_LOGIC; 
  signal data_13_IBUF_102 : STD_LOGIC; 
  signal data_14_IBUF_103 : STD_LOGIC; 
  signal data_15_IBUF_104 : STD_LOGIC; 
  signal data_1_IBUF_105 : STD_LOGIC; 
  signal data_2_IBUF_106 : STD_LOGIC; 
  signal data_3_IBUF_107 : STD_LOGIC; 
  signal data_4_IBUF_108 : STD_LOGIC; 
  signal data_5_IBUF_109 : STD_LOGIC; 
  signal data_6_IBUF_110 : STD_LOGIC; 
  signal data_7_IBUF_111 : STD_LOGIC; 
  signal data_8_IBUF_112 : STD_LOGIC; 
  signal data_9_IBUF_113 : STD_LOGIC; 
  signal data_src_IBUF_115 : STD_LOGIC; 
  signal des_A0_IBUF_117 : STD_LOGIC; 
  signal des_A1_IBUF_119 : STD_LOGIC; 
  signal des_A2_IBUF_121 : STD_LOGIC; 
  signal load_reg0 : STD_LOGIC; 
  signal load_reg1 : STD_LOGIC; 
  signal load_reg2 : STD_LOGIC; 
  signal load_reg3 : STD_LOGIC; 
  signal load_reg4 : STD_LOGIC; 
  signal load_reg5 : STD_LOGIC; 
  signal load_reg6 : STD_LOGIC; 
  signal load_reg7 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_0_44_386 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_0_99_387 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_10_44_388 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_10_99_389 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_11_44_390 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_11_99_391 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_12_44_392 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_12_99_393 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_13_44_394 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_13_99_395 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_14_44_396 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_14_99_397 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_15_44_398 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_15_99_399 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_1_44_400 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_1_99_401 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_2_44_402 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_2_99_403 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_3_44_404 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_3_99_405 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_4_44_406 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_4_99_407 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_5_44_408 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_5_99_409 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_6_44_410 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_6_99_411 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_7_44_412 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_7_99_413 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_8_44_414 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_8_99_415 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_9_44_416 : STD_LOGIC; 
  signal reg_mux3_16bit_Z_9_99_417 : STD_LOGIC; 
  signal src_S0_IBUF_419 : STD_LOGIC; 
  signal src_S1_IBUF_421 : STD_LOGIC; 
  signal src_S2_IBUF_423 : STD_LOGIC; 
  signal d_mux : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal reg00_Q : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal reg01_Q : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal reg02_Q : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal reg03_Q : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal reg04_Q : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal reg05_Q : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal reg06_Q : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal reg07_Q : STD_LOGIC_VECTOR ( 15 downto 0 ); 
begin
  reg07_Q_15 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(15),
      Q => reg07_Q(15)
    );
  reg07_Q_14 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(14),
      Q => reg07_Q(14)
    );
  reg07_Q_13 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(13),
      Q => reg07_Q(13)
    );
  reg07_Q_12 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(12),
      Q => reg07_Q(12)
    );
  reg07_Q_11 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(11),
      Q => reg07_Q(11)
    );
  reg07_Q_10 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(10),
      Q => reg07_Q(10)
    );
  reg07_Q_9 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(9),
      Q => reg07_Q(9)
    );
  reg07_Q_8 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(8),
      Q => reg07_Q(8)
    );
  reg07_Q_7 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(7),
      Q => reg07_Q(7)
    );
  reg07_Q_6 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(6),
      Q => reg07_Q(6)
    );
  reg07_Q_5 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(5),
      Q => reg07_Q(5)
    );
  reg07_Q_4 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(4),
      Q => reg07_Q(4)
    );
  reg07_Q_3 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(3),
      Q => reg07_Q(3)
    );
  reg07_Q_2 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(2),
      Q => reg07_Q(2)
    );
  reg07_Q_1 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(1),
      Q => reg07_Q(1)
    );
  reg07_Q_0 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg7,
      D => d_mux(0),
      Q => reg07_Q(0)
    );
  reg06_Q_15 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(15),
      Q => reg06_Q(15)
    );
  reg06_Q_14 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(14),
      Q => reg06_Q(14)
    );
  reg06_Q_13 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(13),
      Q => reg06_Q(13)
    );
  reg06_Q_12 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(12),
      Q => reg06_Q(12)
    );
  reg06_Q_11 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(11),
      Q => reg06_Q(11)
    );
  reg06_Q_10 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(10),
      Q => reg06_Q(10)
    );
  reg06_Q_9 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(9),
      Q => reg06_Q(9)
    );
  reg06_Q_8 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(8),
      Q => reg06_Q(8)
    );
  reg06_Q_7 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(7),
      Q => reg06_Q(7)
    );
  reg06_Q_6 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(6),
      Q => reg06_Q(6)
    );
  reg06_Q_5 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(5),
      Q => reg06_Q(5)
    );
  reg06_Q_4 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(4),
      Q => reg06_Q(4)
    );
  reg06_Q_3 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(3),
      Q => reg06_Q(3)
    );
  reg06_Q_2 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(2),
      Q => reg06_Q(2)
    );
  reg06_Q_1 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(1),
      Q => reg06_Q(1)
    );
  reg06_Q_0 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg6,
      D => d_mux(0),
      Q => reg06_Q(0)
    );
  reg05_Q_15 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(15),
      Q => reg05_Q(15)
    );
  reg05_Q_14 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(14),
      Q => reg05_Q(14)
    );
  reg05_Q_13 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(13),
      Q => reg05_Q(13)
    );
  reg05_Q_12 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(12),
      Q => reg05_Q(12)
    );
  reg05_Q_11 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(11),
      Q => reg05_Q(11)
    );
  reg05_Q_10 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(10),
      Q => reg05_Q(10)
    );
  reg05_Q_9 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(9),
      Q => reg05_Q(9)
    );
  reg05_Q_8 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(8),
      Q => reg05_Q(8)
    );
  reg05_Q_7 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(7),
      Q => reg05_Q(7)
    );
  reg05_Q_6 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(6),
      Q => reg05_Q(6)
    );
  reg05_Q_5 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(5),
      Q => reg05_Q(5)
    );
  reg05_Q_4 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(4),
      Q => reg05_Q(4)
    );
  reg05_Q_3 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(3),
      Q => reg05_Q(3)
    );
  reg05_Q_2 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(2),
      Q => reg05_Q(2)
    );
  reg05_Q_1 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(1),
      Q => reg05_Q(1)
    );
  reg05_Q_0 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg5,
      D => d_mux(0),
      Q => reg05_Q(0)
    );
  reg04_Q_15 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(15),
      Q => reg04_Q(15)
    );
  reg04_Q_14 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(14),
      Q => reg04_Q(14)
    );
  reg04_Q_13 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(13),
      Q => reg04_Q(13)
    );
  reg04_Q_12 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(12),
      Q => reg04_Q(12)
    );
  reg04_Q_11 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(11),
      Q => reg04_Q(11)
    );
  reg04_Q_10 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(10),
      Q => reg04_Q(10)
    );
  reg04_Q_9 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(9),
      Q => reg04_Q(9)
    );
  reg04_Q_8 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(8),
      Q => reg04_Q(8)
    );
  reg04_Q_7 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(7),
      Q => reg04_Q(7)
    );
  reg04_Q_6 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(6),
      Q => reg04_Q(6)
    );
  reg04_Q_5 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(5),
      Q => reg04_Q(5)
    );
  reg04_Q_4 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(4),
      Q => reg04_Q(4)
    );
  reg04_Q_3 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(3),
      Q => reg04_Q(3)
    );
  reg04_Q_2 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(2),
      Q => reg04_Q(2)
    );
  reg04_Q_1 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(1),
      Q => reg04_Q(1)
    );
  reg04_Q_0 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg4,
      D => d_mux(0),
      Q => reg04_Q(0)
    );
  reg03_Q_15 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(15),
      Q => reg03_Q(15)
    );
  reg03_Q_14 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(14),
      Q => reg03_Q(14)
    );
  reg03_Q_13 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(13),
      Q => reg03_Q(13)
    );
  reg03_Q_12 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(12),
      Q => reg03_Q(12)
    );
  reg03_Q_11 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(11),
      Q => reg03_Q(11)
    );
  reg03_Q_10 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(10),
      Q => reg03_Q(10)
    );
  reg03_Q_9 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(9),
      Q => reg03_Q(9)
    );
  reg03_Q_8 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(8),
      Q => reg03_Q(8)
    );
  reg03_Q_7 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(7),
      Q => reg03_Q(7)
    );
  reg03_Q_6 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(6),
      Q => reg03_Q(6)
    );
  reg03_Q_5 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(5),
      Q => reg03_Q(5)
    );
  reg03_Q_4 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(4),
      Q => reg03_Q(4)
    );
  reg03_Q_3 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(3),
      Q => reg03_Q(3)
    );
  reg03_Q_2 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(2),
      Q => reg03_Q(2)
    );
  reg03_Q_1 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(1),
      Q => reg03_Q(1)
    );
  reg03_Q_0 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg3,
      D => d_mux(0),
      Q => reg03_Q(0)
    );
  reg02_Q_15 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(15),
      Q => reg02_Q(15)
    );
  reg02_Q_14 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(14),
      Q => reg02_Q(14)
    );
  reg02_Q_13 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(13),
      Q => reg02_Q(13)
    );
  reg02_Q_12 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(12),
      Q => reg02_Q(12)
    );
  reg02_Q_11 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(11),
      Q => reg02_Q(11)
    );
  reg02_Q_10 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(10),
      Q => reg02_Q(10)
    );
  reg02_Q_9 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(9),
      Q => reg02_Q(9)
    );
  reg02_Q_8 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(8),
      Q => reg02_Q(8)
    );
  reg02_Q_7 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(7),
      Q => reg02_Q(7)
    );
  reg02_Q_6 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(6),
      Q => reg02_Q(6)
    );
  reg02_Q_5 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(5),
      Q => reg02_Q(5)
    );
  reg02_Q_4 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(4),
      Q => reg02_Q(4)
    );
  reg02_Q_3 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(3),
      Q => reg02_Q(3)
    );
  reg02_Q_2 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(2),
      Q => reg02_Q(2)
    );
  reg02_Q_1 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(1),
      Q => reg02_Q(1)
    );
  reg02_Q_0 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg2,
      D => d_mux(0),
      Q => reg02_Q(0)
    );
  reg01_Q_15 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(15),
      Q => reg01_Q(15)
    );
  reg01_Q_14 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(14),
      Q => reg01_Q(14)
    );
  reg01_Q_13 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(13),
      Q => reg01_Q(13)
    );
  reg01_Q_12 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(12),
      Q => reg01_Q(12)
    );
  reg01_Q_11 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(11),
      Q => reg01_Q(11)
    );
  reg01_Q_10 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(10),
      Q => reg01_Q(10)
    );
  reg01_Q_9 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(9),
      Q => reg01_Q(9)
    );
  reg01_Q_8 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(8),
      Q => reg01_Q(8)
    );
  reg01_Q_7 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(7),
      Q => reg01_Q(7)
    );
  reg01_Q_6 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(6),
      Q => reg01_Q(6)
    );
  reg01_Q_5 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(5),
      Q => reg01_Q(5)
    );
  reg01_Q_4 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(4),
      Q => reg01_Q(4)
    );
  reg01_Q_3 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(3),
      Q => reg01_Q(3)
    );
  reg01_Q_2 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(2),
      Q => reg01_Q(2)
    );
  reg01_Q_1 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(1),
      Q => reg01_Q(1)
    );
  reg01_Q_0 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg1,
      D => d_mux(0),
      Q => reg01_Q(0)
    );
  reg00_Q_15 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(15),
      Q => reg00_Q(15)
    );
  reg00_Q_14 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(14),
      Q => reg00_Q(14)
    );
  reg00_Q_13 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(13),
      Q => reg00_Q(13)
    );
  reg00_Q_12 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(12),
      Q => reg00_Q(12)
    );
  reg00_Q_11 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(11),
      Q => reg00_Q(11)
    );
  reg00_Q_10 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(10),
      Q => reg00_Q(10)
    );
  reg00_Q_9 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(9),
      Q => reg00_Q(9)
    );
  reg00_Q_8 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(8),
      Q => reg00_Q(8)
    );
  reg00_Q_7 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(7),
      Q => reg00_Q(7)
    );
  reg00_Q_6 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(6),
      Q => reg00_Q(6)
    );
  reg00_Q_5 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(5),
      Q => reg00_Q(5)
    );
  reg00_Q_4 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(4),
      Q => reg00_Q(4)
    );
  reg00_Q_3 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(3),
      Q => reg00_Q(3)
    );
  reg00_Q_2 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(2),
      Q => reg00_Q(2)
    );
  reg00_Q_1 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(1),
      Q => reg00_Q(1)
    );
  reg00_Q_0 : FDE
    port map (
      C => Clk_BUFGP_1,
      CE => load_reg0,
      D => d_mux(0),
      Q => reg00_Q(0)
    );
  reg_decoder_3to8_Q71 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => des_A2_IBUF_121,
      I1 => des_A1_IBUF_119,
      I2 => des_A0_IBUF_117,
      O => load_reg7
    );
  reg_decoder_3to8_Q61 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => des_A2_IBUF_121,
      I1 => des_A1_IBUF_119,
      I2 => des_A0_IBUF_117,
      O => load_reg6
    );
  reg_decoder_3to8_Q51 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => des_A1_IBUF_119,
      I1 => des_A2_IBUF_121,
      I2 => des_A0_IBUF_117,
      O => load_reg5
    );
  reg_decoder_3to8_Q41 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => des_A2_IBUF_121,
      I1 => des_A1_IBUF_119,
      I2 => des_A0_IBUF_117,
      O => load_reg4
    );
  reg_decoder_3to8_Q31 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => des_A0_IBUF_117,
      I1 => des_A1_IBUF_119,
      I2 => des_A2_IBUF_121,
      O => load_reg3
    );
  reg_decoder_3to8_Q21 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => des_A2_IBUF_121,
      I1 => des_A0_IBUF_117,
      I2 => des_A1_IBUF_119,
      O => load_reg2
    );
  reg_decoder_3to8_Q11 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => des_A1_IBUF_119,
      I1 => des_A0_IBUF_117,
      I2 => des_A2_IBUF_121,
      O => load_reg1
    );
  reg_decoder_3to8_Q01 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => des_A2_IBUF_121,
      I1 => des_A1_IBUF_119,
      I2 => des_A0_IBUF_117,
      O => load_reg0
    );
  des_A0_IBUF : IBUF
    port map (
      I => des_A0,
      O => des_A0_IBUF_117
    );
  des_A1_IBUF : IBUF
    port map (
      I => des_A1,
      O => des_A1_IBUF_119
    );
  des_A2_IBUF : IBUF
    port map (
      I => des_A2,
      O => des_A2_IBUF_121
    );
  src_S0_IBUF : IBUF
    port map (
      I => src_S0,
      O => src_S0_IBUF_419
    );
  src_S1_IBUF : IBUF
    port map (
      I => src_S1,
      O => src_S1_IBUF_421
    );
  data_src_IBUF : IBUF
    port map (
      I => data_src,
      O => data_src_IBUF_115
    );
  src_S2_IBUF : IBUF
    port map (
      I => src_S2,
      O => src_S2_IBUF_423
    );
  data_15_IBUF : IBUF
    port map (
      I => data(15),
      O => data_15_IBUF_104
    );
  data_14_IBUF : IBUF
    port map (
      I => data(14),
      O => data_14_IBUF_103
    );
  data_13_IBUF : IBUF
    port map (
      I => data(13),
      O => data_13_IBUF_102
    );
  data_12_IBUF : IBUF
    port map (
      I => data(12),
      O => data_12_IBUF_101
    );
  data_11_IBUF : IBUF
    port map (
      I => data(11),
      O => data_11_IBUF_100
    );
  data_10_IBUF : IBUF
    port map (
      I => data(10),
      O => data_10_IBUF_99
    );
  data_9_IBUF : IBUF
    port map (
      I => data(9),
      O => data_9_IBUF_113
    );
  data_8_IBUF : IBUF
    port map (
      I => data(8),
      O => data_8_IBUF_112
    );
  data_7_IBUF : IBUF
    port map (
      I => data(7),
      O => data_7_IBUF_111
    );
  data_6_IBUF : IBUF
    port map (
      I => data(6),
      O => data_6_IBUF_110
    );
  data_5_IBUF : IBUF
    port map (
      I => data(5),
      O => data_5_IBUF_109
    );
  data_4_IBUF : IBUF
    port map (
      I => data(4),
      O => data_4_IBUF_108
    );
  data_3_IBUF : IBUF
    port map (
      I => data(3),
      O => data_3_IBUF_107
    );
  data_2_IBUF : IBUF
    port map (
      I => data(2),
      O => data_2_IBUF_106
    );
  data_1_IBUF : IBUF
    port map (
      I => data(1),
      O => data_1_IBUF_105
    );
  data_0_IBUF : IBUF
    port map (
      I => data(0),
      O => data_0_IBUF_98
    );
  reg0_15_OBUF : OBUF
    port map (
      I => reg00_Q(15),
      O => reg0(15)
    );
  reg0_14_OBUF : OBUF
    port map (
      I => reg00_Q(14),
      O => reg0(14)
    );
  reg0_13_OBUF : OBUF
    port map (
      I => reg00_Q(13),
      O => reg0(13)
    );
  reg0_12_OBUF : OBUF
    port map (
      I => reg00_Q(12),
      O => reg0(12)
    );
  reg0_11_OBUF : OBUF
    port map (
      I => reg00_Q(11),
      O => reg0(11)
    );
  reg0_10_OBUF : OBUF
    port map (
      I => reg00_Q(10),
      O => reg0(10)
    );
  reg0_9_OBUF : OBUF
    port map (
      I => reg00_Q(9),
      O => reg0(9)
    );
  reg0_8_OBUF : OBUF
    port map (
      I => reg00_Q(8),
      O => reg0(8)
    );
  reg0_7_OBUF : OBUF
    port map (
      I => reg00_Q(7),
      O => reg0(7)
    );
  reg0_6_OBUF : OBUF
    port map (
      I => reg00_Q(6),
      O => reg0(6)
    );
  reg0_5_OBUF : OBUF
    port map (
      I => reg00_Q(5),
      O => reg0(5)
    );
  reg0_4_OBUF : OBUF
    port map (
      I => reg00_Q(4),
      O => reg0(4)
    );
  reg0_3_OBUF : OBUF
    port map (
      I => reg00_Q(3),
      O => reg0(3)
    );
  reg0_2_OBUF : OBUF
    port map (
      I => reg00_Q(2),
      O => reg0(2)
    );
  reg0_1_OBUF : OBUF
    port map (
      I => reg00_Q(1),
      O => reg0(1)
    );
  reg0_0_OBUF : OBUF
    port map (
      I => reg00_Q(0),
      O => reg0(0)
    );
  reg1_15_OBUF : OBUF
    port map (
      I => reg01_Q(15),
      O => reg1(15)
    );
  reg1_14_OBUF : OBUF
    port map (
      I => reg01_Q(14),
      O => reg1(14)
    );
  reg1_13_OBUF : OBUF
    port map (
      I => reg01_Q(13),
      O => reg1(13)
    );
  reg1_12_OBUF : OBUF
    port map (
      I => reg01_Q(12),
      O => reg1(12)
    );
  reg1_11_OBUF : OBUF
    port map (
      I => reg01_Q(11),
      O => reg1(11)
    );
  reg1_10_OBUF : OBUF
    port map (
      I => reg01_Q(10),
      O => reg1(10)
    );
  reg1_9_OBUF : OBUF
    port map (
      I => reg01_Q(9),
      O => reg1(9)
    );
  reg1_8_OBUF : OBUF
    port map (
      I => reg01_Q(8),
      O => reg1(8)
    );
  reg1_7_OBUF : OBUF
    port map (
      I => reg01_Q(7),
      O => reg1(7)
    );
  reg1_6_OBUF : OBUF
    port map (
      I => reg01_Q(6),
      O => reg1(6)
    );
  reg1_5_OBUF : OBUF
    port map (
      I => reg01_Q(5),
      O => reg1(5)
    );
  reg1_4_OBUF : OBUF
    port map (
      I => reg01_Q(4),
      O => reg1(4)
    );
  reg1_3_OBUF : OBUF
    port map (
      I => reg01_Q(3),
      O => reg1(3)
    );
  reg1_2_OBUF : OBUF
    port map (
      I => reg01_Q(2),
      O => reg1(2)
    );
  reg1_1_OBUF : OBUF
    port map (
      I => reg01_Q(1),
      O => reg1(1)
    );
  reg1_0_OBUF : OBUF
    port map (
      I => reg01_Q(0),
      O => reg1(0)
    );
  reg2_15_OBUF : OBUF
    port map (
      I => reg02_Q(15),
      O => reg2(15)
    );
  reg2_14_OBUF : OBUF
    port map (
      I => reg02_Q(14),
      O => reg2(14)
    );
  reg2_13_OBUF : OBUF
    port map (
      I => reg02_Q(13),
      O => reg2(13)
    );
  reg2_12_OBUF : OBUF
    port map (
      I => reg02_Q(12),
      O => reg2(12)
    );
  reg2_11_OBUF : OBUF
    port map (
      I => reg02_Q(11),
      O => reg2(11)
    );
  reg2_10_OBUF : OBUF
    port map (
      I => reg02_Q(10),
      O => reg2(10)
    );
  reg2_9_OBUF : OBUF
    port map (
      I => reg02_Q(9),
      O => reg2(9)
    );
  reg2_8_OBUF : OBUF
    port map (
      I => reg02_Q(8),
      O => reg2(8)
    );
  reg2_7_OBUF : OBUF
    port map (
      I => reg02_Q(7),
      O => reg2(7)
    );
  reg2_6_OBUF : OBUF
    port map (
      I => reg02_Q(6),
      O => reg2(6)
    );
  reg2_5_OBUF : OBUF
    port map (
      I => reg02_Q(5),
      O => reg2(5)
    );
  reg2_4_OBUF : OBUF
    port map (
      I => reg02_Q(4),
      O => reg2(4)
    );
  reg2_3_OBUF : OBUF
    port map (
      I => reg02_Q(3),
      O => reg2(3)
    );
  reg2_2_OBUF : OBUF
    port map (
      I => reg02_Q(2),
      O => reg2(2)
    );
  reg2_1_OBUF : OBUF
    port map (
      I => reg02_Q(1),
      O => reg2(1)
    );
  reg2_0_OBUF : OBUF
    port map (
      I => reg02_Q(0),
      O => reg2(0)
    );
  reg3_15_OBUF : OBUF
    port map (
      I => reg03_Q(15),
      O => reg3(15)
    );
  reg3_14_OBUF : OBUF
    port map (
      I => reg03_Q(14),
      O => reg3(14)
    );
  reg3_13_OBUF : OBUF
    port map (
      I => reg03_Q(13),
      O => reg3(13)
    );
  reg3_12_OBUF : OBUF
    port map (
      I => reg03_Q(12),
      O => reg3(12)
    );
  reg3_11_OBUF : OBUF
    port map (
      I => reg03_Q(11),
      O => reg3(11)
    );
  reg3_10_OBUF : OBUF
    port map (
      I => reg03_Q(10),
      O => reg3(10)
    );
  reg3_9_OBUF : OBUF
    port map (
      I => reg03_Q(9),
      O => reg3(9)
    );
  reg3_8_OBUF : OBUF
    port map (
      I => reg03_Q(8),
      O => reg3(8)
    );
  reg3_7_OBUF : OBUF
    port map (
      I => reg03_Q(7),
      O => reg3(7)
    );
  reg3_6_OBUF : OBUF
    port map (
      I => reg03_Q(6),
      O => reg3(6)
    );
  reg3_5_OBUF : OBUF
    port map (
      I => reg03_Q(5),
      O => reg3(5)
    );
  reg3_4_OBUF : OBUF
    port map (
      I => reg03_Q(4),
      O => reg3(4)
    );
  reg3_3_OBUF : OBUF
    port map (
      I => reg03_Q(3),
      O => reg3(3)
    );
  reg3_2_OBUF : OBUF
    port map (
      I => reg03_Q(2),
      O => reg3(2)
    );
  reg3_1_OBUF : OBUF
    port map (
      I => reg03_Q(1),
      O => reg3(1)
    );
  reg3_0_OBUF : OBUF
    port map (
      I => reg03_Q(0),
      O => reg3(0)
    );
  reg4_15_OBUF : OBUF
    port map (
      I => reg04_Q(15),
      O => reg4(15)
    );
  reg4_14_OBUF : OBUF
    port map (
      I => reg04_Q(14),
      O => reg4(14)
    );
  reg4_13_OBUF : OBUF
    port map (
      I => reg04_Q(13),
      O => reg4(13)
    );
  reg4_12_OBUF : OBUF
    port map (
      I => reg04_Q(12),
      O => reg4(12)
    );
  reg4_11_OBUF : OBUF
    port map (
      I => reg04_Q(11),
      O => reg4(11)
    );
  reg4_10_OBUF : OBUF
    port map (
      I => reg04_Q(10),
      O => reg4(10)
    );
  reg4_9_OBUF : OBUF
    port map (
      I => reg04_Q(9),
      O => reg4(9)
    );
  reg4_8_OBUF : OBUF
    port map (
      I => reg04_Q(8),
      O => reg4(8)
    );
  reg4_7_OBUF : OBUF
    port map (
      I => reg04_Q(7),
      O => reg4(7)
    );
  reg4_6_OBUF : OBUF
    port map (
      I => reg04_Q(6),
      O => reg4(6)
    );
  reg4_5_OBUF : OBUF
    port map (
      I => reg04_Q(5),
      O => reg4(5)
    );
  reg4_4_OBUF : OBUF
    port map (
      I => reg04_Q(4),
      O => reg4(4)
    );
  reg4_3_OBUF : OBUF
    port map (
      I => reg04_Q(3),
      O => reg4(3)
    );
  reg4_2_OBUF : OBUF
    port map (
      I => reg04_Q(2),
      O => reg4(2)
    );
  reg4_1_OBUF : OBUF
    port map (
      I => reg04_Q(1),
      O => reg4(1)
    );
  reg4_0_OBUF : OBUF
    port map (
      I => reg04_Q(0),
      O => reg4(0)
    );
  reg5_15_OBUF : OBUF
    port map (
      I => reg05_Q(15),
      O => reg5(15)
    );
  reg5_14_OBUF : OBUF
    port map (
      I => reg05_Q(14),
      O => reg5(14)
    );
  reg5_13_OBUF : OBUF
    port map (
      I => reg05_Q(13),
      O => reg5(13)
    );
  reg5_12_OBUF : OBUF
    port map (
      I => reg05_Q(12),
      O => reg5(12)
    );
  reg5_11_OBUF : OBUF
    port map (
      I => reg05_Q(11),
      O => reg5(11)
    );
  reg5_10_OBUF : OBUF
    port map (
      I => reg05_Q(10),
      O => reg5(10)
    );
  reg5_9_OBUF : OBUF
    port map (
      I => reg05_Q(9),
      O => reg5(9)
    );
  reg5_8_OBUF : OBUF
    port map (
      I => reg05_Q(8),
      O => reg5(8)
    );
  reg5_7_OBUF : OBUF
    port map (
      I => reg05_Q(7),
      O => reg5(7)
    );
  reg5_6_OBUF : OBUF
    port map (
      I => reg05_Q(6),
      O => reg5(6)
    );
  reg5_5_OBUF : OBUF
    port map (
      I => reg05_Q(5),
      O => reg5(5)
    );
  reg5_4_OBUF : OBUF
    port map (
      I => reg05_Q(4),
      O => reg5(4)
    );
  reg5_3_OBUF : OBUF
    port map (
      I => reg05_Q(3),
      O => reg5(3)
    );
  reg5_2_OBUF : OBUF
    port map (
      I => reg05_Q(2),
      O => reg5(2)
    );
  reg5_1_OBUF : OBUF
    port map (
      I => reg05_Q(1),
      O => reg5(1)
    );
  reg5_0_OBUF : OBUF
    port map (
      I => reg05_Q(0),
      O => reg5(0)
    );
  reg6_15_OBUF : OBUF
    port map (
      I => reg06_Q(15),
      O => reg6(15)
    );
  reg6_14_OBUF : OBUF
    port map (
      I => reg06_Q(14),
      O => reg6(14)
    );
  reg6_13_OBUF : OBUF
    port map (
      I => reg06_Q(13),
      O => reg6(13)
    );
  reg6_12_OBUF : OBUF
    port map (
      I => reg06_Q(12),
      O => reg6(12)
    );
  reg6_11_OBUF : OBUF
    port map (
      I => reg06_Q(11),
      O => reg6(11)
    );
  reg6_10_OBUF : OBUF
    port map (
      I => reg06_Q(10),
      O => reg6(10)
    );
  reg6_9_OBUF : OBUF
    port map (
      I => reg06_Q(9),
      O => reg6(9)
    );
  reg6_8_OBUF : OBUF
    port map (
      I => reg06_Q(8),
      O => reg6(8)
    );
  reg6_7_OBUF : OBUF
    port map (
      I => reg06_Q(7),
      O => reg6(7)
    );
  reg6_6_OBUF : OBUF
    port map (
      I => reg06_Q(6),
      O => reg6(6)
    );
  reg6_5_OBUF : OBUF
    port map (
      I => reg06_Q(5),
      O => reg6(5)
    );
  reg6_4_OBUF : OBUF
    port map (
      I => reg06_Q(4),
      O => reg6(4)
    );
  reg6_3_OBUF : OBUF
    port map (
      I => reg06_Q(3),
      O => reg6(3)
    );
  reg6_2_OBUF : OBUF
    port map (
      I => reg06_Q(2),
      O => reg6(2)
    );
  reg6_1_OBUF : OBUF
    port map (
      I => reg06_Q(1),
      O => reg6(1)
    );
  reg6_0_OBUF : OBUF
    port map (
      I => reg06_Q(0),
      O => reg6(0)
    );
  reg7_15_OBUF : OBUF
    port map (
      I => reg07_Q(15),
      O => reg7(15)
    );
  reg7_14_OBUF : OBUF
    port map (
      I => reg07_Q(14),
      O => reg7(14)
    );
  reg7_13_OBUF : OBUF
    port map (
      I => reg07_Q(13),
      O => reg7(13)
    );
  reg7_12_OBUF : OBUF
    port map (
      I => reg07_Q(12),
      O => reg7(12)
    );
  reg7_11_OBUF : OBUF
    port map (
      I => reg07_Q(11),
      O => reg7(11)
    );
  reg7_10_OBUF : OBUF
    port map (
      I => reg07_Q(10),
      O => reg7(10)
    );
  reg7_9_OBUF : OBUF
    port map (
      I => reg07_Q(9),
      O => reg7(9)
    );
  reg7_8_OBUF : OBUF
    port map (
      I => reg07_Q(8),
      O => reg7(8)
    );
  reg7_7_OBUF : OBUF
    port map (
      I => reg07_Q(7),
      O => reg7(7)
    );
  reg7_6_OBUF : OBUF
    port map (
      I => reg07_Q(6),
      O => reg7(6)
    );
  reg7_5_OBUF : OBUF
    port map (
      I => reg07_Q(5),
      O => reg7(5)
    );
  reg7_4_OBUF : OBUF
    port map (
      I => reg07_Q(4),
      O => reg7(4)
    );
  reg7_3_OBUF : OBUF
    port map (
      I => reg07_Q(3),
      O => reg7(3)
    );
  reg7_2_OBUF : OBUF
    port map (
      I => reg07_Q(2),
      O => reg7(2)
    );
  reg7_1_OBUF : OBUF
    port map (
      I => reg07_Q(1),
      O => reg7(1)
    );
  reg7_0_OBUF : OBUF
    port map (
      I => reg07_Q(0),
      O => reg7(0)
    );
  reg_mux3_16bit_Z_9_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_9_IBUF_113,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_9_44_416,
      I3 => reg_mux3_16bit_Z_9_99_417,
      O => d_mux(9)
    );
  reg_mux3_16bit_Z_8_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_8_IBUF_112,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_8_44_414,
      I3 => reg_mux3_16bit_Z_8_99_415,
      O => d_mux(8)
    );
  reg_mux3_16bit_Z_7_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_7_IBUF_111,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_7_44_412,
      I3 => reg_mux3_16bit_Z_7_99_413,
      O => d_mux(7)
    );
  reg_mux3_16bit_Z_6_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_6_IBUF_110,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_6_44_410,
      I3 => reg_mux3_16bit_Z_6_99_411,
      O => d_mux(6)
    );
  reg_mux3_16bit_Z_5_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_5_IBUF_109,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_5_44_408,
      I3 => reg_mux3_16bit_Z_5_99_409,
      O => d_mux(5)
    );
  reg_mux3_16bit_Z_4_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_4_IBUF_108,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_4_44_406,
      I3 => reg_mux3_16bit_Z_4_99_407,
      O => d_mux(4)
    );
  reg_mux3_16bit_Z_3_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_3_IBUF_107,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_3_44_404,
      I3 => reg_mux3_16bit_Z_3_99_405,
      O => d_mux(3)
    );
  reg_mux3_16bit_Z_2_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_2_IBUF_106,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_2_44_402,
      I3 => reg_mux3_16bit_Z_2_99_403,
      O => d_mux(2)
    );
  reg_mux3_16bit_Z_1_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_1_IBUF_105,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_1_44_400,
      I3 => reg_mux3_16bit_Z_1_99_401,
      O => d_mux(1)
    );
  reg_mux3_16bit_Z_15_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_15_IBUF_104,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_15_44_398,
      I3 => reg_mux3_16bit_Z_15_99_399,
      O => d_mux(15)
    );
  reg_mux3_16bit_Z_14_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_14_IBUF_103,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_14_44_396,
      I3 => reg_mux3_16bit_Z_14_99_397,
      O => d_mux(14)
    );
  reg_mux3_16bit_Z_13_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_13_IBUF_102,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_13_44_394,
      I3 => reg_mux3_16bit_Z_13_99_395,
      O => d_mux(13)
    );
  reg_mux3_16bit_Z_12_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_12_IBUF_101,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_12_44_392,
      I3 => reg_mux3_16bit_Z_12_99_393,
      O => d_mux(12)
    );
  reg_mux3_16bit_Z_11_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_11_IBUF_100,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_11_44_390,
      I3 => reg_mux3_16bit_Z_11_99_391,
      O => d_mux(11)
    );
  reg_mux3_16bit_Z_10_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_10_IBUF_99,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_10_44_388,
      I3 => reg_mux3_16bit_Z_10_99_389,
      O => d_mux(10)
    );
  reg_mux3_16bit_Z_0_141 : LUT4
    generic map(
      INIT => X"EEE2"
    )
    port map (
      I0 => data_0_IBUF_98,
      I1 => data_src_IBUF_115,
      I2 => reg_mux3_16bit_Z_0_44_386,
      I3 => reg_mux3_16bit_Z_0_99_387,
      O => d_mux(0)
    );
  reg_mux3_16bit_Z_9_44 : MUXF5
    port map (
      I0 => N16,
      I1 => N17,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_9_44_416
    );
  reg_mux3_16bit_Z_9_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(9),
      I3 => reg05_Q(9),
      O => N16
    );
  reg_mux3_16bit_Z_9_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(9),
      I3 => reg07_Q(9),
      O => N17
    );
  reg_mux3_16bit_Z_8_44 : MUXF5
    port map (
      I0 => N18,
      I1 => N19,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_8_44_414
    );
  reg_mux3_16bit_Z_8_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(8),
      I3 => reg05_Q(8),
      O => N18
    );
  reg_mux3_16bit_Z_8_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(8),
      I3 => reg07_Q(8),
      O => N19
    );
  reg_mux3_16bit_Z_7_44 : MUXF5
    port map (
      I0 => N20,
      I1 => N21,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_7_44_412
    );
  reg_mux3_16bit_Z_7_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(7),
      I3 => reg05_Q(7),
      O => N20
    );
  reg_mux3_16bit_Z_7_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(7),
      I3 => reg07_Q(7),
      O => N21
    );
  reg_mux3_16bit_Z_6_44 : MUXF5
    port map (
      I0 => N22,
      I1 => N23,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_6_44_410
    );
  reg_mux3_16bit_Z_6_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(6),
      I3 => reg05_Q(6),
      O => N22
    );
  reg_mux3_16bit_Z_6_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(6),
      I3 => reg07_Q(6),
      O => N23
    );
  reg_mux3_16bit_Z_5_44 : MUXF5
    port map (
      I0 => N24,
      I1 => N25,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_5_44_408
    );
  reg_mux3_16bit_Z_5_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(5),
      I3 => reg05_Q(5),
      O => N24
    );
  reg_mux3_16bit_Z_5_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(5),
      I3 => reg07_Q(5),
      O => N25
    );
  reg_mux3_16bit_Z_4_44 : MUXF5
    port map (
      I0 => N26,
      I1 => N27,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_4_44_406
    );
  reg_mux3_16bit_Z_4_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(4),
      I3 => reg05_Q(4),
      O => N26
    );
  reg_mux3_16bit_Z_4_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(4),
      I3 => reg07_Q(4),
      O => N27
    );
  reg_mux3_16bit_Z_3_44 : MUXF5
    port map (
      I0 => N28,
      I1 => N29,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_3_44_404
    );
  reg_mux3_16bit_Z_3_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(3),
      I3 => reg05_Q(3),
      O => N28
    );
  reg_mux3_16bit_Z_3_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(3),
      I3 => reg07_Q(3),
      O => N29
    );
  reg_mux3_16bit_Z_2_44 : MUXF5
    port map (
      I0 => N30,
      I1 => N31,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_2_44_402
    );
  reg_mux3_16bit_Z_2_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(2),
      I3 => reg05_Q(2),
      O => N30
    );
  reg_mux3_16bit_Z_2_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(2),
      I3 => reg07_Q(2),
      O => N31
    );
  reg_mux3_16bit_Z_1_44 : MUXF5
    port map (
      I0 => N32,
      I1 => N33,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_1_44_400
    );
  reg_mux3_16bit_Z_1_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(1),
      I3 => reg05_Q(1),
      O => N32
    );
  reg_mux3_16bit_Z_1_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(1),
      I3 => reg07_Q(1),
      O => N33
    );
  reg_mux3_16bit_Z_15_44 : MUXF5
    port map (
      I0 => N34,
      I1 => N35,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_15_44_398
    );
  reg_mux3_16bit_Z_15_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(15),
      I3 => reg05_Q(15),
      O => N34
    );
  reg_mux3_16bit_Z_15_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(15),
      I3 => reg07_Q(15),
      O => N35
    );
  reg_mux3_16bit_Z_14_44 : MUXF5
    port map (
      I0 => N36,
      I1 => N37,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_14_44_396
    );
  reg_mux3_16bit_Z_14_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(14),
      I3 => reg05_Q(14),
      O => N36
    );
  reg_mux3_16bit_Z_14_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(14),
      I3 => reg07_Q(14),
      O => N37
    );
  reg_mux3_16bit_Z_13_44 : MUXF5
    port map (
      I0 => N38,
      I1 => N39,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_13_44_394
    );
  reg_mux3_16bit_Z_13_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(13),
      I3 => reg05_Q(13),
      O => N38
    );
  reg_mux3_16bit_Z_13_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(13),
      I3 => reg07_Q(13),
      O => N39
    );
  reg_mux3_16bit_Z_12_44 : MUXF5
    port map (
      I0 => N40,
      I1 => N41,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_12_44_392
    );
  reg_mux3_16bit_Z_12_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(12),
      I3 => reg05_Q(12),
      O => N40
    );
  reg_mux3_16bit_Z_12_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(12),
      I3 => reg07_Q(12),
      O => N41
    );
  reg_mux3_16bit_Z_11_44 : MUXF5
    port map (
      I0 => N42,
      I1 => N43,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_11_44_390
    );
  reg_mux3_16bit_Z_11_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(11),
      I3 => reg05_Q(11),
      O => N42
    );
  reg_mux3_16bit_Z_11_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(11),
      I3 => reg07_Q(11),
      O => N43
    );
  reg_mux3_16bit_Z_10_44 : MUXF5
    port map (
      I0 => N44,
      I1 => N45,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_10_44_388
    );
  reg_mux3_16bit_Z_10_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(10),
      I3 => reg05_Q(10),
      O => N44
    );
  reg_mux3_16bit_Z_10_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(10),
      I3 => reg07_Q(10),
      O => N45
    );
  reg_mux3_16bit_Z_0_44 : MUXF5
    port map (
      I0 => N46,
      I1 => N47,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_0_44_386
    );
  reg_mux3_16bit_Z_0_44_F : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg04_Q(0),
      I3 => reg05_Q(0),
      O => N46
    );
  reg_mux3_16bit_Z_0_44_G : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg06_Q(0),
      I3 => reg07_Q(0),
      O => N47
    );
  reg_mux3_16bit_Z_9_99 : MUXF5
    port map (
      I0 => N48,
      I1 => N49,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_9_99_417
    );
  reg_mux3_16bit_Z_9_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(9),
      I3 => reg00_Q(9),
      O => N48
    );
  reg_mux3_16bit_Z_9_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(9),
      I3 => reg02_Q(9),
      O => N49
    );
  reg_mux3_16bit_Z_8_99 : MUXF5
    port map (
      I0 => N50,
      I1 => N51,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_8_99_415
    );
  reg_mux3_16bit_Z_8_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(8),
      I3 => reg00_Q(8),
      O => N50
    );
  reg_mux3_16bit_Z_8_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(8),
      I3 => reg02_Q(8),
      O => N51
    );
  reg_mux3_16bit_Z_7_99 : MUXF5
    port map (
      I0 => N52,
      I1 => N53,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_7_99_413
    );
  reg_mux3_16bit_Z_7_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(7),
      I3 => reg00_Q(7),
      O => N52
    );
  reg_mux3_16bit_Z_7_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(7),
      I3 => reg02_Q(7),
      O => N53
    );
  reg_mux3_16bit_Z_6_99 : MUXF5
    port map (
      I0 => N54,
      I1 => N55,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_6_99_411
    );
  reg_mux3_16bit_Z_6_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(6),
      I3 => reg00_Q(6),
      O => N54
    );
  reg_mux3_16bit_Z_6_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(6),
      I3 => reg02_Q(6),
      O => N55
    );
  reg_mux3_16bit_Z_5_99 : MUXF5
    port map (
      I0 => N56,
      I1 => N57,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_5_99_409
    );
  reg_mux3_16bit_Z_5_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(5),
      I3 => reg00_Q(5),
      O => N56
    );
  reg_mux3_16bit_Z_5_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(5),
      I3 => reg02_Q(5),
      O => N57
    );
  reg_mux3_16bit_Z_4_99 : MUXF5
    port map (
      I0 => N58,
      I1 => N59,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_4_99_407
    );
  reg_mux3_16bit_Z_4_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(4),
      I3 => reg00_Q(4),
      O => N58
    );
  reg_mux3_16bit_Z_4_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(4),
      I3 => reg02_Q(4),
      O => N59
    );
  reg_mux3_16bit_Z_3_99 : MUXF5
    port map (
      I0 => N60,
      I1 => N61,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_3_99_405
    );
  reg_mux3_16bit_Z_3_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(3),
      I3 => reg00_Q(3),
      O => N60
    );
  reg_mux3_16bit_Z_3_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(3),
      I3 => reg02_Q(3),
      O => N61
    );
  reg_mux3_16bit_Z_2_99 : MUXF5
    port map (
      I0 => N62,
      I1 => N63,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_2_99_403
    );
  reg_mux3_16bit_Z_2_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(2),
      I3 => reg00_Q(2),
      O => N62
    );
  reg_mux3_16bit_Z_2_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(2),
      I3 => reg02_Q(2),
      O => N63
    );
  reg_mux3_16bit_Z_1_99 : MUXF5
    port map (
      I0 => N64,
      I1 => N65,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_1_99_401
    );
  reg_mux3_16bit_Z_1_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(1),
      I3 => reg00_Q(1),
      O => N64
    );
  reg_mux3_16bit_Z_1_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(1),
      I3 => reg02_Q(1),
      O => N65
    );
  reg_mux3_16bit_Z_15_99 : MUXF5
    port map (
      I0 => N66,
      I1 => N67,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_15_99_399
    );
  reg_mux3_16bit_Z_15_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(15),
      I3 => reg00_Q(15),
      O => N66
    );
  reg_mux3_16bit_Z_15_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(15),
      I3 => reg02_Q(15),
      O => N67
    );
  reg_mux3_16bit_Z_14_99 : MUXF5
    port map (
      I0 => N68,
      I1 => N69,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_14_99_397
    );
  reg_mux3_16bit_Z_14_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(14),
      I3 => reg00_Q(14),
      O => N68
    );
  reg_mux3_16bit_Z_14_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(14),
      I3 => reg02_Q(14),
      O => N69
    );
  reg_mux3_16bit_Z_13_99 : MUXF5
    port map (
      I0 => N70,
      I1 => N71,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_13_99_395
    );
  reg_mux3_16bit_Z_13_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(13),
      I3 => reg00_Q(13),
      O => N70
    );
  reg_mux3_16bit_Z_13_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(13),
      I3 => reg02_Q(13),
      O => N71
    );
  reg_mux3_16bit_Z_12_99 : MUXF5
    port map (
      I0 => N72,
      I1 => N73,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_12_99_393
    );
  reg_mux3_16bit_Z_12_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(12),
      I3 => reg00_Q(12),
      O => N72
    );
  reg_mux3_16bit_Z_12_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(12),
      I3 => reg02_Q(12),
      O => N73
    );
  reg_mux3_16bit_Z_11_99 : MUXF5
    port map (
      I0 => N74,
      I1 => N75,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_11_99_391
    );
  reg_mux3_16bit_Z_11_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(11),
      I3 => reg00_Q(11),
      O => N74
    );
  reg_mux3_16bit_Z_11_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(11),
      I3 => reg02_Q(11),
      O => N75
    );
  reg_mux3_16bit_Z_10_99 : MUXF5
    port map (
      I0 => N76,
      I1 => N77,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_10_99_389
    );
  reg_mux3_16bit_Z_10_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(10),
      I3 => reg00_Q(10),
      O => N76
    );
  reg_mux3_16bit_Z_10_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(10),
      I3 => reg02_Q(10),
      O => N77
    );
  reg_mux3_16bit_Z_0_99 : MUXF5
    port map (
      I0 => N78,
      I1 => N79,
      S => src_S1_IBUF_421,
      O => reg_mux3_16bit_Z_0_99_387
    );
  reg_mux3_16bit_Z_0_99_F : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg01_Q(0),
      I3 => reg00_Q(0),
      O => N78
    );
  reg_mux3_16bit_Z_0_99_G : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => src_S0_IBUF_419,
      I1 => src_S2_IBUF_423,
      I2 => reg03_Q(0),
      I3 => reg02_Q(0),
      O => N79
    );
  Clk_BUFGP : BUFGP
    port map (
      I => Clk,
      O => Clk_BUFGP_1
    );

end Structure;

