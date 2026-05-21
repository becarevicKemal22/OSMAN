--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : StatusniRegistar                                             ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY StatusniRegistar IS
   PORT ( CFi               : IN  std_logic;
          Clock             : IN  std_logic;
          NFi               : IN  std_logic;
          Reset             : IN  std_logic;
          VFi               : IN  std_logic;
          WE                : IN  std_logic;
          ZFi               : IN  std_logic;
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          CF                : OUT std_logic;
          NF                : OUT std_logic;
          VF                : OUT std_logic;
          ZF                : OUT std_logic );
END ENTITY StatusniRegistar;
