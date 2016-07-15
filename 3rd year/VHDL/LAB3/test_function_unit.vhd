--------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY test_function_unit IS
END test_function_unit;
 
ARCHITECTURE behavior OF test_function_unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT function_unit
    PORT(
         F_A : IN  std_logic_vector(15 downto 0);
         F_B : IN  std_logic_vector(15 downto 0);
         F_select : IN  std_logic_vector(4 downto 0);
         F_Vout : OUT  std_logic;
         F_Cout : OUT  std_logic;
         F_Nout : OUT  std_logic;
         F_Zout : OUT  std_logic;
         F_F : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal F_A : std_logic_vector(15 downto 0) := (others => '0');
   signal F_B : std_logic_vector(15 downto 0) := (others => '0');
   signal F_select : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal F_Vout : std_logic;
   signal F_Cout : std_logic;
   signal F_Nout : std_logic;
   signal F_Zout : std_logic;
   signal F_F : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: function_unit PORT MAP (
          F_A => F_A,
          F_B => F_B,
          F_select => F_select,
          F_Vout => F_Vout,
          F_Cout => F_Cout,
          F_Nout => F_Nout,
          F_Zout => F_Zout,
          F_F => F_F
        );

   -- Stimulus process
   stim_proc: process
   begin		

		F_A <= x"AAAA";
		F_B <= x"BBBB";
		
		wait for 20ns;
		F_select <= "00000";
		
		wait for 10ns;
		F_select <= "00001";
		wait for 10ns;
		F_select <= "00010";
		wait for 10ns;
		F_select <= "00011";
		wait for 20ns;
		F_select <= "00100";
		
		wait for 20ns;
		F_select <= "00101";
		wait for 20ns;
		F_select <= "00110";
		
		wait for 10ns;
		F_select <= "00111";
		wait for 10ns;
		F_select <= "01000";
		
		wait for 10ns;
		F_select <= "01001";
		wait for 10ns;
		F_select <= "01010";
		
		wait for 10ns;
		F_select <= "01011";
		wait for 10ns;
		F_select <= "01100";
		
		
		wait for 10ns;
		F_select <= "01101";
		wait for 10ns;
		F_select <= "01110";
		
		wait for 10ns;
		F_select <= "01111";
		wait for 10ns;
		F_select <= "10000";
		
		wait for 10ns;
		F_select <= "10001";
		wait for 10ns;
		F_select <= "10010";
		
		
		wait for 10ns;
		F_select <= "10011";
		wait for 10ns;
		F_select <= "10100";
		
		wait for 10ns;
		F_select <= "10101";
		wait for 10ns;
		F_select <= "10110";
		
		wait for 10ns;
		F_select <= "10111";
		wait for 10ns;
		F_select <= "11000";
		
		
		wait for 10ns;
		F_select <= "11001";
		wait for 10ns;
		F_select <= "11010";
		
		wait for 10ns;
		F_select <= "11011";
		wait for 10ns;
		F_select <= "11100";
		
		wait for 10ns;
		F_select <= "11101";
		wait for 10ns;
		F_select <= "11110";
		wait for 10ns;
		F_select <= "11111";

      wait;
   end process;

END;
