--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : RegistarskaDatoteka                                          ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF RegistarskaDatoteka IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Decoder_8
         PORT ( enable       : IN  std_logic;
                sel          : IN  std_logic_vector( 2 DOWNTO 0 );
                decoderOut_0 : OUT std_logic;
                decoderOut_1 : OUT std_logic;
                decoderOut_2 : OUT std_logic;
                decoderOut_3 : OUT std_logic;
                decoderOut_4 : OUT std_logic;
                decoderOut_5 : OUT std_logic;
                decoderOut_6 : OUT std_logic;
                decoderOut_7 : OUT std_logic );
      END COMPONENT;

      COMPONENT Multiplexer_bus_8
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_2 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_3 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_4 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_5 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_6 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_7 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic_vector( 2 DOWNTO 0 );
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Registar8Bit
         PORT ( Clock             : IN  std_logic;
                DataIn            : IN  std_logic_vector( 7 DOWNTO 0 );
                Reset             : IN  std_logic;
                WE                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                DataOut           : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus1  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus10 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus23 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus10(2 DOWNTO 0) <= Reg1Adresa;
   s_logisimBus23(2 DOWNTO 0) <= Reg2Adresa;
   s_logisimBus4(7 DOWNTO 0)  <= PodaciUpis;
   s_logisimNet0              <= Reset;
   s_logisimNet15             <= Clock;
   s_logisimNet5              <= UpReg;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   PodaciReg1 <= s_logisimBus21(7 DOWNTO 0);
   PodaciReg2 <= s_logisimBus16(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Decoder_8
      PORT MAP ( decoderOut_0 => s_logisimNet13,
                 decoderOut_1 => s_logisimNet17,
                 decoderOut_2 => s_logisimNet6,
                 decoderOut_3 => s_logisimNet19,
                 decoderOut_4 => s_logisimNet2,
                 decoderOut_5 => s_logisimNet18,
                 decoderOut_6 => s_logisimNet22,
                 decoderOut_7 => s_logisimNet20,
                 enable       => s_logisimNet5,
                 sel          => s_logisimBus10(2 DOWNTO 0) );

   PLEXERS_2 : Multiplexer_bus_8
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus9(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus1(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus7(7 DOWNTO 0),
                 muxIn_3 => s_logisimBus8(7 DOWNTO 0),
                 muxIn_4 => s_logisimBus14(7 DOWNTO 0),
                 muxIn_5 => s_logisimBus3(7 DOWNTO 0),
                 muxIn_6 => s_logisimBus12(7 DOWNTO 0),
                 muxIn_7 => s_logisimBus11(7 DOWNTO 0),
                 muxOut  => s_logisimBus21(7 DOWNTO 0),
                 sel     => s_logisimBus10(2 DOWNTO 0) );

   PLEXERS_3 : Multiplexer_bus_8
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus9(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus1(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus7(7 DOWNTO 0),
                 muxIn_3 => s_logisimBus8(7 DOWNTO 0),
                 muxIn_4 => s_logisimBus14(7 DOWNTO 0),
                 muxIn_5 => s_logisimBus3(7 DOWNTO 0),
                 muxIn_6 => s_logisimBus12(7 DOWNTO 0),
                 muxIn_7 => s_logisimBus11(7 DOWNTO 0),
                 muxOut  => s_logisimBus16(7 DOWNTO 0),
                 sel     => s_logisimBus23(2 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   Registar8Bit_1 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet15,
                 DataIn            => s_logisimBus4(7 DOWNTO 0),
                 DataOut           => s_logisimBus9(7 DOWNTO 0),
                 Reset             => s_logisimNet0,
                 WE                => s_logisimNet13,
                 logisimClockTree0 => logisimClockTree0 );

   Registar8Bit_2 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet15,
                 DataIn            => s_logisimBus4(7 DOWNTO 0),
                 DataOut           => s_logisimBus1(7 DOWNTO 0),
                 Reset             => s_logisimNet0,
                 WE                => s_logisimNet17,
                 logisimClockTree0 => logisimClockTree0 );

   Registar8Bit_3 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet15,
                 DataIn            => s_logisimBus4(7 DOWNTO 0),
                 DataOut           => s_logisimBus7(7 DOWNTO 0),
                 Reset             => s_logisimNet0,
                 WE                => s_logisimNet6,
                 logisimClockTree0 => logisimClockTree0 );

   Registar8Bit_4 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet15,
                 DataIn            => s_logisimBus4(7 DOWNTO 0),
                 DataOut           => s_logisimBus8(7 DOWNTO 0),
                 Reset             => s_logisimNet0,
                 WE                => s_logisimNet19,
                 logisimClockTree0 => logisimClockTree0 );

   Registar8Bit_5 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet15,
                 DataIn            => s_logisimBus4(7 DOWNTO 0),
                 DataOut           => s_logisimBus14(7 DOWNTO 0),
                 Reset             => s_logisimNet0,
                 WE                => s_logisimNet2,
                 logisimClockTree0 => logisimClockTree0 );

   Registar8Bit_6 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet15,
                 DataIn            => s_logisimBus4(7 DOWNTO 0),
                 DataOut           => s_logisimBus3(7 DOWNTO 0),
                 Reset             => s_logisimNet0,
                 WE                => s_logisimNet18,
                 logisimClockTree0 => logisimClockTree0 );

   Registar8Bit_7 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet15,
                 DataIn            => s_logisimBus4(7 DOWNTO 0),
                 DataOut           => s_logisimBus12(7 DOWNTO 0),
                 Reset             => s_logisimNet0,
                 WE                => s_logisimNet22,
                 logisimClockTree0 => logisimClockTree0 );

   Registar8Bit_8 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet15,
                 DataIn            => s_logisimBus4(7 DOWNTO 0),
                 DataOut           => s_logisimBus11(7 DOWNTO 0),
                 Reset             => s_logisimNet0,
                 WE                => s_logisimNet20,
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
