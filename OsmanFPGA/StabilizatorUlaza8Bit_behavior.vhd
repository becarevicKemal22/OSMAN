--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : StabilizatorUlaza8Bit                                        ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF StabilizatorUlaza8Bit IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

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
   SIGNAL s_logisimBus0  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
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
   s_logisimBus0(7 DOWNTO 0) <= DataIn;
   s_logisimNet2             <= CLK;
   s_logisimNet3             <= RST;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   DataOut <= s_logisimBus1(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   MEMORY_1 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimBus0(7),
                 preset => '0',
                 q      => s_logisimBus1(7),
                 qBar   => OPEN,
                 reset  => s_logisimNet3,
                 tick   => logisimClockTree0(2) );

   MEMORY_2 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimBus0(6),
                 preset => '0',
                 q      => s_logisimBus1(6),
                 qBar   => OPEN,
                 reset  => s_logisimNet3,
                 tick   => logisimClockTree0(2) );

   MEMORY_3 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimBus0(5),
                 preset => '0',
                 q      => s_logisimBus1(5),
                 qBar   => OPEN,
                 reset  => s_logisimNet3,
                 tick   => logisimClockTree0(2) );

   MEMORY_4 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimBus0(4),
                 preset => '0',
                 q      => s_logisimBus1(4),
                 qBar   => OPEN,
                 reset  => s_logisimNet3,
                 tick   => logisimClockTree0(2) );

   MEMORY_5 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimBus0(3),
                 preset => '0',
                 q      => s_logisimBus1(3),
                 qBar   => OPEN,
                 reset  => s_logisimNet3,
                 tick   => logisimClockTree0(2) );

   MEMORY_6 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimBus0(2),
                 preset => '0',
                 q      => s_logisimBus1(2),
                 qBar   => OPEN,
                 reset  => s_logisimNet3,
                 tick   => logisimClockTree0(2) );

   MEMORY_7 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimBus0(1),
                 preset => '0',
                 q      => s_logisimBus1(1),
                 qBar   => OPEN,
                 reset  => s_logisimNet3,
                 tick   => logisimClockTree0(2) );

   MEMORY_8 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimBus0(0),
                 preset => '0',
                 q      => s_logisimBus1(0),
                 qBar   => OPEN,
                 reset  => s_logisimNet3,
                 tick   => logisimClockTree0(2) );


END platformIndependent;
