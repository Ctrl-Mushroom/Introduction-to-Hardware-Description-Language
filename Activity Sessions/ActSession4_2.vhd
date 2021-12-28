library IEEE;
use IEEE.std_logic_1164.all;

entity ckt4d2 is

   port(
      s1, s2, s3, s4, s5, s6, s7, s8 : in std_logic;
      led1, led2, led3, led4, speaker : out std_logic);

end ckt4d2;

architecture rtl of ckt4d2 is

   signal ic11, ic12, ic13, ic14, ic21, ic22, ic23, ic24, ic31, ic32, ic33, ic34, ic41, ic42 : std_logic;

   begin
      ic11 <= not s1;
         ic21 <= ic11 xor s2;
         led1 <= ic11 xor s2;
            ic31 <= ic21 nand ic22;
      ic12 <= not s3;
         ic22 <= ic12 xor s4;
         led2 <= ic12 xor s4;
      ic13 <= not s5;
         ic23 <= ic13 xor s6;
         led3 <= ic13 xor s6;
            ic31 <= ic23 nand ic24;
      ic14 <= not s7;
         ic24 <= ic14 xor s8;
         led4 <= ic14 xor s8;

      ic33 <= ic31 nand ic32;
         ic34 <= ic33 nand ic33;
            ic42 <= ic34 nor ic34;
               speaker <= ic42 nor ic42;

end rtl;

--TestBench
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ckt4d2 is

end tb_ckt4d2;

architecture tb of tb_ckt4d2 is

   component ckt4d2 is
      port(
         s1, s2, s3, s4, s5, s6, s7, s8 : in std_logic;
         led1, led2, led3, led4, speaker : out std_logic);
   end component;

   signal s1_t, s2_t, s3_t, s4_t, s5_t, s6_t, s7_t, s8_t, led1_t, led2_t, led3_t, led4_t, speaker_t : std_logic;

   begin
      UUT : ckt4d2 port map (s1_t, s2_t, s3_t, s4_t, s5_t, s6_t, s7_t, s8_t, led1_t, led2_t, led3_t, led4_t, speaker_t);

   tb_ckt4d2 : process
      begin
         s1_t <= '0'; s2_t <= '0'; s3_t <= '0'; s4_t <= '0'; s5_t <= '0'; s6_t <= '0'; s7_t <= '0'; s8_t <= '0';
         wait for 20 ns; s1_t <= '1'; s2_t <= '0'; s3_t <= '1'; s4_t <= '0'; s5_t <= '1'; s6_t <= '0'; s7_t <= '1'; s8_t <= '0';
         wait for 20 ns; s1_t <= '0'; s2_t <= '1'; s3_t <= '0'; s4_t <= '1'; s5_t <= '0'; s6_t <= '1'; s7_t <= '0'; s8_t <= '1';
         wait for 20 ns; s1_t <= '1'; s2_t <= '1'; s3_t <= '1'; s4_t <= '1'; s5_t <= '1'; s6_t <= '1'; s7_t <= '1'; s8_t <= '1';
         wait;
   end process;

end tb;

--Angelbert Quiliza, BSCpE 3-1