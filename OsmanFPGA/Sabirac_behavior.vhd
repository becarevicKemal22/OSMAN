--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : Sabirac                                                      ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF Sabirac IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT FullAdder
         PORT ( A                 : IN  std_logic;
                B                 : IN  std_logic;
                Cin               : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Cout              : OUT std_logic;
                S                 : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus10 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus15 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet16 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
   SIGNAL s_logisimNet18 : std_logic;
   SIGNAL s_logisimNet19 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet20 : std_logic;
   SIGNAL s_logisimNet21 : std_logic;
   SIGNAL s_logisimNet22 : std_logic;
   SIGNAL s_logisimNet23 : std_logic;
   SIGNAL s_logisimNet24 : std_logic;
   SIGNAL s_logisimNet25 : std_logic;
   SIGNAL s_logisimNet26 : std_logic;
   SIGNAL s_logisimNet27 : std_logic;
   SIGNAL s_logisimNet28 : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet30 : std_logic;
   SIGNAL s_logisimNet31 : std_logic;
   SIGNAL s_logisimNet32 : std_logic;
   SIGNAL s_logisimNet33 : std_logic;
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus10(7 DOWNTO 0) <= A;
   s_logisimBus15(7 DOWNTO 0) <= B;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Izlaz <= s_logisimBus29(7 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimNet34  <=  '0';


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   FullAdder_8 : FullAdder
      PORT MAP ( A                 => s_logisimBus10(0),
                 B                 => s_logisimBus15(0),
                 Cin               => s_logisimNet34,
                 Cout              => s_logisimNet11,
                 S                 => s_logisimBus29(0),
                 logisimClockTree0 => logisimClockTree0 );

   FullAdder_1 : FullAdder
      PORT MAP ( A                 => s_logisimBus10(7),
                 B                 => s_logisimBus15(7),
                 Cin               => s_logisimNet8,
                 Cout              => OPEN,
                 S                 => s_logisimBus29(7),
                 logisimClockTree0 => logisimClockTree0 );

   FullAdder_2 : FullAdder
      PORT MAP ( A                 => s_logisimBus10(6),
                 B                 => s_logisimBus15(6),
                 Cin               => s_logisimNet12,
                 Cout              => s_logisimNet8,
                 S                 => s_logisimBus29(6),
                 logisimClockTree0 => logisimClockTree0 );

   FullAdder_3 : FullAdder
      PORT MAP ( A                 => s_logisimBus10(5),
                 B                 => s_logisimBus15(5),
                 Cin               => s_logisimNet4,
                 Cout              => s_logisimNet12,
                 S                 => s_logisimBus29(5),
                 logisimClockTree0 => logisimClockTree0 );

   FullAdder_4 : FullAdder
      PORT MAP ( A                 => s_logisimBus10(4),
                 B                 => s_logisimBus15(4),
                 Cin               => s_logisimNet7,
                 Cout              => s_logisimNet4,
                 S                 => s_logisimBus29(4),
                 logisimClockTree0 => logisimClockTree0 );

   FullAdder_5 : FullAdder
      PORT MAP ( A                 => s_logisimBus10(3),
                 B                 => s_logisimBus15(3),
                 Cin               => s_logisimNet14,
                 Cout              => s_logisimNet7,
                 S                 => s_logisimBus29(3),
                 logisimClockTree0 => logisimClockTree0 );

   FullAdder_6 : FullAdder
      PORT MAP ( A                 => s_logisimBus10(2),
                 B                 => s_logisimBus15(2),
                 Cin               => s_logisimNet5,
                 Cout              => s_logisimNet14,
                 S                 => s_logisimBus29(2),
                 logisimClockTree0 => logisimClockTree0 );

   FullAdder_7 : FullAdder
      PORT MAP ( A                 => s_logisimBus10(1),
                 B                 => s_logisimBus15(1),
                 Cin               => s_logisimNet11,
                 Cout              => s_logisimNet5,
                 S                 => s_logisimBus29(1),
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
