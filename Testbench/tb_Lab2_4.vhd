library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity tb2_multiplexor is

end tb2_multiplexor;

architecture tb2 of tb2_multiplexor is

   component multiplexor
      port(	
         I0, I1, I2, I3 : in std_logic_vector(2 downto 0);
         Sel : in std_logic_vector(1 downto 0);
         Q : out std_logic_vector(2 downto 0));
   end component;

   signal T_I0, T_I1, T_I2, T_I3 : std_logic_vector(2 downto 0):="000";
   signal T_Q : std_logic_vector(2 downto 0);
   signal T_Sel : std_logic_vector(1 downto 0);

   begin
      UUT : multiplexor port map (T_I0, T_I1, T_I2, T_I3, T_Sel, T_Q);
	
   process		
      begin									 	
         T_I0 <= "111"; T_I1 <= "101"; T_I2 <= "010"; T_I3 <= "001";
         wait for 10 ns; T_Sel <= "00";
         wait for 10 ns; T_Sel <= "01";
         wait for 10 ns; T_Sel <= "10";
         wait for 10 ns; T_Sel <= "11";
         wait for 10 ns; T_Sel <= "UU";
         wait;
   end process;

end tb2;