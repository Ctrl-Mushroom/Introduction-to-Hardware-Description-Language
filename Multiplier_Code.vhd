library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity multiplier is

   port(
      num1, num2 : in std_logic_vector(1 downto 0);
      product : out std_logic_vector(3 downto 0));

end multiplier;

architecture rtl of multiplier is

   begin
      process(num1, num2)

      variable num1_reg : std_logic_vector(2 downto 0);
      variable product_reg : std_logic_vector(5 downto 0);

      begin
         num1_reg := '0' & num1;
         product_reg := "0000" & num2;

         for i in 1 to 3 loop
            if product_reg(0)='1' then
               product_reg(5 downto 3) := product_reg(5 downto 3) + num1_reg(2 downto 0);
            end if;

            product_reg(5 downto 0) := '0' & product_reg(5 downto 1);
         end loop;

         product <= product_reg(3 downto 0);
   end process;

end rtl;