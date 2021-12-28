library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity tb3_counter is

end tb3_counter;

architecture tb3 of tb3_counter is

   component counter is
      port(
         clock, clear, count : in std_logic;
         Q : out std_logic_vector(1 downto 0));
   end component;

   signal T_clock, T_clear, T_count : std_logic;
   signal T_Q : std_logic_vector(1 downto 0);

   begin
      UUT : counter port map(T_clock, T_clear, T_count, T_Q);

   process
      begin
         T_clock <= '0';
         wait for 10 ns; T_clock <= '1';
         wait for 10 ns;
   end process;

   process
      variable err_cnt : integer := 0;
      begin
         T_clear <= '1'; T_count <= '1';
         wait for 10 ns; T_clear <= '0';
         wait for 10 ns; assert (T_Q = 1) report "Failed(1)"
         severity error;
         if(T_Q/= 1) then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; assert (T_Q = 2) report "Failed(2)"
         severity error;
         if(T_Q/= 2) then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; assert (T_Q = 3) report "Failed(3)"
         severity error;
         if(T_Q/= 3) then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; assert (T_Q = 0) report "Failed(4)"
         severity error;
         if(T_Q/= 0) then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; assert (T_Q = 1) report "Failed(5)"
         severity error;
         if(T_Q/= 0) then
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

configuration config_tb3 of tb3_counter is

   for tb3
   end for;

end config_tb3;