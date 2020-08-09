LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY decoder_BCD_7seg_vector IS
	PORT ( X : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			Y : OUT STD_LOGIC_VECTOR(6 DOWNTO 0) );
END decoder_BCD_7seg_vector;

ARCHITECTURE data_flow OF decoder_BCD_7seg_vector IS
BEGIN
	Y(0) <= NOT (X(3) OR X(1) OR (X(2) AND X(0)) OR ((NOT X(2)) AND (NOT X(0))));
	Y(1) <= NOT ((NOT X(2)) OR ((NOT X(1)) AND (NOT X(0))) OR (X(1) AND X(0)));
	Y(2) <= NOT (X(2) OR (NOT X(1)) OR X(0));
	Y(3) <= NOT (((NOT X(2)) AND (NOT X(0))) OR (X(1) AND (NOT X(0))) OR (X(2) AND (NOT X(1)) AND X(0)) OR ((NOT X(2)) AND X(1)) OR X(3));
	Y(4) <= NOT (((NOT X(2)) AND (NOT X(0))) OR (X(1) AND (NOT X(0))));
	Y(5) <= NOT (X(3) OR ((NOT X(1)) AND (NOT X(0))) OR (X(2) AND (NOT X(1))) OR (X(2) AND (NOT X(0))));
	Y(6) <= NOT (X(3) OR (X(2) AND (NOT X(1))) OR((NOT X(2)) AND X(1)) OR (X(1) AND (NOT X(0))));
END data_flow;