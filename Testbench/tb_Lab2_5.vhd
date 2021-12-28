library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tb2_adder is

end tb2_adder;

architecture tb2 of tb2_adder is

   component adder is
      port(
         a, b : in std_logic_vector(1 downto 0);
         carry : out std_logic;
         sum : out std_logic_vector(1 downto 0));
   end component;

   signal a, b, sum : std_logic_vector(1 downto 0);
   signal carry : std_logic;

   begin
      UUT: adder port map (a, b, carry, sum);
	
   tb2_adder : process
      begin
         a <= "00"; b <= "00"; wait for 10 ns;
         a <= "11"; b <= "11"; wait for 10 ns;
         a <= "01"; b <= "10"; wait for 10 ns;
         a <= "10"; b <= "01"; wait for 10 ns;
         a <= "01"; b <= "01"; wait for 10 ns;
         a <= "ZZ"; b <= "ZZ"; wait for 10 ns;
         wait;
   end process;

end tb2;