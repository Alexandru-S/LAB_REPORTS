--------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity function_unit is
Port ( F_A : in  STD_LOGIC_VECTOR(15 downto 0);
           F_B : in  STD_LOGIC_VECTOR(15 downto 0);
           F_select : in  STD_LOGIC_VECTOR(4 downto 0);
           F_Vout : out  STD_LOGIC;
			  F_Cout : out  STD_LOGIC;
			  F_Nout : out  STD_LOGIC;
			  F_Zout : out  STD_LOGIC;
           F_F : out  STD_LOGIC_VECTOR(15 downto 0));
end function_unit;

architecture Behavioral of function_unit is

Component arithmetic_logic_unit 
    Port ( ALU_A : in  STD_LOGIC_VECTOR(15 downto 0);
           ALU_B : in  STD_LOGIC_VECTOR(15 downto 0);
           ALU_select : in  STD_LOGIC_VECTOR(3 downto 0);
           ALU_Cout : out  STD_LOGIC;
           ALU_Vout : out  STD_LOGIC;
           ALU_G : out  STD_LOGIC_VECTOR(15 downto 0));
end Component;


Component shifter  Port ( B : in  STD_LOGIC_VECTOR(15 downto 0);
           S : in  STD_LOGIC_VECTOR(1 downto 0);
           IR : in  STD_LOGIC;
           IL : in  STD_LOGIC;
           H : out  STD_LOGIC_VECTOR(15 downto 0));
end Component;

Component mux3_16bit Port ( s : in  STD_LOGIC;
           In0 : in  STD_LOGIC_VECTOR(15 downto 0);
           In1 : in  STD_LOGIC_VECTOR(15 downto 0);
           Z : out  STD_LOGIC_VECTOR(15 downto 0));
end Component;

signal src_ALU, src_shift, src_mux : STD_LOGIC_VECTOR(15 downto 0);

begin

reg_arithmetic_logic_unit : arithmetic_logic_unit 
    Port MAP ( ALU_A => F_A,
           ALU_B => F_B,
           ALU_select => F_select(3 downto 0),
           ALU_Cout => F_Cout, 
           ALU_Vout => F_Vout,
           ALU_G => src_ALU);

reg_shifter : shifter  Port MAP ( B => F_B,
           S => F_select(3 downto 2),
           IR => '0',
           IL => '0',
           H => src_shift);


reg_mux3_16bit : mux3_16bit Port MAP ( s => F_select(4),
           In0 => src_ALU,
           In1 => src_shift,
           Z  => src_mux);

F_F <= src_mux;
F_Nout <= src_mux(15);
F_Zout <= ((src_mux(15)) or (src_mux(14)) or (src_mux(13)) or
				(src_mux(12)) or (src_mux(11)) or (src_mux(10)) or 
				(src_mux(9)) or (src_mux(8)) or (src_mux(7)) or 
				(src_mux(6)) or (src_mux(5)) or (src_mux(4)) or 
				(src_mux(3)) or (src_mux(2)) or 
				(src_mux(1)) or (src_mux(0)));



end Behavioral;

