set_false_path -from [get_ports {buttons_i[*]}] -to *
set_false_path -from * -to [get_ports {leds_o[*]}]
set_false_path -from [get_ports {switches_i[*]}] -to *


