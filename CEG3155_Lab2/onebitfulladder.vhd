library IEEE;
use IEEE.std_logic_1164.all;

entity oneBitFullAdder is
	port (
		i_x: in std_logic;
      i_y: in std_logic;
      i_cin: in std_logic;
      o_sum: out std_logic;
      o_cout: out std_logic
    );
end oneBitFullAdder;

architecture rtl of oneBitFullAdder is
  begin
    o_sum <= i_x xor i_y xor i_cin;
    o_cout <= (i_x and i_y) or (i_x and i_cin) or (i_y and i_cin);
end rtl;