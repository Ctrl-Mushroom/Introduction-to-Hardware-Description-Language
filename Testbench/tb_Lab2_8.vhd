library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tb2_multiplier is

end tb2_multiplier;

architecture tb2 of tb2_multiplier is

   component multiplier is
      port(
         num1, num2 : in std_logic_vector(1 downto 0);
         product : out std_logic_vector(3 downto 0));
   end component;

   signal T_num1, T_num2 : std_logic_vector(1 downto 0);
   signal T_product : std_logic_vector(3 downto 0);

   begin
      UUT : multiplier port map (T_num1, T_num2, T_product);

   tb2_multiplier : process
      begin
	T_num1 <= "11"; T_num2 <= "11";
	wait for 20 ns; assert(T_product = "1001") report "Error detected"
	severity warning;
        T_num1 <= "01"; T_num2 <= "00";
	wait for 20 ns; assert(T_product = "0000") report "Error detected"
	severity warning;
	T_num1 <= "10"; T_num2 <= "10";
	wait for 20 ns; assert(T_product = "0100") report "Error detected"
	severity warning;
	T_num1 <= "11"; T_num2 <= "10";
	wait for 20 ns; assert(T_product = "0110") report "Error detected"
	severity warning;
	wait;
   end process;

end tb2;

configuration config_tb2 of tb2_multiplier is

	for tb2
	end for;

end config_tb2;