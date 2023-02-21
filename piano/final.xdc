## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]                            
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches
set_property PACKAGE_PIN V17 [get_ports {volume[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {volume[0]}]
set_property PACKAGE_PIN V16 [get_ports {volume[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {volume[1]}]
set_property PACKAGE_PIN W16 [get_ports {volume[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {volume[2]}]
set_property PACKAGE_PIN W17 [get_ports {volume[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {volume[3]}]
set_property PACKAGE_PIN W15 [get_ports {volume[4]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {volume[4]}]
set_property PACKAGE_PIN V15 [get_ports {volume[5]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {volume[5]}]
set_property PACKAGE_PIN W14 [get_ports {volume[6]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {volume[6]}]
set_property PACKAGE_PIN W13 [get_ports {volume[7]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {volume[7]}]

set_property PACKAGE_PIN U16 [get_ports {note[0]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {note[0]}]
set_property PACKAGE_PIN E19 [get_ports {note[1]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {note[1]}]
set_property PACKAGE_PIN U19 [get_ports {note[2]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {note[2]}]
set_property PACKAGE_PIN V19 [get_ports {note[3]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {note[3]}]
set_property PACKAGE_PIN W18 [get_ports {note[4]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {note[4]}]
set_property PACKAGE_PIN U15 [get_ports {note[5]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {note[5]}]
set_property PACKAGE_PIN U14 [get_ports {note[6]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {note[6]}]
set_property PACKAGE_PIN V14 [get_ports {note[7]}]
        set_property IOSTANDARD LVCMOS33 [get_ports {note[7]}]

##Buttons
set_property PACKAGE_PIN U18 [get_ports rst]                        
    set_property IOSTANDARD LVCMOS33 [get_ports rst]


##Pmod Header JA
##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {AIN}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {AIN}]
##Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {GAIN}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {GAIN}]
##Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {SHUTDOWN_L}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {SHUTDOWN_L}]

##USB-RS232 Interface
set_property PACKAGE_PIN B18 [get_ports rx]
    set_property IOSTANDARD LVCMOS33 [get_ports rx]
