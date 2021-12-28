library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity tb3_sReg is

end tb3_sReg;

architecture tb3 of tb3_sReg is

   component sReg is
      port(
         I, clock, shift : in std_logic;
         Q : out std_logic);
   end component;

   signal T_I, T_clock, T_shift, T_Q : std_logic;

   begin
      UUT : sReg port map(T_I, T_clock, T_shift, T_Q);

   --clock
   process
      begin
         T_clock <= '0';
         wait for 10 ns; T_clock <= '1';
         wait for 10 ns;
   end process;

   --test
   process
      variable err_cnt : integer := 0;
      begin
         T_shift <= '1'; T_I <= '0'; --start shift
         wait for 10 ns; T_I <= '1'; --1st/2nd bit input
         wait for 10 ns; T_I <= '0'; --3rd bit       "
         wait for 10 ns; T_I <= '1'; --4th bit       "
         wait;
   end process;

   process
      variable err_cnt : integer := 0;
      begin
         wait for 10 ns; assert(T_Q = '0') report "Failed(1)"
         severity error;
         if(T_Q/= '0') then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; assert(T_Q = '0') report "Failed(2)"
         severity error;
         if(T_Q/= '0') then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; assert(T_Q = '1') report "Failed(3)"
         severity error;
         if(T_Q/= '1') then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; assert(T_Q = '1') report "Failed(4)"
         severity error;
         if(T_Q/= '1') then
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

configuration config_tb3 of tb3_sReg is

   for tb3
   end for;

end config_tb3;