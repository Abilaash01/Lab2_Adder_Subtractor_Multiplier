library IEEE;
use IEEE.std_logic_1164.all;

entity fourBitFullAdder is
	port (
      i_x: in std_logic_vector(3 downto 0);
      i_y: in std_logic_vector(3 downto 0);
      i_cin: in std_logic;
      o_sum: out std_logic_vector(3 downto 0);
      o_cout: out std_logic
    );
  end fourBitFullAdder;

architecture rtl of fourBitFullAdder is
	component oneBitFullAdder
		port (
			i_x: in std_logic;
         i_y: in std_logic;
         i_cin: in std_logic;
         o_sum: out std_logic;
         o_cout: out std_logic
      );
	end component;

	signal i_carry: std_logic_vector(2 downto 0);
	begin
		cell_1: oneBitFullAdder
			port map (i_x(0), i_y(0), i_cin, o_sum(0), i_carry(0));

		cell_2: oneBitFullAdder
			port map (i_x(1), i_y(1), i_carry(0), o_sum(1), i_carry(1));

		cell_3: oneBitFullAdder
			port map (i_x(2), i_y(2), i_carry(1), o_sum(2), i_carry(2));

		cell_4: oneBitFullAdder
			port map (i_x(3), i_y(3), i_carry(2), o_sum(3), o_cout);
end rtl;