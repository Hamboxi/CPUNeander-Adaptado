LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY PEx03SomadorSubtradorAcumulador IS
	PORT (Bin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Chave, Reset, Clock : IN STD_LOGIC;
			Acumulador : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0));
END PEx03SomadorSubtradorAcumulador;

ARCHITECTURE logic OF PEx03SomadorSubtradorAcumulador IS

SIGNAL S : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN 

	S(3) <= Bin(3) XOR Chave;
	S(2) <= Bin(2) XOR Chave;
	S(1) <= Bin(1) XOR Chave;
	S(0) <= Bin(0) XOR Chave;

	PROCESS(Clock, Reset)
	BEGIN
		IF(Reset = '0') THEN
			Acumulador <= "0000";
		ELSIF(Clock'EVENT AND Clock = '1') THEN
			IF(Chave = '1') THEN
				Acumulador <= Acumulador + S + "0001";
			ELSE
				Acumulador <= Acumulador + S;
			END IF;
		END IF;
	END PROCESS;

END logic;
	