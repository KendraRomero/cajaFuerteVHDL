library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity SERVO is port(
	RELOJ_ENTRADA : in std_logic;
	POSICION : in std_logic;
	SALIDA : out std_logic
); end SERVO;

architecture LOGICA_SERVO of SERVO is

	signal CONTADOR : std_logic_vector (26 downto 0);

begin

	process(RELOJ_ENTRADA) begin
		if (RELOJ_ENTRADA'event and RELOJ_ENTRADA='1') then
			if (CONTADOR = 500000) then
				CONTADOR <= "000000000000000000000000000";
			else
			CONTADOR <= CONTADOR + 1;
				if (CONTADOR < 20000 and POSICION = '0') then
					SALIDA <= '1';
				elsif (CONTADOR < 40000 and POSICION ='1') then
					SALIDA <= '1';
				else
					SALIDA <= '0';
				end if;
			end if;
		end if;
	end process;

end LOGICA_SERVO;
