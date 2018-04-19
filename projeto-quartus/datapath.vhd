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

BEGIN 
PC	:	reg12cp port map (clk, pc_ld, pc_clr, mux_pc_output, pc_output); -- PC
INCREMENT_PC: 
MUX_PC: 
MEM_INST: 
RI: 
SEP_I: 
SEP_INST: 
SEP_OP: 
MEM_DATA: 
MUX_MEM_DATA: 
ULA: 
MUX_ACC: 
ACC: 
RIN: 
MUX_RIN: 
ROUT: 
	--port map() -- !!!!!!!!!!!!!!!!!!!!!!!!!
END comportamento;