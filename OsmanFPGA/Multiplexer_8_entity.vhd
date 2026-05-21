--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : Multiplexer_8                                                ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Multiplexer_8 IS
   PORT ( enable  : IN  std_logic;
          muxIn_0 : IN  std_logic;
          muxIn_1 : IN  std_logic;
          muxIn_2 : IN  std_logic;
          muxIn_3 : IN  std_logic;
          muxIn_4 : IN  std_logic;
          muxIn_5 : IN  std_logic;
          muxIn_6 : IN  std_logic;
          muxIn_7 : IN  std_logic;
          sel     : IN  std_logic_vector( 2 DOWNTO 0 );
          muxOut  : OUT std_logic );
END ENTITY Multiplexer_8;
