LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY Projeto IS
	PORT (Binario : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
			Enable : IN STD_LOGIC;
			Display4, Display3, Display2, Display1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END Projeto;

ARCHITECTURE logic OF Projeto IS

	SIGNAL ToDisplay1, ToDisplay2, ToDisplay3, ToDisplay4 : STD_LOGIC_VECTOR(3 DOWNTO 0);

	COMPONENT binary_to_bcd
		PORT(EN : IN STD_LOGIC;
			  BINARY : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
			  BCD_UNI : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			  BCD_TEN : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			  BCD_HUN : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			  BCD_THO : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT decoder_BCD_7seg_vector
		PORT ( X : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
				Y : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) );
	END COMPONENT;

BEGIN

	G2: binary_to_bcd PORT MAP (Enable, Binario, ToDisplay1, ToDisplay2, ToDisplay3, ToDisplay4);
	G3: decoder_BCD_7seg_vector PORT MAP (ToDisplay4, Display4);
	G4: decoder_BCD_7seg_vector PORT MAP (ToDisplay3, Display3);
	G5: decoder_BCD_7seg_vector PORT MAP (ToDisplay2, Display2);
	G6: decoder_BCD_7seg_vector PORT MAP (ToDisplay1, Display1);

END logic;

	

