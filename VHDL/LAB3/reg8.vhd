----------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity reg8 is
    Port ( load0 : in  STD_LOGIC;
			  load1 : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR(15 downto 0);
           Q : out  STD_LOGIC_VECTOR(15 downto 0));
end reg8;

architecture Behavioral of reg8 is

begin
process(Clk)
begin 
		if(rising_edge(Clk)) then 
			if(load0 ='1') and (load1 ='1') then 
				Q<= D after 5ns;
			end if;
		end if;
	end process;
end Behavioral;

