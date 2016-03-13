-----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity arithmetic_logic_unit is
    Port ( ALU_A : in  STD_LOGIC_VECTOR(15 downto 0);
           ALU_B : in  STD_LOGIC_VECTOR(15 downto 0);
           ALU_select : in  STD_LOGIC_VECTOR(3 downto 0);
           ALU_Cout : out  STD_LOGIC;
           ALU_Vout : out  STD_LOGIC;
           ALU_G : out  STD_LOGIC_VECTOR(15 downto 0));
end arithmetic_logic_unit;

architecture Behavioral of arithmetic_logic_unit is

component ripple_adder Port ( A : in  STD_LOGIC_VECTOR(15 downto 0);
           B : in  STD_LOGIC_VECTOR(15 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Gout : out  STD_LOGIC_VECTOR(15 downto 0);
           Vout : out  STD_LOGIC);
End Component;

component mux3_16bit Port ( s : in  STD_LOGIC;
           In0 : in  STD_LOGIC_VECTOR(15 downto 0);
           In1 : in  STD_LOGIC_VECTOR(15 downto 0);
           Z : out  STD_LOGIC_VECTOR(15 downto 0));
End Component;

component  B_input_logic Port ( B : in  STD_LOGIC_VECTOR(15 downto 0);
           S : in  STD_LOGIC_VECTOR(1 downto 0);
           Y : out  STD_LOGIC_VECTOR(15 downto 0));
End Component;

Component  logic_circuit Port ( A : in  STD_LOGIC_VECTOR(15 downto 0);
           B : in  STD_LOGIC_VECTOR(15 downto 0);
           Cin : in  STD_LOGIC_VECTOR(1 downto 0);
           Cout : out  STD_LOGIC_VECTOR(15 downto 0));
End Component;

signal src_logic , src_B_input_logic, src_ripple : STD_LOGIC_VECTOR(15 downto 0);

begin


reg_ripple_adder : ripple_adder PORT MAP ( A => ALU_A,
           B => src_logic,
           Cin => ALU_select(0),
           Cout => ALU_Cout,
           Gout => src_ripple,
           Vout => ALU_Vout);


reg_mux3_16bit :mux3_16bit PORT MAP ( s => ALU_select(3),
           In0 => src_ripple,
           In1 => src_B_input_logic,
           Z =>ALU_G);


reg_B_input_logic :  B_input_logic PORT MAP ( B => ALU_B,
           S => ALU_SELECT(2 downto 1),
           Y => src_logic);

reg_logic_circuit : logic_circuit PORT MAP( A => ALU_A ,
           B => ALU_B,
           Cin => ALU_select(2 downto 1),
           Cout => src_B_input_logic);



end Behavioral;

