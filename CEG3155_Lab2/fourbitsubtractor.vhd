library IEEE;
use IEEE.std_logic_1164.all;

entity fourBitSubtractor is
	port (
      i_xSub: in std_logic_vector(3 downto 0);
      i_ySub: in std_logic_vector(3 downto 0);
      i_cinSub: in std_logic;
      o_sumSub: out std_logic_vector(3 downto 0);
      o_couSub: out std_logic
    );
  end fourBitSubtractor;

architecture rtl of fourBitSubtractor is
	component oneBitFullAdder
		port (
			i_x: in std_logic;
         i_y: in std_logic;
         i_cin: in std_logic;
         o_sum: out std_logic;
         o_cout: out std_logic
      );
	end component;
	
	component oneBitInverter
		port (
			i_y: in std_logic;
			o_yOut: out std_logic
      );
	end component;

	signal i_carry: std_logic_vector(2 downto 0);
	signal i_carryTemp: std_logic_vector(2 downto 0);
	signal i_carryTemp1: std_logic;
	signal i_yInv: std_logic_vector(3 downto 0);
	signal i_yFinal: std_logic_vector(3 downto 0);
	begin
		cell_1: oneBitInverter
			port map (i_ySub(0), i_yInv(0));
		
		cell_2: oneBitInverter
			port map (i_ySub(1), i_yInv(1));
			
		cell_3: oneBitInverter
			port map (i_ySub(2), i_yInv(2));
			
		cell_4: oneBitInverter
			port map (i_ySub(3), i_yInv(3));
			
		cell_5: oneBitFullAdder
			port map (i_yInv(0), '1', '0', i_yFinal(0), i_carryTemp(0));

		cell_6: oneBitFullAdder
			port map (i_yInv(1), '0', i_carryTemp(0), i_yFinal(1), i_carryTemp(1));

		cell_7: oneBitFullAdder
			port map (i_yInv(2), '0', i_carryTemp(1), i_yFinal(2), i_carryTemp(2));

		cell_8: oneBitFullAdder
			port map (i_yInv(3), '0', i_carryTemp(2), i_yFinal(3), i_carryTemp1);
		
		cell_9: oneBitFullAdder
			port map (i_xSub(0), i_yFinal(0), i_cinSub, o_sumSub(0), i_carry(0));

		cell_10: oneBitFullAdder
			port map (i_xSub(1), i_yFinal(1), i_carry(0), o_sumSub(1), i_carry(1));

		cell_11: oneBitFullAdder
			port map (i_xSub(2), i_yFinal(2), i_carry(1), o_sumSub(2), i_carry(2));

		cell_12: oneBitFullAdder
			port map (i_xSub(3), i_yFinal(3), i_carry(2), o_sumSub(3), o_couSub);
end rtl;