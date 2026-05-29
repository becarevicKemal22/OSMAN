--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : StabilizatorUlaza8Bit                                        ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY StabilizatorUlaza8Bit IS
   PORT ( CLK               : IN  std_logic;
          DataIn            : IN  std_logic_vector( 7 DOWNTO 0 );
          RST               : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          DataOut           : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY StabilizatorUlaza8Bit;
