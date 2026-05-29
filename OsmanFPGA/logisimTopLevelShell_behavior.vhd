--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : logisimTopLevelShell                                         ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF logisimTopLevelShell IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------
      COMPONENT synthesizedClockGenerator
         PORT ( FPGAClock        : IN  std_logic;
                SynthesizedClock : OUT std_logic );
      END COMPONENT;

      COMPONENT logisimTickGenerator
         GENERIC ( nrOfBits    : INTEGER;
                   reloadValue : INTEGER );
         PORT ( FPGAClock : IN  std_logic;
                FPGATick  : OUT std_logic );
      END COMPONENT;

      COMPONENT LogisimClockComponent
         GENERIC ( highTicks : INTEGER;
                   lowTicks  : INTEGER;
                   nrOfBits  : INTEGER;
                   phase     : INTEGER );
         PORT ( clockTick   : IN  std_logic;
                globalClock : IN  std_logic;
                clockBus    : OUT std_logic_vector( 4 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT OSMAN
         PORT ( logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimInputBubbles  : IN  std_logic_vector( 12 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 9 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_fpgaTick             : std_logic;
   SIGNAL s_logisimClockTree0    : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimInputBubbles  : std_logic_vector( 12 DOWNTO 0 );
   SIGNAL s_logisimOutputBubbles : std_logic_vector( 9 DOWNTO 0 );
   SIGNAL s_synthesizedClock     : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All signal adaptations are performed here                                  --
   --------------------------------------------------------------------------------
   LED10_0                   <= s_logisimOutputBubbles(8);
   LED1_0                    <= s_logisimOutputBubbles(3);
   LED2_0                    <= s_logisimOutputBubbles(4);
   LED3_0                    <= s_logisimOutputBubbles(2);
   LED4_0                    <= s_logisimOutputBubbles(0);
   LED5_0                    <= s_logisimOutputBubbles(5);
   LED6_0                    <= s_logisimOutputBubbles(1);
   LED7_0                    <= s_logisimOutputBubbles(6);
   LED8_0                    <= s_logisimOutputBubbles(7);
   LED9_0                    <= s_logisimOutputBubbles(9);
   s_logisimInputBubbles(0)  <=  NOT n_RST_0;
   s_logisimInputBubbles(1)  <= DIP_Switch_sw_1;
   s_logisimInputBubbles(10) <=  NOT n_SW1_0;
   s_logisimInputBubbles(11) <=  NOT n_SW2_0;
   s_logisimInputBubbles(12) <= '0';
   s_logisimInputBubbles(2)  <= DIP_Switch_sw_2;
   s_logisimInputBubbles(3)  <= DIP_Switch_sw_3;
   s_logisimInputBubbles(4)  <= DIP_Switch_sw_4;
   s_logisimInputBubbles(5)  <= DIP_Switch_sw_5;
   s_logisimInputBubbles(6)  <= DIP_Switch_sw_6;
   s_logisimInputBubbles(7)  <= DIP_Switch_sw_7;
   s_logisimInputBubbles(8)  <= DIP_Switch_sw_8;
   s_logisimInputBubbles(9)  <=  NOT n_SW0_0;

   --------------------------------------------------------------------------------
   -- The clock tree components are defined here                                 --
   --------------------------------------------------------------------------------
   BASE_0 : synthesizedClockGenerator
      PORT MAP ( FPGAClock        => fpgaGlobalClock,
                 SynthesizedClock => s_synthesizedClock );

   BASE_1 : logisimTickGenerator
      GENERIC MAP ( nrOfBits    => 26,
                    reloadValue => 1500000 )
      PORT MAP ( FPGAClock => s_synthesizedClock,
                 FPGATick  => s_fpgaTick );

   CLK : LogisimClockComponent
      GENERIC MAP ( highTicks => 1,
                    lowTicks  => 1,
                    nrOfBits  => 1,
                    phase     => 1 )
      PORT MAP ( clockBus    => s_logisimClockTree0,
                 clockTick   => s_fpgaTick,
                 globalClock => s_synthesizedClock );

   --------------------------------------------------------------------------------
   -- The toplevel component is connected here                                   --
   --------------------------------------------------------------------------------
   CIRCUIT_0 : OSMAN
      PORT MAP ( logisimClockTree0    => s_logisimClockTree0,
                 logisimInputBubbles  => s_logisimInputBubbles,
                 logisimOutputBubbles => s_logisimOutputBubbles );
END platformIndependent;
