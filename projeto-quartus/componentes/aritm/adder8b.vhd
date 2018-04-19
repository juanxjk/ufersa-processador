--BIblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY adder8b IS
	PORT(
		A, B	:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		c0		:	IN STD_LOGIC;
		S		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
		c8		:	OUT STD_LOGIC
	);
END ENTITY;


ARCHITECTURE hierarquia OF adder8b IS
SIGNAL c1, c2, c3, c4, c5, c6, c7 : STD_LOGIC;
COMPONENT fulladder IS
	PORT(
		a,b,c	:	IN		STD_LOGIC;
		s,co	:	OUT	STD_LOGIC
	);
END COMPONENT;
BEGIN
	--Inicia o PORTMAP
	U0: fulladder PORT MAP (A(0), B(0), c0, S(0), c1);
	U1: fulladder PORT MAP (A(1), B(1), c1, S(1), c2);
	U2: fulladder PORT MAP (A(2), B(2), c2, S(2), c3);
	U3: fulladder PORT MAP (A(3), B(3), c3, S(3), c4);
	U4: fulladder PORT MAP (A(4), B(4), c4, S(4), c5);
	U5: fulladder PORT MAP (A(5), B(5), c5, S(5), c6);
	U6: fulladder PORT MAP (A(6), B(6), c6, S(6), c7);
	U7: fulladder PORT MAP (A(7), B(7), c7, S(7), c8);
END hierarquia;