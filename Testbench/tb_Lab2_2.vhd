library IEEE;
use IEEE.std_logic_1164.all;

entity tb2_tristate is

end tb2_tristate;

architecture tb2 of tb2_tristate  is

   component tristate is
      port(
         d_in, d_in1 : in std_logic_vector(3 downto 0);
         en : in std_logic;
         d_out : out std_logic_vector(3 downto 0));
   end component;

   signal T_d_in, T_d_in1, T_d_out : std_logic_vector(3 downto 0);
   signal T_en : std_logic;

   begin
      UUT : tristate port map (T_d_in, T_d_in1, T_en, T_d_out);

   tb2_tristate : process
      begin
         T_d_in <= "0000"; T_d_in1 <= "0000"; T_en <= '0';
         wait for 20 ns; T_d_in <= "0100"; T_d_in1 <= "0110"; T_en <= '1';
         wait for 20 ns; T_d_in <= "1010"; T_d_in1 <= "1000"; T_en <= '1';
         wait for 20 ns; T_d_in <= "0101"; T_d_in1 <= "0001"; T_en <= '1';
         wait;
      end process;

end tb2;
