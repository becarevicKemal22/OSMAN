--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : Multiplexer_2                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Multiplexer_2 IS
   PORT ( enable  : IN  std_logic;
          muxIn_0 : IN  std_logic;
          muxIn_1 : IN  std_logic;
          sel     : IN  std_logic;
          muxOut  : OUT std_logic );
END ENTITY Multiplexer_2;
