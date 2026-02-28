# Read technology LEF first, then cell LEF
read_lef /home/kartheesan/Desktop/OpenROAD/test/Nangate45/Nangate45_tech.lef
read_lef /home/kartheesan/Desktop/OpenROAD/test/Nangate45/Nangate45_stdcell.lef

# Read liberty
read_liberty /home/kartheesan/Desktop/OpenROAD/test/Nangate45/Nangate45_typ.lib

# Read netlist
read_verilog /home/kartheesan/Desktop/designs/vedicmul/synth_output.v
link_design vedicmul_64

# Timing constraints
create_clock -name vclk -period 10.0
set_input_delay  0 -clock vclk [all_inputs]
set_output_delay 0 -clock vclk [all_outputs]

# Reports
report_timing
report_worst_slack
report_design_area
