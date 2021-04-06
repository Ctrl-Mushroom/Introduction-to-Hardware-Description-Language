library IEEE;
use IEEE.std_logic_1164.all;

entity nor_gate is

   port(
      a : in std_logic;
      b : in std_logic;
      Q : out std_logic);

end nor_gate;

architecture rtl of nor_gate is

   begin
      Q <= a nor b;

end rtl;