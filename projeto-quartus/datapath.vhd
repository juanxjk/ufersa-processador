LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY datapath IS
	PORT (
		clk, rst			: IN STD_LOGIC;
		rin : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		rout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE comportamento OF datapath IS

-- MÁQUINA DE ESTADOS
COMPONENT fsm_processador
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
END COMPONENT;

-- Registrador 8 Bit
COMPONENT reg8cp
	PORT(
		clk, ld, clr 	: IN STD_LOGIC;
		d					: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		q					: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END COMPONENT;

-- Registrador 16 Bit
COMPONENT reg16cp
	PORT(
		clk, ld, clr 	: IN STD_LOGIC;
		d					: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		q					: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END COMPONENT;

-- Multiplexador 8 Bit 2x1
COMPONENT mux8b_2x1
	PORT(
		a, b	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		s0		:	IN STD_LOGIC;
		y				:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

-- Multiplexador 8 Bit 4x1
COMPONENT mux8b_4x1
	PORT(
		a, b, c, d	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		s1, s0		:	IN STD_LOGIC;
		y				:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);

END COMPONENT;

-- Multiplexador 12 Bit 2x1
COMPONENT mux12b_2x1
	PORT(
		a, b	:	IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		s0		:	IN STD_LOGIC;
		y		:	OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);

END COMPONENT;

-- Somador 8 Bit
COMPONENT adder8b
	PORT(
		A, B	:	IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		c0		:	IN STD_LOGIC;
		S		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
		c8		:	OUT STD_LOGIC
	);
END COMPONENT;

-- Registrador 12 Bit
COMPONENT reg12cp
	PORT(
		clk, ld, clr 	: IN STD_LOGIC;
		d					: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		q					: OUT STD_LOGIC_VECTOR (11 DOWNTO 0)
	);
END COMPONENT;

-- Somador 12 Bit
COMPONENT adder12b
	PORT(
		A, B	:	IN	STD_LOGIC_VECTOR(11 DOWNTO 0);
		c0		:	IN STD_LOGIC;
		S		:	OUT	STD_LOGIC_VECTOR(11 DOWNTO 0);
		c12		:	OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT increment12b
	PORT(
			a	:	IN	STD_LOGIC_VECTOR(11 DOWNTO 0);
			y		:	OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mem_inst
	PORT(
		address		: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mem_data
	PORT(
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wraddress		: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sep_i
	PORT(
		data	:	IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		data_imediato		:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sep_inst
	PORT(
		instrucao	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		data		:	OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sep_op
	PORT(
		instrucao	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		opcode		:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ula
	PORT(
		A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		alu_op : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

-- SIGNAL -- !!!!!!!!!!!!!!!!!!!!!!!!!

	SIGNAL opcode				: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL pc_ld, pc_clr		: STD_LOGIC;	-- Registrador PC
	SIGNAL pc_src				: STD_LOGIC;	-- 
	SIGNAL ri_ld, ri_clr		: STD_LOGIC;
	SIGNAL acc_ld, acc_clr	: STD_LOGIC;
	SIGNAL acc_src				: STD_LOGIC;
	SIGNAL in_ld, in_clr		: STD_LOGIC;
	SIGNAL in_src				: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL out_ld, out_clr	: STD_LOGIC;
	SIGNAL mem_inst_rd		: STD_LOGIC;
	SIGNAL mem_rd, mem_wr	: STD_LOGIC;
	SIGNAL mem_src				: STD_LOGIC;
	SIGNAL alu_opcode			: STD_LOGIC_VECTOR(2 DOWNTO 0);
	
	SIGNAL pc_output, mux_pc_output	: STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL increment_output	:	STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL sep_inst_output	:	STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL sep_op_output : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL sep_i_output	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL mem_inst_output	:	STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL mem_data_output	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL ri_output	:	STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL acc_output : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL mux_acc_output : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL mux_mem_output : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL ula_output	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL mux_in_output	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL in_output : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL nulo : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN 
L_PC	:	reg12cp port map (clk, pc_ld, pc_clr, mux_pc_output, pc_output); -- PC
L_INCREMENT_PC: increment12b port map (pc_output, increment_output);
L_MUX_PC: mux12b_2x1 port map(increment_output, sep_inst_output, pc_src, mux_pc_output);
L_MEM_INST: mem_inst port map(pc_output, clk, mem_inst_output);
L_RI: reg16cp port map(clk, ri_ld, ri_clr, mem_inst_output, ri_output);
L_SEP_I: sep_i port map(sep_inst_output, sep_i_output);
L_SEP_INST: sep_inst port map(ri_output, sep_inst_output);
L_SEP_OP: sep_op port map(ri_output, sep_op_output);
L_MEM_DATA: mem_data port map(clk, acc_output, sep_inst_output, mem_rd, sep_inst_output, mem_wr, mem_data_output);
L_MUX_MEM_DATA: mux8b_2x1 port map(sep_i_output, mem_data_output, mem_src, mux_mem_output);
L_ULA: ula port map(acc_output, mux_mem_output, alu_opcode, ula_output);
L_MUX_ACC: mux8b_2x1 port map(ula_output, mux_mem_output, acc_src, mux_acc_output);
L_ACC: reg8cp port map(clk, acc_ld, acc_clr, mux_in_output, acc_output);
L_RIN: reg8cp port map(clk, in_ld, in_clr, rin, in_output);
L_MUX_IN: mux8b_4x1 port map(mux_in_output, sep_i_output, in_output, nulo, in_src(1), in_src(0), mux_in_output);
L_ROUT: reg8cp port map(clk, out_ld, out_clr, acc_output, rout);
L_FSM_PROCESSADOR: fsm_processador port map(clk, rst, opcode, pc_ld, pc_clr, pc_src, ri_ld, 
						ri_clr, acc_ld, acc_clr, acc_src, in_ld, in_clr, in_src, out_ld, out_clr, mem_inst_rd, mem_rd, 
						mem_wr, mem_src, alu_opcode);




END comportamento;