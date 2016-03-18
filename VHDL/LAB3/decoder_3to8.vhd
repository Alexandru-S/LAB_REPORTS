
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity decoder_3to8 is
    Port ( A0 : in  STD_LOGIC;
           A1 : in  STD_LOGIC;
           A2 : in  STD_LOGIC;
			  A3 : in  STD_LOGIC;
           Q0 : out  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q3 : out  STD_LOGIC;
           Q4 : out  STD_LOGIC;
           Q5 : out  STD_LOGIC;
           Q6 : out  STD_LOGIC;
			  Q7 : out  STD_LOGIC;
           Q8 : out  STD_LOGIC);
end decoder_3to8;

architecture Behavioral of decoder_3to8 is

begin
	Q0 <= ((	NOT A0) AND (NOT A1) AND (NOT A2) AND (NOT A3)) AFTER 5ns;
	Q1 <= ((	NOT A0) AND (NOT A1) AND A2 AND (NOT A2)) AFTER 5ns;
	Q2 <= ((	NOT A0) AND A1 AND (NOT A2) AND (NOT A2)) AFTER 5ns;
	Q3 <= ((	NOT A0) AND A1 AND A2 AND (NOT A2)) AFTER 5ns;
	Q4 <= (A0 AND (NOT A1) AND (NOT A2) AND (NOT A2)) AFTER 5ns;
	Q5 <= (A0 AND (NOT A1) AND A2 AND (NOT A2)) AFTER 5ns;
	Q6 <= (A0 AND A1 AND (NOT A2) AND (NOT A2)) AFTER 5ns;
	Q7 <= (A0 AND A1 AND A2 AND (NOT A2)) AFTER 5ns;
	Q8 <= A3 AFTER 5ns;
end Behavioral;

