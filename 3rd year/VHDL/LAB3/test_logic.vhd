--------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_logic IS
END test_logic;
 
ARCHITECTURE behavior OF test_logic IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT logic_circuit
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Cin : IN  std_logic_vector(1 downto 0);
         Cout : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal Cin : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Cout : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: logic_circuit PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout
        );

   stim_proc: process
   begin		
		wait for 10ns;
		 A <= x"FFFF";
       B <= x"9999";
       Cin <= "00";
		 
		 wait for 10ns;
       Cin <= "01";
		 
		 wait for 10ns;
       Cin <= "10";
		 
		 wait for 10ns;
       Cin <= "11";
      wait;
   end process;

END;
