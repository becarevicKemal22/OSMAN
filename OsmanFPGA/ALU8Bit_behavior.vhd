--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : ALU8Bit                                                      ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF ALU8Bit IS 

   -----------------------------------------------------------------------------
   -- Here all used components are defined                                    --
   -----------------------------------------------------------------------------

      COMPONENT NOR_GATE_8_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                input4 : IN  std_logic;
                input5 : IN  std_logic;
                input6 : IN  std_logic;
                input7 : IN  std_logic;
                input8 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT XOR_GATE_ONEHOT
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                result : OUT std_logic );
      END COMPONENT;

      COMPONENT AND_GATE_3_INPUTS
         GENERIC ( BubblesMask : std_logic_vector );
         PORT ( input1 : IN  std_logic;
                input2 : IN  std_logic;
                input3 : IN  std_logic;
                result : OUT std_logic );
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

      COMPONENT ALU1Bit
         PORT ( A                 : IN  std_logic;
                B                 : IN  std_logic;
                Cin               : IN  std_logic;
                F                 : IN  std_logic_vector( 2 DOWNTO 0 );
                InvB              : IN  std_logic;
                logisimClockTree0 : IN  std_logic_vector( 4 DOWNTO 0 );
                Cout              : OUT std_logic;
                O                 : OUT std_logic );
      END COMPONENT;

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_logisimBus0  : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus16 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus18 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus29 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus33 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimBus37 : std_logic_vector( 3 DOWNTO 0 );
   SIGNAL s_logisimBus38 : std_logic_vector( 7 DOWNTO 0 );
   SIGNAL s_logisimNet10 : std_logic;
   SIGNAL s_logisimNet11 : std_logic;
   SIGNAL s_logisimNet12 : std_logic;
   SIGNAL s_logisimNet13 : std_logic;
   SIGNAL s_logisimNet14 : std_logic;
   SIGNAL s_logisimNet15 : std_logic;
   SIGNAL s_logisimNet17 : std_logic;
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
   SIGNAL s_logisimNet34 : std_logic;
   SIGNAL s_logisimNet35 : std_logic;
   SIGNAL s_logisimNet36 : std_logic;
   SIGNAL s_logisimNet39 : std_logic;
   SIGNAL s_logisimNet4  : std_logic;
   SIGNAL s_logisimNet40 : std_logic;
   SIGNAL s_logisimNet41 : std_logic;
   SIGNAL s_logisimNet42 : std_logic;
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
   SIGNAL s_logisimNet55 : std_logic;
   SIGNAL s_logisimNet56 : std_logic;
   SIGNAL s_logisimNet57 : std_logic;
   SIGNAL s_logisimNet58 : std_logic;
   SIGNAL s_logisimNet59 : std_logic;
   SIGNAL s_logisimNet6  : std_logic;
   SIGNAL s_logisimNet60 : std_logic;
   SIGNAL s_logisimNet61 : std_logic;
   SIGNAL s_logisimNet62 : std_logic;
   SIGNAL s_logisimNet63 : std_logic;
   SIGNAL s_logisimNet7  : std_logic;
   SIGNAL s_logisimNet8  : std_logic;
   SIGNAL s_logisimNet9  : std_logic;

BEGIN

   --------------------------------------------------------------------------------
   -- Here all wiring is defined                                                 --
   --------------------------------------------------------------------------------
   s_logisimBus33(0) <= s_logisimNet49;
   s_logisimBus33(1) <= s_logisimNet4;
   s_logisimBus33(2) <= s_logisimNet28;
   s_logisimBus33(3) <= s_logisimNet34;
   s_logisimBus33(4) <= s_logisimNet43;
   s_logisimBus33(5) <= s_logisimNet2;
   s_logisimBus33(6) <= s_logisimNet26;
   s_logisimBus38(1) <= s_logisimNet6;
   s_logisimBus38(2) <= s_logisimNet30;
   s_logisimBus38(3) <= s_logisimNet36;
   s_logisimBus38(4) <= s_logisimNet44;
   s_logisimBus38(5) <= s_logisimNet3;
   s_logisimBus38(6) <= s_logisimNet27;
   s_logisimBus38(7) <= s_logisimNet35;
   s_logisimNet2     <= s_logisimBus29(6);
   s_logisimNet26    <= s_logisimBus29(7);
   s_logisimNet27    <= s_logisimBus29(5);
   s_logisimNet28    <= s_logisimBus29(3);
   s_logisimNet3     <= s_logisimBus29(4);
   s_logisimNet30    <= s_logisimBus29(1);
   s_logisimNet34    <= s_logisimBus29(4);
   s_logisimNet35    <= s_logisimBus29(6);
   s_logisimNet36    <= s_logisimBus29(2);
   s_logisimNet4     <= s_logisimBus29(2);
   s_logisimNet43    <= s_logisimBus29(5);
   s_logisimNet44    <= s_logisimBus29(3);
   s_logisimNet49    <= s_logisimBus29(1);
   s_logisimNet6     <= s_logisimBus29(0);

   --------------------------------------------------------------------------------
   -- Here all input connections are defined                                     --
   --------------------------------------------------------------------------------
   s_logisimBus18(7 DOWNTO 0) <= B;
   s_logisimBus29(7 DOWNTO 0) <= A;
   s_logisimBus37(3 DOWNTO 0) <= ALUOp;

   --------------------------------------------------------------------------------
   -- Here all output connections are defined                                    --
   --------------------------------------------------------------------------------
   CF <= s_logisimNet31;
   I  <= s_logisimBus16(7 DOWNTO 0);
   NF <= s_logisimBus0(7);
   VF <= s_logisimNet62;
   ZF <= s_logisimNet61;

   --------------------------------------------------------------------------------
   -- Here all in-lined components are defined                                   --
   --------------------------------------------------------------------------------

   -- Constant
    s_logisimBus33(7)  <=  '0';


   -- Constant
    s_logisimBus38(0)  <=  '0';


   -- NOT Gate
   s_logisimNet32 <=  NOT s_logisimBus37(2);

   --------------------------------------------------------------------------------
   -- Here all normal components are defined                                     --
   --------------------------------------------------------------------------------
   GATES_1 : NOR_GATE_8_INPUTS
      GENERIC MAP ( BubblesMask => X"00" )
      PORT MAP ( input1 => s_logisimBus0(7),
                 input2 => s_logisimBus0(6),
                 input3 => s_logisimBus0(5),
                 input4 => s_logisimBus0(4),
                 input5 => s_logisimBus0(3),
                 input6 => s_logisimBus0(2),
                 input7 => s_logisimBus0(1),
                 input8 => s_logisimBus0(0),
                 result => s_logisimNet61 );

   GATES_2 : XOR_GATE_ONEHOT
      GENERIC MAP ( BubblesMask => "00" )
      PORT MAP ( input1 => s_logisimNet39,
                 input2 => s_logisimNet31,
                 result => s_logisimNet62 );

   GATES_3 : AND_GATE_3_INPUTS
      GENERIC MAP ( BubblesMask => "000" )
      PORT MAP ( input1 => s_logisimBus37(0),
                 input2 => s_logisimBus37(1),
                 input3 => s_logisimNet32,
                 result => s_logisimNet11 );

   PLEXERS_4 : Multiplexer_bus_4
      GENERIC MAP ( nrOfBits => 8 )
      PORT MAP ( enable  => '1',
                 muxIn_0 => s_logisimBus0(7 DOWNTO 0),
                 muxIn_1 => s_logisimBus0(7 DOWNTO 0),
                 muxIn_2 => s_logisimBus33(7 DOWNTO 0),
                 muxIn_3 => s_logisimBus38(7 DOWNTO 0),
                 muxOut  => s_logisimBus16(7 DOWNTO 0),
                 sel(0)  => s_logisimBus37(0),
                 sel(1)  => s_logisimBus37(3) );


   --------------------------------------------------------------------------------
   -- Here all sub-circuits are defined                                          --
   --------------------------------------------------------------------------------

   ALU1Bit_1 : ALU1Bit
      PORT MAP ( A                 => s_logisimBus29(7),
                 B                 => s_logisimBus18(7),
                 Cin               => s_logisimNet39,
                 Cout              => s_logisimNet31,
                 F                 => s_logisimBus37(2 DOWNTO 0),
                 InvB              => s_logisimNet11,
                 O                 => s_logisimBus0(7),
                 logisimClockTree0 => logisimClockTree0 );

   ALU1Bit_2 : ALU1Bit
      PORT MAP ( A                 => s_logisimBus29(6),
                 B                 => s_logisimBus18(6),
                 Cin               => s_logisimNet17,
                 Cout              => s_logisimNet39,
                 F                 => s_logisimBus37(2 DOWNTO 0),
                 InvB              => s_logisimNet11,
                 O                 => s_logisimBus0(6),
                 logisimClockTree0 => logisimClockTree0 );

   ALU1Bit_3 : ALU1Bit
      PORT MAP ( A                 => s_logisimBus29(5),
                 B                 => s_logisimBus18(5),
                 Cin               => s_logisimNet12,
                 Cout              => s_logisimNet17,
                 F                 => s_logisimBus37(2 DOWNTO 0),
                 InvB              => s_logisimNet11,
                 O                 => s_logisimBus0(5),
                 logisimClockTree0 => logisimClockTree0 );

   ALU1Bit_4 : ALU1Bit
      PORT MAP ( A                 => s_logisimBus29(4),
                 B                 => s_logisimBus18(4),
                 Cin               => s_logisimNet13,
                 Cout              => s_logisimNet12,
                 F                 => s_logisimBus37(2 DOWNTO 0),
                 InvB              => s_logisimNet11,
                 O                 => s_logisimBus0(4),
                 logisimClockTree0 => logisimClockTree0 );

   ALU1Bit_5 : ALU1Bit
      PORT MAP ( A                 => s_logisimBus29(3),
                 B                 => s_logisimBus18(3),
                 Cin               => s_logisimNet14,
                 Cout              => s_logisimNet13,
                 F                 => s_logisimBus37(2 DOWNTO 0),
                 InvB              => s_logisimNet11,
                 O                 => s_logisimBus0(3),
                 logisimClockTree0 => logisimClockTree0 );

   ALU1Bit_6 : ALU1Bit
      PORT MAP ( A                 => s_logisimBus29(2),
                 B                 => s_logisimBus18(2),
                 Cin               => s_logisimNet15,
                 Cout              => s_logisimNet14,
                 F                 => s_logisimBus37(2 DOWNTO 0),
                 InvB              => s_logisimNet11,
                 O                 => s_logisimBus0(2),
                 logisimClockTree0 => logisimClockTree0 );

   ALU1Bit_7 : ALU1Bit
      PORT MAP ( A                 => s_logisimBus29(1),
                 B                 => s_logisimBus18(1),
                 Cin               => s_logisimNet10,
                 Cout              => s_logisimNet15,
                 F                 => s_logisimBus37(2 DOWNTO 0),
                 InvB              => s_logisimNet11,
                 O                 => s_logisimBus0(1),
                 logisimClockTree0 => logisimClockTree0 );

   ALU1Bit_8 : ALU1Bit
      PORT MAP ( A                 => s_logisimBus29(0),
                 B                 => s_logisimBus18(0),
                 Cin               => s_logisimNet11,
                 Cout              => s_logisimNet10,
                 F                 => s_logisimBus37(2 DOWNTO 0),
                 InvB              => s_logisimNet11,
                 O                 => s_logisimBus0(0),
                 logisimClockTree0 => logisimClockTree0 );

END platformIndependent;
