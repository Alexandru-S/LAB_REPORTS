-----------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY test_register_file IS
END test_register_file;
 
ARCHITECTURE behavior OF test_register_file IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         inA : IN  std_logic_vector(2 downto 0);
         inB : IN  std_logic_vector(2 downto 0);
         inD : IN  std_logic_vector(2 downto 0);
         Clk : IN  std_logic;
         load_in : IN  std_logic;
         data : IN  std_logic_vector(15 downto 0);
         outA : OUT  std_logic_vector(15 downto 0);
         outB : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inA : std_logic_vector(2 downto 0) := (others => '0');
   signal inB : std_logic_vector(2 downto 0) := (others => '0');
   signal inD : std_logic_vector(2 downto 0) := (others => '0');
   signal Clk : std_logic := '0';
   signal load_in : std_logic := '0';
   signal data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal outA : std_logic_vector(15 downto 0);
   signal outB : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          inA => inA,
          inB => inB,
          inD => inD,
          Clk => Clk,
          load_in => load_in,
          data => data,
          outA => outA,
          outB => outB
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
    load_in <= '1';
	 inD <= "000";
	 data <= x"FFFF";
	 
	 wait for 10ns;
	 inD <= "001";
	 data <= x"EEEE";
	 
	 wait for 10ns;
	 inD <= "010";
	 data <= x"DDDD";
	 
	 wait for 10ns;
	 inD <= "011";
	 data <= x"CCCC";
	 
	 wait for 10ns;
	 inD <= "100";
	 data <= x"BBBB";
	 
	 	 wait for 10ns;
	 inD <= "101";
	 data <= x"AAAA";
	 
	 wait for 10ns;
	 inD <= "110";
	 data <= x"9999";
	 
	 wait for 10ns;
	 inD <= "111";
	 data <= x"8888";
	 
	 wait for 10ns;
	 load_in <= '0';
	 inA <= "000";
	 inB <= "111";
	 
	 wait for 5ns;
	 inA <= "001";
	 inB <= "110";
	 
	 wait for 5ns;
	 inA <= "010";
	 inB <= "101";
	 
	 wait for 5ns;
	 inA <= "011";
	 inB <= "100";
	 
      wait;
   end process;

END;
