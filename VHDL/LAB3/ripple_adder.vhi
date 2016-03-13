
-- VHDL Instantiation Created from source file ripple_adder.vhd -- 22:49:05 03/03/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ripple_adder
	PORT(
		A : IN std_logic_vector(15 downto 0);
		B : IN std_logic_vector(15 downto 0);
		Cin : IN std_logic;          
		Cout : OUT std_logic;
		Gout : OUT std_logic_vector(15 downto 0);
		Vout : OUT std_logic
		);
	END COMPONENT;

	Inst_ripple_adder: ripple_adder PORT MAP(
		A => ,
		B => ,
		Cin => ,
		Cout => ,
		Gout => ,
		Vout => 
	);


