LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fsm_placar IS
	PORT(
		clk, rst			: IN STD_LOGIC;
		bt1_tA, bt2_tA, bt3_tA	: IN STD_LOGIC;
		bt1_tB, bt2_tB, bt3_tB	: IN STD_LOGIC;
		btn_quarto		: IN STD_LOGIC;
		ld_A, cl_A, ld_B, cl_B, ld_Q, cl_Q, m1, m0, T : OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE comportamento OF fsm_placar IS
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
	logicacombinacional: PROCESS([...]) -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	BEGIN
		--Seleção em relação ao meu estado atual
		CASE estadoatual IS
			--Estado: Inicial
			WHEN S0 =>
				estadoproximo <= SW;
			WHEN SB <=
				
			WHEN SD <=
				
			WHEN S_SOMA <=
				
			WHEN S_SUB <=
				
			WHEN S_AND <=
				
			WHEN S_XOR <=
				
			WHEN S_LDA <=
				
			WHEN S_STA <=
				
			WHEN S_JMP <=
				
			WHEN S_JZ <=
				
			WHEN OTHERS =>
				estadoproximo <= S0;
		END CASE;
	END PROCESS;
END comportamento;
