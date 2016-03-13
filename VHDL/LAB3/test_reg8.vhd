---------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY test_reg8 IS
END test_reg8;
 
ARCHITECTURE behavior OF test_reg8 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg8
    PORT(
         load0 : IN  std_logic;
         load1 : IN  std_logic;
         Clk : IN  std_logic;
         D : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal load0 : std_logic := '0';
   signal load1 : std_logic := '0';
   signal Clk : std_logic := '0';
   signal D : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg8 PORT MAP (
          load0 => load0,
          load1 => load1,
          Clk => Clk,
          D => D,
          Q => Q
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		D <= x"FFFF";
		load0 <= '1';
		load1 <= '1';
		
		wait for 15ns;
		D <= x"AAAA";
		load0 <= '0';
		
		wait for 10ns;
		load1 <= '0';
		
		wait for 10ns;
		load0 <= '1';
		load1 <= '1';

      wait;
   end process;

END;
