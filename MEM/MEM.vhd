LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.STD_LOGIC_UNSIGNED.all;
USE ieee.Numeric_STD.all;

ENTITY MEM IS
	GENERIC (bitsDados: INTEGER := 2;
	bitsEnd: INTEGER := 2;
	bitsOP: INTEGER := 1);
	
	PORT(RDMEntrada: IN STD_LOGIC_VECTOR(bitsDados+bitsEnd+bitsOP-1 DOWNTO 0);
	CLK: IN STD_LOGIC;
	Endereco: IN STD_LOGIC_VECTOR(bitsEnd-1 DOWNTO 0);
	Leitura, Escrita: IN STD_LOGIC;
	Encerra: OUT STD_LOGIC;
	Saida: OUT STD_LOGIC_VECTOR(bitsDados+bitsEnd+bitsOP-1 DOWNTO 0));
END MEM;

ARCHITECTURE comportamental OF MEM IS
	BEGIN
	PROCESS(CLK, Endereco)
		VARIABLE i: INTEGER;
		VARIABLE j: INTEGER;
		VARIABLE auxSaida: STD_LOGIC_VECTOR((2**bitsEnd)*(bitsDados+bitsEnd+bitsOP)-1 DOWNTO 0);
		BEGIN
		
		i := to_integer(unsigned(Endereco)); -- Transformando endereço para inteiro;
		
		IF(CLK'EVENT AND CLK = '0') THEN
			IF(i /= 0) THEN -- ENDERECO 0 E NULO
				Encerra <= '0';
-----------------------------ESCRITA----------------------------------------
				IF(Escrita = '1') THEN
					j := 0;
					WHILE j <= (bitsDados+bitsEnd+bitsOP-1) LOOP
						auxSaida(i*(bitsDados+bitsEnd+bitsOP)+j) := RDMEntrada(j);
						j := j+1;
					END LOOP;
				
-----------------------------LEITURA-----------------------------------------
			
				ELSIF(Leitura = '1') THEN
					j := 0;
					WHILE j <= bitsDados+bitsEnd+bitsOP-1 LOOP
						Saida(j) <= auxSaida(i*(bitsDados+bitsEnd+bitsOP)+j);
						j := j+1;
					END LOOP;
				
-------------------------CASO IMPOSSIVEL--------------------------------------
				ELSE
					j := 0;
					WHILE j <= bitsDados+bitsEnd+bitsOP-1 LOOP
						Saida(j) <= '0';
						j := j+1;
					END LOOP;
				END IF;
			
-----------------------ENCERRA------------------------------------------------
			ELSE
				Encerra <= '1';
				j := 0;
				WHILE j <= bitsDados+bitsEnd+bitsOP-1 LOOP
					Saida(j) <= '0';
					j := j+1;
				END LOOP;
			END IF;
		END IF;
	END PROCESS;
END comportamental;
