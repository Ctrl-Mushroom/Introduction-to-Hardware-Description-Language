library IEEE;
use IEEE.std_logic_1164.all;

entity ckt4d3 is

   port(
      Hin1, Hin2, Min1, Min2 : in std_logic_vector(3 downto 0);
      Hin1_segment, Hin2_segment, Min1_segment, Min2_segment : out std_logic_vector(6 downto 0));

end ckt4d3;

architecture rtl of ckt4d3 is

   begin
      process(Hin1)
         begin case Hin1 is
            when "0000" => Hin1_segment <= "1111110"; --0 
            when "0001" => Hin1_segment <= "0110000"; --1
            when "0010" => Hin1_segment <= "1101101"; --2
            when others => Hin1_segment <= "0000000"; --null
         end case;
      end process;

      process(Hin2)
         begin case Hin2 is
            when "0000" => Hin2_segment <= "1111110"; --0 
            when "0001" => Hin2_segment <= "0110000"; --1
            when "0010" => Hin2_segment <= "1101101"; --2
            when "0011" => Hin2_segment <= "1111001"; --3
            when "0100" => Hin2_segment <= "0110011"; --4
            when "0101" => Hin2_segment <= "1011011"; --5
            when "0110" => Hin2_segment <= "1011111"; --6
            when "0111" => Hin2_segment <= "1110000"; --7
            when "1000" => Hin2_segment <= "1111111"; --8
            when "1001" => Hin2_segment <= "1111011"; --9
            when others => Hin2_segment <= "0000000"; --null
         end case;
      end process;

      process(Min1)
         begin case Min1 is
            when "0000" => Min1_segment <= "1111110"; --0 
            when "0001" => Min1_segment <= "0110000"; --1
            when "0010" => Min1_segment <= "1101101"; --2
            when "0011" => Min1_segment <= "1111001"; --3
            when "0100" => Min1_segment <= "0110011"; --4
            when "0101" => Min1_segment <= "1011011"; --5
            when "0110" => Min1_segment <= "1011111"; --6
            when others => Min1_segment <= "0000000"; --null
         end case;
      end process;

      process(Min2)
         begin case Min2 is
            when "0000" => Min2_segment <= "1111110"; --0 
            when "0001" => Min2_segment <= "0110000"; --1
            when "0010" => Min2_segment <= "1101101"; --2
            when "0011" => Min2_segment <= "1111001"; --3
            when "0100" => Min2_segment <= "0110011"; --4
            when "0101" => Min2_segment <= "1011011"; --5
            when "0110" => Min2_segment <= "1011111"; --6
            when "0111" => Min2_segment <= "1110000"; --7
            when "1000" => Min2_segment <= "1111111"; --8
            when "1001" => Min2_segment <= "1111011"; --9
            when others => Min2_segment <= "0000000"; --null
         end case;
      end process;

end rtl;

--Angelbert Quiliza, BSCpE 3-1