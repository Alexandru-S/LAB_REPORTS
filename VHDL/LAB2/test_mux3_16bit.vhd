--------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY test_mux3_16bit IS
END test_mux3_16bit;
 
ARCHITECTURE behavior OF test_mux3_16bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux3_16bit
    PORT(
         s : IN  std_logic;
         In0 : IN  std_logic_vector(15 downto 0);
         In1 : IN  std_logic_vector(15 downto 0);
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal s : std_logic := '0';
   signal In0 : std_logic_vector(15 downto 0) := (others => '0');
   signal In1 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux3_16bit PORT MAP (
          s => s,
          In0 => In0,
          In1 => In1,
          Z => Z
        );

   -- Stimulus process
   stim_proc: process
   begin		
          In0 <= x"FFFF";
          In1 <= x"AAAA";
			 
			 wait for 10ns;
			 s <= '1';
			 wait for 10ns;
			 s <= '0';
			 wait for 10ns;
			 s <= '1';
      wait;
   end process;

END;
