library IEEE;
use IEEE.std_logic_1164.all;

entity or_gate is

   port(
      a : in std_logic;
      b : in std_logic;
      Q : out std_logic);

end or_gate;

architecture rtl of or_gate is

   begin
      Q <= a or b;

end rtl;