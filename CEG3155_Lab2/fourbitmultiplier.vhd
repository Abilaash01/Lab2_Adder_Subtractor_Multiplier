library IEEE;
use IEEE.std_logic_1164.all;

entity fourBitMultiplier is
	port (
      i_A: in std_logic_vector(3 downto 0);
      i_B: in std_logic_vector(3 downto 0);
		i_cin: in std_logic;
      o_product: out std_logic_vector(7 downto 0);
      o_cout: out std_logic
    );
  end fourBitMultiplier;

architecture rtl of fourBitMultiplier is
	component fourBitFullAdder
		port (
			i_x: in std_logic_vector(3 downto 0);
         i_y: in std_logic_vector(3 downto 0);
         i_cin: in std_logic;
         o_sum: out std_logic_vector(3 downto 0);
         o_cout: out std_logic
      );
	end component;
	
	component oneAndFourBit
		port(
			i_x: in std_logic;
			i_y: in std_logic_vector(3 downto 0);
			o_out: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component oneAndFourBitInitial
		port(
			i_x: in std_logic;
			i_y: in std_logic_vector(3 downto 0);
			o_out: out std_logic_vector(3 downto 0);
			o_carry: out std_logic
		);
	end component;

	signal i_carry1, i_carry2, i_carry3: std_logic;
	signal i_Ain1: std_logic_vector(3 downto 0);
	signal i_Bin2: std_logic_vector(3 downto 0);
	signal i_Bin3: std_logic_vector(3 downto 0);
	signal i_Bin4: std_logic_vector(3 downto 0);
	signal i_tempSum1: std_logic_vector(3 downto 0);
	signal i_tempSum2: std_logic_vector(3 downto 0);
	signal i_tempSumFirst: std_logic_vector(3 downto 0);
	signal i_tempSumSecond: std_logic_vector(3 downto 0);
	signal i_tempSumThird: std_logic_vector(3 downto 0);
	begin
		cell_1: oneAndFourBitInitial
			port map (i_A(0), i_B, i_Ain1, o_product(0));
		
		cell_2: oneAndFourBit
			port map (i_A(1), i_B, i_Bin2);
		
		cell_3: fourBitFullAdder
			port map (i_Ain1, i_Bin2, '0', i_tempSumFirst, i_carry1);
			o_product(1) <= i_tempSumFirst(0);
			i_tempSum1(0) <= i_tempSumFirst(1);
			i_tempSum1(1) <= i_tempSumFirst(2);
			i_tempSum1(2) <= i_tempSumFirst(3);
			i_tempSum1(3) <= i_carry1;
		
		cell_4: oneAndFourBit
			port map (i_A(2), i_B, i_Bin3);
		
		cell_5: fourBitFullAdder
			port map (i_Bin3, i_tempSum1, '0', i_tempSumSecond, i_carry2);
			o_product(2) <= i_tempSumSecond(0);
			i_tempSum2(0) <= i_tempSumSecond(1);
			i_tempSum2(1) <= i_tempSumSecond(2);
			i_tempSum2(2) <= i_tempSumSecond(3);
			i_tempSum2(3) <= i_carry2;
		
		cell_6: oneAndFourBit
			port map (i_A(3), i_B, i_Bin4);
		
		cell_7: fourBitFullAdder
			port map (i_Bin4, i_tempSum2, '0', i_tempSumThird, i_carry3);
			o_product(3) <= i_tempSumThird(0);
			o_product(4) <= i_tempSumThird(1);
			o_product(5) <= i_tempSumThird(2);
			o_product(6) <= i_tempSumThird(3);
			o_product(7) <= i_carry3;
end rtl;