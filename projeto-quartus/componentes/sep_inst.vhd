--Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--Entidade
ENTITY sep_inst IS
	PORT(
		instrucao	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		data		:	OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);

END sep_inst;


--Arquitetura
ARCHITECTURE comportamento OF sep_inst IS

BEGIN
	data <= instrucao(11 DOWNTO 0);
END comportamento;