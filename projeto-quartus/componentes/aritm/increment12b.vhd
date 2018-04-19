--adder4b.vhd
--Somador de 2-bits em CHDL utilizando somador
--Completo

--BIblioteca
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY increment12b IS
	PORT(
		a	:	IN	STD_LOGIC_VECTOR(11 DOWNTO 0);
		y		:	OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END ENTITY;


ARCHITECTURE comportamento OF increment12b IS

COMPONENT adder12b
	PORT(
		A, B	:	IN	STD_LOGIC_VECTOR(11 DOWNTO 0);
		c0		:	IN STD_LOGIC;
		S		:	OUT	STD_LOGIC_VECTOR(11 DOWNTO 0);
		c12		:	OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL nulo : STD_LOGIC;

BEGIN
INCREMENTO: adder12b port map(a, "000000000001", nulo, y, nulo);
END comportamento;