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

		COMPONENT InstrukcijskaMemorija
			PORT (
				address  : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				clock    : IN STD_LOGIC := '1';
				q        : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
			);
		END COMPONENT;
		
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
   SIGNAL s_logisimBus13 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus14 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus20 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus21 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus22 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus25 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus27 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus30 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus32 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus36 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus37 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus39 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus4  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus46 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus48 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus5  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus50 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus6  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus7  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 15 DOWNTO 0 );
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet38 : std_logic;
   SIGNAL s_logisimNet40 : std_logic;
   SIGNAL s_logisimNet41 : std_logic;
   SIGNAL s_logisimNet42 : std_logic;
   SIGNAL s_logisimNet43 : std_logic;
   SIGNAL s_logisimNet44 : std_logic;
   SIGNAL s_logisimNet45 : std_logic;
   SIGNAL s_logisimNet47 : std_logic;
   SIGNAL s_logisimNet49 : std_logic;
   SIGNAL s_logisimNet51 : std_logic;
   SIGNAL s_logisimNet52 : std_logic;
   SIGNAL s_logisimNet53 : std_logic;
   SIGNAL s_logisimNet54 : std_logic;
   SIGNAL s_logisimNet55 : std_logic;
   SIGNAL s_logisimNet56 : std_logic;
   SIGNAL s_logisimNet57 : std_logic;
   SIGNAL s_logisimNet58 : std_logic;
   SIGNAL s_logisimNet59 : std_logic;
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
   SIGNAL s_logisimNet75 : std_logic;
   SIGNAL s_logisimNet76 : std_logic;
   SIGNAL s_logisimNet77 : std_logic;
   SIGNAL s_logisimNet8  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- All clock generator connections are defined here                           --
   --------------------------------------------------------------------------------
   s_logisimNet11 <= logisimClockTree1(0);
   s_logisimNet75 <= logisimClockTree0(0);

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus1(4) <= s_logisimNet31;
   s_logisimBus1(5) <= s_logisimNet31;
   s_logisimBus1(6) <= s_logisimNet31;
   s_logisimBus1(7) <= s_logisimNet31;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet40  <=  '1';


   -- Constant
    s_logisimNet31  <=  '0';


   -- Constant
    s_logisimBus32(7 DOWNTO 0)  <=  X"01";

-- STARO
--   -- ROM: InstrukcijskaMemorija
--   WITH (s_logisimBus29) SELECT s_logisimBus9 <=
--      X"9200" WHEN X"00",
--      X"81F8" WHEN X"01",
--      X"89FF" WHEN X"02",
--      X"9F01" WHEN X"03",
--      X"DA21" WHEN X"04",
--      X"925B" WHEN X"05",
--      X"DA22" WHEN X"06",
--      X"924F" WHEN X"07",
--      X"DA23" WHEN X"08",
--      X"9266" WHEN X"09",
--      X"DA24" WHEN X"0A",
--      X"926D" WHEN X"0B",
--      X"DA25" WHEN X"0C",
--      X"927D" WHEN X"0D",
--      X"DA26" WHEN X"0E",
--      X"9207" WHEN X"0F",
--      X"DA27" WHEN X"10",
--      X"927F" WHEN X"11",
--      X"DA28" WHEN X"12",
--      X"926F" WHEN X"13",
--      X"DA29" WHEN X"14",
--      X"81F9" WHEN X"15",
--      X"5901" WHEN X"16",
--      X"F101" WHEN X"17",
--      X"AF15" WHEN X"18",
--      X"81F8" WHEN X"19",
--      X"9200" WHEN X"1A",
--      X"F164" WHEN X"1B",
--      X"B720" WHEN X"1C",
--      X"4A01" WHEN X"1D",
--      X"5164" WHEN X"1E",
--      X"9F1B" WHEN X"1F",
--      X"95EE" WHEN X"20",
--      X"0D40" WHEN X"21",
--      X"D5A0" WHEN X"22",
--      X"8DFC" WHEN X"23",
--      X"9200" WHEN X"24",
--      X"F10A" WHEN X"25",
--      X"B72A" WHEN X"26",
--      X"4A01" WHEN X"27",
--      X"510A" WHEN X"28",
--      X"9F25" WHEN X"29",
--      X"95EE" WHEN X"2A",
--      X"0D40" WHEN X"2B",
--      X"D5A0" WHEN X"2C",
--      X"8DFD" WHEN X"2D",
--      X"9200" WHEN X"2E",
--      X"F101" WHEN X"2F",
--      X"B734" WHEN X"30",
--      X"4A01" WHEN X"31",
--      X"5101" WHEN X"32",
--      X"9F2F" WHEN X"33",
--      X"95EE" WHEN X"34",
--      X"0D40" WHEN X"35",
--      X"D5A0" WHEN X"36",
--      X"8DFE" WHEN X"37",
--      X"9F15" WHEN X"38",
--      X"0000" WHEN OTHERS;

	InstrukcijskaMemorijaKomp : InstrukcijskaMemorija
		PORT MAP (
			address => s_logisimBus29,
			clock   => s_logisimNet75,
			q       => s_logisimBus9
		);

   -- Button: RST
   s_logisimNet19 <= logisimInputBubbles(0);

   -- LED: LED1
   logisimOutputBubbles(24) <= s_logisimBus37(7);

   -- LED: LED2
   logisimOutputBubbles(25) <= s_logisimBus37(6);

   -- LED: LED3
   logisimOutputBubbles(26) <= s_logisimBus37(5);

   -- LED: LED4
   logisimOutputBubbles(27) <= s_logisimBus37(4);

   -- LED: LED5
   logisimOutputBubbles(28) <= s_logisimBus37(3);

   -- LED: LED6
   logisimOutputBubbles(29) <= s_logisimBus37(2);

   -- LED: LED7
   logisimOutputBubbles(30) <= s_logisimBus37(1);

   -- LED: LED8
   logisimOutputBubbles(31) <= s_logisimBus37(0);

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
   s_logisimBus1(0) <= logisimInputBubbles(9);

   -- Button: SW1
   s_logisimBus1(1) <= logisimInputBubbles(10);

   -- Button: SW2
   s_logisimBus1(2) <= logisimInputBubbles(11);

   -- Button: SW3
   s_logisimBus1(3) <= logisimInputBubbles(12);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus2(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus7(7 DOWNTO 0),
                 muxOut  => s_logisimBus46(7 DOWNTO 0),
                 sel     => s_logisimNet53 );

   PLEXERS_2 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus13(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus9(7 DOWNTO 0),
                 muxOut  => s_logisimBus30(7 DOWNTO 0),
                 sel     => s_logisimNet54 );

   PLEXERS_3 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus5(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus9(7 DOWNTO 0),
                 muxOut  => s_logisimBus0(7 DOWNTO 0),
                 sel     => s_logisimNet55 );

   PLEXERS_4 : Multiplexer_bus_2
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus6(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus25(7 DOWNTO 0),
                 muxOut  => s_logisimBus14(7 DOWNTO 0),
                 sel     => s_logisimNet45 );

   PLEXERS_5 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus5(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus14(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus39(7 DOWNTO 0),
                 muxIn_3 => X"00",
                 muxOut  => s_logisimBus21(7 DOWNTO 0),
                 sel     => s_logisimBus36(1 DOWNTO 0) );

   PLEXERS_6 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus39(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus9(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus2(7 DOWNTO 0),
                 muxIn_3 => s_logisimBus2(7 DOWNTO 0),
                 muxOut  => s_logisimBus22(7 DOWNTO 0),
                 sel     => s_logisimBus16(1 DOWNTO 0) );

   MemorijaPodataka : RAMCONTENTS_MemorijaPodataka
      PORT MAP ( address => s_logisimBus0(7 DOWNTO 0),
                 clock   => logisimClockTree1(4),
                 dataIn  => s_logisimBus2(7 DOWNTO 0),
                 dataOut => s_logisimBus25(7 DOWNTO 0),
                 oe      => '1',
                 tick    => logisimClockTree1(3),
                 we      => s_logisimNet34 );

   MEMORY_8 : D_FLIPFLOP
      GENERIC MAP ( invertClockEnable => 0 )
      PORT MAP ( clock  => logisimClockTree0(4),
                 d      => s_logisimNet19,
                 preset => '0',
                 q      => s_logisimNet77,
                 qBar   => OPEN,
                 reset  => '0',
                 tick   => logisimClockTree0(2) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   SR : StatusniRegistar
      PORT MAP ( CF                => s_logisimNet33,
                 CFi               => s_logisimNet12,
                 Clock             => s_logisimNet75,
                 NF                => s_logisimNet10,
                 NFi               => s_logisimNet24,
                 Reset             => s_logisimNet77,
                 VF                => s_logisimNet43,
                 VFi               => s_logisimNet17,
                 WE                => s_logisimNet47,
                 ZF                => s_logisimNet26,
                 ZFi               => s_logisimNet41,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   ALU : ALU8Bit
      PORT MAP ( A                 => s_logisimBus46(7 DOWNTO 0),
                 ALUOp             => s_logisimBus48(3 DOWNTO 0),
                 B                 => s_logisimBus30(7 DOWNTO 0),
                 CF                => s_logisimNet12,
                 I                 => s_logisimBus5(7 DOWNTO 0),
                 NF                => s_logisimNet24,
                 VF                => s_logisimNet17,
                 ZF                => s_logisimNet41,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   KJG : KontrolnaJedinicaGrananja
      PORT MAP ( CF                => s_logisimNet33,
                 GranTip           => s_logisimBus50(2 DOWNTO 0),
                 I                 => s_logisimBus16(1 DOWNTO 0),
                 NF                => s_logisimNet10,
                 SkokReg           => s_logisimNet49,
                 VF                => s_logisimNet43,
                 ZF                => s_logisimNet26,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   Dekoder_Adresa : DekoderAdresa
      PORT MAP ( Addr              => s_logisimBus0(7 DOWNTO 0),
                 CMem              => s_logisimNet51,
                 OutputSrc         => s_logisimNet45,
                 OutputWe          => s_logisimNet42,
                 PMem              => s_logisimNet52,
                 RAMOe             => s_logisimNet44,
                 RAMWe             => s_logisimNet34,
                 UIAddr            => s_logisimBus4(1 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   UI_Kontroler : UIKontroler
      PORT MAP ( Adresa            => s_logisimBus4(1 DOWNTO 0),
                 Clock             => s_logisimNet75,
                 Izlaz1            => s_logisimBus27(7 DOWNTO 0),
                 Izlaz2            => s_logisimBus3(7 DOWNTO 0),
                 Izlaz3            => s_logisimBus18(7 DOWNTO 0),
                 Izlaz4            => s_logisimBus37(7 DOWNTO 0),
                 IzlazniPodaci     => s_logisimBus2(7 DOWNTO 0),
                 OdabraniUlaz      => s_logisimBus6(7 DOWNTO 0),
                 RST               => s_logisimNet77,
                 Ulaz1             => s_logisimBus20(7 DOWNTO 0),
                 Ulaz2             => s_logisimBus1(7 DOWNTO 0),
                 Ulaz3             => X"00",
                 Ulaz4             => X"00",
                 WE                => s_logisimNet42,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   SedSeg3 : SevenSegAdapter
      PORT MAP ( Segmenti             => s_logisimBus27(7 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(7  DOWNTO  0) );

   SedSeg2 : SevenSegAdapter
      PORT MAP ( Segmenti             => s_logisimBus3(7 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(15  DOWNTO  8) );

   SedSeg1 : SevenSegAdapter
      PORT MAP ( Segmenti             => s_logisimBus18(7 DOWNTO 0),
                 logisimClockTree0    => logisimClockTree0,
                 logisimClockTree1    => logisimClockTree1,
                 logisimOutputBubbles => logisimOutputBubbles(23  DOWNTO  16) );

   PB : ProgramskiBrojac
      PORT MAP ( Clock             => s_logisimNet75,
                 DataIn            => s_logisimBus22(7 DOWNTO 0),
                 DataOut           => s_logisimBus29(7 DOWNTO 0),
                 Reset             => s_logisimNet77,
                 WE                => s_logisimNet40,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   PBSab : Sabirac
      PORT MAP ( A                 => s_logisimBus32(7 DOWNTO 0),
                 B                 => s_logisimBus29(7 DOWNTO 0),
                 Izlaz             => s_logisimBus39(7 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   KJ : KontrolnaJedinica
      PORT MAP ( ALUIzv1           => s_logisimNet53,
                 ALUIzv2           => s_logisimNet54,
                 ALUOp             => s_logisimBus48(3 DOWNTO 0),
                 CMem              => s_logisimNet51,
                 GranTip           => s_logisimBus50(2 DOWNTO 0),
                 MemIzv            => s_logisimNet55,
                 Opcode            => s_logisimBus9(15 DOWNTO 11),
                 PMem              => s_logisimNet52,
                 RegPod            => s_logisimBus36(1 DOWNTO 0),
                 SkokReg           => s_logisimNet49,
                 UpReg             => s_logisimNet76,
                 UpStat            => s_logisimNet47,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   Predznaceno_Prosirenje : PredznacenoProsirenje
      PORT MAP ( Izlaz             => s_logisimBus7(7 DOWNTO 0),
                 Ulaz              => s_logisimBus9(4 DOWNTO 0),
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

   RD : RegistarskaDatoteka
      PORT MAP ( Clock             => s_logisimNet75,
                 PodaciReg1        => s_logisimBus2(7 DOWNTO 0),
                 PodaciReg2        => s_logisimBus13(7 DOWNTO 0),
                 PodaciUpis        => s_logisimBus21(7 DOWNTO 0),
                 Reg1Adresa        => s_logisimBus9(10 DOWNTO 8),
                 Reg2Adresa        => s_logisimBus9(7 DOWNTO 5),
                 Reset             => s_logisimNet77,
                 UpReg             => s_logisimNet76,
                 logisimClockTree0 => logisimClockTree0,
                 logisimClockTree1 => logisimClockTree1 );

END platformIndependent;
