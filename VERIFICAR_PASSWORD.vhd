library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity VERIFICAR_PASSWORD is port(
	RELOJ_ENTRADA : in std_logic;
	CAMBIO : in std_logic;
	ENTRADA0 : in std_logic_vector(3 downto 0);
	ENTRADA1 : in std_logic_vector(3 downto 0);
	ENTRADA2 : in std_logic_vector(3 downto 0);
	ENTRADA3 : in std_logic_vector(3 downto 0);
	ENTER : in std_logic;
	PASSWORD0 : in std_logic_vector(3 downto 0):="0000";
	PASSWORD1 : in std_logic_vector(3 downto 0):="0000";
	PASSWORD2 : in std_logic_vector(3 downto 0):="0000";
	PASSWORD3 : in std_logic_vector(3 downto 0):="0000";
	HABILITADO : out std_logic
); end VERIFICAR_PASSWORD;

architecture Behavioral of VERIFICAR_PASSWORD is

begin

	process (RELOJ_ENTRADA) begin
		if(RELOJ_ENTRADA'event and RELOJ_ENTRADA='1' and ENTER='1' and CAMBIO='0') then
			HABILITADO <=		 not(ENTRADA0(0) xor PASSWORD0(0))
								and not(ENTRADA0(1) xor PASSWORD0(1))
								and not(ENTRADA0(2) xor PASSWORD0(2))
								and not(ENTRADA0(3) xor PASSWORD0(3))
								and not(ENTRADA1(0) xor PASSWORD1(0))
								and not(ENTRADA1(1) xor PASSWORD1(1))
								and not(ENTRADA1(2) xor PASSWORD1(2))
								and not(ENTRADA1(3) xor PASSWORD1(3))
								and not(ENTRADA2(0) xor PASSWORD2(0))
								and not(ENTRADA2(1) xor PASSWORD2(1))
								and not(ENTRADA2(2) xor PASSWORD2(2))
								and not(ENTRADA2(3) xor PASSWORD2(3))
								and not(ENTRADA3(0) xor PASSWORD3(0))
								and not(ENTRADA3(1) xor PASSWORD3(1))
								and not(ENTRADA3(2) xor PASSWORD3(2))
								and not(ENTRADA3(3) xor PASSWORD3(3));
		end if;
	end process;
end Behavioral;

