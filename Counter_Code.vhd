library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity counter is

   generic(n : natural := 2);

   port(
      clock, clear, count : in std_logic;
      Q : out std_logic_vector(n-1 downto 0));

end counter;

architecture rtl of counter is

   signal Pre_Q : std_logic_vector(n-1 downto 0);

   begin
      process(clock, clear, count)
         begin
            if clear = '1' then
               Pre_Q <= Pre_Q - Pre_Q;
            elsif(clock = '1' and clock'event) then
               if count = '1' then
                  Pre_Q <= Pre_Q + 1;
               end if;
            end if;
      end process;

   Q <= Pre_Q;

end rtl;