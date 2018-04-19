--Bibliotecas
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

--Entidade
ENTITY sep_i IS
	PORT(
		data	:	IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		data_imediato		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);

END sep_i;


--Arquitetura
ARCHITECTURE comportamento OF sep_i IS

BEGIN
	data_imediato <= data(11 DOWNTO 4);
END comportamento;