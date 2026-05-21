--==============================================================================
--== Logisim-evolution goes FPGA automatic generated VHDL code                ==
--== https://github.com/logisim-evolution/                                    ==
--==                                                                          ==
--==                                                                          ==
--== Project   : OSMAN                                                        ==
--== Component : Multiplexer_2                                                ==
--==                                                                          ==
--==============================================================================

ARCHITECTURE platformIndependent OF Multiplexer_2 IS 

BEGIN

   makeMux : PROCESS(enable,
                     muxIn_0,
                     muxIn_1,
                     sel) IS
   BEGIN
      IF (enable = '0') THEN
         muxOut <= '0';
                        ELSE
         CASE (sel) IS
            WHEN '0' => muxOut <= muxIn_0;
            WHEN OTHERS  => muxOut <= muxIn_1;
         END CASE;
      END IF;
   END PROCESS makeMux;

END platformIndependent;
