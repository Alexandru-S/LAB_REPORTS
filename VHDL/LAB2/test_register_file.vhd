--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:49:03 02/15/2016
-- Design Name:   
-- Module Name:   C:/Users/owner/Desktop/VHDL/LAB1/test_register_file.vhd
-- Project Name:  LAB1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_register_file IS
END test_register_file;
 
ARCHITECTURE behavior OF test_register_file IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         src_S0 : IN  std_logic;
         src_S1 : IN  std_logic;
         src_S2 : IN  std_logic;
         des_A0 : IN  std_logic;
         des_A1 : IN  std_logic;
         des_A2 : IN  std_logic;
         Clk : IN  std_logic;
         data_src : IN  std_logic;
         data : IN  std_logic_vector(15 downto 0);
         reg0 : OUT  std_logic_vector(15 downto 0);
         reg1 : OUT  std_logic_vector(15 downto 0);
         reg2 : OUT  std_logic_vector(15 downto 0);
         reg3 : OUT  std_logic_vector(15 downto 0);
         reg4 : OUT  std_logic_vector(15 downto 0);
         reg5 : OUT  std_logic_vector(15 downto 0);
         reg6 : OUT  std_logic_vector(15 downto 0);
         reg7 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal src_S0 : std_logic := '0';
   signal src_S1 : std_logic := '0';
   signal src_S2 : std_logic := '0';
   signal des_A0 : std_logic := '0';
   signal des_A1 : std_logic := '0';
   signal des_A2 : std_logic := '0';
   signal Clk : std_logic := '0';
   signal data_src : std_logic := '0';
   signal data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal reg0 : std_logic_vector(15 downto 0);
   signal reg1 : std_logic_vector(15 downto 0);
   signal reg2 : std_logic_vector(15 downto 0);
   signal reg3 : std_logic_vector(15 downto 0);
   signal reg4 : std_logic_vector(15 downto 0);
   signal reg5 : std_logic_vector(15 downto 0);
   signal reg6 : std_logic_vector(15 downto 0);
   signal reg7 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          src_S0 => src_S0,
          src_S1 => src_S1,
          src_S2 => src_S2,
          des_A0 => des_A0,
          des_A1 => des_A1,
          des_A2 => des_A2,
          Clk => Clk,
          data_src => data_src,
          data => data,
          reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3,
          reg4 => reg4,
          reg5 => reg5,
          reg6 => reg6,
          reg7 => reg7
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
		wait for 10 ns;
			des_A0 <= '0';
			des_A1 <= '0';
			des_A2 <= '0';
			data <= x"FFFF";
		
		wait for 10 ns;
			des_A0 <= '0';
			des_A1 <= '0';
			des_A2 <= '1';
			data <= x"EEEE";
			
		wait for 10 ns;
			des_A0 <= '0';
			des_A1 <= '1';
			des_A2 <= '0';
			data <= x"DDDD";
		
		wait for 10 ns;
			des_A0 <= '0';
			des_A1 <= '1';
			des_A2 <= '1';
			data <= x"CCCC";
			
			wait for 10 ns;
			des_A0 <= '1';
			des_A1 <= '0';
			des_A2 <= '0';
			data <= x"BBBB";
		
		wait for 10 ns;
			des_A0 <= '1';
			des_A1 <= '0';
			des_A2 <= '1';
			data <= x"AAAA";
			
		wait for 10 ns;
			des_A0 <= '1';
			des_A1 <= '1';
			des_A2 <= '0';
			data <= x"9999";
		
		wait for 10 ns;
			des_A0 <= '1';
			des_A1 <= '1';
			des_A2 <= '1';
			data <= x"0000";
	  
    
   end process;

END;
