--muxwe.vhdl
--Multiplexador implementado com a estrutura
--de seleção when/else

--Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--Entidade
ENTITY mux12b_2x1 IS
	PORT(
		a, b	:	IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		s0		:	IN STD_LOGIC;
		y		:	OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);

END mux12b_2x1;


--Arquitetura
ARCHITECTURE ws OF mux12b_2x1 IS
BEGIN
		y <= 	a WHEN s0 = '0' ELSE
				b;
END ws;