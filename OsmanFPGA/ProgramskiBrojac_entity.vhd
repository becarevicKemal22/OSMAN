--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : ProgramskiBrojac                                             ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY ProgramskiBrojac IS
   PORT ( Clock             : IN  std_logic;
          DataIn            : IN  std_logic_vector( 7 DOWNTO 0 );
          Reset             : IN  std_logic;
          WE                : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          DataOut           : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY ProgramskiBrojac;
