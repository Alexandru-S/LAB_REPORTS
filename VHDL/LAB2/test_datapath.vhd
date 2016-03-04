------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY test_datapath IS
END test_datapath;
 
ARCHITECTURE behavior OF test_datapath IS 
 
    COMPONENT datapath
    PORT(
         data_in : IN  std_logic_vector(15 downto 0);
         constant_in : IN  std_logic_vector(15 downto 0);
         D_select : IN  std_logic_vector(16 downto 0);
         D_Clk : IN  std_logic;
         D_Vout : OUT  std_logic;
         D_Cout : OUT  std_logic;
         D_Nout : OUT  std_logic;
         D_Zout : OUT  std_logic;
         address_out : OUT  std_logic_vector(15 downto 0);
         data_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal constant_in : std_logic_vector(15 downto 0) := (others => '0');
   signal D_select : std_logic_vector(16 downto 0) := (others => '0');
   signal D_Clk : std_logic := '0';

 	--Outputs
   signal D_Vout : std_logic;
   signal D_Cout : std_logic;
   signal D_Nout : std_logic;
   signal D_Zout : std_logic;
   signal address_out : std_logic_vector(15 downto 0);
   signal data_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant D_Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: datapath PORT MAP (
          data_in => data_in,
          constant_in => constant_in,
          D_select => D_select,
          D_Clk => D_Clk,
          D_Vout => D_Vout,
          D_Cout => D_Cout,
          D_Nout => D_Nout,
          D_Zout => D_Zout,
          address_out => address_out,
          data_out => data_out
        );

   -- Clock process definitions
   D_Clk_process :process
   begin
		D_Clk <= '0';
		wait for D_Clk_period/2;
		D_Clk <= '1';
		wait for D_Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      data_in <= x"FFFF";
		constant_in <= x"0000";
		D_select <= "00000000100000011";
		
		wait for 20ns;
		data_in <= x"AAAA";
		D_select <= "00000000100000011";
		
		wait for 20ns;
		D_select <= "00000000100110001";
		
		wait for 20ns;
		D_select <= "01001001001000000";
		
		

      wait;
   end process;

END;
