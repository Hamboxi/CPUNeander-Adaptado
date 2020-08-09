LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY binary_to_bcd IS
	PORT(EN : IN STD_LOGIC;
		  BINARY : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
		  BCD_UNI : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  BCD_TEN : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  BCD_HUN : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  BCD_THO : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END binary_to_bcd;

ARCHITECTURE logic OF binary_to_bcd IS

BEGIN
	
	PROCESS(BINARY)
	
		VARIABLE BINARYATUAL : STD_LOGIC_VECTOR (12 downto 0);
		VARIABLE BCD : STD_LOGIC_VECTOR (15 DOWNTO 0);
	
	BEGIN
	
		BINARYATUAL(12 DOWNTO 0) := BINARY;
		BCD(15 DOWNTO 0) := "0000000000000000";
		
	
		IF(EN = '1') THEN
		
			FOR i IN 0 TO 12 LOOP
			
				IF BCD(3 DOWNTO 0) > "0100" THEN
				  BCD(3 DOWNTO 0) := BCD(3 DOWNTO 0) + "0011";
				END IF;
				
				IF BCD(7 DOWNTO 4) > "0100" THEN
				  BCD(7 DOWNTO 4) := BCD(7 DOWNTO 4) + "0011";
				END IF;
			 
				IF BCD(11 DOWNTO 8) > "0100" THEN
				  BCD(11 DOWNTO 8) := BCD(11 DOWNTO 8) + "0011";
				END IF;
				
				IF BCD(15 DOWNTO 12) > "0100" THEN
				  BCD(15 DOWNTO 12) := BCD(15 DOWNTO 12) + "0011";
				END IF;
				
				BCD := BCD(14 DOWNTO 0) & BINARYATUAL(12);
				BINARYATUAL := BINARYATUAL(11 DOWNTO 0) & '0';
				
			END LOOP;
		
			BCD_UNI <= BCD(3 DOWNTO 0);
			BCD_TEN <= BCD(7 DOWNTO 4);
			BCD_HUN <= BCD(11 DOWNTO 8);
			BCD_THO <= BCD(15 DOWNTO 12);
						
		END IF;
		
	END PROCESS;
END logic;