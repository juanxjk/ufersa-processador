--Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--Entidade
ENTITY mux8b_4x1 IS
	PORT(
		a, b, c, d	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		s1, s0		:	IN STD_LOGIC;
		y				:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);

END mux8b_4x1;


--Arquitetura
ARCHITECTURE ws OF mux8b_4x1 IS
SIGNAL sel	: STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
	sel(1) <= s1;
	sel(0) <= s0;
	WITH sel SELECT
		y <= 	a WHEN "00",
				b WHEN "01",
				c WHEN "10",
				d WHEN OTHERS;
END ws;