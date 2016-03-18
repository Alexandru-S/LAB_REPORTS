--------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY test_mux8_16bit IS
END test_mux8_16bit;
 
ARCHITECTURE behavior OF test_mux8_16bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux8_16bit
    PORT(
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         In0 : IN  std_logic_vector(15 downto 0);
         In1 : IN  std_logic_vector(15 downto 0);
         In2 : IN  std_logic_vector(15 downto 0);
         In3 : IN  std_logic_vector(15 downto 0);
         In4 : IN  std_logic_vector(15 downto 0);
         In5 : IN  std_logic_vector(15 downto 0);
         In6 : IN  std_logic_vector(15 downto 0);
         In7 : IN  std_logic_vector(15 downto 0);
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal In0 : std_logic_vector(15 downto 0) := (others => '0');
   signal In1 : std_logic_vector(15 downto 0) := (others => '0');
   signal In2 : std_logic_vector(15 downto 0) := (others => '0');
   signal In3 : std_logic_vector(15 downto 0) := (others => '0');
   signal In4 : std_logic_vector(15 downto 0) := (others => '0');
   signal In5 : std_logic_vector(15 downto 0) := (others => '0');
   signal In6 : std_logic_vector(15 downto 0) := (others => '0');
   signal In7 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux8_16bit PORT MAP (
          S0 => S0,
          S1 => S1,
          S2 => S2,
          In0 => In0,
          In1 => In1,
          In2 => In2,
          In3 => In3,
          In4 => In4,
          In5 => In5,
          In6 => In6,
          In7 => In7,
          Z => Z
        );

   stim_proc: process
   begin		
		In0 <= x"FFFF";
		In1 <= x"EEEE";
		In2 <= x"DDDD";
		In3 <= x"CCCC";
		In4 <= x"BBBB";
		In5 <= x"AAAA";
		In6 <= x"9999";
		In7 <= x"8888";
		
		wait for 10ns;
		 S0 <='0';
       S1 <='0';
       S2 <='0';
		 
		wait for 10ns;
		 S0 <='1';
       S1 <='0';
       S2 <='0';
		 
		wait for 10ns;
		 S0 <='0';
       S1 <='1';
       S2 <='0';
		 
		wait for 10ns;
		 S0 <='1';
       S1 <='1';
       S2 <='0';
		 
		wait for 10ns;
		 S0 <='0';
       S1 <='0';
       S2 <='1';
		 
		wait for 10ns;
		 S0 <='1';
       S1 <='0';
       S2 <='1';
		 
		wait for 10ns;
		 S0 <='0';
       S1 <='1';
       S2 <='1';
		 
		wait for 10ns;
		 S0 <='1';
       S1 <='1';
       S2 <='1';
		
		
      wait;
   end process;

END;
