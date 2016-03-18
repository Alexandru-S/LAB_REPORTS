--------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity B_input_logic is
    Port ( B : in  STD_LOGIC_VECTOR(15 downto 0);
           S : in  STD_LOGIC_VECTOR(1 downto 0);
           Y : out  STD_LOGIC_VECTOR(15 downto 0));
end B_input_logic;

architecture Behavioral of B_input_logic is

component mux2_1bit  Port ( S0 : in  STD_LOGIC;
										S1 : in  STD_LOGIC;
										Cin : in  STD_LOGIC;
										Res : out  STD_LOGIC);
End Component;

begin
mux2_1bit00 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(0),
												Res => Y(0));
					
mux2_1bit01 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(1),
												Res => Y(1));
												
mux2_1bit02 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(2),
												Res => Y(2));
					
mux2_1bit03 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(3),
												Res => Y(3));
												
mux2_1bit04 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(4),
												Res => Y(4));
					
mux2_1bit05 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(5),
												Res => Y(5));
												
mux2_1bit06 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(6),
												Res => Y(6));
					
mux2_1bit07 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(7),
												Res => Y(7));
												
mux2_1bit08 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(8),
												Res => Y(8));
					
mux2_1bit09 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(9),
												Res => Y(9));
												
mux2_1bit10 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(10),
												Res => Y(10));
					
mux2_1bit11 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(11),
												Res => Y(11));
												
mux2_1bit12 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(12),
												Res => Y(12));
					
mux2_1bit13 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(13),
												Res => Y(13));
												
mux2_1bit14 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(14),
												Res => Y(14));
					
mux2_1bit15 : mux2_1bit PORT MAP( S0 => S(0),
												S1 => S(1),
												Cin =>B(15),
												Res => Y(15));

end Behavioral;

