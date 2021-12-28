library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--define first
package alu_package is

   constant interval : time := 8 ns;

   signal sig_a, sig_b, sig_Sel, sig_Res : std_logic_vector(1 downto 0);

   procedure load_data(signal a, b : out std_logic_vector(1 downto 0);
   signal Sel : out std_logic_vector(1 downto 0));						 	 	

   procedure check_data(signal Sel : out std_logic_vector(1 downto 0));
	
end ALU_package;

--put the procedures
package body alu_package is

   procedure load_data (signal a, b : out std_logic_vector(1 downto 0);

      signal Sel : out std_logic_vector(1 downto 0)) is
      begin
         a <= sig_a; b <= sig_b; Sel <= sig_Sel;
   end load_data;

   procedure check_data (signal Sel : out std_logic_vector(1 downto 0)) is
      begin
         Sel <= sig_Sel;
         if (sig_Sel = "00") then
            assert(sig_Res = (sig_a + sig_b))
	    report "Error detected in Addition"
	    severity warning;
         elsif (sig_Sel = "01") then
	    assert(sig_Res = (sig_a - sig_b))
	    report "Error detected in Subtraction"
	    severity warning;
         elsif (sig_Sel = "10") then
	    assert(sig_Res = (sig_a and sig_b))
	    report "AND Operation Error"
	    severity warning;
         elsif (sig_Sel = "11") then
	    assert(sig_Res = (sig_a or sig_b)) 
	    report "OR operation Error"
	    severity warning;
         end if;
   end check_data;

end alu_package;

--Test Bench
library IEEE;
use IEEE.std_logic_1164. all;
use work.alu_package.all;

entity tb2_alu is

end tb2_alu;

architecture tb2 of tb2_alu is

   component alu
      port(
         a, b, Sel : in std_logic_vector(1 downto 0);
         Res : out std_logic_vector(1 downto 0));
   end component;

   signal a, b, Res : std_logic_vector(1 downto 0):="00";
   signal Sel : std_logic_vector(1 downto 0);

   begin
      UUT : alu port map (a, b, Sel, Res);
	
   tb2_alu : process
      begin
         sig_a <= "10"; sig_b <= "01";
         sig_Sel <= "00";
         wait for 1 ns; load_data(a, b, Sel);
         wait for 1 ns; sig_Res <= Res;
         wait for INTERVAL; check_data(Sel);
         sig_Sel <= "01";
         wait for 1 ns; load_data(a, b, Sel);
         wait for 1 ns; sig_Res <= Res;
         wait for INTERVAL; check_data(Sel);
         sig_Sel <= "10";
         wait for 1 ns; load_data(a, b, Sel);
         wait for 1 ns; sig_Res <= Res;
         wait for INTERVAL; check_data(Sel);
         sig_Sel <= "11";
         wait for 1 ns; load_data(a, b, Sel);
         wait for 1 ns; sig_Res <= Res;
         wait for INTERVAL; check_data(Sel);
         wait;
   end process;

end tb2;

configuration config_tb2 of tb2_alu is

   for tb2
   end for;

end config_tb2;