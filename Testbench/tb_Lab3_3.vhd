library IEEE;
use IEEE.std_logic_1164.all;

entity tb3_jkFliFlop is

end tb3_jkFliFlop;

architecture tb3 of tb3_jkFliFlop is

   component jkFliFlop is
      port(
         clock, j, k, reset : in std_logic;
         Q, Qbar : out std_logic);
   end component;

   signal T_clock, T_j, T_k, T_reset, T_Q, T_Qbar : std_logic;

   begin
      UUT : jkFliFlop port map(T_clock, T_j, T_k, T_reset, T_Q, T_Qbar);

   process
      begin
         T_clock <= '0';
         wait for 10 ns; T_clock <= '1';
         wait for 10 ns;
   end process;

   process
      variable err_cnt : integer := 0;
      begin
         T_reset <= '1';
         wait for 10 ns; T_reset <= '0';
         wait for 10 ns;
         T_j <= '0'; T_k <= '1';
         wait for 10 ns; assert(T_Q = '0') report "Error(1)"
         severity error;
         if(T_Q/= '0') then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; T_j <= '1'; T_k <= '0';
         wait for 10 ns; assert(T_Q = '1') report "Error(2)"
         severity error;
         if(T_Q/= '0') then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; T_j <= '1'; T_k <= '1';
         wait for 10 ns; assert(T_Q = '0') report "Error(3)"
         severity error;
         if(T_Q/= '0') then
            err_cnt := err_cnt + 1;
         end if;

         if(err_cnt = 0) then
            assert (false) report "Success"
            severity note;
         else
            assert (true) report "Something went wrong"
            severity error;
         end if;
         wait;
   end process;

end tb3;

configuration config_tb3 of tb3_jkFliFlop is

   for tb3
   end for;

end config_tb3;