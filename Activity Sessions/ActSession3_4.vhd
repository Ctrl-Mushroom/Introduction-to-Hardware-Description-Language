library IEEE;
use IEEE.std_logic_1164.all;

entity ckt3d4 is

   port(
      a, b, c, d, e : in std_logic;
      Q_1, Q_2 : out std_logic);

end ckt3d4;

architecture rtl of ckt3d4 is

   signal q1, q2, q3 : std_logic;

   begin
      q1 <= a xor b;
      q2 <= c xor d;
      Q_1 <= q1 xor q2;
      q3 <= q1 xor q2;
      Q_2 <= e xor q3;

end rtl;

--TestBench
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ckt3d4 is

end tb_ckt3d4;

architecture tb of tb_ckt3d4 is

   component ckt3d4 is
      port(
         a, b, c, d, e : in std_logic;
         Q_1, Q_2 : out std_logic);
   end component;

   signal a_t, b_t, c_t, d_t, e_t, Q_1_t, Q_2_t : std_logic;

   begin
      UUT : ckt3d4 port map (a_t, b_t, c_t, d_t, e_t, Q_1_t, Q_2_t);

   tb_ckt3d4 : process
      begin
         a_t <= '0'; b_t <= '0'; c_t <= '0'; d_t <= '0'; e_t <= '0';
         wait for 10 ns; a_t <= '1'; b_t <= '1'; c_t <= '1'; d_t <= '0'; e_t <= '0';
         wait for 10 ns; a_t <= '1'; b_t <= '0'; c_t <= '1'; d_t <= '1'; e_t <= '0';
         wait for 10 ns; a_t <= '1'; b_t <= '0'; c_t <= '1'; d_t <= '0'; e_t <= '1';
         wait for 10 ns; a_t <= '1'; b_t <= '1'; c_t <= '1'; d_t <= '1'; e_t <= '1';
         wait;
   end process;

end tb;

--Angelbert Quiliza, BSCpE 3-1