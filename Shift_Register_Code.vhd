library IEEE;
use IEEE.std_logic_1164.all;

entity sReg is

   port(
      I, clock, shift : in std_logic;
      Q : out std_logic);

end sReg;

architecture rtl of sReg is

   signal S : std_logic_vector(2 downto 0) := "111";

   begin
      process(I, clock, shift, S)
         begin
            if clock'event and clock = '1' then
               if shift = '1' then
                  S <= I & S(2 downto 1);
               end if;
            end if;
      end process;

   Q <= S(0);

end rtl;