--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : SevenSegAdapter                                              ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF SevenSegAdapter IS 

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus8 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet0 : std_logic;
   SIGNAL s_logisimNet1 : std_logic;
   SIGNAL s_logisimNet2 : std_logic;
   SIGNAL s_logisimNet3 : std_logic;
   SIGNAL s_logisimNet4 : std_logic;
   SIGNAL s_logisimNet5 : std_logic;
   SIGNAL s_logisimNet6 : std_logic;
   SIGNAL s_logisimNet7 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus8(7 DOWNTO 0) <= Segmenti;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- 7-Segment Display: SedamSegDisplej
   logisimOutputBubbles(0) <= s_logisimBus8(0);
   logisimOutputBubbles(1) <= s_logisimBus8(1);
   logisimOutputBubbles(2) <= s_logisimBus8(2);
   logisimOutputBubbles(3) <= s_logisimBus8(3);
   logisimOutputBubbles(4) <= s_logisimBus8(4);
   logisimOutputBubbles(5) <= s_logisimBus8(5);
   logisimOutputBubbles(6) <= s_logisimBus8(6);
   logisimOutputBubbles(7) <= s_logisimBus8(7);

END platformIndependent;
