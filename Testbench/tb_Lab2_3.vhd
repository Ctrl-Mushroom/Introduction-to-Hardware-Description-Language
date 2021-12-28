library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity tb2_decoder is	

end tb2_decoder;

architecture tb2 of tb2_decoder is

   component decoder
      port(	
         I : in std_logic_vector(1 downto 0);
         Q : out std_logic_vector(3 downto 0));
   end component;

   signal T_I: std_logic_vector(1 downto 0):="00";
   signal T_Q: std_logic_vector(3 downto 0);

   begin
      UUT : decoder port map (T_I, T_Q);

   tb2 : process
      begin		
         wait for 10 ns; T_I <= "00";
         wait for 10 ns; T_I <= "01";
         wait for 10 ns; T_I <= "10";
         wait for 10 ns; T_I <= "11";
         wait for 10 ns; T_I <= "UU";
         wait;
   end process;

end tb2;