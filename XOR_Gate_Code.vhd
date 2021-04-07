library IEEE;
use IEEE.std_logic_1164.all;

entity xor_gate is

   port(
      a : in std_logic;
      b : in std_logic;
      Q : out std_logic);

end xor_gate;

architecture rtl of xor_gate is

   begin
      Q <= a xor b;

end rtl;