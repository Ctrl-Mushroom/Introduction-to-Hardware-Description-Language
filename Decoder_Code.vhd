library IEEE;
use IEEE.std_logic_1164.all;

entity decoder is

   port(
      I : in std_logic_vector(1 downto 0);
      Q : out std_logic_vector(3 downto 0));

end decoder;

architecture rtl of decoder is

   begin
      Q <= "0001"
      when I = "00" else "0010"
      when I = "01" else "0100"
      when I = "10" else "1000"
      when I = "11" else "XXXX";

end rtl;