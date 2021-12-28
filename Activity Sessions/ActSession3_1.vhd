library IEEE;
use IEEE.std_logic_1164.all;

entity ckt3d1 is

   port(
      a, b, c, d : in std_logic;
      Q : out std_logic);

end ckt3d1;

architecture rtl of ckt3d1 is

   signal q1, q2 : std_logic;

   begin
      q1 <= a nand b;
      q2 <= c nand d;
      Q <= q1 nand q2;

end rtl;

--TestBench
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ckt3d1 is

end tb_ckt3d1;

architecture tb of tb_ckt3d1 is

   component ckt3d1 is
      port(
         a, b, c, d : in std_logic;
         Q : out std_logic);
   end component;

   signal a_t, b_t, c_t, d_t : std_logic;

   begin
      UUT : ckt3d1 port map (a_t, b_t, c_t, d_t);

   tb_ckt3d1 : process
      begin
         wait for 10 ns; a_t <= '0'; b_t <= '0'; c_t <= '1'; d_t <= '1';
         wait for 10 ns; a_t <= '0'; b_t <= '1'; c_t <= '1'; d_t <= '0';
         wait for 10 ns; a_t <= '1'; b_t <= '0'; c_t <= '0'; d_t <= '1';
         wait for 10 ns; a_t <= '1'; b_t <= '1'; c_t <= '1'; d_t <= '1';
         wait;
   end process;

end tb;

--Angelbert Quiliza, BSCpE 3-1