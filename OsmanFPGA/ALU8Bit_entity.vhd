--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : ALU8Bit                                                      ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY ALU8Bit IS
   PORT ( A                 : IN  std_logic_vector( 7 DOWNTO 0 );
          ALUOp             : IN  std_logic_vector( 3 DOWNTO 0 );
          B                 : IN  std_logic_vector( 7 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          CF                : OUT std_logic;
          I                 : OUT std_logic_vector( 7 DOWNTO 0 );
          NF                : OUT std_logic;
          VF                : OUT std_logic;
          ZF                : OUT std_logic );
END ENTITY ALU8Bit;
