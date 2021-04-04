library IEEE;
use IEEE.std_logic_1164.all;

entity and_gate is

   port(
      a : in std_logic;
      b : in std_logic;
      Q : out std_logic);

end and_gate;

architecture rtl of and_gate is

   begin
      Q <= a and b;

end rtl;