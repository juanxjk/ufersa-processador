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
TYPE estado IS (S0, SW, SBW, SA1, SA2, SA3, SB1, SB2, SB3, SQ1);
SIGNAL estadoatual, estadoproximo : estado;

BEGIN
	--Registrador de Estado
	restradordeestado: PROCESS(clk, rst)
	BEGIN
		IF(rst='1') THEN
			estadoatual <= S0;
		ELSIF(rising_edge(clk)) THEN
			estadoatual <= estadoproximo;
		END IF;
	END PROCESS;
	
	--Lógica Combinacional
	logicacombinacional: PROCESS(bt1_tA, bt2_tA, bt3_tA, bt1_tB, bt2_tB, bt3_tB, btn_quarto, estadoatual)
	BEGIN
		--Seleção em relação ao meu estado atual
		CASE estadoatual IS
			--Estado: Inicial
			WHEN S0 =>
				ld_A <= '0';
				cl_A <= '1';
				ld_B <= '0';
				cl_B <= '1';
				ld_Q <= '0';
				cl_Q <= '1';
				estadoproximo <= SW;
			--Estado: Espera
			WHEN SW =>
				ld_A <= '0';
				cl_A <= '0';
				ld_B <= '0';
				cl_B <= '0';
				ld_Q <= '0';
				cl_Q <= '0';
				IF	(bt1_tA='1') THEN
					estadoproximo <= SA1;
				ELSIF (bt2_tA='1') THEN
					estadoproximo <= SA2;
				ELSIF (bt3_tA='1') THEN
					estadoproximo <= SA3;
				ELSIF (bt1_tB='1') THEN
					estadoproximo <= SB1;
				ELSIF (bt2_tB='1') THEN
					estadoproximo <= SB2;
				ELSIF (bt3_tB='1') THEN
					estadoproximo <= SB3;
				ELSIF (btn_quarto='1') THEN
					estadoproximo <= SQ1;
				END IF;
			--Estado: Espera por todos botões desativados.
			WHEN SBW =>
				ld_A <= '0';
				cl_A <= '0';
				ld_B <= '0';
				cl_B <= '0';
				ld_Q <= '0';
				cl_Q <= '0';
				IF (
					bt1_tA = '0' AND 
					bt2_tA = '0' AND 
					bt3_tA = '0' AND
					bt1_tB = '0' AND
					bt2_tB = '0' AND
					bt3_tB = '0' AND
					btn_quarto = '0'
				) THEN
					estadoproximo <= SW;
				END IF;
			--Estado: Equipe A +1
			WHEN SA1 =>
				ld_A <= '1';
				cl_A <= '0';
				ld_B <= '0';
				cl_B <= '0';
				ld_Q <= '0';
				cl_Q <= '0';
				T 	<= '0';
				m1 <= '0';
				m0 <= '1';
				estadoproximo <= SBW;
			--Estado: Equipe A +2
			WHEN SA2 => 
				ld_A <= '1';
				cl_A <= '0';
				ld_B <= '0';
				cl_B <= '0';
				ld_Q <= '0';
				cl_Q <= '0';
				T 	<= '0';
				m1 <= '1';
				m0 <= '0';
				estadoproximo <= SBW;
			--Estado: Equipe A +3
			WHEN SA3 =>
				ld_A <= '1';
				cl_A <= '0';
				ld_B <= '0';
				cl_B <= '0';
				ld_Q <= '0';
				cl_Q <= '0';
				T 	<= '0';
				m1 <= '1';
				m0 <= '1';
				estadoproximo <= SBW;
			--Estado: Equipe B +1
			WHEN SB1 =>
				ld_A <= '0';
				cl_A <= '0';
				ld_B <= '1';
				cl_B <= '0';
				ld_Q <= '0';
				cl_Q <= '0';
				T 	<= '1';
				m1 <= '0';
				m0 <= '1';	
				estadoproximo <= SBW;
			--Estado: Equipe B +2
			WHEN SB2 =>
				ld_A <= '0';
				cl_A <= '0';
				ld_B <= '1';
				cl_B <= '0';
				ld_Q <= '0';
				cl_Q <= '0';
				T 	<= '1';
				m1 <= '1';
				m0 <= '0';
				estadoproximo <= SBW;
			--Estado: Equipe B +3
			WHEN SB3 =>
				ld_A <= '0';
				cl_A <= '0';
				ld_B <= '1';
				cl_B <= '0';
				ld_Q <= '0';
				cl_Q <= '0';
				T 	<= '1';
				m1 <= '1';
				m0 <= '1';
				estadoproximo <= SBW;
			--Estado: Equipe Q +1
			WHEN SQ1 =>
				ld_A <= '0';
				cl_A <= '0';
				ld_B <= '0';
				cl_B <= '0';
				ld_Q <= '1';
				cl_Q <= '0';
				estadoproximo <= SBW;
			WHEN OTHERS =>
				estadoproximo <= S0;
		END CASE;
	END PROCESS;
END comportamento;
