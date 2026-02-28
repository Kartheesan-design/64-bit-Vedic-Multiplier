# Define a virtual clock just for timing reference
create_clock -name virtual_clk -period 10.0

# Set input delay
set_input_delay 0 -clock virtual_clk [all_inputs]

# Set output delay
set_output_delay 0 -clock virtual_clk [all_outputs]
