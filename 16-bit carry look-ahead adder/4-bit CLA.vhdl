--4-Bit Carry Lookahead Adder

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CLA_4_bit is
port(
C : in STD_LOGIC;
Xin : in STD_LOGIC_VECTOR(3 downto 0);
Yin : in STD_LOGIC_VECTOR(3 downto 0);
Pi : out STD_LOGIC; 
Gi : out STD_LOGIC;
Sum : out STD_LOGIC_VECTOR(3 downto 0)
);
end CLA_4_bit;


architecture CLA_4_bit_Arch of CLA_4_bit is 
signal Pi : STD_LOGIC_VECTOR (3 downto 0);
signal Gi : STD_LOGIC_VECTOR (3 downto 0);
signal Ci : STD_LOGIC_VECTOR (4 downto 1);

Component Bit_Cell is 
port(
x : in STD_LOGIC;
y : in STD_LOGIC;
ci : in STD_LOGIC;
p : out STD_LOGIC;
g : out STD_LOGIC;
s : out STD_LOGIC
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
U0 : CLA_Logic port map (C, Pi, Gi, Ci);
U1 : Bit_Cell port map (Xin(0), Yin(0), C, Pi(0), Gi(0), Sum(0));
U2 : Bit_Cell port map (Xin(1), Yin(1), Ci(1), Pi(1), Gi(1), Sum(1)); 
U3 : Bit_Cell port map (Xin(2), Yin(2), Ci(2), Pi(2), Gi(2), Sum(2));
U4 : Bit_Cell port map (Xin(3), Yin(3), Ci(3), Pi(3), Gi(3), Sum(3)); 
Pi <= Pi(3) and Pi(2) and Pi(1) and Pi(0);
Gi <= Gi(3) or (Pi(3) and Gi(2)) or (Pi(3) and Pi(2) and Gi(1)) or (Pi(3) and Pi(2) and Pi(1) and Gi(0));

end CLA_4_bit_Arch;
