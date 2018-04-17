LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY datapath IS
	PORT (
		Rin : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Rout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		clk, rst			: IN STD_LOGIC
	);
END ENTITY;

ARCHITECTURE comportamento OF datapath IS
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

-- Multiplexador 13 Bit 2x1
COMPONENT mux13b_2x1
	PORT(
		a, b	:	IN STD_LOGIC_VECTOR(12 DOWNTO 0);
		s0		:	IN STD_LOGIC;
		y				:	OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
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

-- Registrador 13 Bit
COMPONENT reg13cp
	PORT(
		clk, ld, clr 	: IN STD_LOGIC;
		d					: IN STD_LOGIC_VECTOR(12 DOWNTO 0);
		q					: OUT STD_LOGIC_VECTOR (12 DOWNTO 0)
	);
END COMPONENT;

-- Somador 13 Bit
COMPONENT adder13b
	PORT(
		A, B	:	IN	STD_LOGIC_VECTOR(12 DOWNTO 0);
		c0		:	IN STD_LOGIC;
		S		:	OUT	STD_LOGIC_VECTOR(12 DOWNTO 0);
		c13		:	OUT STD_LOGIC
	);
END COMPONENT;

-- SIGNAL -- !!!!!!!!!!!!!!!!!!!!!!!!!
BEGIN 
	--port map() -- !!!!!!!!!!!!!!!!!!!!!!!!!
END comportamento;