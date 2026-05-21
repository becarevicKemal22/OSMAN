--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : KontrolnaJedinicaGrananja                                    ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY KontrolnaJedinicaGrananja IS
   PORT ( CF                : IN  std_logic;
          GranTip           : IN  std_logic_vector( 2 DOWNTO 0 );
          NF                : IN  std_logic;
          SkokReg           : IN  std_logic;
          VF                : IN  std_logic;
          ZF                : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          I                 : OUT std_logic_vector( 1 DOWNTO 0 ) );
END ENTITY KontrolnaJedinicaGrananja;
