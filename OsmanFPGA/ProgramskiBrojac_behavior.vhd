--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : ProgramskiBrojac                                             ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF ProgramskiBrojac IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Multiplexer_2
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic;
                muxIn_1 : IN  std_logic;
                sel     : IN  std_logic;
                muxOut  : OUT std_logic );
      END COMPONENT;

      COMPONENT D_FLIPFLOP
         GENERIC ( invertClockEnable : INTEGER );
         PORT ( clock  : IN  std_logic;
                d      : IN  std_logic;
                preset : IN  std_logic;
                reset  : IN  std_logic;
                tick   : IN  std_logic;
                q      : OUT std_logic;
                qBar   : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus11 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus12(7 DOWNTO 0) <= DataIn;
   s_logisimNet29             <= WE;
   s_logisimNet4              <= Clock;
   s_logisimNet6              <= Reset;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   DataOut <= s_logisimBus11(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- NOT Gate
   s_logisimNet7 <=  NOT s_logisimNet29;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(2),
                 muxIn_1 => s_logisimBus11(2),
                 muxOut  => s_logisimNet25,
                 sel     => s_logisimNet7 );

   MEMORY_2 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet19,
                 preset => '0',
                 q      => s_logisimBus11(1),
                 qBar   => OPEN,
                 reset  => s_logisimNet6,
                 tick   => logisimClockTree0(2) );

   MEMORY_3 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet13,
                 preset => '0',
                 q      => s_logisimBus11(0),
                 qBar   => OPEN,
                 reset  => s_logisimNet6,
                 tick   => logisimClockTree0(2) );

   PLEXERS_4 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(3),
                 muxIn_1 => s_logisimBus11(3),
                 muxOut  => s_logisimNet0,
                 sel     => s_logisimNet7 );

   PLEXERS_5 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(4),
                 muxIn_1 => s_logisimBus11(4),
                 muxOut  => s_logisimNet14,
                 sel     => s_logisimNet7 );

   PLEXERS_6 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(6),
                 muxIn_1 => s_logisimBus11(6),
                 muxOut  => s_logisimNet26,
                 sel     => s_logisimNet7 );

   PLEXERS_7 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(0),
                 muxIn_1 => s_logisimBus11(0),
                 muxOut  => s_logisimNet13,
                 sel     => s_logisimNet7 );

   MEMORY_8 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet14,
                 preset => '0',
                 q      => s_logisimBus11(4),
                 qBar   => OPEN,
                 reset  => s_logisimNet6,
                 tick   => logisimClockTree0(2) );

   PLEXERS_9 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(7),
                 muxIn_1 => s_logisimBus11(7),
                 muxOut  => s_logisimNet2,
                 sel     => s_logisimNet7 );

   MEMORY_10 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet0,
                 preset => '0',
                 q      => s_logisimBus11(3),
                 qBar   => OPEN,
                 reset  => s_logisimNet6,
                 tick   => logisimClockTree0(2) );

   PLEXERS_11 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(5),
                 muxIn_1 => s_logisimBus11(5),
                 muxOut  => s_logisimNet20,
                 sel     => s_logisimNet7 );

   MEMORY_12 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet20,
                 preset => '0',
                 q      => s_logisimBus11(5),
                 qBar   => OPEN,
                 reset  => s_logisimNet6,
                 tick   => logisimClockTree0(2) );

   MEMORY_13 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet26,
                 preset => '0',
                 q      => s_logisimBus11(6),
                 qBar   => OPEN,
                 reset  => s_logisimNet6,
                 tick   => logisimClockTree0(2) );

   PLEXERS_14 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus12(1),
                 muxIn_1 => s_logisimBus11(1),
                 muxOut  => s_logisimNet19,
                 sel     => s_logisimNet7 );

   MEMORY_15 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet2,
                 preset => '0',
                 q      => s_logisimBus11(7),
                 qBar   => OPEN,
                 reset  => s_logisimNet6,
                 tick   => logisimClockTree0(2) );

   MEMORY_16 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet25,
                 preset => '0',
                 q      => s_logisimBus11(2),
                 qBar   => OPEN,
                 reset  => s_logisimNet6,
                 tick   => logisimClockTree0(2) );


END platformIndependent;
