---------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_mux3_1bit IS
END test_mux3_1bit;
 
ARCHITECTURE behavior OF test_mux3_1bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux3_1bit
    PORT(
         In0 : IN  std_logic;
         In1 : IN  std_logic;
         In2 : IN  std_logic;
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal In0 : std_logic := '0';
   signal In1 : std_logic := '0';
   signal In2 : std_logic := '0';
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';

 	--Outputs
   signal Z : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux3_1bit PORT MAP (
          In0 => In0,
          In1 => In1,
          In2 => In2,
          S0 => S0,
          S1 => S1,
          Z => Z
        );

   stim_proc: process
   begin		
		wait for 10ns;
		In0 <= '0';
      In1 <= '0';
      In2 <= '0';
		
		wait for 10ns;
		In0 <= '1';
      In1 <= '0';
      In2 <= '1';
		
		wait for 5ns;
		S0 <= '0';
      S1 <= '0';
		
		wait for 5ns;
		S0 <= '0';
      S1 <= '1';
		
		wait for 5ns;
		S0 <= '1';
      S1 <= '0';
      
		wait for 5ns;
		S0 <= '1';
      S1 <= '1';
      wait;
   end process;

END;
