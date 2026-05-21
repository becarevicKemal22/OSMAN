--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : ALU1Bit                                                      ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY ALU1Bit IS
   PORT ( A                 : IN  std_logic;
          B                 : IN  std_logic;
          Cin               : IN  std_logic;
          F                 : IN  std_logic_vector( 2 DOWNTO 0 );
          InvB              : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          Cout              : OUT std_logic;
          O                 : OUT std_logic );
END ENTITY ALU1Bit;
