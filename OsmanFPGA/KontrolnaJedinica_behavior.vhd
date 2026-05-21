--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : KontrolnaJedinica                                            ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF KontrolnaJedinica IS 

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus19 : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimBus2  : std_logic_vector( 16 DOWNTO 0 );
   SIGNAL s_logisimBus3  : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus8  : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus19(0) <= s_logisimNet20;
   s_logisimBus19(1) <= s_logisimNet21;
   s_logisimBus8(0)  <= s_logisimNet14;
   s_logisimBus8(1)  <= s_logisimNet15;
   s_logisimBus8(2)  <= s_logisimNet16;
   s_logisimBus8(3)  <= s_logisimNet17;
   s_logisimBus9(0)  <= s_logisimNet10;
   s_logisimBus9(1)  <= s_logisimNet11;
   s_logisimBus9(2)  <= s_logisimNet12;
   s_logisimNet10    <= s_logisimBus2(14);
   s_logisimNet11    <= s_logisimBus2(15);
   s_logisimNet12    <= s_logisimBus2(16);
   s_logisimNet14    <= s_logisimBus2(6);
   s_logisimNet15    <= s_logisimBus2(7);
   s_logisimNet16    <= s_logisimBus2(8);
   s_logisimNet17    <= s_logisimBus2(9);
   s_logisimNet20    <= s_logisimBus2(1);
   s_logisimNet21    <= s_logisimBus2(2);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus3(4 DOWNTO 0) <= Opcode;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   ALUIzv1 <= s_logisimBus2(5);
   ALUIzv2 <= s_logisimBus2(4);
   ALUOp   <= s_logisimBus8(3 DOWNTO 0);
   CMem    <= s_logisimBus2(11);
   GranTip <= s_logisimBus9(2 DOWNTO 0);
   MemIzv  <= s_logisimBus2(0);
   PMem    <= s_logisimBus2(10);
   RegPod  <= s_logisimBus19(1 DOWNTO 0);
   SkokReg <= s_logisimBus2(13);
   UpReg   <= s_logisimBus2(3);
   UpStat  <= s_logisimBus2(12);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- ROM: KontrolniROM
   WITH (s_logisimBus3) SELECT s_logisimBus2 <=
      "0"&X"0088" WHEN "0"&X"1",
      "0"&X"00C8" WHEN "0"&X"2",
      "0"&X"0048" WHEN "0"&X"3",
      "0"&X"0108" WHEN "0"&X"4",
      "0"&X"0148" WHEN "0"&X"5",
      "0"&X"0188" WHEN "0"&X"6",
      "0"&X"0208" WHEN "0"&X"7",
      "0"&X"0248" WHEN "0"&X"8",
      "0"&X"0098" WHEN "0"&X"9",
      "0"&X"00D8" WHEN "0"&X"A",
      "0"&X"0118" WHEN "0"&X"B",
      "0"&X"0158" WHEN "0"&X"C",
      "0"&X"0198" WHEN "0"&X"D",
      "1"&X"C01C" WHEN "0"&X"E",
      "0"&X"2000" WHEN "0"&X"F",
      "0"&X"081B" WHEN "1"&X"0",
      "0"&X"0413" WHEN "1"&X"1",
      "0"&X"01D8" WHEN "1"&X"2",
      "1"&X"C010" WHEN "1"&X"3",
      "0"&X"4010" WHEN "1"&X"4",
      "0"&X"8010" WHEN "1"&X"5",
      "0"&X"C010" WHEN "1"&X"6",
      "1"&X"0010" WHEN "1"&X"7",
      "1"&X"4010" WHEN "1"&X"8",
      "1"&X"8010" WHEN "1"&X"9",
      "0"&X"08AA" WHEN "1"&X"A",
      "0"&X"04A2" WHEN "1"&X"B",
      "0"&X"00A8" WHEN "1"&X"C",
      "0"&X"10C0" WHEN "1"&X"D",
      "0"&X"10D0" WHEN "1"&X"E",
      "0"&X"0000" WHEN OTHERS;

END platformIndependent;
