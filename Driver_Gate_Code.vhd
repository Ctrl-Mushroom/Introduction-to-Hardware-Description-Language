library IEEE;
use IEEE.std_logic_1164.all;

entity driver_gate is

   port(
      a : in std_logic;
      Q : out std_logic);

end driver_gate;

architecture rtl of driver_gate is

   begin
      Q <= a;

end rtl;