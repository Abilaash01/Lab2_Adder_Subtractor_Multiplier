library IEEE;
use IEEE.std_logic_1164.all;

entity oneAndFourBitInitial is
	port (
		i_x: in std_logic;
      i_y: in std_logic_vector(3 downto 0);
      o_out: out std_logic_vector(3 downto 0);
		o_carry: out std_logic
    );
end oneAndFourBitInitial;

architecture rtl of oneAndFourBitInitial is
  begin
    o_out(0) <= i_x and i_y(1);
	 o_out(1) <= i_x and i_y(2);
	 o_out(2) <= i_x and i_y(3);
	 o_out(3) <= '0';
	 o_carry <= i_x and i_y(0);
end rtl;