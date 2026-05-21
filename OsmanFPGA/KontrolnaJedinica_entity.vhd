--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : KontrolnaJedinica                                            ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY KontrolnaJedinica IS
   PORT ( Opcode            : IN  std_logic_vector( 4 DOWNTO 0 );
          logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
          ALUIzv1           : OUT std_logic;
          ALUIzv2           : OUT std_logic;
          ALUOp             : OUT std_logic_vector( 3 DOWNTO 0 );
          CMem              : OUT std_logic;
          GranTip           : OUT std_logic_vector( 2 DOWNTO 0 );
          MemIzv            : OUT std_logic;
          PMem              : OUT std_logic;
          RegPod            : OUT std_logic_vector( 1 DOWNTO 0 );
          SkokReg           : OUT std_logic;
          UpReg             : OUT std_logic;
          UpStat            : OUT std_logic );
END ENTITY KontrolnaJedinica;
