library IEEE;
use IEEE.std_logic_1164.all;

entity tristate is

   port(
      d_in, d_in1 : in std_logic_vector(3 downto 0);
      en : in std_logic;
      d_out : out std_logic_vector(3 downto 0));

end tristate;

architecture rtl of tristate is

   begin
      process (d_in, d_in1, en)
         begin
            if en = '1' then d_out <= d_in;
            else d_out <= "ZZZZ";
            end if;
      end process;

end rtl;