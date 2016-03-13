library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath is
Port ( data_in : in  STD_LOGIC_VECTOR(15 downto 0);
			PC_in : in  STD_LOGIC_VECTOR(15 downto 0);
           control_in : in  STD_LOGIC_VECTOR(17 downto 0);
			  D_Clk : in STD_LOGIC;
			  TD : in STD_LOGIC;
			  TA : in STD_LOGIC;
			  TB : in STD_LOGIC;
			  address_out : out  STD_LOGIC_VECTOR(15 downto 0);
           data_out : out  STD_LOGIC_VECTOR(15 downto 0);
			  path_out : out STD_LOGIC_VECTOR(3 downto 0)
			  );

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

Component zero_fill
    Port ( sb : in  STD_LOGIC_VECTOR(2 downto 0);
           z_out : out  STD_LOGIC_VECTOR(15 downto 0));
end Component;

signal src_muxD, src_muxB, src_regA, src_regB, src_out, src_z : STD_LOGIC_VECTOR(15 downto 0);

signal src_outA, src_outB, src_outD, src_path : STD_LOGIC_VECTOR(3 downto 0);

 



begin

Dreg_mux3_16bit : mux3_16bit PORT MAP ( s => D_select(2),
           In0 => src_out,
           In1 => data_in,
           Z => src_muxD);

Breg_mux3_16bit : mux3_16bit PORT MAP ( s => D_select(8),
           In0 => constant_in,
           In1 => src_regB,
           Z => src_muxB);


reg_function_unit: function_unit PORT MAP ( 
				F_A => src_regA,
           F_B => src_muxB,
           F_select => D_select(7 downto 3),
           F_Vout => src_path(3),
			  F_Cout => src_path(2),
			  F_Nout => src_path(1),
			  F_Zout => src_path(0),
           F_F => src_out);

reg_register_file : register_file PORT MAP( 
				inA => src_outA,
           inB => src_outB,
           inD => src_outD,
           Clk => D_Clk,
          load_in => control_in(1),
           data => src_muxD,
				outA => src_regA,
				outB => src_regB);
				
reg_zero_fill : zero_fill PORT MAP( 
				sb => control_in(11 downto 9),
           z_out => src_z);				
				
data_out <= src_muxB;
address_out <= src_regA;
path_out <= src_path;

end Behavioral;

