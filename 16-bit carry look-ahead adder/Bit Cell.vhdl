--Bit Cell
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Bit_Cell is
port(
x : in STD_LOGIC;
y : in STD_LOGIC;
ci : in STD_LOGIC;
p : out STD_LOGIC;
g : out STD_LOGIC;
s : out STD_LOGIC
);

end Bit_Cell;

architecture Bit_Cell_Arch of Bit_Cell is
begin

-- enter your statements here -- 
s <= x xor y xor ci;
p <= x xor y; 
g <= x and y;

end Bit_Cell_Arch;
