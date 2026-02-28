# Read all design files
read_verilog vedicmul_2.v
read_verilog vedicmul_4.v
read_verilog vedicmul_8.v
read_verilog vedicmul_16.v
read_verilog vedicmul_32.v
read_verilog vedicmu_64.v

# Set top module (change this to whichever you want to synthesize)
synth -top vedicmul_64

# Technology mapping to generic gates
abc -g AND,OR,XOR,NAND,NOR

# Write output netlist
write_verilog -noattr synth_output.v

write_json synth.json

# Print area/stats report
stat
