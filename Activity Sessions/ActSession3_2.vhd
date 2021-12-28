library IEEE;
use IEEE.std_logic_1164.all;

entity ckt3d2 is

   port(
      a, b, c, d : in std_logic;
      Q : out std_logic);

end ckt3d2;

architecture rtl of ckt3d2 is

   signal q1, q2, q3 : std_logic;

   begin
      q1 <= not b;
      q2 <= a or q1;
      q3 <= c or d;
      Q <= q2 or q3;

end rtl;

--TestBench
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ckt3d2 is

end tb_ckt3d2;

architecture tb of tb_ckt3d2 is

   component ckt3d2 is
      port(
         a, b, c, d : in std_logic;
         Q : out std_logic);
   end component;

   signal a_t, b_t, c_t, d_t : std_logic;

   begin
      UUT : ckt3d2 port map (a_t, b_t, c_t, d_t);

   tb_ckt3d2 : process
      begin
         wait for 10 ns; a_t <= '0'; b_t <= '0'; c_t <= '1'; d_t <= '1';
         wait for 10 ns; a_t <= '0'; b_t <= '1'; c_t <= '1'; d_t <= '0';
         wait for 10 ns; a_t <= '1'; b_t <= '0'; c_t <= '0'; d_t <= '1';
         wait for 10 ns; a_t <= '1'; b_t <= '1'; c_t <= '1'; d_t <= '1';
         wait;
   end process;

end tb;

--Angelbert Quiliza, BSCpE 3-1