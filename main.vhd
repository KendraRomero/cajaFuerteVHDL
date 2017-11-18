library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity MAIN is port (
	RELOJ_BASE : in std_logic;
	LED_DE_PRUEBA : out std_logic;
	SALIDA_SERVO : out std_logic;
	CATODOS_BASYS : out std_logic_vector (6 downto 0);
	ANODOS_BASYS : out std_logic_vector (3 downto 0);
	DATOS_CEE : out std_logic_vector (3 downto 0);
	ANODOS_CEE : out std_logic_vector (3 downto 0);
	PIN_A : in std_logic;
	PIN_B : in std_logic;
	PIN_C : in std_logic;
	PIN_0 : out std_logic;
	PIN_1 : out std_logic;
	PIN_2 : out std_logic;
	PIN_3 : out std_logic
); end MAIN;


architecture LOGICA_MAIN of MAIN is

	signal RELOJ_SEGUNDO : std_logic;
	signal RELOJ_KILO : std_logic;
	
	signal HABILITACION : std_logic;
	
	signal ENTER : std_logic;
	signal CAMBIO :  std_logic;
	signal UNO : std_logic;
	signal DOS : std_logic;
	signal TRES : std_logic;
	signal CUATRO : std_logic;
	signal CINCO : std_logic;
	signal SEIS : std_logic;
	signal SIETE : std_logic;
	signal OCHO : std_logic;
	signal NUEVE : std_logic;
	signal CERO : std_logic;
	
	signal SIGNAL_PASSWORD0 : std_logic_vector (3 downto 0);
	signal SIGNAL_PASSWORD1 : std_logic_vector (3 downto 0);
	signal SIGNAL_PASSWORD2 : std_logic_vector (3 downto 0);
	signal SIGNAL_PASSWORD3 : std_logic_vector (3 downto 0);
	
	signal SIGNAL_ENTRADA0 : std_logic_vector (3 downto 0);
	signal SIGNAL_ENTRADA1 : std_logic_vector (3 downto 0);
	signal SIGNAL_ENTRADA2 : std_logic_vector (3 downto 0);
	signal SIGNAL_ENTRADA3 : std_logic_vector (3 downto 0);
	
	component TECLADO_MULTIPLEXADO port (
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
); end component;
	
	component VERIFICAR_PASSWORD port(
		RELOJ_ENTRADA : in std_logic;
		ENTRADA0 : in std_logic_vector(3 downto 0);
		ENTRADA1 : in std_logic_vector(3 downto 0);
		ENTRADA2 : in std_logic_vector(3 downto 0);
		ENTRADA3 : in std_logic_vector(3 downto 0);
		ENTER : in std_logic;
		CAMBIO : in std_logic;
		PASSWORD0 : in std_logic_vector (3 downto 0);
		PASSWORD1 : in std_logic_vector (3 downto 0);
		PASSWORD2 : in std_logic_vector (3 downto 0);
		PASSWORD3 : in std_logic_vector (3 downto 0);
		HABILITADO : out std_logic
	); end component;
	
	component CAMBIAR_PASSWORD port(
		HABILITADO : in std_logic;
		CAMBIO : in std_logic;
		ENTER : in std_logic;
		ENTRADA0 : in std_logic_vector (3 downto 0);
		ENTRADA1 : in std_logic_vector (3 downto 0);
		ENTRADA2 : in std_logic_vector (3 downto 0);
		ENTRADA3 : in std_logic_vector (3 downto 0);
		PASSWORD0 : out std_logic_vector (3 downto 0);
		PASSWORD1 : out std_logic_vector (3 downto 0);
		PASSWORD2 : out std_logic_vector (3 downto 0);
		PASSWORD3 : out std_logic_vector (3 downto 0)
	); end component;
	
	component RECOLECTOR_ENTRADAS port(
		RELOJ_ENTRADA : in std_logic;
		UNO : in std_logic;
		DOS : in std_logic;
		TRES : in std_logic;
		CUATRO : in std_logic;
		CINCO : in std_logic;
		SEIS : in std_logic;
		SIETE : in std_logic;
		OCHO : in std_logic;
		NUEVE : in std_logic;
		CERO : in std_logic;
		SALIDA0 : out std_logic_vector (3 downto 0);
		SALIDA1 : out std_logic_vector (3 downto 0);
		SALIDA2 : out std_logic_vector (3 downto 0);
		SALIDA3 : out std_logic_vector (3 downto 0)
	); end component;
	
	component SIETE_SEGMENTOS_MULTIPLEXADO port(
		RELOJ_ENTRADA : in std_logic;
		ENTRADA0 : in std_logic_vector(3 downto 0);
		ENTRADA1 : in std_logic_vector(3 downto 0);
		ENTRADA2 : in std_logic_vector(3 downto 0);
		ENTRADA3 : in std_logic_vector(3 downto 0);
		SALIDA_CEE : out std_logic_vector (3 downto 0);
		SALIDA_SIETE_SEGMENTOS : out std_logic_vector(6 downto 0);
		SALIDA_TRANSISTOR : out std_logic_vector (3 downto 0)
	); end component;

	component SEGUNDO port(
		RELOJ_BASE: in std_logic;
		RELOJ_SALIDA : out std_logic
	); end component;

	component RELOJ_1K port(
		RELOJ_BASE: in std_logic;
		RELOJ_SALIDA : out std_logic
	); end component;
	
	component SERVO port(
		RELOJ_ENTRADA : in std_logic;
		POSICION : in std_logic;
		SALIDA : out std_logic
	); end component;
	
	
begin

	TECLADO_MULTIPLEXADO1 : TECLADO_MULTIPLEXADO port map (
		RELOJ_ENTRADA => RELOJ_KILO,
		PIN_A => PIN_A,
		PIN_B => PIN_B,
		PIN_C => PIN_C,
		PIN_SALIDA(0) => PIN_0,
		PIN_SALIDA(1) => PIN_1,
		PIN_SALIDA(2) => PIN_2,
		PIN_SALIDA(3) => PIN_3,
		ENTER => ENTER,
		CAMBIO => CAMBIO,
		UNO => UNO,
		DOS => DOS,
		TRES => TRES,
		CUATRO => CUATRO,
		CINCO => CINCO,
		SEIS  => SEIS,
		SIETE => SIETE,
		OCHO => OCHO,
		NUEVE => NUEVE,
		CERO => CERO
	);

	SERVO1 : SERVO port map(
		RELOJ_ENTRADA => RELOJ_BASE,
		POSICION => HABILITACION,
		SALIDA => SALIDA_SERVO
	);

	RECOLECTOR_ENTRADAS1 : RECOLECTOR_ENTRADAS port map(
		RELOJ_ENTRADA => RELOJ_KILO,
		UNO => UNO,
		DOS => DOS,
		TRES => TRES,
		CUATRO => CUATRO,
		CINCO => CINCO,
		SEIS => SEIS,
		SIETE => SIETE,
		OCHO => OCHO,
		NUEVE => NUEVE,
		CERO => CERO,
		SALIDA0 => SIGNAL_ENTRADA0,
		SALIDA1 => SIGNAL_ENTRADA1,
		SALIDA2 => SIGNAL_ENTRADA2,
		SALIDA3 => SIGNAL_ENTRADA3
	);
	
	VERIFICAR_PASSWORD1 : VERIFICAR_PASSWORD port map(
		RELOJ_ENTRADA => RELOJ_BASE,
		ENTRADA0 => SIGNAL_ENTRADA0,
		ENTRADA1 => SIGNAL_ENTRADA1,
		ENTRADA2 => SIGNAL_ENTRADA2,
		ENTRADA3 => SIGNAL_ENTRADA3,
		ENTER => ENTER,
		CAMBIO => CAMBIO,
		PASSWORD0 => SIGNAL_PASSWORD0,
		PASSWORD1 => SIGNAL_PASSWORD1,
		PASSWORD2 => SIGNAL_PASSWORD2,
		PASSWORD3 => SIGNAL_PASSWORD3,
		HABILITADO => HABILITACION
	); 
	
	CAMBIAR_PASSWORD1 : CAMBIAR_PASSWORD port map(
		HABILITADO => HABILITACION,
		CAMBIO => CAMBIO,
		ENTER => ENTER,
		ENTRADA0 => SIGNAL_ENTRADA0,
		ENTRADA1 => SIGNAL_ENTRADA1,
		ENTRADA2 => SIGNAL_ENTRADA2,
		ENTRADA3 => SIGNAL_ENTRADA3,
		PASSWORD0 => SIGNAL_PASSWORD0,
		PASSWORD1 => SIGNAL_PASSWORD1,
		PASSWORD2 => SIGNAL_PASSWORD2,
		PASSWORD3 => SIGNAL_PASSWORD3
	);
	
	DISPLAY_CEE : SIETE_SEGMENTOS_MULTIPLEXADO port map(
		RELOJ_ENTRADA => RELOJ_KILO ,
		ENTRADA0 => SIGNAL_ENTRADA0,
		ENTRADA1 => SIGNAL_ENTRADA1,
		ENTRADA2 => SIGNAL_ENTRADA2,
		ENTRADA3 => SIGNAL_ENTRADA3,
		SALIDA_CEE => DATOS_CEE ,
		SALIDA_SIETE_SEGMENTOS => open,
		SALIDA_TRANSISTOR => ANODOS_CEE
	);
	
	DISPLAY_BASYS : SIETE_SEGMENTOS_MULTIPLEXADO port map(
		RELOJ_ENTRADA => RELOJ_KILO ,  
		ENTRADA0 => SIGNAL_PASSWORD0,
		ENTRADA1 => SIGNAL_PASSWORD1,
		ENTRADA2 => SIGNAL_PASSWORD2,
		ENTRADA3 => SIGNAL_PASSWORD3,
		SALIDA_CEE => open,
		SALIDA_SIETE_SEGMENTOS => CATODOS_BASYS ,
		SALIDA_TRANSISTOR => ANODOS_BASYS
	);

	SEGUNDO1 : SEGUNDO port map (
		RELOJ_BASE => RELOJ_BASE,
		RELOJ_SALIDA => RELOJ_SEGUNDO
	);
	
	RELOK_1K1 : RELOJ_1K port map (
		RELOJ_BASE => RELOJ_BASE,
		RELOJ_SALIDA => RELOJ_KILO	
	);
	
LED_DE_PRUEBA <= HABILITACION;

end LOGICA_MAIN;