library IEEE;
use IEEE.std_logic_1164.all;

entity testbench1 is

end testbench1;

architecture tb1 of testbench1 is

   --Insert Component/s
   component not_gate is
      port(
         a : in std_logic;
         Q : out std_logic);
   end component;

   --Insert Signal/s
   signal a_t : std_logic;

   --Unit Under Test
   begin
      UUT : not_gate port map (a_t);

   --Runtime(Automatic)
   testbench1 : process
      begin
         a_t <= '0';
         wait for 20 ns; a_t <= '1';
         wait for 20 ns; a_t <= '0';
         wait;
      end process;

end tb1;