library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CAR is
    Port ( car_in : in  STD_LOGIC_VECTOR(7 downto 0);
           muxs_in : in  STD_LOGIC;
           res : in  STD_LOGIC;
           car_out : out  STD_LOGIC_VECTOR(7 downto 0));
end CAR;
architecture Behavioral of CAR is
begin
	process(res, car_in)
	variable car_now : STD_LOGIC_VECTOR(7 downto 0);
	variable car_temp : integer;
	variable car_next : std_logic_vector(7 downto 0);
	begin
		if(res = '1') then
			car_now := x"C0";
		elsif(muxs_in = '1') then 
			car_now := car_in;
		elsif(muxs_in = '0') then 
			car_temp := conv_integer(car_now);
			car_temp := car_temp + conv_integer(1);
			car_next := conv_std_logic_vector(car_temp, 8);
			car_now := car_next;
			end if;
			car_out <= car_next after 20ns;
	end process;
end Behavioral;

