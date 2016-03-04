--------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_shifter IS
END test_shifter;
 
ARCHITECTURE behavior OF test_shifter IS 

    COMPONENT shifter
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         IR : IN  std_logic;
         IL : IN  std_logic;
         H : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');
   signal IR : std_logic := '0';
   signal IL : std_logic := '0';

 	--Outputs
   signal H : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shifter PORT MAP (
          B => B,
          S => S,
          IR => IR,
          IL => IL,
          H => H
        );

   stim_proc: process
   begin		
    
	 wait for 10ns;
	 B <= x"FFFF";
	 S <= "00";
	 
	 wait for 15ns;
	 s <= "01";
	 
	 wait for 15ns;
	 B <= H;
	 
	 wait for 15ns;
	 B <= H;
	 S <= "10";

      wait;
   end process;

END;
