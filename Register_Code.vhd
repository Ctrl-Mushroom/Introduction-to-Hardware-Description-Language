library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity reg is

   generic(n : natural := 2);

   port(
      I : in std_logic_vector(n-1 downto 0);
      clock, load, clear : in std_logic;
      Q : out std_logic_vector(n-1 downto 0));

end reg;

architecture rtl of reg is

   signal Q_tmp : std_logic_vector(n-1 downto 0);

   begin
      process(I, clock, load, clear)
      begin
         if clear = '0' then
            Q_tmp <= (Q_tmp'range => '0');
         elsif(clock = '1' and clock'event) then
            if load = '1' then
               Q_tmp <= I;
            end if;
         end if;
      end process;

   Q <= Q_tmp;

end rtl;