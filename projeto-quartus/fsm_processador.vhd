LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fsm_processador IS
	PORT(
		clk, rst			: IN STD_LOGIC;
		opcode: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		ld_A, cl_A, ld_B, cl_B, ld_Q, cl_Q, m1, m0, T : OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE comportamento OF fsm_processador IS
--Signals
TYPE estado IS (
S0, -- Estado Inicial
SB, -- Estado Busca
SD, -- Estado Decodifica
S_SOMA, -- SOMA 
S_SUB, -- SUBTRAÇÃO
S_AND, -- AND LÓGICO
S_XOR, -- XOR LÓGICO
S_LDA, -- LOAD MEMÓRIA
S_STA, -- STORE MEMÓRIA
S_JMP, -- DESVIO
S_JZ 	 -- DESVIO CONDICIONAL
);
SIGNAL estadoatual, estadoproximo : estado;

BEGIN
	--Registrador de Estado
	restradordeestado: PROCESS(clk, rst)
	BEGIN
		IF(rising_edge(clk)) THEN
			estadoatual <= estadoproximo;
		END IF;
	END PROCESS;
	
	--Lógica Combinacional
	logicacombinacional: PROCESS(estadoatual, opcode) -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	BEGIN
		--Seleção em relação ao meu estado atual
		CASE estadoatual IS
			--Estado: Inicial
			WHEN S0 =>
				--estadoproximo <= SW;
			WHEN SB =>
				
			WHEN SD =>
				
			WHEN S_SOMA =>
				
			WHEN S_SUB =>
				
			WHEN S_AND =>
				
			WHEN S_XOR =>
				
			WHEN S_LDA =>
				
			WHEN S_STA =>
				
			WHEN S_JMP =>
				
			WHEN S_JZ =>
				
			WHEN OTHERS =>
				estadoproximo <= S0;
		END CASE;
	END PROCESS;
END comportamento;
