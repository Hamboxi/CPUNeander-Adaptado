LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.STD_LOGIC_UNSIGNED.all;

ENTITY Neander IS
	GENERIC (bitsDados: INTEGER := 8;
	bitsEnd: INTEGER := 4;
	bitsOP: INTEGER := 4);
	
	PORT
	(CLK, CLKmaq, Gravar: IN STD_LOGIC;
	CargaAC: IN STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
	CargaRDM: IN STD_LOGIC_VECTOR(bitsDados+bitsEnd+bitsOP-1 DOWNTO 0);
	CargaPC, CargaREM: IN STD_LOGIC_VECTOR(bitsEnd-1 DOWNTO 0);
	Saida: BUFFER STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
	Display4, Display3, Display2, Display1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	Encerra: OUT STD_LOGIC;
-----------------------------------------------Saidas de teste--------------
	tOUTREM, tOUTPC, tOUTMUX: OUT STD_LOGIC_VECTOR(bitsEnd-1 DOWNTO 0);
	tOUTAC, tOUTULA: OUT STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
	tOUTRDM, tOUTMEM, tINMEM: OUT STD_LOGIC_VECTOR(bitsDados+bitsEnd+bitsOP-1 DOWNTO 0);
	tW, tR, tSel: OUT STD_LOGIC
	);
END Neander;

ARCHITECTURE comportamental OF Neander IS

-------------------------DECODER------------------------
COMPONENT Projeto IS
	PORT (Binario : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
			Enable : IN STD_LOGIC;
			Display4, Display3, Display2, Display1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;
--------------------------------------------------------

-------------------------MEMORY-------------------------
	COMPONENT MEM IS
	GENERIC (bitsDados: INTEGER := bitsDados;
	bitsEnd: INTEGER := BitsEnd;
	bitsOP: INTEGER := 4);
	
	PORT(RDMEntrada: IN STD_LOGIC_VECTOR(bitsDados+bitsEnd+bitsOP-1 DOWNTO 0);
	CLK: IN STD_LOGIC;
	Endereco: IN STD_LOGIC_VECTOR(bitsEnd-1 DOWNTO 0);
	Leitura, Escrita: IN STD_LOGIC;
	Encerra: OUT STD_LOGIC;
	Saida: OUT STD_LOGIC_VECTOR(bitsDados+bitsEnd+bitsOP-1 DOWNTO 0));
	END COMPONENT;
-------------------------MEMORY-------------------------

--------------------------ALU---------------------------
	COMPONENT ULA IS
		GENERIC (bitsDados: INTEGER := bitsDados;
		bitsSelec: INTEGER := 3); -- QUANTIDADE DE OPERACOES DA ULA
		
		PORT
		(CLK: IN STD_LOGIC;
		X, Y: IN STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
		SelULA: IN STD_LOGIC_VECTOR(bitsSelec-1 DOWNTO 0);
		AC: OUT STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
		N, Z: OUT STD_LOGIC); -- DEFINIR SAIDAS AINDA
	END COMPONENT;
--------------------------ALU---------------------------

------------------------REGISTER------------------------
	COMPONENT Registrador IS
		GENERIC (bitsDados: INTEGER := bitsDados);
		
		PORT
		(X: IN STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
		L: IN STD_LOGIC;
		Carga: IN STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
		Saida: OUT STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0));
	END COMPONENT;
------------------------REGISTER------------------------

-------------------UNIDADE DE CONTROLE------------------
	SIGNAL selUAL: STD_LOGIC_VECTOR(3-1 DOWNTO 0); -- SE ALTERAR A QTD DE OP DA ULA MUDAR AQUI TBM
	SIGNAL auxX, auxY, INAC, OUTAC, OUTULA: STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0); -- AC, ULA
	SIGNAL auxOUT, auxIN, OUTRDM, INRDM: STD_LOGIC_VECTOR(bitsDados+bitsEnd+bitsOP-1 DOWNTO 0); -- RDM
	SIGNAL INREM, OUTREM, INPC, auxPC, OUTPC: STD_LOGIC_VECTOR(bitsEnd-1 DOWNTO 0); -- REM, PC
	SIGNAL RDMEndereco: STD_LOGIC_VECTOR(bitsEnd-1 DOWNTO 0); -- VIA RDM
	SIGNAL RDMOperacao: STD_LOGIC_VECTOR(bitsOP-1 DOWNTO 0); -- VIA RDM
	SIGNAL RDMDado: STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0); -- VIA RDM
	SIGNAL IncrementaPC, Psel, auxN, auxZ, W, R: STD_LOGIC; -- UNIDADE DE CONTROLE
	SIGNAL Rodar: STD_LOGIC;
	
	SIGNAL auxCargaAC: STD_LOGIC_VECTOR(bitsDados-1 DOWNTO 0);
	SIGNAL auxCargaRDM: STD_LOGIC_VECTOR(bitsDados+bitsEnd+bitsOP-1 DOWNTO 0);
	SIGNAL auxCargaPC, auxCargaPC2, auxCargaREM: STD_LOGIC_VECTOR(bitsEnd-1 DOWNTO 0);
	SIGNAL CLK2: STD_LOGIC; -- CLOCK AUXILIAR BAAAABY
	SIGNAL LRDM, LREM, sel: STD_LOGIC;
	SIGNAL FIRST: STD_LOGIC_VECTOR(bitsEnd-1 DOWNTO 0) := "0000";
	
	--Aux flipflops
	SIGNAL auxLRDM1, auxLRDM2, LPC, auxLPC: STD_LOGIC := '0';
	
	BEGIN
	Decod: Projeto PORT MAP ("00000"&Saida, '1', Display4, Display3, Display2, Display1);
--------------------------------------------------------
	LRDM <= '0' WHEN auxLRDM2 = '1' ELSE
		auxLRDM1;
		
	IncrementaPC <= '0';
--------------------------------------------------------
	CLK2 <= not CLK;
--------------------------------------------------------
----------------------ANINHAMENTO-----------------------
	auxRDM: FOR i IN 0 TO bitsOP-1 GENERATE -- POSSIVEL BUG
		RDMOperacao(i) <= OUTRDM(i);
	END GENERATE auxRDM;
	
	auxRDM1: FOR i IN bitsOP TO bitsEnd+bitsOP-1 GENERATE
		RDMEndereco(i-bitsOP) <= OUTRDM(i);
	END GENERATE auxRDM1;
	
	auxRDM2: FOR i IN bitsOP+bitsEnd TO bitsEnd+bitsOP+bitsDados-1 GENERATE
		RDMDado(i-bitsOP-bitsEnd) <= OUTRDM(i);
	END GENERATE auxRDM2;
	
	AC: Registrador PORT MAP (OUTULA, '0', auxCargaAC, auxX);--AC
	tOUTAC <= auxX; --TESTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
	
	PC: Registrador GENERIC MAP (bitsEnd) PORT MAP (INPC, LPC, auxCargaPC, auxPC);--PC
	ajudaPC: PROCESS(CLK2)
		BEGIN
		IF(CLK2'EVENT AND CLK2 = '0') THEN
			INPC <= RDMEndereco;
			LPC <= auxLPC;
			auxCargaPC <= auxCargaPC2;
		END IF;
	END PROCESS ajudaPC;
	
	IncrePC: PROCESS(IncrementaPC, auxPC)
		BEGIN
		IF(IncrementaPC = '1') THEN
			OUTPC <= auxPC+1;
		ELSE
			OUTPC <= auxPC;
		END IF;
	END PROCESS IncrePC;
	tOUTPC <= OUTPC; --TESTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
	
	MUX: PROCESS(Sel, RDMEndereco) -- MUX
		BEGIN
		IF(Sel = '0') THEN
			INREM <= OUTPC;
		ELSE
			INREM <= RDMEndereco;
		END IF;
	END PROCESS MUX;
	tOUTMUX <= INREM;
	tSel <= Sel;
	
	RDM: Registrador GENERIC MAP (bitsDados+bitsEnd+bitsOP) PORT MAP (INRDM, LRDM, auxCargaRDM, OUTRDM); -- CUIDADO, PODE HAVER BUG
	tOUTRDM <= OUTRDM; --TESTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
	aRDM: PROCESS(auxIN, auxX)
		BEGIN
		IF(auxIN /= 0) THEN
			INRDM <= auxIN;
		ELSE
			a: FOR i IN 0 TO bitsDados-1 LOOP
				INRDM(i+bitsDados) <= auxX(i);
				INRDM(i) <= '0'; -- Qual será sua próxima instrução??
			END LOOP a;
		END IF;
	END PROCESS aRDM;
	
	aREM: Registrador GENERIC MAP (bitsEnd) PORT MAP (INREM, LREM, auxCargaREM, OUTREM); -- REM
	tOUTREM <= OUTREM; --TESTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
	
	aULA: ULA PORT MAP (CLK2, auxX, RDMDado, selUAL, OUTULA, auxN, auxZ); -- ULA
	tOUTULA <= OUTULA;
	
	aMEM: MEM PORT MAP (OUTRDM, CLK2, OUTREM, R, W, Encerra, auxIN); -- CUIDADO, PODE HAVER BUG
	tOUTMEM <= auxIN;
	tINMEM <= OUTRDM;
	tW <= W;
	tR <= R;
	
----------------------ANINHAMENTO-----------------------
--Controles: auxCargaAC, auxCargaPC, IncrementaPC, Sel, auxCargaRDM, auxCargaREM, selUAL, W, R
--InControles: RDMOperacao, N, Z

	UNDCONTROLE: PROCESS(CLK)
		BEGIN
			IF(CLK'EVENT AND CLK = '0') THEN
				Sel <= '1';
				IF(Gravar = '1') THEN
					IF(FIRST = 0) THEN
						FIRST <= CargaREM;
					END IF;
					Rodar <= '0';
					W <= '1';
					R <= '0';
					auxLRDM1 <= '1';
					LREM <= '1';
					auxCargaREM <= CargaREM;
					auxCargaRDM <= CargaRDM;
				ELSE
					IF(Rodar = '0') THEN
						Rodar <= '1'; -- Atualiza ultimo pulso de clock
						auxLRDM1 <= '0';
						auxCargaREM <= FIRST;
						R <= '1';
						W <= '0';
					ELSE
						saida <= "00000000";
						LREM <= '0';
						auxLPC <= '0';
						CASE RDMOperacao IS
							WHEN "0000" =>
								R <= '1';
								W <= '0';
								selUAL <= "111";
							WHEN "0001" =>
								IF(W = '0') THEN
									W <= '1';--STORE
									R <= '0';
									Sel <= '0';
									auxLRDM1 <= '1';
									selUAL <= "101";
									
									auxRDMa: FOR i IN bitsOP+bitsEnd TO bitsEnd+bitsOP+bitsDados-1 LOOP
										auxCargaRDM(i) <= auxX(i-bitsOP-bitsEnd);
									END LOOP auxRDMa;
									
									auxRDM: FOR i IN 0 TO bitsOP+bitsEnd-1 LOOP -- POSSIVEL BUG
										auxCargaRDM(i) <= OUTRDM(i);
									END LOOP auxRDM;
									auxLPC <= '1';
									auxCargaPC2 <= RDMDado(bitsDados-1 DOWNTO bitsDados-4);
								ELSE
									selUAL <= "101";
									W <= '0';
									R <= '1';
								END IF;
							WHEN "0010" =>
								R <= '1';
								W <= '0';
								selUAL <= "100";--LOAD
							WHEN "0011" =>
								R <= '1';
								W <= '0';
								selUAL <= "000";--SOMA
							WHEN "0100" =>
								R <= '1';
								W <= '0';
								selUAL <= "010";--OR
							WHEN "0101" =>
								R <= '1';
								W <= '0';
								selUAL <= "001";--AND
							WHEN "0110" =>
								selUAL <= "011";--NOT AC
								R <= '1';
								W <= '0';
								selUAL <= "101";
							WHEN "1000" =>
								R <= '1';--JUMP INCONDICIONAL
								W <= '0';
								selUAL <= "101";
							WHEN "1001" =>
								R <= '1';
								W <= '0';
								selUAL <= "110"; -- MULTIPLICACAO
							WHEN "1111" =>
								R <= '1';
								W <= '0';
								selUAL <= "101";
								saida <= auxX;--FINAL DE PROGRAMA. IMPRIME 'END'
								auxCargaREM <= "0000";
								LREM <= '1';
							WHEN OTHERS =>
								selUAL <= "100"; -- LOAD
								R <= '1';--JUMP NAO IMPLEMENTADO
								W <= '0';
						END CASE;
					END IF;
				END IF;
		END IF;
		IF(CLK'EVENT AND CLK = '1') THEN
		auxLRDM2 <= '0';
			IF(RDMOperacao = "0001" AND Gravar = '0') THEN
				auxLRDM2 <= '1';
			END IF;
		END IF;
	END PROCESS UNDCONTROLE;
	
END comportamental;
-------------------UNIDADE DE CONTROLE------------------