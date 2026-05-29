# Load Quartus II Tcl Project package
package require ::quartus::project

set make_assignments 1

if {$make_assignments} {

   set_global_assignment -name FAMILY "Cyclone V"
   set_global_assignment -name DEVICE 5CSEMA5F31C6
   set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
   set_global_assignment -name DEVICE_FILTER_PIN_COUNT 896
   set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
   set_global_assignment -name FMAX_REQUIREMENT "50 MHz "
   set_global_assignment -name RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
   set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"

   set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3-V LVTTL"

    # Map fpga_clk and ionets to fpga pins
    set_location_assignment PIN_AF14 -to fpgaGlobalClock
            set_location_assignment PIN_V16 -to LED10_0
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
            set_location_assignment PIN_W16 -to LED9_0
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

