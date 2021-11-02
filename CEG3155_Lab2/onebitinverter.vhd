library IEEE;
use IEEE.std_logic_1164.all;

entity oneBitinverter is
	port (
		i_y: in std_logic;
      o_yOut: out std_logic
    );
end oneBitinverter;

architecture rtl of oneBitinverter is
  begin
		o_yOut <= not(i_y);
end rtl;