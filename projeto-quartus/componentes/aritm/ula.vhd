LIBRARY IEEE;

USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ula IS
	PORT(
		A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		alu_op : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE comportamento OF ula IS

BEGIN

 WITH alu_op SELECT
 Y <= std_logic_vector(to_unsigned(to_integer(unsigned(A)) + to_integer(unsigned(B)), 8))	WHEN "000", -- SOMA
		std_logic_vector(to_unsigned(to_integer(unsigned(A)) - to_integer(unsigned(B)), 8))	WHEN "001", -- SUBTRACAO	 
		(A AND B)	WHEN "010", -- AND
		(A XOR B)	WHEN "011", -- XOR
		NOT(B)	WHEN "100", -- NOT
		(OTHERS => '0') WHEN OTHERS;
END comportamento;