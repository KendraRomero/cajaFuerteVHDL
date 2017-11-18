library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RECOLECTOR_ENTRADAS is port(
	RELOJ_ENTRADA : in std_logic;
	CERO : in std_logic;
	UNO : in std_logic;
	DOS : in std_logic;
	TRES : in std_logic;
	CUATRO : in std_logic;
	CINCO : in std_logic;
	SEIS : in std_logic;
	SIETE : in std_logic;
	OCHO : in std_logic;
	NUEVE : in std_logic;
	SALIDA0 : out std_logic_vector (3 downto 0);
	SALIDA1 : out std_logic_vector (3 downto 0);
	SALIDA2 : out std_logic_vector (3 downto 0);
	SALIDA3 : out std_logic_vector (3 downto 0)
); end RECOLECTOR_ENTRADAS;

architecture LOGICA_RECOLECTOR_ENTRADAS of RECOLECTOR_ENTRADAS is

	signal SIGNAL_FLAG : std_logic:='0';
	signal SIGNAL_CONTADOR : std_logic_vector (6 downto 0);
	signal SIGNAL_NUMERO_ACTUAL : std_logic_vector (3 downto 0);
	signal SIGNAL_SALIDA0 : std_logic_vector (3 downto 0);
	signal SIGNAL_SALIDA1 : std_logic_vector (3 downto 0);
	signal SIGNAL_SALIDA2 : std_logic_vector (3 downto 0);
	signal SIGNAL_SALIDA3 : std_logic_vector (3 downto 0);

begin
	
	process(RELOJ_ENTRADA) begin
		if(RELOJ_ENTRADA'event and RELOJ_ENTRADA='1') then
			if (UNO='1' and SIGNAL_FLAG='0') then
				SIGNAL_NUMERO_ACTUAL <= "0001";
				SIGNAL_FLAG <='1';
			elsif (DOS='1' and SIGNAL_FLAG ='0') then
				SIGNAL_NUMERO_ACTUAL <= "0010";
				SIGNAL_FLAG <='1';
			elsif (TRES='1' and SIGNAL_FLAG ='0') then
				SIGNAL_NUMERO_ACTUAL <= "0011";
				SIGNAL_FLAG <='1';
			elsif (CUATRO='1' and SIGNAL_FLAG='0') then
				SIGNAL_NUMERO_ACTUAL <= "0100";
				SIGNAL_FLAG <='1';
			elsif (CINCO='1' and SIGNAL_FLAG='0') then
				SIGNAL_NUMERO_ACTUAL <= "0101";
				SIGNAL_FLAG <='1';
			elsif (SEIS='1' and SIGNAL_FLAG='0') then
				SIGNAL_NUMERO_ACTUAL <= "0110";
				SIGNAL_FLAG <='1';
			elsif (SIETE='1' and SIGNAL_FLAG='0') then
				SIGNAL_NUMERO_ACTUAL <= "0111";
				SIGNAL_FLAG <='1';
			elsif (OCHO='1' and SIGNAL_FLAG='0') then
				SIGNAL_NUMERO_ACTUAL <= "1000";
				SIGNAL_FLAG <='1';
			elsif (NUEVE='1' and SIGNAL_FLAG='0') then
				SIGNAL_NUMERO_ACTUAL <= "1001";
				SIGNAL_FLAG <='1';
			elsif (CERO='1' and SIGNAL_FLAG='0') then
				SIGNAL_NUMERO_ACTUAL <= "0000";
				SIGNAL_FLAG <='1';
			elsif (SIGNAL_FLAG ='1') then
				if (SIGNAL_CONTADOR="1111111") then
					SIGNAL_FLAG <= '0';
					SIGNAL_CONTADOR<="0000000";
					SIGNAL_SALIDA0 <= SIGNAL_SALIDA1;
					SIGNAL_SALIDA1 <= SIGNAL_SALIDA2;
					SIGNAL_SALIDA2 <= SIGNAL_SALIDA3;
					SIGNAL_SALIDA3 <= SIGNAL_NUMERO_ACTUAL;
				else
					SIGNAL_CONTADOR <= SIGNAL_CONTADOR + 1;
				end if;
			end if;
		end if;
	end process;
	
	SALIDA0 <= SIGNAL_SALIDA0;
	SALIDA1 <= SIGNAL_SALIDA1;
	SALIDA2 <= SIGNAL_SALIDA2;
	SALIDA3 <= SIGNAL_SALIDA3;

end LOGICA_RECOLECTOR_ENTRADAS;

