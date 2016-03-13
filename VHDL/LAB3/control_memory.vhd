-----------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_memory is
    Port ( car_in : in  STD_LOGIC_VECTOR(7 downto 0);
           NA : out  STD_LOGIC_VECTOR(7 downto 0);
           MSout : out  STD_LOGIC_VECTOR(2 downto 0);
           MC : out  STD_LOGIC;
           IL : out  STD_LOGIC;
           PI : out  STD_LOGIC;
           PL : out  STD_LOGIC;
           TD : out  STD_LOGIC;
           TA : out  STD_LOGIC;
           TB : out  STD_LOGIC;
           MB : out  STD_LOGIC;
           FSout : out  STD_LOGIC_VECTOR(4 downto 0);
           MD : out  STD_LOGIC;
           RW : out  STD_LOGIC;
           MM : out  STD_LOGIC;
           MW : out  STD_LOGIC);
end control_memory;
architecture Behavioral of control_memory is

	type src_memory is array(0 to 255) of STD_LOGIC_VECTOR(27 downto 0);
	
begin
	memory : process(car_in)
	variable memory : src_memory := (

	x"F0E1D50",
	x"F0E1D51",
	x"F0E1D52",
	x"F0E1D53",
	x"F0E1D54",
	x"F0E1D55",
	x"F0E1D56",
	x"F0E1D57",
	x"F0E1D58",
	x"F0E1D59",
	x"F0E1D5A",
	x"F0E1D5B",
	x"F0E1D5C",
	x"F0E1D5D",
	x"F0E1D5E",
	x"F0E1D5F",
	
		x"F0E1D50",
	x"F0E1D51",
	x"F0E1D52",
	x"F0E1D53",
	x"F0E1D54",
	x"F0E1D55",
	x"F0E1D56",
	x"F0E1D57",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",


	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	
	
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",


	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	
	
		x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",


	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	
	
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",


	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	
		x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",


	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000",
	x"0000000",
	x"0000000",	
	x"0000000",
	x"0000000");
	
	VARIABLE addr : integer;
	variable control_out : STD_LOGIC_VECTOR(27 downto 0);
	begin 
		addr := conv_integer(car_in);
		control_out := memory(addr);
		 NA <= control_out(27 downto 20); 
           MSout <= control_out(19 downto 17);
           MC <= control_out(16);
           IL <= control_out(15);
           PI <= control_out(14);
           PL <= control_out(13);
           TD <= control_out(12);
           TA <= control_out(11);
           TB <= control_out(10);
           MB <= control_out(9);
           FSout <= control_out(8 downto 4);
           MD <= control_out(3);
           RW <= control_out(2);
           MM <= control_out(1);
           MW <= control_out(0);
	end process;
end Behavioral;

