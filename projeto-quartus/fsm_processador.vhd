LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fsm_processador IS
	PORT(
		clk, rst				: IN STD_LOGIC;
		opcode				: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		pc_ld, pc_clr		: OUT STD_LOGIC;	-- Registrador PC
		pc_src				: OUT STD_LOGIC;	-- 
		ri_ld, ri_clr		: OUT STD_LOGIC;
		acc_ld, acc_clr	: OUT STD_LOGIC;
		acc_src				: OUT	STD_LOGIC;
		in_ld, in_clr		: OUT STD_LOGIC;
		in_src				: OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		out_ld, out_clr	: OUT STD_LOGIC;
		mem_inst_rd			: OUT STD_LOGIC;
		mem_rd, mem_wr		: OUT STD_LOGIC;
		mem_src				: OUT STD_LOGIC;
		alu_opcode			: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
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
S_JZ,  -- DESVIO CONDICIONAL
S_IN,  -- IN
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
			
			-- Estado: Inicial
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
				in_src 		<= "00";				
				out_ld 		<= '0';
				out_clr 		<= '0';
				mem_inst_rd <= '0';	
				mem_rd 		<= '0';
				mem_wr 		<= '0';
				mem_src 		<= '0';	
				alu_opcode <= "000";
				-- Transição
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
			
			-- Estado: SOMA
			WHEN S_ADD =>
				estadoproximo <= SB;
			
			-- Estado: SUBTRAÇÃO
			WHEN S_SUB =>
				estadoproximo <= SB;
			
			-- Estado: AND LÓGICO
			WHEN S_AND =>
				estadoproximo <= SB;
			
			-- Estado: XOR LÓGICO
			WHEN S_XOR =>
				estadoproximo <= SB;
			
			-- Estado: NOT LÓGICO
			WHEN S_NOT =>
				estadoproximo <= SB;
			
			-- Estado: ADIÇÃO IMEDIATA
			WHEN S_ADDI =>
				estadoproximo <= SB;
			
			-- Estado: SUBTRAÇÃO IMEDIATA
			WHEN S_SUBI =>
				estadoproximo <= SB;
			
			-- Estado: AND LÓGICO IMEDIATO
			WHEN S_ANDI =>
				estadoproximo <= SB;
			
			-- Estado: XOR LÓGICO IMEDIATO
			WHEN S_XORI =>
				estadoproximo <= SB;
			
			-- Estado: LOAD MEMÓRIA
			WHEN S_LDA =>
				estadoproximo <= SB;
			
			-- Estado: LOAD MEMÓRIA IMEDIATA
			WHEN S_LDI =>
				estadoproximo <= SB;
			
			-- Estado: STORE MEMÓRIA
			WHEN S_STA =>
				estadoproximo <= SB;
			
			-- Estado: DESVIO
			WHEN S_JMP =>
				estadoproximo <= SB;
			
			-- Estado: DESVIO CONDICIONAL
			WHEN S_JZ =>
				estadoproximo <= SB;
			
			-- Estado: IN
			WHEN S_IN =>
				estadoproximo <= SB;
			
			-- Estado: OUT
			WHEN S_OUT =>
				estadoproximo <= SB;
			
			-- OUTROS
			WHEN OTHERS =>
				estadoproximo <= S0;
		END CASE;
	END PROCESS;
END comportamento;
