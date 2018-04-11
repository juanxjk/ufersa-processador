LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg13cp IS
	PORT(
		clk, ld, clr 	: IN STD_LOGIC;
		d					: IN STD_LOGIC_VECTOR(12 DOWNTO 0);
		q					: OUT STD_LOGIC_VECTOR (12 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE comportamento OF reg13cp IS
BEGIN
	PROCESS(clk)
	BEGIN
		IF(clk'EVENT AND clk='1') THEN
			IF(ld='1') THEN
				q <= d;
			ELSIF(clr='1') THEN
				q <= x"0";
			END IF;
		END IF;
	END PROCESS;
END comportamento;