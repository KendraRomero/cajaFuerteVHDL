library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture tb of testbench is

	component MAIN port (
		RELOJ_BASE : in std_logic;
		RESET : in std_logic;
		LED_DE_PRUEBA : out std_logic;
		UNO : in std_logic;
		DOS : in std_logic;
		TRES : in std_logic;
		CATODOS_BASYS : out std_logic_vector (6 downto 0);
		ANODOS_BASYS : out std_logic_vector (3 downto 0)
	); end component;

	
begin

	

end testbench;
