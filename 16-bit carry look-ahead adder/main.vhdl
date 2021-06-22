--16-Bit Carry Look Adder

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CLA_16_bit is
port(
Cin : in STD_LOGIC;
x : in STD_LOGIC_VECTOR(15 downto 0);
y : in STD_LOGIC_VECTOR(15 downto 0);
s : out STD_LOGIC_VECTOR(15 downto 0)
);
end CLA_16_bit;

architecture CLA_16_bit_arch of CLA_16_bit is 
signal c : STD_LOGIC_VECTOR ( 4 downto 1);
signal pi : STD_LOGIC_VECTOR ( 3 downto 0);
signal gi : STD_LOGIC_VECTOR ( 3 downto 0);

Component CLA_4_bit is
port(
C : in STD_LOGIC;
Xin : in STD_LOGIC_VECTOR(3 downto 0);
Yin : in STD_LOGIC_VECTOR(3 downto 0);
Pi : out STD_LOGIC; 
Gi : out STD_LOGIC;
Sum : out STD_LOGIC_VECTOR(3 downto 0)
);
end Component; 

Component CLA_Logic is
port(
Cin : in STD_LOGIC;
P : in STD_LOGIC_VECTOR(3 downto 0);
G : in STD_LOGIC_VECTOR(3 downto 0);
C : out STD_LOGIC_VECTOR(4 downto 1)
);
end Component;

begin

-- enter your statements here -- 
L0 : CLA_Logic port map (Cin, pi, gi, c);
L1 : CLA_4_bit port map(Cin,x(3 downto 0), y(3 downto 0), pi(0), gi(0), s(3 downto 0));
L2 : CLA_4_bit port map(C(1), x(7 downto 4), y(7 downto 4), pi(1), gi(1), s(7 downto 4));
L3 : CLA_4_bit port map(C(2), x(11 downto 8), y(11 downto 8), pi(2), gi(2), s(11 downto 8));
L4 : CLA_4_bit port map(C(3), x(15 downto 12), y(15 downto 12), pi(3), gi(3), s(15 downto 12));

end CLA_16_bit_arch;
