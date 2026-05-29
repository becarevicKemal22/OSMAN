--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : Decoder_4                                                    ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF Decoder_4 IS 

BEGIN

   decoderOut_0 <= '1' WHEN sel = "00" AND
                            enable = '1' ELSE '0';

   decoderOut_1 <= '1' WHEN sel = "01" AND
                            enable = '1' ELSE '0';

   decoderOut_2 <= '1' WHEN sel = "10" AND
                            enable = '1' ELSE '0';

   decoderOut_3 <= '1' WHEN sel = "11" AND
                            enable = '1' ELSE '0';
END platformIndependent;
