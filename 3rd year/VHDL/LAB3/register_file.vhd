library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity register_file is
    Port ( 
           inA : in  STD_LOGIC_VECTOR(3 downto 0);
           inB : in  STD_LOGIC_VECTOR(3 downto 0);
           inD : in  STD_LOGIC_VECTOR(3 downto 0);
           Clk : in  STD_LOGIC;
          load_in : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR(15 downto 0);
				outA :  out  STD_LOGIC_VECTOR(15 downto 0);
				outB :  out  STD_LOGIC_VECTOR(15 downto 0)
			 );
end register_file;

architecture Behavioral of register_file is

	Component decoder_3to8
	Port ( A0 : in  STD_LOGIC;
          A1 : in  STD_LOGIC;
			 A2 : in  STD_LOGIC;
			 A3 : in  STD_LOGIC;
          Q0 : out  STD_LOGIC;
          Q1 : out  STD_LOGIC;
          Q2 : out  STD_LOGIC;
          Q3 : out  STD_LOGIC;
          Q4 : out  STD_LOGIC;
          Q5 : out  STD_LOGIC;
          Q6 : out  STD_LOGIC;
			 Q7 : out  STD_LOGIC;
          Q8 : out  STD_LOGIC);
	End Component;

	Component mux3_16bit
	Port ( s : in  STD_LOGIC;
          In0 : in  STD_LOGIC_VECTOR(15 downto 0);
          In1 : in  STD_LOGIC_VECTOR(15 downto 0);
          Z : out  STD_LOGIC_VECTOR(15 downto 0));
	End Component;
	
	Component reg8
	Port ( load0 : in  STD_LOGIC;
				load1 : in STD_LOGIC;
          Clk : in  STD_LOGIC;
          D : in  STD_LOGIC_VECTOR(15 downto 0);
          Q : out  STD_LOGIC_VECTOR(15 downto 0));
	End Component;
	
	Component mux8_16bit
	Port ( S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S2 : in  STD_LOGIC;
			  S3 : in  STD_LOGIC;
           In0 : in  STD_LOGIC_VECTOR(15 downto 0);
           In1 : in  STD_LOGIC_VECTOR(15 downto 0);
           In2 : in  STD_LOGIC_VECTOR(15 downto 0);
           In3 : in  STD_LOGIC_VECTOR(15 downto 0);
           In4 : in  STD_LOGIC_VECTOR(15 downto 0);
           In5 : in  STD_LOGIC_VECTOR(15 downto 0);
           In6 : in  STD_LOGIC_VECTOR(15 downto 0);
           In7 : in  STD_LOGIC_VECTOR(15 downto 0);
			  In8 : in  STD_LOGIC_VECTOR(15 downto 0);
           Z : out  STD_LOGIC_VECTOR(15 downto 0));
	End Component;
	
	signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4,
				load_reg5, load_reg6, load_reg7, load_reg8 : STD_LOGIC;
	signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q,
				reg7_q, reg8_q, d_mux, src_reg, src_A, src_B : STD_LOGIC_VECTOR(15 downto 0);

begin
	reg_decoder_3to8 : decoder_3to8 PORT MAP(
		A0 => inD(0),
		A1 => inD(1),
		A2 => inD(2),
		A3 => inD(3),
		Q0 => load_reg0,
		Q1 => load_reg1,
		Q2 => load_reg2,
		Q3 => load_reg3,
		Q4 => load_reg4,
		Q5 => load_reg5,
		Q6 => load_reg6,
		Q7 => load_reg7,
		Q8 => load_reg8
		);
	
	A_reg_mux8_16bit : mux8_16bit PORT MAP(
		S0 => inA(0),
		S1 => inA(1),
		S2 => inA(2),
		S3 => inA(3),
		In0 => reg0_q,
		In1 => reg1_q,
		In2 => reg2_q,
		In3 => reg3_q,
		In4 => reg4_q,
		In5 => reg5_q,
		In6 => reg6_q,
		In7 => reg7_q,
		In8 => reg8_q,
		Z => src_A
		);
		
	B_reg_mux8_16bit : mux8_16bit PORT MAP(
		S0 => inB(0),
		S1 => inB(1),
		S2 => inB(2),
		S3 => inB(3),
		In0 => reg0_q,
		In1 => reg1_q,
		In2 => reg2_q,
		In3 => reg3_q,
		In4 => reg4_q,
		In5 => reg5_q,
		In6 => reg6_q,
		In7 => reg7_q,
		In8 => reg8_q,
		Z => src_B
		);
		
	reg00 : reg8 PORT MAP(
		load0 =>	load_reg0,
		load1 => load_in,
		Clk =>	Clk,
		D =>	data,
		Q => reg0_q);
		
	reg01 : reg8 PORT MAP(
		load0 =>	load_reg1,
		load1 => load_in,
		Clk =>	Clk,
		D =>	data,
		Q => reg1_q);
	
	reg02 : reg8 PORT MAP(
		load0 =>	load_reg2,
		load1 => load_in,
		Clk =>	Clk,
		D =>	data,
		Q => reg2_q);	

	reg03 : reg8 PORT MAP(
		load0 =>	load_reg3,
		load1 => load_in,
		Clk =>	Clk,
		D =>	data,
		Q => reg3_q);

	reg04 : reg8 PORT MAP(
		load0 =>	load_reg4,
		load1 => load_in,
		Clk =>	Clk,
		D =>	data,
		Q => reg4_q);
		
	reg05 : reg8 PORT MAP(
		load0 =>	load_reg5,
		load1 => load_in,
		Clk =>	Clk,
		D =>	data,
		Q => reg5_q);
		
	reg06 : reg8 PORT MAP(
		load0 =>	load_reg6,
		load1 => load_in,
		Clk =>	Clk,
		D =>	data,
		Q => reg6_q);
		
	reg07 : reg8 PORT MAP(
		load0 =>	load_reg7,
		load1 => load_in,
		Clk =>	Clk,
		D =>	data,
		Q => reg7_q);
		
	reg08 : reg8 PORT MAP(
		load0 =>	load_reg8,
		load1 => load_in,
		Clk =>	Clk,
		D =>	data,
		Q => reg8_q);

	outA <= src_A;
	outB <= src_B;


end Behavioral;