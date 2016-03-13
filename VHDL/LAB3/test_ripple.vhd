--------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_ripple IS
END test_ripple;
 
ARCHITECTURE behavior OF test_ripple IS 
 
    COMPONENT ripple_adder
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Gout : OUT  std_logic_vector(15 downto 0);
         Vout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal Gout : std_logic_vector(15 downto 0);
   signal Vout : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ripple_adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Gout => Gout,
          Vout => Vout
        );

   stim_proc: process
   begin		
	
	 A <=x"AAAA";
    B <=x"FBAA";
    Cin <= '1';
     
	  wait for 10ns;
	  A <=x"FFFF";
    B <=x"0000";
    Cin <= '1';
	  
      wait;
   end process;

END;
