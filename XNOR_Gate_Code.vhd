library IEEE;
use IEEE.std_logic_1164.all;

entity xnor_gate is

   port(
      a : in std_logic;
      b : in std_logic;
      Q : out std_logic);

end xnor_gate;

architecture rtl of xnor_gate is

   begin
      Q <= a xnor b;

end rtl;