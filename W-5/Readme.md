## GLS Simulation

In this section, we will be performing Gate level Simulation by creating two different netlist - one is specific to our ASIC application using UART mechanism for data transfer and second netlist is created for testing by bypassing the UART mechanism.

yosys commands to generate the netlist 

```
read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80_256.lib
read_verilog processor.v
synth -top wrapper
dfflibmap -liberty sky130_fd_sc_hd__tt_025C_1v80_256.lib
abc -liberty sky130_fd_sc_hd__tt_025C_1v80_256.lib
write_verilog processor_synth.v
show wrapper

```
``show wrapper`` command gives the following gnerated netlist picture.


This netlist along with primitives.v and sky130_fd_sc_hd.v and sky130_sram_1kbyte_1rw1r_32x256.v files are used with iverilog to perform GLS simulation.

![Screenshot 2024-04-17 223351](https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/1f5bd9e5-6d88-456e-af10-ad572ab1225a)

![Screenshot 2024-04-17 223718](https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/5986b4bf-117f-46b6-85bb-a50b20c3c19d)
