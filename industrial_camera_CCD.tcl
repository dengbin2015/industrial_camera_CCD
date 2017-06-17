package require ::quartus::project

set_location_assignment PIN_37 -to clk
set_location_assignment PIN_12 -to din[7]
set_location_assignment PIN_13 -to din[6]
set_location_assignment PIN_14 -to din[5]
set_location_assignment PIN_15 -to din[4]
set_location_assignment PIN_18 -to din[3]
set_location_assignment PIN_19 -to din[2]
set_location_assignment PIN_20 -to din[1]
set_location_assignment PIN_21 -to din[0]

set_location_assignment PIN_22 -to ad_clock
set_location_assignment PIN_5 -to QM
set_location_assignment PIN_3 -to SH
set_location_assignment PIN_2 -to ICG

set_location_assignment PIN_44 -to oe
set_location_assignment PIN_38 -to RXF
set_location_assignment PIN_43 -to TXE
set_location_assignment PIN_35 -to USB_RD
set_location_assignment PIN_35 -to USB_WD

set_location_assignment PIN_34 -to USB_DATA[7]
set_location_assignment PIN_33 -to USB_DATA[6]
set_location_assignment PIN_31 -to USB_DATA[5]
set_location_assignment PIN_30 -to USB_DATA[4]
set_location_assignment PIN_28 -to USB_DATA[3]
set_location_assignment PIN_27 -to USB_DATA[2]
set_location_assignment PIN_25 -to USB_DATA[1]
set_location_assignment PIN_23 -to USB_DATA[0]