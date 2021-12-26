library IEEE;
use IEEE.std_logic_1164.all;

entity cmb_ckt is

   port(
      a, b, c : in std_logic;
      Q : out std_logic);

end cmb_ckt;

architecture rtl of cmb_ckt is

   signal and1 : std_logic;

   begin
      and1 <= a and b;
      Q <= and1 or c;

end rtl;