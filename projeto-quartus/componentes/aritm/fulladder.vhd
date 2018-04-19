--Somador Completo
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fulladder IS
	PORT(
		a, b, c	: IN STD_LOGIC;
		s, co		: OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE logica OF fulladder IS
BEGIN
	s <= a XOR b XOR c;
	co <= (a AND b) or (a AND c) OR (b AND c);
END logica;