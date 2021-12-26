library IEEE;
use IEEE.std_logic_1164.all;

entity dFliFlop is

   port(
      data_in, clock : in std_logic;
      data_out : out std_logic);

end dFliFlop;

architecture rtl of dFliFlop is

   begin
      process(data_in, clock)
      begin
         if(clock = '1' and clock'event) then
            data_out <= data_in;
         end if;
      end process;

end rtl;