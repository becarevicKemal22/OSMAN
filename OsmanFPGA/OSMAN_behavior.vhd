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

      COMPONENT StatusniRegistar
         PORT ( CFi               : IN  std_logic;
                Clock             : IN  std_logic;
                NFi               : IN  std_logic;
                Reset             : IN  std_logic;
                VFi               : IN  std_logic;
                WE                : IN  std_logic;
                ZFi               : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
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
                I                 : OUT std_logic_vector( 1 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT DekoderAdresa
         PORT ( Addr              : IN  std_logic_vector( 7 DOWNTO 0 );
                CMem              : IN  std_logic;
                PMem              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
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
                Izlaz1            : OUT std_logic_vector( 7 DOWNTO 0 );
                Izlaz2            : OUT std_logic_vector( 7 DOWNTO 0 );
                Izlaz3            : OUT std_logic_vector( 7 DOWNTO 0 );
                Izlaz4            : OUT std_logic_vector( 7 DOWNTO 0 );
                OdabraniUlaz      : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT ProgramskiBrojac
         PORT ( Clock             : IN  std_logic;
                DataIn            : IN  std_logic_vector( 7 DOWNTO 0 );
                Reset             : IN  std_logic;
                WE                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                DataOut           : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT Sabirac
         PORT ( A                 : IN  std_logic_vector( 7 DOWNTO 0 );
                B                 : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Izlaz             : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

      COMPONENT KontrolnaJedinica
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
      END COMPONENT;

      COMPONENT PredznacenoProsirenje
         PORT ( Ulaz              : IN  std_logic_vector( 4 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
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
                PodaciReg1        : OUT std_logic_vector( 7 DOWNTO 0 );
                PodaciReg2        : OUT std_logic_vector( 7 DOWNTO 0 ) );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus10 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus12 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus17 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus23 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus27 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus32 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus33 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus34 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus42 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus44 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus46 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet30 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet37 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet39 : std_logic;
   SIGNAL s_logisimNet40 : std_logic;
   SIGNAL s_logisimNet41 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
   SIGNAL s_logisimNet45 : std_logic;
   SIGNAL s_logisimNet47 : std_logic;
   SIGNAL s_logisimNet48 : std_logic;
   SIGNAL s_logisimNet49 : std_logic;
   SIGNAL s_logisimNet50 : std_logic;
   SIGNAL s_logisimNet51 : std_logic;
   SIGNAL s_logisimNet52 : std_logic;
   SIGNAL s_logisimNet53 : std_logic;
   SIGNAL s_logisimNet54 : std_logic;
   SIGNAL s_logisimNet55 : std_logic;
   SIGNAL s_logisimNet56 : std_logic;
   SIGNAL s_logisimNet57 : std_logic;
   SIGNAL s_logisimNet58 : std_logic;
   SIGNAL s_logisimNet59 : std_logic;
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
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet63 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus2(4) <= s_logisimNet28;
   s_logisimBus2(5) <= s_logisimNet28;
   s_logisimBus2(6) <= s_logisimNet28;
   s_logisimBus2(7) <= s_logisimNet28;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet36  <=  '1';


   -- Constant
    s_logisimBus29(7 DOWNTO 0)  <=  X"01";


   -- ROM: InstrukcijskaMemorija
   WITH (s_logisimBus26) SELECT s_logisimBus7 <=
      X"9301" WHEN X"00",
      X"8BFE" WHEN X"01",
      X"84F8" WHEN X"02",
      X"82F9" WHEN X"03",
      X"F201" WHEN X"04",
      X"AF00" WHEN X"05",
      X"9302" WHEN X"06",
      X"8BFE" WHEN X"07",
      X"85F8" WHEN X"08",
      X"82F9" WHEN X"09",
      X"F201" WHEN X"0A",
      X"AF06" WHEN X"0B",
      X"0CA0" WHEN X"0C",
      X"8CFF" WHEN X"0D",
      X"9F00" WHEN X"0E",
      X"0000" WHEN OTHERS;

   -- Button: RST
   s_logisimNet65 <= logisimInputBubbles(0);

   -- DIP Switch: DIP_Switch
   s_logisimBus16(0) <= logisimInputBubbles(1);
   s_logisimBus16(1) <= logisimInputBubbles(2);
   s_logisimBus16(2) <= logisimInputBubbles(3);
   s_logisimBus16(3) <= logisimInputBubbles(4);
   s_logisimBus16(4) <= logisimInputBubbles(5);
   s_logisimBus16(5) <= logisimInputBubbles(6);
   s_logisimBus16(6) <= logisimInputBubbles(7);
   s_logisimBus16(7) <= logisimInputBubbles(8);

   -- LED: LED4
   logisimOutputBubbles(0) <= s_logisimBus32(3);

   -- LED: LED6
   logisimOutputBubbles(1) <= s_logisimBus32(5);

   -- LED: LED3
   logisimOutputBubbles(2) <= s_logisimBus32(2);

   -- LED: LED1
   logisimOutputBubbles(3) <= s_logisimBus32(0);

   -- LED: LED2
   logisimOutputBubbles(4) <= s_logisimBus32(1);

   -- LED: LED5
   logisimOutputBubbles(5) <= s_logisimBus32(4);

   -- LED: LED7
   logisimOutputBubbles(6) <= s_logisimBus32(6);

   -- LED: LED8
   logisimOutputBubbles(7) <= s_logisimBus32(7);

   -- LED: LED10
   logisimOutputBubbles(8) <= s_logisimBus10(1);

   -- LED: LED9
   logisimOutputBubbles(9) <= s_logisimBus10(0);

   -- Button: SW0
   s_logisimBus2(0) <= logisimInputBubbles(9);

   -- Button: SW1
   s_logisimBus2(1) <= logisimInputBubbles(10);

   -- Button: SW2
   s_logisimBus2(2) <= logisimInputBubbles(11);

   -- Button: SW3
   s_logisimBus2(3) <= logisimInputBubbles(12);

   -- Constant
    s_logisimNet28  <=  '0';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus1(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus6(7 DOWNTO 0),
                 muxOut  => s_logisimBus42(7 DOWNTO 0),
                 sel     => s_logisimNet49 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus11(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus7(7 DOWNTO 0),
                 muxOut  => s_logisimBus27(7 DOWNTO 0),
                 sel     => s_logisimNet50 );

   PLEXERS_3 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus4(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus7(7 DOWNTO 0),
                 muxOut  => s_logisimBus0(7 DOWNTO 0),
                 sel     => s_logisimNet51 );

   PLEXERS_4 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus5(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus23(7 DOWNTO 0),
                 muxOut  => s_logisimBus12(7 DOWNTO 0),
                 sel     => s_logisimNet41 );

   PLEXERS_5 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus4(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus12(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus34(7 DOWNTO 0),
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus17(7 DOWNTO 0),
                 sel     => s_logisimBus33(1 DOWNTO 0) );

   PLEXERS_6 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus34(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus7(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus1(7 DOWNTO 0),
                 muxIn_3 => s_logisimBus1(7 DOWNTO 0),
                 muxOut  => s_logisimBus19(7 DOWNTO 0),
                 sel     => s_logisimBus14(1 DOWNTO 0) );

   MemorijaPodataka : RAMCONTENTS_MemorijaPodataka
      PORT MAP ( address => s_logisimBus0(7 DOWNTO 0),
                 clock   => logisimClockTree0(4),
                 dataIn  => s_logisimBus1(7 DOWNTO 0),
                 dataOut => s_logisimBus23(7 DOWNTO 0),
                 oe      => '1',
                 tick    => logisimClockTree0(3),
                 we      => s_logisimNet31 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   SR : StatusniRegistar
      PORT MAP ( CF                => s_logisimNet30,
                 CFi               => s_logisimNet9,
                 Clock             => s_logisimNet63,
                 NF                => s_logisimNet8,
                 NFi               => s_logisimNet22,
                 Reset             => s_logisimNet65,
                 VF                => s_logisimNet39,
                 VFi               => s_logisimNet15,
                 WE                => s_logisimNet43,
                 ZF                => s_logisimNet24,
                 ZFi               => s_logisimNet37,
                 logisimClockTree0 => logisimClockTree0 );

   ALU : ALU8Bit
      PORT MAP ( A                 => s_logisimBus42(7 DOWNTO 0),
                 ALUOp             => s_logisimBus44(3 DOWNTO 0),
                 B                 => s_logisimBus27(7 DOWNTO 0),
                 CF                => s_logisimNet9,
                 I                 => s_logisimBus4(7 DOWNTO 0),
                 NF                => s_logisimNet22,
                 VF                => s_logisimNet15,
                 ZF                => s_logisimNet37,
                 logisimClockTree0 => logisimClockTree0 );

   KJG : KontrolnaJedinicaGrananja
      PORT MAP ( CF                => s_logisimNet30,
                 GranTip           => s_logisimBus46(2 DOWNTO 0),
                 I                 => s_logisimBus14(1 DOWNTO 0),
                 NF                => s_logisimNet8,
                 SkokReg           => s_logisimNet45,
                 VF                => s_logisimNet39,
                 ZF                => s_logisimNet24,
                 logisimClockTree0 => logisimClockTree0 );

   Dekoder_Adresa : DekoderAdresa
      PORT MAP ( Addr              => s_logisimBus0(7 DOWNTO 0),
                 CMem              => s_logisimNet47,
                 OutputSrc         => s_logisimNet41,
                 OutputWe          => s_logisimNet38,
                 PMem              => s_logisimNet48,
                 RAMOe             => s_logisimNet40,
                 RAMWe             => s_logisimNet31,
                 UIAddr            => s_logisimBus3(1 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   UI_Kontroler : UIKontroler
      PORT MAP ( Adresa            => s_logisimBus3(1 DOWNTO 0),
                 Clock             => s_logisimNet63,
                 Izlaz1            => OPEN,
                 Izlaz2            => OPEN,
                 Izlaz3            => s_logisimBus10(7 DOWNTO 0),
                 Izlaz4            => s_logisimBus32(7 DOWNTO 0),
                 IzlazniPodaci     => s_logisimBus1(7 DOWNTO 0),
                 OdabraniUlaz      => s_logisimBus5(7 DOWNTO 0),
                 RST               => s_logisimNet65,
                 Ulaz1             => s_logisimBus16(7 DOWNTO 0),
                 Ulaz2             => s_logisimBus2(7 DOWNTO 0),
                 Ulaz3             => X"00",
                 Ulaz4             => X"00",
                 WE                => s_logisimNet38,
                 logisimClockTree0 => logisimClockTree0 );

   PB : ProgramskiBrojac
      PORT MAP ( Clock             => s_logisimNet63,
                 DataIn            => s_logisimBus19(7 DOWNTO 0),
                 DataOut           => s_logisimBus26(7 DOWNTO 0),
                 Reset             => s_logisimNet65,
                 WE                => s_logisimNet36,
                 logisimClockTree0 => logisimClockTree0 );

   PBSab : Sabirac
      PORT MAP ( A                 => s_logisimBus29(7 DOWNTO 0),
                 B                 => s_logisimBus26(7 DOWNTO 0),
                 Izlaz             => s_logisimBus34(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   KJ : KontrolnaJedinica
      PORT MAP ( ALUIzv1           => s_logisimNet49,
                 ALUIzv2           => s_logisimNet50,
                 ALUOp             => s_logisimBus44(3 DOWNTO 0),
                 CMem              => s_logisimNet47,
                 GranTip           => s_logisimBus46(2 DOWNTO 0),
                 MemIzv            => s_logisimNet51,
                 Opcode            => s_logisimBus7(15 DOWNTO 11),
                 PMem              => s_logisimNet48,
                 RegPod            => s_logisimBus33(1 DOWNTO 0),
                 SkokReg           => s_logisimNet45,
                 UpReg             => s_logisimNet64,
                 UpStat            => s_logisimNet43,
                 logisimClockTree0 => logisimClockTree0 );

   Predznaceno_Prosirenje : PredznacenoProsirenje
      PORT MAP ( Izlaz             => s_logisimBus6(7 DOWNTO 0),
                 Ulaz              => s_logisimBus7(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   RD : RegistarskaDatoteka
      PORT MAP ( Clock             => s_logisimNet63,
                 PodaciReg1        => s_logisimBus1(7 DOWNTO 0),
                 PodaciReg2        => s_logisimBus11(7 DOWNTO 0),
                 PodaciUpis        => s_logisimBus17(7 DOWNTO 0),
                 Reg1Adresa        => s_logisimBus7(10 DOWNTO 8),
                 Reg2Adresa        => s_logisimBus7(7 DOWNTO 5),
                 Reset             => s_logisimNet65,
                 UpReg             => s_logisimNet64,
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
