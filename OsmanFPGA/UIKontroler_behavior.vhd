--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : UIKontroler                                                  ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF UIKontroler IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Decoder_4
         PORT ( enable       : IN  std_logic;
                sel          : IN  std_logic_vector( 1 DOWNTO 0 );
                decoderOut_0 : OUT std_logic;
                decoderOut_1 : OUT std_logic;
                decoderOut_2 : OUT std_logic;
                decoderOut_3 : OUT std_logic );
      END COMPONENT;

      COMPONENT Multiplexer_bus_4
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_2 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_3 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic_vector( 1 DOWNTO 0 );
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

      COMPONENT StabilizatorUlaza8Bit
         PORT ( CLK               : IN  std_logic;
                DataIn            : IN  std_logic_vector( 7 DOWNTO 0 );
                RST               : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                DataOut           : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus10 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet3  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus0(7 DOWNTO 0)  <= IzlazniPodaci;
   s_logisimBus10(1 DOWNTO 0) <= Adresa;
   s_logisimBus5(7 DOWNTO 0)  <= Ulaz4;
   s_logisimBus6(7 DOWNTO 0)  <= Ulaz1;
   s_logisimBus7(7 DOWNTO 0)  <= Ulaz2;
   s_logisimBus8(7 DOWNTO 0)  <= Ulaz3;
   s_logisimNet13             <= WE;
   s_logisimNet2              <= RST;
   s_logisimNet3              <= Clock;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Izlaz1       <= s_logisimBus14(7 DOWNTO 0);
   Izlaz2       <= s_logisimBus19(7 DOWNTO 0);
   Izlaz3       <= s_logisimBus15(7 DOWNTO 0);
   Izlaz4       <= s_logisimBus20(7 DOWNTO 0);
   OdabraniUlaz <= s_logisimBus12(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Decoder_4
      PORT MAP ( decoderOut_0 => s_logisimNet16,
                 decoderOut_1 => s_logisimNet18,
                 decoderOut_2 => s_logisimNet11,
                 decoderOut_3 => s_logisimNet17,
                 enable       => s_logisimNet13,
                 sel          => s_logisimBus10(1 DOWNTO 0) );

   PLEXERS_2 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus21(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus1(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus4(7 DOWNTO 0),
                 muxIn_3 => s_logisimBus9(7 DOWNTO 0),
                 muxOut  => s_logisimBus12(7 DOWNTO 0),
                 sel     => s_logisimBus10(1 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   UIIzlazniReg1 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet3,
                 DataIn            => s_logisimBus0(7 DOWNTO 0),
                 DataOut           => s_logisimBus14(7 DOWNTO 0),
                 Reset             => s_logisimNet2,
                 WE                => s_logisimNet16,
                 logisimClockTree0 => logisimClockTree0 );

   UIIzlazniReg2 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet3,
                 DataIn            => s_logisimBus0(7 DOWNTO 0),
                 DataOut           => s_logisimBus19(7 DOWNTO 0),
                 Reset             => s_logisimNet2,
                 WE                => s_logisimNet18,
                 logisimClockTree0 => logisimClockTree0 );

   UIIzlazniReg3 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet3,
                 DataIn            => s_logisimBus0(7 DOWNTO 0),
                 DataOut           => s_logisimBus15(7 DOWNTO 0),
                 Reset             => s_logisimNet2,
                 WE                => s_logisimNet11,
                 logisimClockTree0 => logisimClockTree0 );

   UIIzlazniReg4 : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet3,
                 DataIn            => s_logisimBus0(7 DOWNTO 0),
                 DataOut           => s_logisimBus20(7 DOWNTO 0),
                 Reset             => s_logisimNet2,
                 WE                => s_logisimNet17,
                 logisimClockTree0 => logisimClockTree0 );

   UIUlazniStabilizator1 : StabilizatorUlaza8Bit
      PORT MAP ( CLK               => s_logisimNet3,
                 DataIn            => s_logisimBus6(7 DOWNTO 0),
                 DataOut           => s_logisimBus21(7 DOWNTO 0),
                 RST               => s_logisimNet2,
                 logisimClockTree0 => logisimClockTree0 );

   UIUlazniStabilizator2 : StabilizatorUlaza8Bit
      PORT MAP ( CLK               => s_logisimNet3,
                 DataIn            => s_logisimBus7(7 DOWNTO 0),
                 DataOut           => s_logisimBus1(7 DOWNTO 0),
                 RST               => s_logisimNet2,
                 logisimClockTree0 => logisimClockTree0 );

   UIUlazniStabilizator3 : StabilizatorUlaza8Bit
      PORT MAP ( CLK               => s_logisimNet3,
                 DataIn            => s_logisimBus8(7 DOWNTO 0),
                 DataOut           => s_logisimBus4(7 DOWNTO 0),
                 RST               => s_logisimNet2,
                 logisimClockTree0 => logisimClockTree0 );

   UIUlazniStabilizator4 : StabilizatorUlaza8Bit
      PORT MAP ( CLK               => s_logisimNet3,
                 DataIn            => s_logisimBus5(7 DOWNTO 0),
                 DataOut           => s_logisimBus9(7 DOWNTO 0),
                 RST               => s_logisimNet2,
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
