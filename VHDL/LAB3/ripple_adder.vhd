
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ripple_adder is
    Port ( A : in  STD_LOGIC_VECTOR(15 downto 0);
           B : in  STD_LOGIC_VECTOR(15 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Gout : out  STD_LOGIC_VECTOR(15 downto 0);
           Vout : out  STD_LOGIC);
end ripple_adder;

architecture Behavioral of ripple_adder is

Component full_adder
PORT(X: in STD_LOGIC;
		Y: in STD_LOGIC;
		S: out STD_LOGIC;
		Cin: in STD_LOGIC;
		Cout: out STD_LOGIC);
End Component;

signal src_sig0, src_sig1, src_sig2, src_sig3, src_sig4,
 src_sig5, src_sig6, src_sig7, src_sig8, src_sig9, src_sig10,
 src_sig11, src_sig12, src_sig13, src_sig14, src_sig15,
 src_out: STD_LOGIC;
begin
full_adder00 : full_adder PORT MAP(X => A(0),
												Y => B(0),
												S => Gout(0),
												Cin => Cin,
												Cout =>src_sig0 );

full_adder01 : full_adder PORT MAP(X => A(1),
												Y => B(1),
												S => Gout(1),
												Cin => Cin,
												Cout =>src_sig1);
												
full_adder02 : full_adder PORT MAP(X => A(2),
												Y => B(2),
												S => Gout(2),
												Cin => Cin,
												Cout =>src_sig2);

full_adder03 : full_adder PORT MAP(X => A(3),
												Y => B(3),
												S => Gout(3),
												Cin => Cin,
												Cout =>src_sig3);

full_adder04 : full_adder PORT MAP(X => A(4),
												Y => B(4),
												S => Gout(4),
												Cin => Cin,
												Cout =>src_sig4);

full_adder05 : full_adder PORT MAP(X => A(5),
												Y => B(5),
												S => Gout(5),
												Cin => Cin,
												Cout =>src_sig5);
												
full_adder06 : full_adder PORT MAP(X => A(6),
												Y => B(6),
												S => Gout(6),
												Cin => Cin,
												Cout =>src_sig6);

full_adder07 : full_adder PORT MAP(X => A(7),
												Y => B(7),
												S => Gout(7),
												Cin => Cin,
												Cout =>src_sig7);
												
full_adder08 : full_adder PORT MAP(X => A(8),
												Y => B(8),
												S => Gout(8),
												Cin => Cin,
												Cout =>src_sig8);

full_adder09 : full_adder PORT MAP(X => A(9),
												Y => B(9),
												S => Gout(9),
												Cin => Cin,
												Cout =>src_sig9);
												
full_adder10 : full_adder PORT MAP(X => A(10),
												Y => B(10),
												S => Gout(10),
												Cin => Cin,
												Cout =>src_sig10);

full_adder11 : full_adder PORT MAP(X => A(11),
												Y => B(11),
												S => Gout(11),
												Cin => Cin,
												Cout =>src_sig11);

full_adder12 : full_adder PORT MAP(X => A(12),
												Y => B(12),
												S => Gout(12),
												Cin => Cin,
												Cout =>src_sig12);

full_adder13 : full_adder PORT MAP(X => A(13),
												Y => B(13),
												S => Gout(13),
												Cin => Cin,
												Cout =>src_sig13);
												
full_adder14 : full_adder PORT MAP(X => A(14),
												Y => B(14),
												S => Gout(14),
												Cin => Cin,
												Cout =>src_sig14);

full_adder15 : full_adder PORT MAP(X => A(15),
												Y => B(15),
												S => Gout(15),
												Cin => Cin,
												Cout =>src_sig15);



end Behavioral;

