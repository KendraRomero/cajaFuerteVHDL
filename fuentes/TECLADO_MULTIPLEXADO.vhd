library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity TECLADO_MULTIPLEXADO is port (
	RELOJ_ENTRADA : in std_logic;
	PIN_A : in std_logic;
	PIN_B : in std_logic;
	PIN_C : in std_logic;
	PIN_SALIDA : out std_logic_vector (3 downto 0);
	ENTER : out std_logic;
	CAMBIO : out std_logic;
	UNO : out std_logic;
	DOS : out std_logic;
	TRES :out std_logic;
	CUATRO : out std_logic;
	CINCO : out std_logic;
	SEIS  : out std_logic;
	SIETE : out std_logic;
	OCHO : out std_logic;
	NUEVE : out std_logic;
	CERO : out std_logic
); end TECLADO_MULTIPLEXADO;

architecture Behavioral of TECLADO_MULTIPLEXADO is
	
	signal FILA_ACTUAL : std_logic_vector (1 downto 0);

begin

	process(RELOJ_ENTRADA) begin
		if (RELOJ_ENTRADA'event and RELOJ_ENTRADA='1') then
			if (FILA_ACTUAL="11") then
				FILA_ACTUAL<="00";
			else
				FILA_ACTUAL <= FILA_ACTUAL + 1;
			end if;
		end if;
	end process;

process(RELOJ_ENTRADA) begin
	if (RELOJ_ENTRADA'event and RELOJ_ENTRADA='1') then
		UNO <= not(FILA_ACTUAL(0)) and not(FILA_ACTUAL(1)) and PIN_A;
		DOS <= not(FILA_ACTUAL(0)) and not(FILA_ACTUAL(1)) and PIN_B;
		TRES <= not(FILA_ACTUAL(0)) and not(FILA_ACTUAL(1)) and PIN_C;
		CUATRO <= not(FILA_ACTUAL(0)) and FILA_ACTUAL(1) and PIN_A;
		CINCO <= not(FILA_ACTUAL(0)) and FILA_ACTUAL(1) and PIN_B;
		SEIS <= not(FILA_ACTUAL(0)) and FILA_ACTUAL(1) and PIN_C;
		SIETE <= FILA_ACTUAL(0) and not(FILA_ACTUAL(1)) and PIN_A;
		OCHO <= FILA_ACTUAL(0) and not(FILA_ACTUAL(1)) and PIN_B;
		NUEVE <= FILA_ACTUAL(0) and not(FILA_ACTUAL(1)) and PIN_C;
		CERO <= FILA_ACTUAL(0) and FILA_ACTUAL(1) and PIN_B;
		ENTER <= FILA_ACTUAL(0) and FILA_ACTUAL(1) and PIN_C;
		CAMBIO <= FILA_ACTUAL(0) and FILA_ACTUAL(1) and PIN_A;
	end if;
end process;

with FILA_ACTUAL select PIN_SALIDA <=
	"0001" when "00",
	"0010" when "01",
	"0100" when "10",
	"1000" when "11",
	"0000" when others;

end Behavioral;

