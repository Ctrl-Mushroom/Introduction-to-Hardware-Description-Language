library IEEE;
use IEEE.std_logic_1164.all;

entity smpLatch is

   port(
      data_in, enable : in std_logic;
      data_out : out std_logic);

end smpLatch;

architecture rtl of smpLatch is

   begin
      process(data_in, enable)
         begin
            if(enable = '1') then
               data_out <= data_in;
            end if;
      end process;

end rtl;