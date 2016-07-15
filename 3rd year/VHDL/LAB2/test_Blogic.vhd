--------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_Blogic IS
END test_Blogic;
 
ARCHITECTURE behavior OF test_Blogic IS 

    COMPONENT B_input_logic
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         Y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: B_input_logic PORT MAP (
          B => B,
          S => S,
          Y => Y
        );

   stim_proc: process
   begin		
     B <=x"AAAA";
     S <= "00";

		wait for 5ns;
		S <= "00";
		wait for 5ns;
		S <= "01";
		wait for 5ns;
		S <= "10";
		wait for 5ns;
		S <= "11";
		
      wait;
   end process;

END;
