-----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity logic_circuit is
    Port ( A : in  STD_LOGIC_VECTOR(15 downto 0);
           B : in  STD_LOGIC_VECTOR(15 downto 0);
           Cin : in  STD_LOGIC_VECTOR(1 downto 0);
           Cout : out  STD_LOGIC_VECTOR(15 downto 0));
end logic_circuit;

architecture Behavioral of logic_circuit is

begin
Cout <= (A and B) after 1ns when Cin = "00" else
			(A or B) after 1ns when Cin = "01" else
			(A xor B) after 1ns when Cin = "10" else
			(not (A)) after 1ns;
end Behavioral;

