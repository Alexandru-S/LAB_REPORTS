----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:33:03 02/14/2016 
-- Design Name: 
-- Module Name:    register_file - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity register_file is
    Port ( src_S0 : in  STD_LOGIC;
           src_S1 : in  STD_LOGIC;
           src_S2 : in  STD_LOGIC;
           des_A0 : in  STD_LOGIC;
           des_A1 : in  STD_LOGIC;
           des_A2 : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           data_src : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR(15 downto 0);
           reg0 : out  STD_LOGIC_VECTOR(15 downto 0);
           reg1 : out  STD_LOGIC_VECTOR(15 downto 0);
           reg2 : out  STD_LOGIC_VECTOR(15 downto 0);
           reg3 : out  STD_LOGIC_VECTOR(15 downto 0);
           reg4 : out  STD_LOGIC_VECTOR(15 downto 0);
           reg5 : out  STD_LOGIC_VECTOR(15 downto 0);
           reg6 : out  STD_LOGIC_VECTOR(15 downto 0);
           reg7 : out  STD_LOGIC_VECTOR(15 downto 0));
end register_file;

architecture Behavioral of register_file is

	Component decoder_3to8
	Port ( A0 : in  STD_LOGIC;
          A1 : in  STD_LOGIC;
			 A2 : in  STD_LOGIC;
          Q0 : out  STD_LOGIC;
          Q1 : out  STD_LOGIC;
          Q2 : out  STD_LOGIC;
          Q3 : out  STD_LOGIC;
          Q4 : out  STD_LOGIC;
          Q5 : out  STD_LOGIC;
          Q6 : out  STD_LOGIC;
          Q7 : out  STD_LOGIC);
	End Component;

	Component mux3_16bit
	Port ( s : in  STD_LOGIC;
          In0 : in  STD_LOGIC_VECTOR(15 downto 0);
          In1 : in  STD_LOGIC_VECTOR(15 downto 0);
          Z : out  STD_LOGIC_VECTOR(15 downto 0));
	End Component;
	
	Component reg8
	Port ( load : in  STD_LOGIC;
          Clk : in  STD_LOGIC;
          D : in  STD_LOGIC_VECTOR(15 downto 0);
          Q : out  STD_LOGIC_VECTOR(15 downto 0));
	End Component;
	
	Component mux8_16bit
	Port ( S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S2 : in  STD_LOGIC;
           In0 : in  STD_LOGIC_VECTOR(15 downto 0);
           In1 : in  STD_LOGIC_VECTOR(15 downto 0);
           In2 : in  STD_LOGIC_VECTOR(15 downto 0);
           In3 : in  STD_LOGIC_VECTOR(15 downto 0);
           In4 : in  STD_LOGIC_VECTOR(15 downto 0);
           In5 : in  STD_LOGIC_VECTOR(15 downto 0);
           In6 : in  STD_LOGIC_VECTOR(15 downto 0);
           In7 : in  STD_LOGIC_VECTOR(15 downto 0);
           Z : out  STD_LOGIC_VECTOR(15 downto 0));
	End Component;
	
	signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4,
				load_reg5, load_reg6, load_reg7 : STD_LOGIC;
	signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q,
				reg7_q, d_mux, src_reg : STD_LOGIC_VECTOR(15 downto 0);

begin
	reg_decoder_3to8 : decoder_3to8 PORT MAP(
		A0 => des_A0,
		A1 => des_A1,
		A2 => des_A2,
		Q0 => load_reg0,
		Q1 => load_reg1,
		Q2 => load_reg2,
		Q3 => load_reg3,
		Q4 => load_reg4,
		Q5 => load_reg5,
		Q6 => load_reg6,
		Q7 => load_reg7
		);
	reg_mux3_16bit : mux3_16bit PORT MAP(
		s =>	data_src, 
		In0 => data,
		In1 => src_reg,
		Z =>	d_mux
		);
	reg_mux8_16bit : mux8_16bit PORT MAP(
		S0 => src_s0,
		S1 => src_s1,
		S2 => src_s2,
		In0 => reg0_q,
		In1 => reg1_q,
		In2 => reg2_q,
		In3 => reg3_q,
		In4 => reg4_q,
		In5 => reg5_q,
		In6 => reg6_q,
		In7 => reg7_q,
		Z => src_reg
		);
		
	reg00 : reg8 PORT MAP(
		load =>	load_reg0,
		Clk =>	Clk,
		D =>	d_mux,
		Q => reg0_q);
		
	reg01 : reg8 PORT MAP(
		load =>	load_reg1,
		Clk =>	Clk,
		D =>	d_mux,
		Q => reg1_q);
	
	reg02 : reg8 PORT MAP(
		load =>	load_reg2,
		Clk =>	Clk,
		D =>	d_mux,
		Q => reg2_q);	

	reg03 : reg8 PORT MAP(
		load =>	load_reg3,
		Clk =>	Clk,
		D =>	d_mux,
		Q => reg3_q);

	reg04 : reg8 PORT MAP(
		load =>	load_reg4,
		Clk =>	Clk,
		D =>	d_mux,
		Q => reg4_q);
		
	reg05 : reg8 PORT MAP(
		load =>	load_reg5,
		Clk =>	Clk,
		D =>	d_mux,
		Q => reg5_q);
		
	reg06 : reg8 PORT MAP(
		load =>	load_reg6,
		Clk =>	Clk,
		D =>	d_mux,
		Q => reg6_q);
		
	reg07 : reg8 PORT MAP(
		load =>	load_reg7,
		Clk =>	Clk,
		D =>	d_mux,
		Q => reg7_q);

	reg0 <= reg0_q;
	reg1 <= reg1_q;
	reg2 <= reg2_q;
	reg3 <= reg3_q;
	reg4 <= reg4_q;
	reg5 <= reg5_q;
	reg6 <= reg6_q;
	reg7 <= reg7_q;

end Behavioral;