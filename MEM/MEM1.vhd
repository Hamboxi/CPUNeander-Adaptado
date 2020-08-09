LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.STD_LOGIC_UNSIGNED.all;

ENTITY MEM1 IS
	PORT(RDMEntrada: IN STD_LOGIC;
		REMEntrada: IN STD_LOGIC;
		Leitura, Escrita: IN STD_LOGIC;
		Saida: OUT STD_LOGIC);
END MEM1;

ARCHITECTURE comportamental OF MEM1 IS
	SIGNAL celula: STD_LOGIC;
	BEGIN
	PROCESS(Leitura, Escrita)
		BEGIN
		IF(Leitura = '1') THEN
			Saida <= celula;
		ELSE
			Saida <= '0';
		END IF;
		
		IF(Escrita = '1') THEN
			celula <= RDMEntrada;
		END IF;
	END PROCESS;
END comportamental;
			