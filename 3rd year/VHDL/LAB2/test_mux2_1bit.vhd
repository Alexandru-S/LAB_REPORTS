--------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_mux2_1bit IS
END test_mux2_1bit;
 
ARCHITECTURE behavior OF test_mux2_1bit IS 

    COMPONENT mux2_1bit
    PORT(
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         Cin : IN  std_logic;
         Res : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Res : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2_1bit PORT MAP (
          S0 => S0,
          S1 => S1,
          Cin => Cin,
          Res => Res
        );

   stim_proc: process
   begin		
       S0 <= '1';
       S1 <=  '0';
		 
		 wait for 10ns;
		 Cin <= '1';
		 
		 wait for 10ns;
		 Cin <= '0';

      wait;
   end process;

END;
