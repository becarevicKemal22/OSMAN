--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY logisimTopLevelShell IS
   PORT ( DIP_Switch_sw_1 : IN  std_logic;
          DIP_Switch_sw_2 : IN  std_logic;
          DIP_Switch_sw_3 : IN  std_logic;
          DIP_Switch_sw_4 : IN  std_logic;
          DIP_Switch_sw_5 : IN  std_logic;
          DIP_Switch_sw_6 : IN  std_logic;
          DIP_Switch_sw_7 : IN  std_logic;
          DIP_Switch_sw_8 : IN  std_logic;
          fpgaGlobalClock : IN  std_logic;
          n_RST_0         : IN  std_logic;
          n_SW0_0         : IN  std_logic;
          n_SW1_0         : IN  std_logic;
          n_SW2_0         : IN  std_logic;
          LED10_0         : OUT std_logic;
          LED1_0          : OUT std_logic;
          LED2_0          : OUT std_logic;
          LED3_0          : OUT std_logic;
          LED4_0          : OUT std_logic;
          LED5_0          : OUT std_logic;
          LED6_0          : OUT std_logic;
          LED7_0          : OUT std_logic;
          LED8_0          : OUT std_logic;
          LED9_0          : OUT std_logic );
END ENTITY logisimTopLevelShell;
