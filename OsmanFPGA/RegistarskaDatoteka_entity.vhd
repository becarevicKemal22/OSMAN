--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : RegistarskaDatoteka                                          ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY RegistarskaDatoteka IS
   PORT ( Clock             : IN  std_logic;
          PodaciUpis        : IN  std_logic_vector( 7 DOWNTO 0 );
          Reg1Adresa        : IN  std_logic_vector( 2 DOWNTO 0 );
          Reg2Adresa        : IN  std_logic_vector( 2 DOWNTO 0 );
          Reset             : IN  std_logic;
          UpReg             : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          PodaciReg1        : OUT std_logic_vector( 7 DOWNTO 0 );
          PodaciReg2        : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY RegistarskaDatoteka;
