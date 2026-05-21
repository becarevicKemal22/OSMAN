--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : D_FLIPFLOP                                                   ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY D_FLIPFLOP IS
   GENERIC ( invertClockEnable : INTEGER );
   PORT ( clock  : IN  std_logic;
          d      : IN  std_logic;
          preset : IN  std_logic;
          reset  : IN  std_logic;
          tick   : IN  std_logic;
          q      : OUT std_logic;
          qBar   : OUT std_logic );
END ENTITY D_FLIPFLOP;
