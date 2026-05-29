--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : UIKontroler                                                  ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY UIKontroler IS
   PORT ( Adresa            : IN  std_logic_vector( 1 DOWNTO 0 );
          Clock             : IN  std_logic;
          IzlazniPodaci     : IN  std_logic_vector( 7 DOWNTO 0 );
          RST               : IN  std_logic;
          Ulaz1             : IN  std_logic_vector( 7 DOWNTO 0 );
          Ulaz2             : IN  std_logic_vector( 7 DOWNTO 0 );
          Ulaz3             : IN  std_logic_vector( 7 DOWNTO 0 );
          Ulaz4             : IN  std_logic_vector( 7 DOWNTO 0 );
          WE                : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          Izlaz1            : OUT std_logic_vector( 7 DOWNTO 0 );
          Izlaz2            : OUT std_logic_vector( 7 DOWNTO 0 );
          Izlaz3            : OUT std_logic_vector( 7 DOWNTO 0 );
          Izlaz4            : OUT std_logic_vector( 7 DOWNTO 0 );
          OdabraniUlaz      : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY UIKontroler;
