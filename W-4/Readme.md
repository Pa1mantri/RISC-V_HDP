After debugging the C code using spike, the inline assembly C code is converted into an Optimised RTL specific to the instruction set. The [Processor](https://github.com/Pa1mantri/RISC-V_HDP/blob/main/W-4/processor.v) and [testbench](https://github.com/Pa1mantri/RISC-V_HDP/blob/main/W-4/testbench.v) files are generated using the chipcron tool. 

## Commands to run verilog file 

```
iverilog -o out processor.v testbench.v
./out
gtkwave waveform.vcd

```

![Screenshot 2024-04-14 143235](https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/edfab88e-2f9c-4ea3-843c-9825aa911219)
