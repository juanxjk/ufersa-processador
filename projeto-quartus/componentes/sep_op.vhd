--Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--Entidade
ENTITY sep_op IS
	PORT(
		instrucao	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		opcode		:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);

END sep_op;


--Arquitetura
ARCHITECTURE comportamento OF sep_op IS
BEGIN
	opcode <= instrucao(15 DOWNTO 12);
END comportamento;