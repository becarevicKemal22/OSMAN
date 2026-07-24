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
   s_logisimBus20(0) <= logisimInputBubbles(8);
   s_logisimBus20(1) <= logisimInputBubbles(7);
   s_logisimBus20(2) <= logisimInputBubbles(6);
   s_logisimBus20(3) <= logisimInputBubbles(5);
   s_logisimBus20(4) <= logisimInputBubbles(4);
   s_logisimBus20(5) <= logisimInputBubbles(3);
   s_logisimBus20(6) <= logisimInputBubbles(2);
   s_logisimBus20(7) <= logisimInputBubbles(1);

   -- Button: SW0
   s_logisimBus1(0) <= logisimInputBubbles(9);

   -- Button: SW1
   s_logisimBus1(1) <= logisimInputBubbles(10);

   -- Button: SW2
   s_logisimBus1(2) <= logisimInputBubbles(11);

   -- Button: SW3
   s_logisimBus1(3) <= logisimInputBubbles(12);

   -- ROM: InstrukcijskaMemorija
   WITH (s_logisimBus29) SELECT s_logisimBus9 <=
      X"81F9" WHEN X"00",
      X"9201" WHEN X"01",
      X"2140" WHEN X"02",
      X"F100" WHEN X"03",
      X"A707" WHEN X"04",
      X"9101" WHEN X"05",
      X"9F08" WHEN X"06",
      X"9100" WHEN X"07",
      X"D900" WHEN X"08",
      X"4801" WHEN X"09",
      X"9101" WHEN X"0A",
      X"FA20" WHEN X"0B",
      X"5001" WHEN X"0C",
      X"D100" WHEN X"0D",
      X"E940" WHEN X"0E",
      X"AF12" WHEN X"0F",
      X"9100" WHEN X"10",
      X"9F13" WHEN X"11",
      X"9101" WHEN X"12",
      X"F100" WHEN X"13",
      X"A724" WHEN X"14",
      X"81F8" WHEN X"15",
      X"89EA" WHEN X"16",
      X"91EB" WHEN X"17",
      X"D900" WHEN X"18",
      X"4801" WHEN X"19",
      X"91EE" WHEN X"1A",
      X"D900" WHEN X"1B",
      X"4801" WHEN X"1C",
      X"81EA" WHEN X"1D",
      X"D900" WHEN X"1E",
      X"4801" WHEN X"1F",
      X"77A7" WHEN X"20",
      X"5003" WHEN X"21",
      X"F9C0" WHEN X"22",
      X"9F00" WHEN X"23",
      X"9100" WHEN X"24",
      X"89FC" WHEN X"25",
      X"81F9" WHEN X"26",
      X"9202" WHEN X"27",
      X"2140" WHEN X"28",
      X"F100" WHEN X"29",
      X"A72D" WHEN X"2A",
      X"9101" WHEN X"2B",
      X"9F2E" WHEN X"2C",
      X"9100" WHEN X"2D",
      X"D900" WHEN X"2E",
      X"4801" WHEN X"2F",
      X"9101" WHEN X"30",
      X"FA20" WHEN X"31",
      X"5001" WHEN X"32",
      X"D100" WHEN X"33",
      X"E940" WHEN X"34",
      X"AF38" WHEN X"35",
      X"9100" WHEN X"36",
      X"9F39" WHEN X"37",
      X"9101" WHEN X"38",
      X"F100" WHEN X"39",
      X"A75C" WHEN X"3A",
      X"81F8" WHEN X"3B",
      X"9201" WHEN X"3C",
      X"2140" WHEN X"3D",
      X"F100" WHEN X"3E",
      X"A742" WHEN X"3F",
      X"9101" WHEN X"40",
      X"9F43" WHEN X"41",
      X"9100" WHEN X"42",
      X"89E8" WHEN X"43",
      X"81E8" WHEN X"44",
      X"D900" WHEN X"45",
      X"4801" WHEN X"46",
      X"9101" WHEN X"47",
      X"FA20" WHEN X"48",
      X"5001" WHEN X"49",
      X"D100" WHEN X"4A",
      X"E940" WHEN X"4B",
      X"A74F" WHEN X"4C",
      X"9100" WHEN X"4D",
      X"9F50" WHEN X"4E",
      X"9101" WHEN X"4F",
      X"F100" WHEN X"50",
      X"A757" WHEN X"51",
      X"9100" WHEN X"52",
      X"89FD" WHEN X"53",
      X"9140" WHEN X"54",
      X"89FE" WHEN X"55",
      X"9F5B" WHEN X"56",
      X"9140" WHEN X"57",
      X"89FD" WHEN X"58",
      X"9170" WHEN X"59",
      X"89FE" WHEN X"5A",
      X"9F26" WHEN X"5B",
      X"81F9" WHEN X"5C",
      X"9204" WHEN X"5D",
      X"2140" WHEN X"5E",
      X"F100" WHEN X"5F",
      X"A763" WHEN X"60",
      X"9101" WHEN X"61",
      X"9F64" WHEN X"62",
      X"9100" WHEN X"63",
      X"D900" WHEN X"64",
      X"4801" WHEN X"65",
      X"9101" WHEN X"66",
      X"FA20" WHEN X"67",
      X"5001" WHEN X"68",
      X"D100" WHEN X"69",
      X"E940" WHEN X"6A",
      X"AF6E" WHEN X"6B",
      X"9100" WHEN X"6C",
      X"9F6F" WHEN X"6D",
      X"9101" WHEN X"6E",
      X"F100" WHEN X"6F",
      X"A780" WHEN X"70",
      X"81F8" WHEN X"71",
      X"89E9" WHEN X"72",
      X"91EB" WHEN X"73",
      X"D900" WHEN X"74",
      X"4801" WHEN X"75",
      X"91EE" WHEN X"76",
      X"D900" WHEN X"77",
      X"4801" WHEN X"78",
      X"81E9" WHEN X"79",
      X"D900" WHEN X"7A",
      X"4801" WHEN X"7B",
      X"77A7" WHEN X"7C",
      X"5003" WHEN X"7D",
      X"F9C0" WHEN X"7E",
      X"9F5C" WHEN X"7F",
      X"81E8" WHEN X"80",
      X"D900" WHEN X"81",
      X"4801" WHEN X"82",
      X"9101" WHEN X"83",
      X"FA20" WHEN X"84",
      X"5001" WHEN X"85",
      X"D100" WHEN X"86",
      X"E940" WHEN X"87",
      X"A78B" WHEN X"88",
      X"9100" WHEN X"89",
      X"9F8C" WHEN X"8A",
      X"9101" WHEN X"8B",
      X"F100" WHEN X"8C",
      X"A793" WHEN X"8D",
      X"81E9" WHEN X"8E",
      X"FA20" WHEN X"8F",
      X"9100" WHEN X"90",
      X"1140" WHEN X"91",
      X"89E9" WHEN X"92",
      X"91EB" WHEN X"93",
      X"D900" WHEN X"94",
      X"4801" WHEN X"95",
      X"91EE" WHEN X"96",
      X"D900" WHEN X"97",
      X"4801" WHEN X"98",
      X"81EA" WHEN X"99",
      X"D900" WHEN X"9A",
      X"4801" WHEN X"9B",
      X"81E9" WHEN X"9C",
      X"FA20" WHEN X"9D",
      X"5001" WHEN X"9E",
      X"D100" WHEN X"9F",
      X"0940" WHEN X"A0",
      X"D900" WHEN X"A1",
      X"4801" WHEN X"A2",
      X"77A7" WHEN X"A3",
      X"5003" WHEN X"A4",
      X"F9C0" WHEN X"A5",
      X"9FA6" WHEN X"A6",
      X"DF00" WHEN X"A7",
      X"4801" WHEN X"A8",
      X"DD00" WHEN X"A9",
      X"4801" WHEN X"AA",
      X"FD00" WHEN X"AB",
      X"4803" WHEN X"AC",
      X"D1BD" WHEN X"AE",
      X"D9A0" WHEN X"AF",
      X"9100" WHEN X"B0",
      X"D9A1" WHEN X"B1",
      X"D1A1" WHEN X"B2",
      X"D900" WHEN X"B3",
      X"4801" WHEN X"B4",
      X"9103" WHEN X"B5",
      X"FA20" WHEN X"B6",
      X"5001" WHEN X"B7",
      X"D100" WHEN X"B8",
      X"E940" WHEN X"B9",
      X"B7BD" WHEN X"BA",
      X"9100" WHEN X"BB",
      X"9FBE" WHEN X"BC",
      X"9101" WHEN X"BD",
      X"F100" WHEN X"BE",
      X"A7F9" WHEN X"BF",
      X"9100" WHEN X"C0",
      X"D9A2" WHEN X"C1",
      X"D1A0" WHEN X"C2",
      X"D900" WHEN X"C3",
      X"4801" WHEN X"C4",
      X"910A" WHEN X"C5",
      X"FA20" WHEN X"C6",
      X"5001" WHEN X"C7",
      X"D100" WHEN X"C8",
      X"E940" WHEN X"C9",
      X"BFCD" WHEN X"CA",
      X"9100" WHEN X"CB",
      X"9FCE" WHEN X"CC",
      X"9101" WHEN X"CD",
      X"F100" WHEN X"CE",
      X"A7E3" WHEN X"CF",
      X"D1A0" WHEN X"D0",
      X"D900" WHEN X"D1",
      X"4801" WHEN X"D2",
      X"910A" WHEN X"D3",
      X"FA20" WHEN X"D4",
      X"5001" WHEN X"D5",
      X"D100" WHEN X"D6",
      X"1140" WHEN X"D7",
      X"D9A0" WHEN X"D8",
      X"D1A2" WHEN X"D9",
      X"D900" WHEN X"DA",
      X"4801" WHEN X"DB",
      X"9101" WHEN X"DC",
      X"FA20" WHEN X"DD",
      X"5001" WHEN X"DE",
      X"D100" WHEN X"DF",
      X"0940" WHEN X"E0",
      X"D9A2" WHEN X"E1",
      X"9FC2" WHEN X"E2",
      X"D1A0" WHEN X"E3",
      X"FA20" WHEN X"E4",
      X"D3BC" WHEN X"E5",
      X"0B40" WHEN X"E6",
      X"D160" WHEN X"E7",
      X"D900" WHEN X"E8",
      X"4801" WHEN X"E9",
      X"D1A1" WHEN X"EA",
      X"FA20" WHEN X"EB",
      X"D3BB" WHEN X"EC",
      X"0B40" WHEN X"ED",
      X"D160" WHEN X"EE",
      X"FB20" WHEN X"EF",
      X"5001" WHEN X"F0",
      X"D100" WHEN X"F1",
      X"D960" WHEN X"F2",
      X"D1A2" WHEN X"F3",
      X"D9A0" WHEN X"F4",
      X"D1A1" WHEN X"F5",
      X"4901" WHEN X"F6",
      X"D9A1" WHEN X"F7",
      X"9FB2" WHEN X"F8",
      X"F8A0" WHEN X"F9",
      X"5001" WHEN X"FA",
      X"D500" WHEN X"FB",
      X"5001" WHEN X"FC",
      X"D700" WHEN X"FD",
      X"7F00" WHEN X"FE",
      X"0000" WHEN OTHERS;

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
