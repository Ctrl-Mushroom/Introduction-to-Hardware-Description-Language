library IEEE;
use IEEE.std_logic_1164.all;

entity ckt4d1 is

   port(
      A, B, C, D, E : in std_logic_vector(0 downto 0);
      dis1, dis2, dis3, disx : out std_logic_vector(6 downto 0));

end ckt4d1;

architecture rtl of ckt4d1 is

   signal n, n1, n2, n3, n4, n5, n7, n8, n9 : std_logic_vector(0 downto 0);

   begin
      n1 <= not D;
         n5 <= not n1;
      n2 <= not C;
         n4 <= not n2;
      n3 <= not B;
      n7 <= n1 and n2;
      n8 <= n5 and n2;
      n9 <= n4 and n3;

      n <= n7 and E;

   -- Add-on display --
   process(A)
      begin case A is
         when "1" => disx <= "1001111"; --E-empty
         when others => disx <= "0000000";
      end case;
   end process;
   -- Add-on display --

   process(n)
      begin case n is
         when "1" => dis1 <= "1000111"; --F-full
         when others => dis1 <= "0000000";
      end case;
   end process;

   process(n8)
      begin case n8 is
         when "1" => dis2 <= "0110111"; --H-high
         when others => dis2 <= "0000000";
      end case;
   end process;

   process(n9)
      begin case n9 is
         when "1" => dis3 <= "0001110"; --L-low
         when others => dis3 <= "0000000";
      end case;
   end process;

end rtl;

--TestBench
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ckt4d1 is

end tb_ckt4d1;

architecture tb of tb_ckt4d1 is

   component ckt4d1 is
      port(
         A, B, C, D, E : in std_logic_vector(0 downto 0);
         dis1, dis2, dis3, disx : out std_logic_vector(6 downto 0));
   end component;

   signal A_t, B_t, C_t, D_t, E_t : std_logic_vector(0 downto 0);
   signal dis1_t, dis2_t, dis3_t, disx_t : std_logic_vector(6 downto 0);

   begin
      UUT : ckt4d1 port map (A_t, B_t, C_t, D_t, E_t, dis1_t, dis2_t, dis3_t, disx_t);

   tb_ckt4d1 : process
      begin
         A_t <= "0"; B_t <= "0"; C_t <= "0"; D_t <= "0"; E_t <= "0";
         wait for 20 ns; A_t <= "1"; B_t <= "0"; C_t <= "0"; D_t <= "0"; E_t <= "0";
         wait for 20 ns; A_t <= "1"; B_t <= "1"; C_t <= "0"; D_t <= "0"; E_t <= "0";
         wait for 20 ns; A_t <= "1"; B_t <= "0"; C_t <= "1"; D_t <= "0"; E_t <= "0";
         wait for 20 ns; A_t <= "1"; B_t <= "0"; C_t <= "0"; D_t <= "1"; E_t <= "0";
         wait for 20 ns; A_t <= "1"; B_t <= "0"; C_t <= "0"; D_t <= "0"; E_t <= "1";
         wait;
   end process;

end tb;

--Angelbert Quiliza, BSCpE 3-1