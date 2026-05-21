--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : PredznacenoProsirenje                                        ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY PredznacenoProsirenje IS
   PORT ( Ulaz              : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          Izlaz             : OUT std_logic_vector( 7 DOWNTO 0 ) );
END ENTITY PredznacenoProsirenje;
