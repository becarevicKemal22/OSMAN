--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : OSMAN                                                        ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF OSMAN IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Multiplexer_bus_2
         GENERIC ( nrOfBits : INTEGER );
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                muxIn_1 : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                sel     : IN  std_logic;
                muxOut  : OUT std_logic_vector( (nrOfBits - 1) DOWNTO 0 ) );
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

      COMPONENT RAMCONTENTS_MemorijaPodataka
         PORT ( address : IN  std_logic_vector( 7 DOWNTO 0 );
                clock   : IN  std_logic;
                dataIn  : IN  std_logic_vector( 7 DOWNTO 0 );
                oe      : IN  std_logic;
                tick    : IN  std_logic;
                we      : IN  std_logic;
                dataOut : OUT std_logic_vector( 7 DOWNTO 0 ) );
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

      COMPONENT StatusniRegistar
         PORT ( CFi               : IN  std_logic;
                Clock             : IN  std_logic;
                NFi               : IN  std_logic;
                Reset             : IN  std_logic;
                VFi               : IN  std_logic;
                WE                : IN  std_logic;
                ZFi               : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                CF                : OUT std_logic;
                NF                : OUT std_logic;
                VF                : OUT std_logic;
                ZF                : OUT std_logic );
      END COMPONENT;

      COMPONENT ALU8Bit
         PORT ( A                 : IN  std_logic_vector( 7 DOWNTO 0 );
                ALUOp             : IN  std_logic_vector( 3 DOWNTO 0 );
                B                 : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                CF                : OUT std_logic;
                I                 : OUT std_logic_vector( 7 DOWNTO 0 );
                NF                : OUT std_logic;
                VF                : OUT std_logic;
                ZF                : OUT std_logic );
      END COMPONENT;

      COMPONENT KontrolnaJedinicaGrananja
         PORT ( CF                : IN  std_logic;
                GranTip           : IN  std_logic_vector( 2 DOWNTO 0 );
                NF                : IN  std_logic;
                SkokReg           : IN  std_logic;
                VF                : IN  std_logic;
                ZF                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                I                 : OUT std_logic_vector( 1 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT DekoderAdresa
         PORT ( Addr              : IN  std_logic_vector( 7 DOWNTO 0 );
                CMem              : IN  std_logic;
                PMem              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                OutputSrc         : OUT std_logic;
                OutputWe          : OUT std_logic;
                RAMOe             : OUT std_logic;
                RAMWe             : OUT std_logic;
                UIAddr            : OUT std_logic_vector( 1 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT UIKontroler
         PORT ( Adresa            : IN  std_logic_vector( 1 DOWNTO 0 );
                Clock             : IN  std_logic;
                IzlazniPodaci     : IN  std_logic_vector( 7 DOWNTO 0 );
                RST               : IN  std_logic;
                Ulaz1             : IN  std_logic_vector( 7 DOWNTO 0 );
                Ulaz2             : IN  std_logic_vector( 7 DOWNTO 0 );
                Ulaz3             : IN  std_logic_vector( 7 DOWNTO 0 );
                Ulaz4             : IN  std_logic_vector( 7 DOWNTO 0 );
                WE                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                Izlaz1            : OUT std_logic_vector( 7 DOWNTO 0 );
                Izlaz2            : OUT std_logic_vector( 7 DOWNTO 0 );
                Izlaz3            : OUT std_logic_vector( 7 DOWNTO 0 );
                Izlaz4            : OUT std_logic_vector( 7 DOWNTO 0 );
                OdabraniUlaz      : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT SevenSegAdapter
         PORT ( Segmenti             : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimClockTree0    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1    : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimOutputBubbles : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT ProgramskiBrojac
         PORT ( Clock             : IN  std_logic;
                DataIn            : IN  std_logic_vector( 7 DOWNTO 0 );
                Reset             : IN  std_logic;
                WE                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                DataOut           : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Sabirac
         PORT ( A                 : IN  std_logic_vector( 7 DOWNTO 0 );
                B                 : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                Izlaz             : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT KontrolnaJedinica
         PORT ( Opcode            : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
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
      END COMPONENT;

      COMPONENT PredznacenoProsirenje
         PORT ( Ulaz              : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                Izlaz             : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT RegistarskaDatoteka
         PORT ( Clock             : IN  std_logic;
                PodaciUpis        : IN  std_logic_vector( 7 DOWNTO 0 );
                Reg1Adresa        : IN  std_logic_vector( 2 DOWNTO 0 );
                Reg2Adresa        : IN  std_logic_vector( 2 DOWNTO 0 );
                Reset             : IN  std_logic;
                UpReg             : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree1 : IN  std_logic_vector( 4 DOWNTO 0 );
                PodaciReg1        : OUT std_logic_vector( 7 DOWNTO 0 );
                PodaciReg2        : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus22 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus34 : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus35 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus37 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus42 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus43 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus46 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus51 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus55 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus56 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus59 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet39 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet40 : std_logic;
   SIGNAL s_logisimNet41 : std_logic;
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet45 : std_logic;
   SIGNAL s_logisimNet47 : std_logic;
   SIGNAL s_logisimNet48 : std_logic;
   SIGNAL s_logisimNet50 : std_logic;
   SIGNAL s_logisimNet52 : std_logic;
   SIGNAL s_logisimNet53 : std_logic;
   SIGNAL s_logisimNet54 : std_logic;
   SIGNAL s_logisimNet57 : std_logic;
   SIGNAL s_logisimNet58 : std_logic;
   SIGNAL s_logisimNet60 : std_logic;
   SIGNAL s_logisimNet61 : std_logic;
   SIGNAL s_logisimNet62 : std_logic;
   SIGNAL s_logisimNet63 : std_logic;
   SIGNAL s_logisimNet64 : std_logic;
   SIGNAL s_logisimNet65 : std_logic;
   SIGNAL s_logisimNet66 : std_logic;
   SIGNAL s_logisimNet67 : std_logic;
   SIGNAL s_logisimNet68 : std_logic;
   SIGNAL s_logisimNet69 : std_logic;
   SIGNAL s_logisimNet70 : std_logic;
   SIGNAL s_logisimNet71 : std_logic;
   SIGNAL s_logisimNet72 : std_logic;
   SIGNAL s_logisimNet73 : std_logic;
   SIGNAL s_logisimNet74 : std_logic;
   SIGNAL s_logisimNet75 : std_logic;
   SIGNAL s_logisimNet76 : std_logic;
   SIGNAL s_logisimNet77 : std_logic;
   SIGNAL s_logisimNet78 : std_logic;
   SIGNAL s_logisimNet79 : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet83 : std_logic;
   SIGNAL s_logisimNet84 : std_logic;
   SIGNAL s_logisimNet85 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet4  <= logisimClockTree1(0);
   s_logisimNet83 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus35(4) <= s_logisimNet32;
   s_logisimBus35(5) <= s_logisimNet32;
   s_logisimBus35(6) <= s_logisimNet32;
   s_logisimBus35(7) <= s_logisimNet32;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet33  <=  '1';


   -- Constant
    s_logisimNet32  <=  '0';


   -- Constant
    s_logisimBus26(7 DOWNTO 0)  <=  X"01";


   -- Button: RST
   s_logisimNet48 <= logisimInputBubbles(0);

   -- LED: LED1
   logisimOutputBubbles(16) <= s_logisimBus43(7);

   -- LED: LED2
   logisimOutputBubbles(17) <= s_logisimBus43(6);

   -- LED: LED3
   logisimOutputBubbles(18) <= s_logisimBus43(5);

   -- LED: LED4
   logisimOutputBubbles(19) <= s_logisimBus43(4);

   -- LED: LED5
   logisimOutputBubbles(20) <= s_logisimBus43(3);

   -- LED: LED6
   logisimOutputBubbles(21) <= s_logisimBus43(2);

   -- LED: LED7
   logisimOutputBubbles(22) <= s_logisimBus43(1);

   -- LED: LED8
   logisimOutputBubbles(23) <= s_logisimBus43(0);

   -- DIP Switch: DIP_Switch
   s_logisimBus20(0) <= logisimInputBubbles(1);
   s_logisimBus20(1) <= logisimInputBubbles(2);
   s_logisimBus20(2) <= logisimInputBubbles(3);
   s_logisimBus20(3) <= logisimInputBubbles(4);
   s_logisimBus20(4) <= logisimInputBubbles(5);
   s_logisimBus20(5) <= logisimInputBubbles(6);
   s_logisimBus20(6) <= logisimInputBubbles(7);
   s_logisimBus20(7) <= logisimInputBubbles(8);

   -- Button: SW0
   s_logisimBus35(0) <= logisimInputBubbles(9);

   -- Button: SW1
   s_logisimBus35(1) <= logisimInputBubbles(10);

   -- Button: SW2
   s_logisimBus35(2) <= logisimInputBubbles(11);

   -- Button: SW3
   s_logisimBus35(3) <= logisimInputBubbles(12);

   -- ROM: InstrukcijskaMemorija
   WITH (s_logisimBus25) SELECT s_logisimBus34 <=
      X"81F9" WHEN X"00",
      X"5901" WHEN X"01",
      X"F101" WHEN X"02",
      X"AF00" WHEN X"03",
      X"81F8" WHEN X"04",
      X"9200" WHEN X"05",
      X"F164" WHEN X"06",
      X"B70B" WHEN X"07",
      X"4A01" WHEN X"08",
      X"5164" WHEN X"09",
      X"9F06" WHEN X"0A",
      X"95EE" WHEN X"0B",
      X"0D40" WHEN X"0C",
      X"D5A0" WHEN X"0D",
      X"8DFC" WHEN X"0E",
      X"9200" WHEN X"0F",
      X"F10A" WHEN X"10",
      X"B715" WHEN X"11",
      X"4A01" WHEN X"12",
      X"510A" WHEN X"13",
      X"9F10" WHEN X"14",
      X"95EE" WHEN X"15",
      X"0D40" WHEN X"16",
      X"D5A0" WHEN X"17",
      X"8DFD" WHEN X"18",
      X"9200" WHEN X"19",
      X"F101" WHEN X"1A",
      X"B71F" WHEN X"1B",
      X"4A01" WHEN X"1C",
      X"5101" WHEN X"1D",
      X"9F1A" WHEN X"1E",
      X"95EE" WHEN X"1F",
      X"0D40" WHEN X"20",
      X"D5A0" WHEN X"21",
      X"8DFE" WHEN X"22",
      X"9F00" WHEN X"23",
      X"0000" WHEN OTHERS;

   -- 7-Segment Display: SedSeg1
   logisimOutputBubbles(24) <= s_logisimBus14(0);
   logisimOutputBubbles(25) <= s_logisimBus14(1);
   logisimOutputBubbles(26) <= s_logisimBus14(2);
   logisimOutputBubbles(27) <= s_logisimBus14(3);
   logisimOutputBubbles(28) <= s_logisimBus14(4);
   logisimOutputBubbles(29) <= s_logisimBus14(5);
   logisimOutputBubbles(30) <= s_logisimBus14(6);
   logisimOutputBubbles(31) <= s_logisimBus14(7);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus5(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus6(7 DOWNTO 0),
                 muxOut  => s_logisimBus56(7 DOWNTO 0),
                 sel     => s_logisimNet61 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus7(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus34(7 DOWNTO 0),
                 muxOut  => s_logisimBus51(7 DOWNTO 0),
                 sel     => s_logisimNet62 );

   PLEXERS_3 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus1(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus34(7 DOWNTO 0),
                 muxOut  => s_logisimBus37(7 DOWNTO 0),
                 sel     => s_logisimNet63 );

   PLEXERS_4 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus2(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus30(7 DOWNTO 0),
                 muxOut  => s_logisimBus9(7 DOWNTO 0),
                 sel     => s_logisimNet41 );

   PLEXERS_5 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus1(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus9(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus42(7 DOWNTO 0),
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus16(7 DOWNTO 0),
                 sel     => s_logisimBus55(1 DOWNTO 0) );

   PLEXERS_6 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus42(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus34(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus5(7 DOWNTO 0),
                 muxIn_3 => s_logisimBus5(7 DOWNTO 0),
                 muxOut  => s_logisimBus18(7 DOWNTO 0),
                 sel     => s_logisimBus11(1 DOWNTO 0) );

   MemorijaPodataka : RAMCONTENTS_MemorijaPodataka
      PORT MAP ( address => s_logisimBus37(7 DOWNTO 0),
                 clock   => logisimClockTree1(4),
                 dataIn  => s_logisimBus5(7 DOWNTO 0),
                 dataOut => s_logisimBus30(7 DOWNTO 0),
                 oe      => '1',
                 tick    => logisimClockTree1(3),
                 we      => s_logisimNet54 );

   MEMORY_8 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet48,
                 preset => '0',
                 q      => s_logisimNet85,
                 qBar   => OPEN,
                 reset  => '0',
                 tick   => logisimClockTree0(2) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   SR : StatusniRegistar
      PORT MAP ( CF                => s_logisimNet53,
                 CFi               => s_logisimNet28,
                 Clock             => s_logisimNet83,
                 NF                => s_logisimNet47,
                 NFi               => s_logisimNet31,
                 Reset             => s_logisimNet85,
                 VF                => s_logisimNet38,
                 VFi               => s_logisimNet13,
                 WE                => s_logisimNet57,
                 ZF                => s_logisimNet19,
                 ZFi               => s_logisimNet44,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   ALU : ALU8Bit
      PORT MAP ( A                 => s_logisimBus56(7 DOWNTO 0),
                 ALUOp             => s_logisimBus46(3 DOWNTO 0),
                 B                 => s_logisimBus51(7 DOWNTO 0),
                 CF                => s_logisimNet28,
                 I                 => s_logisimBus1(7 DOWNTO 0),
                 NF                => s_logisimNet31,
                 VF                => s_logisimNet13,
                 ZF                => s_logisimNet44,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   KJG : KontrolnaJedinicaGrananja
      PORT MAP ( CF                => s_logisimNet53,
                 GranTip           => s_logisimBus59(2 DOWNTO 0),
                 I                 => s_logisimBus11(1 DOWNTO 0),
                 NF                => s_logisimNet47,
                 SkokReg           => s_logisimNet58,
                 VF                => s_logisimNet38,
                 ZF                => s_logisimNet19,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   Dekoder_Adresa : DekoderAdresa
      PORT MAP ( Addr              => s_logisimBus37(7 DOWNTO 0),
                 CMem              => s_logisimNet52,
                 OutputSrc         => s_logisimNet41,
                 OutputWe          => s_logisimNet45,
                 PMem              => s_logisimNet60,
                 RAMOe             => s_logisimNet40,
                 RAMWe             => s_logisimNet54,
                 UIAddr            => s_logisimBus22(1 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   UI_Kontroler : UIKontroler
      PORT MAP ( Adresa            => s_logisimBus22(1 DOWNTO 0),
                 Clock             => s_logisimNet83,
                 Izlaz1            => s_logisimBus21(7 DOWNTO 0),
                 Izlaz2            => s_logisimBus0(7 DOWNTO 0),
                 Izlaz3            => s_logisimBus14(7 DOWNTO 0),
                 Izlaz4            => s_logisimBus43(7 DOWNTO 0),
                 IzlazniPodaci     => s_logisimBus5(7 DOWNTO 0),
                 OdabraniUlaz      => s_logisimBus2(7 DOWNTO 0),
                 RST               => s_logisimNet85,
                 Ulaz1             => s_logisimBus20(7 DOWNTO 0),
                 Ulaz2             => s_logisimBus35(7 DOWNTO 0),
                 Ulaz3             => X"00",
                 Ulaz4             => X"00",
                 WE                => s_logisimNet45,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   SedSeg3 : SevenSegAdapter
      PORT MAP ( Segmenti             => s_logisimBus21(7 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   SedSeg2 : SevenSegAdapter
      PORT MAP ( Segmenti             => s_logisimBus0(7 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   PB : ProgramskiBrojac
      PORT MAP ( Clock             => s_logisimNet83,
                 DataIn            => s_logisimBus18(7 DOWNTO 0),
                 DataOut           => s_logisimBus25(7 DOWNTO 0),
                 Reset             => s_logisimNet85,
                 WE                => s_logisimNet33,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   PBSab : Sabirac
      PORT MAP ( A                 => s_logisimBus26(7 DOWNTO 0),
                 B                 => s_logisimBus25(7 DOWNTO 0),
                 Izlaz             => s_logisimBus42(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   KJ : KontrolnaJedinica
      PORT MAP ( ALUIzv1           => s_logisimNet61,
                 ALUIzv2           => s_logisimNet62,
                 ALUOp             => s_logisimBus46(3 DOWNTO 0),
                 CMem              => s_logisimNet52,
                 GranTip           => s_logisimBus59(2 DOWNTO 0),
                 MemIzv            => s_logisimNet63,
                 Opcode            => s_logisimBus34(15 DOWNTO 11),
                 PMem              => s_logisimNet60,
                 RegPod            => s_logisimBus55(1 DOWNTO 0),
                 SkokReg           => s_logisimNet58,
                 UpReg             => s_logisimNet84,
                 UpStat            => s_logisimNet57,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   Predznaceno_Prosirenje : PredznacenoProsirenje
      PORT MAP ( Izlaz             => s_logisimBus6(7 DOWNTO 0),
                 Ulaz              => s_logisimBus34(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   RD : RegistarskaDatoteka
      PORT MAP ( Clock             => s_logisimNet83,
                 PodaciReg1        => s_logisimBus5(7 DOWNTO 0),
                 PodaciReg2        => s_logisimBus7(7 DOWNTO 0),
                 PodaciUpis        => s_logisimBus16(7 DOWNTO 0),
                 Reg1Adresa        => s_logisimBus34(10 DOWNTO 8),
                 Reg2Adresa        => s_logisimBus34(7 DOWNTO 5),
                 Reset             => s_logisimNet85,
                 UpReg             => s_logisimNet84,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

END platformIndependent;
