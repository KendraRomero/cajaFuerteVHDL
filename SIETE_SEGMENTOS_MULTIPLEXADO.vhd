library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity SIETE_SEGMENTOS_MULTIPLEXADO is port(
	RELOJ_ENTRADA : in std_logic;
	ENTRADA0 : in std_logic_vector(3 downto 0);
	ENTRADA1 : in std_logic_vector(3 downto 0);
	ENTRADA2 : in std_logic_vector(3 downto 0);
	ENTRADA3 : in std_logic_vector(3 downto 0);
	SALIDA_CEE : out std_logic_vector (3 downto 0);
	SALIDA_SIETE_SEGMENTOS : out std_logic_vector(6 downto 0);
	SALIDA_TRANSISTOR : out std_logic_vector (3 downto 0)
); end SIETE_SEGMENTOS_MULTIPLEXADO;

architecture LOGICA_SIETE_SEGMENTOS_MULTIPLEXADO of SIETE_SEGMENTOS_MULTIPLEXADO is

	
	component SIETE_SEGMENTOS port(
		ENTRADA : in std_logic_vector(3 downto 0);
		SALIDA_SIETE_SEGMENTOS : out std_logic_vector(6 downto 0)
	); end component;

	signal SIGNAL_ENTRADA_ACTUAL : std_logic_vector (3 downto 0);
	signal SIGNAL_SALIDA_TRANSISTOR : std_logic_vector (1 downto 0);
	signal SIGNAL_SALIDA_SIETE_SEGMENTOS : std_logic_vector (6 downto 0);


begin

	
	SIETE_SEGMENTOS_VARIABLE : SIETE_SEGMENTOS port map (
		ENTRADA => SIGNAL_ENTRADA_ACTUAL,
		SALIDA_SIETE_SEGMENTOS => SIGNAL_SALIDA_SIETE_SEGMENTOS
	);

	process (RELOJ_ENTRADA) begin
		if (RELOJ_ENTRADA'event and RELOJ_ENTRADA='1') then
			if (SIGNAL_SALIDA_TRANSISTOR = "11") then
				SIGNAL_SALIDA_TRANSISTOR <= "00";
			else
				SIGNAL_SALIDA_TRANSISTOR <= SIGNAL_SALIDA_TRANSISTOR + 1;
			end if;
		end if;
	end process;
	
with SIGNAL_SALIDA_TRANSISTOR select SIGNAL_ENTRADA_ACTUAL <=
	ENTRADA0 when "00",
	ENTRADA1 when "01",
	ENTRADA2 when "10",
	ENTRADA3 when "11",
	"0000" when others;
	
with SIGNAL_SALIDA_TRANSISTOR select SALIDA_TRANSISTOR <=
	"1110" when "00",
	"1101" when "01",
	"1011" when "10",
	"0111" when "11",
	"1111" when others;
	
SALIDA_SIETE_SEGMENTOS <= SIGNAL_SALIDA_SIETE_SEGMENTOS;

SALIDA_CEE <= SIGNAL_ENTRADA_ACTUAL;

end LOGICA_SIETE_SEGMENTOS_MULTIPLEXADO;