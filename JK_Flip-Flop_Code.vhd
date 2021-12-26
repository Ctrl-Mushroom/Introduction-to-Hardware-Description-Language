library IEEE;
use IEEE.std_logic_1164.all;

entity jkFliFlop is

   port(
      clock, j, k, reset : in std_logic;
      Q, Qbar : out std_logic);

end jkFliFlop;

architecture rtl of jkFliFlop is

   signal state : std_logic;
   signal input : std_logic_vector(1 downto 0);

   begin
      input <= j & k;
      p: process(clock, reset) is
      begin
         if(reset= '1') then
            state <= '0';
         elsif(rising_edge(clock)) then
            case(input) is
               when "11" => state <= not state;
               when "10" => state <= '1';
               when "01" => state <= '0';
               when others => null;
            end case;
         end if;
      end process;

   Q <= state;
   Qbar <= not state;

end rtl;