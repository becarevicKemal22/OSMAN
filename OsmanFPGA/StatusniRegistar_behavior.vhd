--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : StatusniRegistar                                             ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF StatusniRegistar IS 

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
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
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
   s_logisimNet13 <= NFi;
   s_logisimNet14 <= CFi;
   s_logisimNet15 <= WE;
   s_logisimNet4  <= Reset;
   s_logisimNet5  <= Clock;
   s_logisimNet8  <= ZFi;
   s_logisimNet9  <= VFi;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   CF <= s_logisimNet10;
   NF <= s_logisimNet6;
   VF <= s_logisimNet2;
   ZF <= s_logisimNet0;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- NOT Gate
   s_logisimNet7 <=  NOT s_logisimNet15;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimNet9,
                 muxIn_1 => s_logisimNet2,
                 muxOut  => s_logisimNet1,
                 sel     => s_logisimNet7 );

   PLEXERS_2 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimNet14,
                 muxIn_1 => s_logisimNet10,
                 muxOut  => s_logisimNet12,
                 sel     => s_logisimNet7 );

   PLEXERS_3 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimNet8,
                 muxIn_1 => s_logisimNet0,
                 muxOut  => s_logisimNet3,
                 sel     => s_logisimNet7 );

   PLEXERS_4 : Multiplexer_2
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimNet13,
                 muxIn_1 => s_logisimNet6,
                 muxOut  => s_logisimNet11,
                 sel     => s_logisimNet7 );

   MEMORY_5 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 1 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet1,
                 preset => '0',
                 q      => s_logisimNet2,
                 qBar   => OPEN,
                 reset  => s_logisimNet4,
                 tick   => logisimClockTree0(3) );

   MEMORY_6 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 1 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet12,
                 preset => '0',
                 q      => s_logisimNet10,
                 qBar   => OPEN,
                 reset  => s_logisimNet4,
                 tick   => logisimClockTree0(3) );

   MEMORY_7 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 1 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet3,
                 preset => '0',
                 q      => s_logisimNet0,
                 qBar   => OPEN,
                 reset  => s_logisimNet4,
                 tick   => logisimClockTree0(3) );

   MEMORY_8 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 1 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet11,
                 preset => '0',
                 q      => s_logisimNet6,
                 qBar   => OPEN,
                 reset  => s_logisimNet4,
                 tick   => logisimClockTree0(3) );


END platformIndependent;
