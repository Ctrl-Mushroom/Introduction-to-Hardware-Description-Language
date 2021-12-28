library IEEE;
use IEEE.std_logic_1164.all;

entity ckt3d3 is

   port(
      a, b, c, d : in std_logic;
      Q_1, Q_2 : out std_logic);

end ckt3d3;

architecture rtl of ckt3d3 is

   signal q1, q2, q3 : std_logic;

   begin
      q1 <= not b;
      q2 <= a or q1;
      q3 <= c or d;
      Q_1 <= q2 or q3;
      Q_2 <= q2 or q3;

end rtl;

--TestBench
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ckt3d3 is

end tb_ckt3d3;

architecture tb of tb_ckt3d3 is

   component ckt3d3 is
      port(
         a, b, c, d : in std_logic;
         Q_1, Q_2 : out std_logic);
   end component;

   signal a_t, b_t, c_t, d_t, Q_1_t, Q_2_t : std_logic;

   begin
      UUT : ckt3d3 port map (a_t, b_t, c_t, d_t, Q_1_t, Q_2_t);

   tb_ckt3d3 : process
      begin
         a_t <= '1'; b_t <= '1'; c_t <= '1'; d_t <= '0';
         wait;
   end process;

end tb;

--Angelbert Quiliza, BSCpE 3-1