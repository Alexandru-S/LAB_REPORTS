-------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity datapath is
Port ( data_in : in  STD_LOGIC_VECTOR(15 downto 0);
				constant_in : in  STD_LOGIC_VECTOR(15 downto 0);
           D_select : in  STD_LOGIC_VECTOR(16 downto 0);
			  D_Clk : in STD_LOGIC;
           D_Vout : out  STD_LOGIC;
			  D_Cout : out  STD_LOGIC;
			  D_Nout : out  STD_LOGIC;
			  D_Zout : out  STD_LOGIC;
			  address_out : out  STD_LOGIC_VECTOR(15 downto 0);
           data_out : out  STD_LOGIC_VECTOR(15 downto 0));

end datapath;

architecture Behavioral of datapath is

component  mux3_16bit
    Port ( s : in  STD_LOGIC;
           In0 : in  STD_LOGIC_VECTOR(15 downto 0);
           In1 : in  STD_LOGIC_VECTOR(15 downto 0);
           Z : out  STD_LOGIC_VECTOR(15 downto 0));
end Component;

Component function_unit
Port ( F_A : in  STD_LOGIC_VECTOR(15 downto 0);
           F_B : in  STD_LOGIC_VECTOR(15 downto 0);
           F_select : in  STD_LOGIC_VECTOR(4 downto 0);
           F_Vout : out  STD_LOGIC;
			  F_Cout : out  STD_LOGIC;
			  F_Nout : out  STD_LOGIC;
			  F_Zout : out  STD_LOGIC;
           F_F : out  STD_LOGIC_VECTOR(15 downto 0));
end Component;

Component register_file 
    Port ( inA : in  STD_LOGIC_VECTOR(2 downto 0);
           inB : in  STD_LOGIC_VECTOR(2 downto 0);
           inD : in  STD_LOGIC_VECTOR(2 downto 0);
           Clk : in  STD_LOGIC;
          load_in : in  STD_LOGIC;
           data : in  STD_LOGIC_VECTOR(15 downto 0);
				outA :  out  STD_LOGIC_VECTOR(15 downto 0);
				outB :  out  STD_LOGIC_VECTOR(15 downto 0));
end Component ;

signal src_muxD, src_muxB, src_regA, src_regB, src_out : STD_LOGIC_VECTOR(15 downto 0);

begin

Dreg_mux3_16bit : mux3_16bit PORT MAP ( s => D_select(1),
           In0 => src_out,
           In1 => data_in,
           Z => src_muxD);

Breg_mux3_16bit : mux3_16bit PORT MAP ( s => D_select(7),
           In0 => constant_in,
           In1 => src_regB,
           Z => src_muxB);


reg_function_unit: function_unit PORT MAP ( F_A => src_regA,
           F_B => src_muxB,
           F_select => D_select(6 downto 2),
           F_Vout => D_Vout,
			  F_Cout => D_Cout,
			  F_Nout => D_Nout,
			  F_Zout => D_Zout,
           F_F => src_out);


reg_register_file : register_file PORT MAP( inA => D_select(13 downto 11),
           inB => D_select(10 downto 8),
           inD => D_select(16 downto 14),
           Clk => D_Clk,
          load_in => D_select(0),
           data => src_muxD,
				outA => src_regA,
				outB => src_regB);
				
data_out <= src_muxB;
address_out <= src_regA;



end Behavioral;

