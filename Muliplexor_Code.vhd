library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexor is

   port(
      I0, I1, I2, I3 : in std_logic_vector(2 downto 0);
      Sel : in std_logic_vector(1 downto 0);
      Q : out std_logic_vector(2 downto 0));

end multiplexor;

architecture rtl of multiplexor is

   begin
      process (I0, I1, I2, I3, Sel)
         begin
            case Sel is
               when "00" => Q <= I0;
               when "01" => Q <= I1;
               when "10" => Q <= I2;
               when "11" => Q <= I3;
               when others => Q <= "ZZZ";
            end case;
      end process;

end rtl;