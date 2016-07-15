--------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test_alu IS
END test_alu;
 
ARCHITECTURE behavior OF test_alu IS 

    COMPONENT arithmetic_logic_unit
    PORT(
         ALU_A : IN  std_logic_vector(15 downto 0);
         ALU_B : IN  std_logic_vector(15 downto 0);
         ALU_select : IN  std_logic_vector(3 downto 0);
         ALU_Cout : OUT  std_logic;
         ALU_Vout : OUT  std_logic;
         ALU_G : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALU_A : std_logic_vector(15 downto 0) := (others => '0');
   signal ALU_B : std_logic_vector(15 downto 0) := (others => '0');
   signal ALU_select : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ALU_Cout : std_logic;
   signal ALU_Vout : std_logic;
   signal ALU_G : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arithmetic_logic_unit PORT MAP (
          ALU_A => ALU_A,
          ALU_B => ALU_B,
          ALU_select => ALU_select,
          ALU_Cout => ALU_Cout,
          ALU_Vout => ALU_Vout,
          ALU_G => ALU_G
        );

   stim_proc: process
   begin		
    ALU_A <= x"FFAA";
	 ALU_B <= x"000F";
	 ALU_select <= "0000";
	 
	 wait for 10ns;
	 ALU_select <= "0000";
	 
	 wait for 10ns;
	 ALU_select <= "0001";
	 
	 wait for 10ns;
	 ALU_select <= "0010";
	 
	 wait for 10ns;
	 ALU_select <= "0011";
	 
	 wait for 10ns;
	 ALU_select <= "0100";
	 
	 wait for 10ns;
	 ALU_select <= "0101";
	 
	 wait for 10ns;
	 ALU_select <= "0110";
	 
	 wait for 10ns;
	 ALU_select <= "0111";
	 
	 wait for 10ns;
	 ALU_select <= "1000";
	 
	 wait for 10ns;
	 ALU_select <= "1001";
	 
	 wait for 10ns;
	 ALU_select <= "1010";
	 
	 wait for 10ns;
	 ALU_select <= "1011";
	 
	 wait for 10ns;
	 ALU_select <= "1100";
	 
	 wait for 10ns;
	 ALU_select <= "1101";
	 
	 wait for 10ns;
	 ALU_select <= "1110";
	 
	 wait for 10ns;
	 ALU_select <= "1111";
	 
      wait;
   end process;

END;
