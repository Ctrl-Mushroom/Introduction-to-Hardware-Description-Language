library IEEE;
use IEEE.std_logic_1164.all;

entity tb3_dFliFlop is

end tb3_dFliFlop;

architecture tb3 of tb3_dFliFlop is

   component dFliFlop is
      port(
         data_in, clock : in std_logic;
         data_out : out std_logic);
   end component;

   signal T_data_in, T_clock, T_data_out : std_logic;

   begin
      UUT : dFliFlop port map(T_data_in, T_clock, T_data_out);

   process
      begin
         T_clock <= '0';
         wait for 10 ns; T_clock <= '1';
         wait for 10 ns;
   end process;

   process
      variable err_cnt : integer := 0;
      begin
         T_data_in <= '1';
         wait for 10 ns; assert(T_data_out = '1') report "Error(1)"
         severity error;
         if(T_data_out/= '1') then
            err_cnt := err_cnt + 1;
         end if;
         T_data_in <= '0';
         wait for 10 ns; assert(T_data_out = '0') report "Error(2)"
         severity error;
         if(T_data_out/= '0') then
            err_cnt := err_cnt + 1;
         end if;
         T_data_in <= '1';
         wait for 10 ns; assert(T_data_out = '0') report "Error(3)"
         severity error;
         if(T_data_out/= '0') then
            err_cnt := err_cnt + 1;
         end if;
         T_data_in <= '0';
         wait for 10 ns; assert(T_data_out = '0') report "Error(4)"
         severity error;
         if(T_data_out/= '0') then
            err_cnt := err_cnt + 1;
         end if;
         T_data_in <= '1';
         wait for 10 ns; assert(T_data_out = '1') report "Error(5)"
         severity error;
         if(T_data_out/= '0') then
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

configuration config_tb3 of tb3_dFliFlop is

   for tb3
   end for;

end config_tb3;