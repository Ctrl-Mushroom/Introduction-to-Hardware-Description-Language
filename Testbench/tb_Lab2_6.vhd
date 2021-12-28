library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tb2_comparator is

end tb2_comparator;

architecture tb2 of tb2_comparator is

   component comparator
      port(	
         a, b :	in std_logic_vector(1 downto 0);
         less, equal, greater : out std_logic);
   end component;

   signal a, b: std_logic_vector(1 downto 0):="00";
   signal less, equal, greater: std_logic;

   begin
      UUT: comparator port map (a, b, less, equal, greater);
	
   tb2_comparator : process
      begin		
         a <= "11"; b <= "00";
         for i in 0 to 2 loop
            wait for 10 ns; b <= b + '1';	    		
         end loop;
         a <= "00"; b <= "01";
         for i in 0 to 2 loop
            wait for 10 ns; b <= b + '1';	   
         end loop;
         a <= "01"; b <= "01";
         wait for 10 ns;
         wait;
   end process;

end tb2;