library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity tb3_reg is

end tb3_reg;

architecture tb3 of tb3_reg is

   component reg is
      port(
         I : in std_logic_vector(1 downto 0);
         clock, load, clear : in std_logic;
         Q : out std_logic_vector(1 downto 0));
   end component;

   signal T_clock, T_load, T_clear : std_logic;
   signal T_I, T_Q : std_logic_vector(1 downto 0);

   begin
      UUT : reg port map(T_I, T_clock, T_load, T_clear, T_Q);

   process
      begin
         T_clock <= '0';
         wait for 10 ns; T_clock <= '1';
         wait for 10 ns;
   end process;

   process
      variable err_cnt : integer := 0;
      begin
         T_I <= "10"; T_load <= '0'; T_clear <= '1';
         wait for 10 ns; T_load <= '1';
         wait for 10 ns; assert(T_Q = "10") report "Fail(1)"
         severity error;
         if(T_Q/= T_I) then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; T_load <= '0';
         wait for 10 ns; assert(T_Q = "10") report "Fail(2)"
         severity error;
         if(T_Q/= T_I) then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; T_load <= '0';
         wait for 10 ns; assert(T_Q = "00") report "Fail(3)"
         severity error;
         if(T_Q/= T_I) then
            err_cnt := err_cnt + 1;
         end if;
         wait for 10 ns; T_load <= '1';
         wait for 10 ns; assert(T_Q = "00") report "Fail(4)"
         severity error;
         if(T_Q/= T_I) then
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

configuration config_tb3 of tb3_reg is

   for tb3
   end for;

end config_tb3;