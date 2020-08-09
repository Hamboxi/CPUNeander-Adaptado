LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.STD_LOGIC_UNSIGNED.all;
USE ieee.NUMERIC_STD.all;

ENTITY ULA IS
	GENERIC (bitsDados: INTEGER := 1;
	bitsSelec: INTEGER := 3);
	
	PORT
	(CLK: IN STD_LOGIC;
	X, Y: IN STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
	SelULA: IN STD_LOGIC_VECTOR(bitsSelec-1 DOWNTO 0);
	AC: BUFFER STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
	N, Z: OUT STD_LOGIC); -- DEFINIR SAIDAS AINDA
END ULA;

ARCHITECTURE comportamental OF ULA IS
	BEGIN
	PROCESS(CLK)
		BEGIN
		IF(CLK'EVENT AND CLK = '0') THEN
			CASE selULA IS
				WHEN "000" => AC <= X+Y;
				WHEN "001" =>
					Andd: FOR i IN 0 TO bitsDados-1 LOOP
						AC(i) <= '0';
					END LOOP Andd;
					IF(X and Y) = X THEN
						AC(0) <= '1';
					END IF;
				WHEN "010" => AC <= X or Y;
				WHEN "011" => AC <= not X;
				WHEN "100" => AC <= Y;
				WHEN "110" => AC <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(X))*to_integer(unsigned(Y)), AC'LENGTH));
				WHEN "111" =>
					a: FOR i IN 0 TO bitsDados-1 LOOP
						AC(i) <= '0';
					END LOOP a;
				When OTHERS => AC <= AC;
			END CASE;
		END IF;
	END PROCESS;
END comportamental;
			
			