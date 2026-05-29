--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : OSMAN                                                        ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY OSMAN IS
   PORT ( logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimInputBubbles  : IN  std_logic_vector( 12 DOWNTO 0 );
          logisimOutputBubbles : OUT std_logic_vector( 9 DOWNTO 0 ) );
END ENTITY OSMAN;
