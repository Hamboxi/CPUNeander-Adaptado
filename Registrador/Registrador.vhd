LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.STD_LOGIC_UNSIGNED.all;

ENTITY Registrador IS
	GENERIC (bitsDados: INTEGER := 1);
	
	PORT
	(X: IN STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
	L: IN STD_LOGIC;
	Carga: IN STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
	Saida: OUT STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0));
END Registrador;

ARCHITECTURE comportamental OF Registrador IS
	BEGIN
	PROCESS(X, L, Carga)
		BEGIN
			IF(L = '1') THEN
				Saida <= Carga;
			ELSIF(L = '0') THEN
				Saida <= X;
			END IF;
	END PROCESS;
END comportamental;