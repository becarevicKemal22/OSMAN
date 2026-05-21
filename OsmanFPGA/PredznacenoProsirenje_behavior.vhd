--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : PredznacenoProsirenje                                        ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF PredznacenoProsirenje IS 

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus1 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus7 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet0 : std_logic;
   SIGNAL s_logisimNet2 : std_logic;
   SIGNAL s_logisimNet3 : std_logic;
   SIGNAL s_logisimNet4 : std_logic;
   SIGNAL s_logisimNet5 : std_logic;
   SIGNAL s_logisimNet6 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus7(0) <= s_logisimNet6;
   s_logisimBus7(1) <= s_logisimNet5;
   s_logisimBus7(2) <= s_logisimNet4;
   s_logisimBus7(3) <= s_logisimNet3;
   s_logisimBus7(4) <= s_logisimNet2;
   s_logisimBus7(5) <= s_logisimNet0;
   s_logisimBus7(6) <= s_logisimNet0;
   s_logisimBus7(7) <= s_logisimNet0;
   s_logisimNet2    <= s_logisimBus1(4);
   s_logisimNet3    <= s_logisimBus1(3);
   s_logisimNet4    <= s_logisimBus1(2);
   s_logisimNet5    <= s_logisimBus1(1);
   s_logisimNet6    <= s_logisimBus1(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus1(4 DOWNTO 0) <= Ulaz;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Izlaz <= s_logisimBus7(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet0  <=  '0';


END platformIndependent;
