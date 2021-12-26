library IEEE;
use IEEE.std_logic_1164.all;

entity comparator is

   generic(n : natural :=2);

   port(
      a, b : in std_logic_vector(n-1 downto 0);
      less, equal, greater : out std_logic);

end comparator;

architecture rtl of comparator is

   begin
      process(a, b)
         begin
            if (a < b) then
               less <= '1';
               equal <= '0';
               greater <= '0';
            elsif (a = b) then
               less <= '0';
               equal <= '1';
               greater <= '0';
            else
               less <= '0';
               equal <= '0';
               greater <= '1';
            end if;
      end process;

end rtl;