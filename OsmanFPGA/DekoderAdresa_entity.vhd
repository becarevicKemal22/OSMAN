--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : DekoderAdresa                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY DekoderAdresa IS
   PORT ( Addr              : IN  std_logic_vector( 7 DOWNTO 0 );
          CMem              : IN  std_logic;
          PMem              : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          OutputSrc         : OUT std_logic;
          OutputWe          : OUT std_logic;
          RAMOe             : OUT std_logic;
          RAMWe             : OUT std_logic;
          UIAddr            : OUT std_logic_vector( 1 DOWNTO 0 ) );
END ENTITY DekoderAdresa;
