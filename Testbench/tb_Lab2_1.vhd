library IEEE;
use IEEE.std_logic_1164.all;

entity tb2_cmb_ckt is

end tb2_cmb_ckt;

architecture tb2 of tb2_cmb_ckt  is

   component cmb_ckt is
      port(
         a, b, c : in std_logic;
         Q : out std_logic);
   end component;

   signal a_t, b_t, c_t : std_logic;

   begin
      UUT : cmb_ckt port map (a_t, b_t, c_t);

   tb2_cmb_ckt : process
      begin
         a_t <= '0'; b_t <= '0'; c_t <= '0';
         wait for 20 ns; a_t <= '0'; b_t <= '1'; c_t <= '0';
         wait for 20 ns; a_t <= '1'; b_t <= '0'; c_t <= '0';
         wait for 20 ns; a_t <= '1'; b_t <= '1'; c_t <= '0';
         wait for 20 ns; a_t <= '0'; b_t <= '0'; c_t <= '1';
         wait for 20 ns; a_t <= '0'; b_t <= '1'; c_t <= '1';
         wait for 20 ns; a_t <= '1'; b_t <= '0'; c_t <= '1';
         wait for 20 ns; a_t <= '1'; b_t <= '1'; c_t <= '1';
         wait;
      end process;

end tb2;