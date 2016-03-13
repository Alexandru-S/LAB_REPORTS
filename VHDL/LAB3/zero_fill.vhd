----------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_fill is
    Port ( sb : in  STD_LOGIC_VECTOR(2 downto 0);
           z_out : out  STD_LOGIC_VECTOR(15 downto 0));
end zero_fill;

architecture Behavioral of zero_fill is
	signal src_z : STD_LOGIC_VECTOR(15 downto 0);
begin
	src_z(2 downto 0) <= sb;
	src_z(15 downto 3) <= "0000000000000";
	z_out <= src_z;
end Behavioral;

