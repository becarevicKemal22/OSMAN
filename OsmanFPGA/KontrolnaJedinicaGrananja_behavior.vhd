--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : KontrolnaJedinicaGrananja                                    ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF KontrolnaJedinicaGrananja IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT Multiplexer_8
         PORT ( enable  : IN  std_logic;
                muxIn_0 : IN  std_logic;
                muxIn_1 : IN  std_logic;
                muxIn_2 : IN  std_logic;
                muxIn_3 : IN  std_logic;
                muxIn_4 : IN  std_logic;
                muxIn_5 : IN  std_logic;
                muxIn_6 : IN  std_logic;
                muxIn_7 : IN  std_logic;
                sel     : IN  std_logic_vector( 2 DOWNTO 0 );
                muxOut  : OUT std_logic );
      END COMPONENT;

      COMPONENT XOR_GATE_ONEHOT
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus7  : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimBus9  : std_logic_vector( 1 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet5  : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus7(2 DOWNTO 0) <= GranTip;
   s_logisimBus9(1)          <= SkokReg;
   s_logisimNet11            <= NF;
   s_logisimNet12            <= VF;
   s_logisimNet2             <= ZF;
   s_logisimNet3             <= CF;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   I <= s_logisimBus9(1 DOWNTO 0);

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- NOT Gate
   s_logisimNet0 <=  NOT s_logisimNet2;

   -- NOT Gate
   s_logisimNet1 <=  NOT s_logisimNet4;

   -- NOT Gate
   s_logisimNet10 <=  NOT s_logisimNet3;

   -- Constant
    s_logisimNet5  <=  '0';


   -- Constant
    s_logisimNet6  <=  '1';


   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   PLEXERS_1 : Multiplexer_8
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimNet5,
                 muxIn_1 => s_logisimNet2,
                 muxIn_2 => s_logisimNet0,
                 muxIn_3 => s_logisimNet4,
                 muxIn_4 => s_logisimNet1,
                 muxIn_5 => s_logisimNet3,
                 muxIn_6 => s_logisimNet10,
                 muxIn_7 => s_logisimNet6,
                 muxOut  => s_logisimBus9(0),
                 sel     => s_logisimBus7(2 DOWNTO 0) );

   GATES_2 : XOR_GATE_ONEHOT
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet11,
                 input2 => s_logisimNet12,
                 result => s_logisimNet4 );


END platformIndependent;
