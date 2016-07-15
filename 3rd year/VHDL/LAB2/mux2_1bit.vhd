--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2_1bit is
    Port ( S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Res : out  STD_LOGIC);
end mux2_1bit;

architecture Behavioral of mux2_1bit is

begin
Res <= S0 after 1ns when Cin = '1' else
			S1 after 1ns when Cin = '1' else
			'0' after 1ns;

end Behavioral;

