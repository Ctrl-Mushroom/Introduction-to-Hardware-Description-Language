library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity alu is

   port(
      a, b, Sel: in std_logic_vector(1 downto 0);
      Res : out std_logic_vector(1 downto 0));

end alu;

architecture rtl of alu is

   begin
      process(a, b, Sel)
         begin
            case Sel is
            when "00" => Res <= a + b;
            when "01" => Res <= a + (not b) + 1;
            when "10" => Res <= a and b;
            when "11" => Res <= a or b;
            when others => Res <= "XX";
            end case;
      end process;

end rtl;