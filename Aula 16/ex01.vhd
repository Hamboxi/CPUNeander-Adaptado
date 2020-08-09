LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ex01 IS
	PORT(Enable, Clock : IN STD_LOGIC;
		  Duty : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		  PWM : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END ex01;

ARCHITECTURE logic OF ex01 IS

	SIGNAL Contador : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN
	PROCESS(Clock, Enable)
	BEGIN
		IF(Enable = '1') THEN
			IF(Clock'EVENT AND Clock = '1') THEN
				IF(Contador >  Duty) THEN
					PWM <= "1111111";
				ELSE
					PWM <= "0000000";
				END IF;
				Contador <= (Contador + "00000001");
			END IF;
		END IF;
	END PROCESS;
END logic;