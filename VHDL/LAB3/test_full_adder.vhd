--------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_full_adder IS
END test_full_adder;
 
ARCHITECTURE behavior OF test_full_adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         X : IN  std_logic;
         Y : IN  std_logic;
         S : OUT  std_logic;
         Cin : IN  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic := '0';
   signal Y : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal Cout : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          X => X,
          Y => Y,
          S => S,
          Cin => Cin,
          Cout => Cout
        );

   stim_proc: process
   begin		
	
		wait for 10ns;
		 X <= '0';
       Y <= '0';
      
		wait for 10ns;
		 X <= '0';
       Y <= '1';

		wait for 10ns;
		 X <= '1';
       Y <= '0';
      
		wait for 10ns;
		 X <= '1';
       Y <= '1';
		 
		wait for 10ns;
		 Cin <= '1';
  

      wait;
   end process;

END;
