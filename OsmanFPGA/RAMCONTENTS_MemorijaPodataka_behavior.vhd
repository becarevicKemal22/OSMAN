--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : RAMCONTENTS_MemorijaPodataka                                 ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF RAMCONTENTS_MemorijaPodataka IS 

--------------------------------------------------------------------------------
-- Here all private types are defined                                         --
--------------------------------------------------------------------------------
   TYPE memoryArray IS ARRAY ( 256 DOWNTO 0 ) OF std_logic_vector( 7 DOWNTO 0);

--------------------------------------------------------------------------------
-- All used signals are defined here                                          --
--------------------------------------------------------------------------------
   SIGNAL s_memContents     : memoryArray;
   SIGNAL s_ramDataOut      : std_logic_vector( 7 DOWNTO 0 );
	
   attribute ram_init_file : string;
   attribute ram_init_file of s_memContents : signal is "ram.mif";

BEGIN

   --------------------------------------------------------------------------------
   -- IZLAZ BEZ REGISTRA (Imitira MegaWizard opciju gdje "q" nije registered)
   --------------------------------------------------------------------------------
   dataOut <= s_ramDataOut WHEN oe = '1' ELSE (others => '0');

   --------------------------------------------------------------------------------
   -- GLAVNI MEMORIJSKI BLOK (Sintetizira se kao pravi M10K RAM na 50MHz)
   --------------------------------------------------------------------------------
   mem : PROCESS(clock) IS
   BEGIN
      IF (falling_edge(clock)) THEN
         -- 1. Sinhroni upis (vezan strogo za CPU tick signal generator)
         IF (we = '1' AND tick = '1') THEN
            s_memContents(to_integer(unsigned(address))) <= dataIn;
         END IF;
         
         -- 2. Sinhrono čitanje (Oslobođeno od CPU tick ograničenja!)
         -- Ovim RAM na svaki tvoj glavni oscilator procesira trenutnu adresu sa magistrale
         s_ramDataOut <= s_memContents(to_integer(unsigned(address)));
      END IF;
   END PROCESS mem;

END platformIndependent;
