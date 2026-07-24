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
   SIGNAL s_logisimBus0 : std_logic_vector( 4 DOWNTO 0 );
   SIGNAL s_logisimBus6 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet1 : std_logic;
   SIGNAL s_logisimNet2 : std_logic;
   SIGNAL s_logisimNet3 : std_logic;
   SIGNAL s_logisimNet4 : std_logic;
   SIGNAL s_logisimNet5 : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus6(0) <= s_logisimNet5;
   s_logisimBus6(1) <= s_logisimNet4;
   s_logisimBus6(2) <= s_logisimNet3;
   s_logisimBus6(3) <= s_logisimNet2;
   s_logisimBus6(4) <= s_logisimNet1;
   s_logisimBus6(5) <= s_logisimNet1;
   s_logisimBus6(6) <= s_logisimNet1;
   s_logisimBus6(7) <= s_logisimNet1;
   s_logisimNet1    <= s_logisimBus0(4);
   s_logisimNet2    <= s_logisimBus0(3);
   s_logisimNet3    <= s_logisimBus0(2);
   s_logisimNet4    <= s_logisimBus0(1);
   s_logisimNet5    <= s_logisimBus0(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus0(4 DOWNTO 0) <= Ulaz;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Izlaz <= s_logisimBus6(7 DOWNTO 0);

END platformIndependent;
