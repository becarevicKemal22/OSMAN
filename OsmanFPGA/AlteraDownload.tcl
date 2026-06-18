# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
    if {[string compare $quartus(project) "logisimTopLevelShell"]} {
        puts "Project logisimTopLevelShell is not open"
        set make_assignments 0
    }
} else {
    # Only open if not already open
    if {[project_exists logisimTopLevelShell]} {
        project_open -revision logisimTopLevelShell logisimTopLevelShell
    } else {
        project_new -revision logisimTopLevelShell logisimTopLevelShell
    }
    set need_to_close_project 1
}
# Make assignments
if {$make_assignments} {

   set_global_assignment -name FAMILY "Cyclone V"
   set_global_assignment -name DEVICE 5CSEMA5F31C6
   set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
   set_global_assignment -name DEVICE_FILTER_PIN_COUNT 896
   set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
   set_global_assignment -name FMAX_REQUIREMENT "50 MHz "
   set_global_assignment -name RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
   set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"

    # Include all entities and gates


    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/arith/Comparator_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/base/LogisimClockComponent_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/base/logisimTickGenerator_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/base/synthesizedClockGenerator_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/ALU1Bit_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/ALU8Bit_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/DekoderAdresa_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/FullAdder_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/KontrolnaJedinicaGrananja_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/KontrolnaJedinica_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/OSMAN_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/PredznacenoProsirenje_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/ProgramskiBrojac_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/Registar8Bit_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/RegistarskaDatoteka_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/Sabirac_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/SevenSegAdapter_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/StabilizatorUlaza8Bit_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/StatusniRegistar_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/UIKontroler_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/gates/AND_GATE_3_INPUTS_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/gates/AND_GATE_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/gates/NOR_GATE_8_INPUTS_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/gates/OR_GATE_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/gates/XOR_GATE_ONEHOT_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/memory/D_FLIPFLOP_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/memory/RAMCONTENTS_MemorijaPodataka_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Decoder_4_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Decoder_8_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Multiplexer_2_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Multiplexer_8_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Multiplexer_bus_2_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Multiplexer_bus_4_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Multiplexer_bus_8_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/toplevel/logisimTopLevelShell_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/arith/Comparator_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/base/LogisimClockComponent_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/base/logisimTickGenerator_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/base/synthesizedClockGenerator_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/ALU1Bit_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/ALU8Bit_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/DekoderAdresa_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/FullAdder_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/KontrolnaJedinicaGrananja_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/KontrolnaJedinica_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/OSMAN_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/PredznacenoProsirenje_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/ProgramskiBrojac_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/Registar8Bit_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/RegistarskaDatoteka_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/Sabirac_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/SevenSegAdapter_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/StabilizatorUlaza8Bit_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/StatusniRegistar_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/circuit/UIKontroler_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/gates/AND_GATE_3_INPUTS_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/gates/AND_GATE_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/gates/NOR_GATE_8_INPUTS_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/gates/OR_GATE_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/gates/XOR_GATE_ONEHOT_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/memory/D_FLIPFLOP_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/memory/RAMCONTENTS_MemorijaPodataka_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Decoder_4_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Decoder_8_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Multiplexer_2_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Multiplexer_8_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Multiplexer_bus_2_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Multiplexer_bus_4_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/plexers/Multiplexer_bus_8_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/kemal/OneDrive/Documents/OSMANLogisimVHDLOutput//OSMAN/OSMAN/vhdl/toplevel/logisimTopLevelShell_behavior.vhd"

    # Map fpga_clk and ionets to fpga pins
    set_location_assignment PIN_AF14 -to fpgaGlobalClock
            set_location_assignment PIN_AB23 -to n_SedSeg3_SedamSegDisplej_Segment_A
            set_location_assignment PIN_AE29 -to n_SedSeg3_SedamSegDisplej_Segment_B
            set_location_assignment PIN_AD29 -to n_SedSeg3_SedamSegDisplej_Segment_C
            set_location_assignment PIN_AC28 -to n_SedSeg3_SedamSegDisplej_Segment_D
            set_location_assignment PIN_AD30 -to n_SedSeg3_SedamSegDisplej_Segment_E
            set_location_assignment PIN_AC29 -to n_SedSeg3_SedamSegDisplej_Segment_F
            set_location_assignment PIN_AC30 -to n_SedSeg3_SedamSegDisplej_Segment_G
            set_location_assignment PIN_AJ29 -to n_SedSeg2_SedamSegDisplej_Segment_A
            set_location_assignment PIN_AH29 -to n_SedSeg2_SedamSegDisplej_Segment_B
            set_location_assignment PIN_AH30 -to n_SedSeg2_SedamSegDisplej_Segment_C
            set_location_assignment PIN_AG30 -to n_SedSeg2_SedamSegDisplej_Segment_D
            set_location_assignment PIN_AF29 -to n_SedSeg2_SedamSegDisplej_Segment_E
            set_location_assignment PIN_AF30 -to n_SedSeg2_SedamSegDisplej_Segment_F
            set_location_assignment PIN_AD27 -to n_SedSeg2_SedamSegDisplej_Segment_G
            set_location_assignment PIN_AE26 -to n_SedSeg1_Segment_A
            set_location_assignment PIN_AE27 -to n_SedSeg1_Segment_B
            set_location_assignment PIN_AE28 -to n_SedSeg1_Segment_C
            set_location_assignment PIN_AG27 -to n_SedSeg1_Segment_D
            set_location_assignment PIN_AF28 -to n_SedSeg1_Segment_E
            set_location_assignment PIN_AG28 -to n_SedSeg1_Segment_F
            set_location_assignment PIN_AH28 -to n_SedSeg1_Segment_G
            set_location_assignment PIN_AE12 -to DIP_Switch_sw_1
            set_location_assignment PIN_AD10 -to DIP_Switch_sw_2
            set_location_assignment PIN_AC9 -to DIP_Switch_sw_3
            set_location_assignment PIN_AE11 -to DIP_Switch_sw_4
            set_location_assignment PIN_AD12 -to DIP_Switch_sw_5
            set_location_assignment PIN_AD11 -to DIP_Switch_sw_6
            set_location_assignment PIN_AF10 -to DIP_Switch_sw_7
            set_location_assignment PIN_AF9 -to DIP_Switch_sw_8
            set_location_assignment PIN_W15 -to n_SW2_0
            set_location_assignment PIN_AA15 -to n_SW1_0
            set_location_assignment PIN_Y16 -to n_RST_0
            set_location_assignment PIN_V17 -to LED8_0
            set_location_assignment PIN_W19 -to LED5_0
            set_location_assignment PIN_Y19 -to LED4_0
            set_location_assignment PIN_V18 -to LED7_0
            set_location_assignment PIN_W17 -to LED6_0
            set_location_assignment PIN_Y21 -to LED1_0
            set_location_assignment PIN_AA14 -to n_SW0_0
            set_location_assignment PIN_W20 -to LED3_0
            set_location_assignment PIN_W21 -to LED2_0
    # Commit assignments
    export_assignments

    # Close project
    if {$need_to_close_project} {
        project_close
    }
}

