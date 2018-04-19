LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fsm_processador IS
	PORT(
		clk, rst			: IN STD_LOGIC;
		opcode			: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		pc_ld, pc_clr	: IN STD_LOGIC;	-- Registrador PC
		pc_src			: IN STD_LOGIC;	-- 
		ri_ld, ri_clr	: IN STD_LOGIC;
		acc_ld, acc_clr	:	IN STD_LOGIC;
		acc_src				:	IN	STD_LOGIC;
		in_ld, in_clr		: IN STD_LOGIC;
		in_src				: IN STD_LOGIC;
		out_ld, out_clr	: IN STD_LOGIC;
		mem_inst_rd			: IN STD_LOGIC;
		mem_rd, mem_wr		: IN STD_LOGIC;
		mem_src				: IN STD_LOGIC
	);
END ENTITY;

ARCHITECTURE comportamento OF fsm_processador IS
--Signals
TYPE estado IS (
S0, -- Estado Inicial
SB, -- Estado Busca
SW, -- Estado de espera
SD, -- Estado Decodifica
S_ADD, -- SOMA 
S_SUB, -- SUBTRAÇÃO
S_AND, -- AND LÓGICO
S_XOR, -- XOR LÓGICO
S_NOT, -- NOT LÓGICO
S_ADDI, -- SOMA IMEDIATA
S_SUBI, -- SUBTRAÇÃO IMEDIATA
S_ANDI, -- AND LÓGICO IMEDIATO
S_XORI, -- XOR LÓGICO IMEDIATO
S_LDA, -- LOAD MEMÓRIA
S_LDI, -- LOAD MEMÓRIA IMEDIATO
S_STA, -- STORE MEMÓRIA
S_JMP, -- DESVIO
S_JZ, 	 -- DESVIO CONDICIONAL
S_IN, 	 -- IN
S_OUT  -- OUT
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
				pc_ld 		<= '0';
				pc_clr		<= '0';
				pc_src 		<= '0';
				ri_ld 		<= '0';
				ri_clr		<= '0';	
				acc_ld		<= '0';
				acc_clr		<= '0';
				acc_src		<= '0';
				in_ld			<= '0';
				in_clr		<= '0';
				in_src 		<= '0';				
				out_ld 		<= '0';
				out_clr 		<= '0';
				mem_inst_rd <= '0';	
				mem_rd 		<= '0';
				mem_wr 		<= '0';
				mem_src 		<= '0';	
				estadoproximo <= SB;
			-- Estado Busca
			WHEN SB =>
				estadoproximo <= SW;
			-- Estado de espera
			WHEN SW =>
				estadoproximo <= SD;
			-- Estado de decodificação
			WHEN SD =>
				CASE opcode IS
					WHEN "0000" => -- ADD adr
						estadoproximo <= S_ADD;
					WHEN "0001" => -- SUB adr
						estadoproximo <= S_SUB;
					WHEN "0010" => -- AND adr
						estadoproximo <= S_AND;
					WHEN "0011" => -- XOR adr
						estadoproximo <= S_XOR;
					WHEN "0100" => -- NOT adr
						estadoproximo <= S_NOT;
					WHEN "0101" => -- ADDI val
						estadoproximo <= S_ADDI;
					WHEN "0110" => -- SUBI val
						estadoproximo <= S_SUBI;
					WHEN "0111" => -- ANDI val
						estadoproximo <= S_ANDI;
					WHEN "1000" => -- XORI val
						estadoproximo <= S_XORI;
					WHEN "1001" => -- LDA adr
						estadoproximo <= S_LDA;
					WHEN "1010" => -- LDI val
						estadoproximo <= S_LDI;
					WHEN "1011" => -- STA adr
						estadoproximo <= S_STA;
					WHEN "1100" => -- JMP pcadr
						estadoproximo <= S_JMP;
					WHEN "1101" => -- JZ pcadr
						estadoproximo <= S_JZ;
					WHEN "1110" => -- IN
						estadoproximo <= S_IN;
					WHEN "1111" => -- OUT
						estadoproximo <= S_OUT;
				END CASE;
			WHEN S_ADD =>
				estadoproximo <= SB;
			WHEN S_SUB =>
				estadoproximo <= SB;
			WHEN S_AND =>
				estadoproximo <= SB;
			WHEN S_XOR =>
				estadoproximo <= SB;
			WHEN S_NOT =>
				estadoproximo <= SB;
			WHEN S_ADDI =>
				estadoproximo <= SB;
			WHEN S_SUBI =>
				estadoproximo <= SB;
			WHEN S_ANDI =>
				estadoproximo <= SB;
			WHEN S_XORI =>
				estadoproximo <= SB;
			WHEN S_LDA =>
				estadoproximo <= SB;
			WHEN S_LDI =>
				estadoproximo <= SB;
			WHEN S_STA =>
				estadoproximo <= SB;
			WHEN S_JMP =>
				estadoproximo <= SB;
			WHEN S_JZ =>
				estadoproximo <= SB;
			WHEN S_IN =>
				estadoproximo <= SB;
			WHEN S_OUT =>
				estadoproximo <= SB;
			WHEN OTHERS =>
				estadoproximo <= S0;
		END CASE;
	END PROCESS;
END comportamento;
