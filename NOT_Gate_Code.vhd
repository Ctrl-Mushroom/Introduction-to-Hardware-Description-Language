library IEEE;
use IEEE.std_logic_1164.all;

entity not_gate is

   port(
      a : in std_logic;
      Q : out std_logic);

end not_gate;

architecture rtl of not_gate is

   begin
      Q <= not a;

end rtl;