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

      COMPONENT Comparator
         GENERIC ( nrOfBits       : INTEGER;
                   twosComplement : INTEGER );
         PORT ( dataA         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                dataB         : IN  std_logic_vector( (nrOfBits - 1) DOWNTO 0 );
                aEqualsB      : OUT std_logic;
                aGreaterThanB : OUT std_logic;
                aLessThanB    : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT ProgramskiBrojac
         PORT ( Clock             : IN  std_logic;
                DataIn            : IN  std_logic_vector( 7 DOWNTO 0 );
                Reset             : IN  std_logic;
                WE                : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                DataOut           : OUT std_logic_vector( 7 DOWNTO 0 ) );
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

      COMPONENT Sabirac
         PORT ( A                 : IN  std_logic_vector( 7 DOWNTO 0 );
                B                 : IN  std_logic_vector( 7 DOWNTO 0 );
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Izlaz             : OUT std_logic_vector( 7 DOWNTO 0 ) );
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
   SIGNAL s_logisimBus0  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus1  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus11 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus19 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus22 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus26 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus31 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus32 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus36 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet29 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet37 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet39 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet45 : std_logic;
   SIGNAL s_logisimNet46 : std_logic;
   SIGNAL s_logisimNet47 : std_logic;
   SIGNAL s_logisimNet48 : std_logic;
   SIGNAL s_logisimNet49 : std_logic;
   SIGNAL s_logisimNet50 : std_logic;
   SIGNAL s_logisimNet51 : std_logic;
   SIGNAL s_logisimNet52 : std_logic;
   SIGNAL s_logisimNet53 : std_logic;
   SIGNAL s_logisimNet54 : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet43 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet27  <=  '1';


   -- ROM: InstrukcijskaMemorija
   WITH (s_logisimBus19) SELECT s_logisimBus5 <=
      X"8900" WHEN X"00",
      X"89FF" WHEN X"01",
      X"4901" WHEN X"02",
		X"9801" WHEN X"03",
      X"0000" WHEN OTHERS;

   -- Button: RST
   s_logisimNet45 <= logisimInputBubbles(0);

   -- Constant
    s_logisimBus21(7 DOWNTO 0)  <=  X"01";


   -- Constant
    s_logisimBus22(7 DOWNTO 0)  <=  X"FF";


   -- NOT Gate
   s_logisimNet46 <=  NOT s_logisimNet2;

   -- LED: LED7
   logisimOutputBubbles(0) <= s_logisimBus30(6);

   -- LED: LED1
   logisimOutputBubbles(1) <= s_logisimBus30(0);

   -- LED: LED4
   logisimOutputBubbles(2) <= s_logisimBus30(3);

   -- LED: LED5
   logisimOutputBubbles(3) <= s_logisimBus30(4);

   -- LED: LED6
   logisimOutputBubbles(4) <= s_logisimBus30(5);

   -- LED: LED8
   logisimOutputBubbles(5) <= s_logisimBus30(7);

   -- LED: LED2
   logisimOutputBubbles(6) <= s_logisimBus30(1);

   -- LED: LED3
   logisimOutputBubbles(7) <= s_logisimBus30(2);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus3(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus5(7 DOWNTO 0),
                 muxOut  => s_logisimBus0(7 DOWNTO 0),
                 sel     => s_logisimNet38 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus8(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus5(7 DOWNTO 0),
                 muxOut  => s_logisimBus20(7 DOWNTO 0),
                 sel     => s_logisimNet24 );

   PLEXERS_3 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus3(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus9(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus26(7 DOWNTO 0),
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus14(7 DOWNTO 0),
                 sel     => s_logisimBus25(1 DOWNTO 0) );

   PLEXERS_4 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus1(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus4(7 DOWNTO 0),
                 muxOut  => s_logisimBus31(7 DOWNTO 0),
                 sel     => s_logisimNet39 );

   PLEXERS_5 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus26(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus5(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus1(7 DOWNTO 0),
                 muxIn_3 => s_logisimBus1(7 DOWNTO 0),
                 muxOut  => s_logisimBus15(7 DOWNTO 0),
                 sel     => s_logisimBus11(1 DOWNTO 0) );

   MemorijaPodataka : RAMCONTENTS_MemorijaPodataka
      PORT MAP ( address => s_logisimBus0(7 DOWNTO 0),
                 clock   => logisimClockTree0(4),
                 dataIn  => s_logisimBus1(7 DOWNTO 0),
                 dataOut => s_logisimBus9(7 DOWNTO 0),
                 oe      => '1',
                 tick    => logisimClockTree0(3),
                 we      => s_logisimNet13 );

   ARITH_7 : Comparator
      GENERIC MAP ( nrOfBits       => 8,
                    twosComplement => 1 )
      PORT MAP ( aEqualsB      => s_logisimNet2,
                 aGreaterThanB => OPEN,
                 aLessThanB    => OPEN,
                 dataA         => s_logisimBus22(7 DOWNTO 0),
                 dataB         => s_logisimBus0(7 DOWNTO 0) );

   GATES_8 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet46,
                 input2 => s_logisimNet37,
                 result => s_logisimNet13 );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   PB : ProgramskiBrojac
      PORT MAP ( Clock             => s_logisimNet43,
                 DataIn            => s_logisimBus15(7 DOWNTO 0),
                 DataOut           => s_logisimBus19(7 DOWNTO 0),
                 Reset             => s_logisimNet45,
                 WE                => s_logisimNet27,
                 logisimClockTree0 => logisimClockTree0 );

   ALU : ALU8Bit
      PORT MAP ( A                 => s_logisimBus31(7 DOWNTO 0),
                 ALUOp             => s_logisimBus32(3 DOWNTO 0),
                 B                 => s_logisimBus20(7 DOWNTO 0),
                 CF                => s_logisimNet7,
                 I                 => s_logisimBus3(7 DOWNTO 0),
                 NF                => s_logisimNet17,
                 VF                => s_logisimNet12,
                 ZF                => s_logisimNet28,
                 logisimClockTree0 => logisimClockTree0 );

   KJ : KontrolnaJedinica
      PORT MAP ( ALUIzv1           => s_logisimNet39,
                 ALUIzv2           => s_logisimNet24,
                 ALUOp             => s_logisimBus32(3 DOWNTO 0),
                 CMem              => s_logisimNet35,
                 GranTip           => s_logisimBus36(2 DOWNTO 0),
                 MemIzv            => s_logisimNet38,
                 Opcode            => s_logisimBus5(15 DOWNTO 11),
                 PMem              => s_logisimNet37,
                 RegPod            => s_logisimBus25(1 DOWNTO 0),
                 SkokReg           => s_logisimNet34,
                 UpReg             => s_logisimNet44,
                 UpStat            => s_logisimNet33,
                 logisimClockTree0 => logisimClockTree0 );

   Predznaceno_Prosirenje : PredznacenoProsirenje
      PORT MAP ( Izlaz             => s_logisimBus4(7 DOWNTO 0),
                 Ulaz              => s_logisimBus5(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   RD : RegistarskaDatoteka
      PORT MAP ( Clock             => s_logisimNet43,
                 PodaciReg1        => s_logisimBus1(7 DOWNTO 0),
                 PodaciReg2        => s_logisimBus8(7 DOWNTO 0),
                 PodaciUpis        => s_logisimBus14(7 DOWNTO 0),
                 Reg1Adresa        => s_logisimBus5(10 DOWNTO 8),
                 Reg2Adresa        => s_logisimBus5(7 DOWNTO 5),
                 Reset             => s_logisimNet45,
                 UpReg             => s_logisimNet44,
                 logisimClockTree0 => logisimClockTree0 );

   PBSab : Sabirac
      PORT MAP ( A                 => s_logisimBus21(7 DOWNTO 0),
                 B                 => s_logisimBus19(7 DOWNTO 0),
                 Izlaz             => s_logisimBus26(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0 );

   SR : StatusniRegistar
      PORT MAP ( CF                => s_logisimNet23,
                 CFi               => s_logisimNet7,
                 Clock             => s_logisimNet43,
                 NF                => s_logisimNet6,
                 NFi               => s_logisimNet17,
                 Reset             => s_logisimNet45,
                 VF                => s_logisimNet29,
                 VFi               => s_logisimNet12,
                 WE                => s_logisimNet33,
                 ZF                => s_logisimNet18,
                 ZFi               => s_logisimNet28,
                 logisimClockTree0 => logisimClockTree0 );

   KJG : KontrolnaJedinicaGrananja
      PORT MAP ( CF                => s_logisimNet23,
                 GranTip           => s_logisimBus36(2 DOWNTO 0),
                 I                 => s_logisimBus11(1 DOWNTO 0),
                 NF                => s_logisimNet6,
                 SkokReg           => s_logisimNet34,
                 VF                => s_logisimNet29,
                 ZF                => s_logisimNet18,
                 logisimClockTree0 => logisimClockTree0 );

   LEDReg : Registar8Bit
      PORT MAP ( Clock             => s_logisimNet43,
                 DataIn            => s_logisimBus1(7 DOWNTO 0),
                 DataOut           => s_logisimBus30(7 DOWNTO 0),
                 Reset             => s_logisimNet45,
                 WE                => s_logisimNet2,
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
