--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : ALU1Bit                                                      ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF ALU1Bit IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT XOR_GATE_ONEHOT
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT OR_GATE
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

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
   SIGNAL s_logisimBus10 : std_logic_vector( 2 DOWNTO 0 );
   SIGNAL s_logisimNet0  : std_logic;
   SIGNAL s_logisimNet1  : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet2  : std_logic;
   SIGNAL s_logisimNet3  : std_logic;
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
   s_logisimBus10(2 DOWNTO 0) <= F;
   s_logisimNet0              <= B;
   s_logisimNet3              <= A;
   s_logisimNet5              <= InvB;
   s_logisimNet6              <= Cin;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   Cout <= s_logisimNet7;
   O    <= s_logisimNet9;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- NOT Gate
   s_logisimNet11 <=  NOT s_logisimNet3;

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : XOR_GATE_ONEHOT
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet5,
                 input2 => s_logisimNet0,
                 result => s_logisimNet12 );

   GATES_2 : AND_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet3,
                 input2 => s_logisimNet0,
                 result => s_logisimNet2 );

   GATES_3 : OR_GATE
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet3,
                 input2 => s_logisimNet0,
                 result => s_logisimNet8 );

   GATES_4 : XOR_GATE_ONEHOT
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet3,
                 input2 => s_logisimNet0,
                 result => s_logisimNet1 );

   PLEXERS_5 : Multiplexer_8
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimNet3,
                 muxIn_1 => s_logisimNet11,
                 muxIn_2 => s_logisimNet4,
                 muxIn_3 => s_logisimNet4,
                 muxIn_4 => s_logisimNet2,
                 muxIn_5 => s_logisimNet8,
                 muxIn_6 => s_logisimNet1,
                 muxIn_7 => s_logisimNet0,
                 muxOut  => s_logisimNet9,
                 sel     => s_logisimBus10(2 DOWNTO 0) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   FullAdder_1 : FullAdder
      PORT MAP ( A                 => s_logisimNet3,
                 B                 => s_logisimNet12,
                 Cin               => s_logisimNet6,
                 Cout              => s_logisimNet7,
                 S                 => s_logisimNet4,
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
