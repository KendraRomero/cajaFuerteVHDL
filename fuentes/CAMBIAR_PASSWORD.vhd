library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity CAMBIAR_PASSWORD is port (
	HABILITADO : in std_logic;
	CAMBIO : in std_logic;
	ENTER : in std_logic;
	ENTRADA0 : in std_logic_vector (3 downto 0);
	ENTRADA1 : in std_logic_vector (3 downto 0);
	ENTRADA2 : in std_logic_vector (3 downto 0);
	ENTRADA3 : in std_logic_vector (3 downto 0);
	PASSWORD0 : out std_logic_vector (3 downto 0):="0000";
	PASSWORD1 : out std_logic_vector (3 downto 0):="0000";
	PASSWORD2 : out std_logic_vector (3 downto 0):="0000";
	PASSWORD3 : out std_logic_vector (3 downto 0):="0000"
); end CAMBIAR_PASSWORD;

architecture Behavioral of CAMBIAR_PASSWORD is

	signal SIGNAL_PASSWORD0 : std_logic_vector (3 downto 0);
	signal SIGNAL_PASSWORD1 : std_logic_vector (3 downto 0);
	signal SIGNAL_PASSWORD2 : std_logic_vector (3 downto 0);
	signal SIGNAL_PASSWORD3 : std_logic_vector (3 downto 0);

	signal AUXILIAR : std_logic_vector(2 downto 0);

begin

	AUXILIAR <= HABILITADO & CAMBIO & ENTER;
	
	with AUXILIAR select SIGNAL_PASSWORD0 <=
		ENTRADA0 when "111",
		SIGNAL_PASSWORD0 when others;
	with AUXILIAR select SIGNAL_PASSWORD1 <=
		ENTRADA1 when "111",
		SIGNAL_PASSWORD1 when others;
	with AUXILIAR select SIGNAL_PASSWORD2 <=
		ENTRADA2 when "111",
		SIGNAL_PASSWORD2 when others;
	with AUXILIAR select SIGNAL_PASSWORD3 <=
		ENTRADA3 when "111",
		SIGNAL_PASSWORD3 when others;

	PASSWORD0 <= SIGNAL_PASSWORD0;
	PASSWORD1 <= SIGNAL_PASSWORD1;
	PASSWORD2 <= SIGNAL_PASSWORD2;
	PASSWORD3 <= SIGNAL_PASSWORD3;

end Behavioral;

