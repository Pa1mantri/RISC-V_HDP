After debugging the C code using spike, the inline assembly C code is converted into an Optimised RTL specific to the instruction set. The [Processor](https://github.com/Pa1mantri/RISC-V_HDP/blob/main/W-4/processor.v) and [testbench](https://github.com/Pa1mantri/RISC-V_HDP/blob/main/W-4/testbench.v) files are generated using the chipcron tool. 

## Commands to run verilog file 

```
iverilog -o out processor.v testbench.v
./out
gtkwave waveform.vcd

```

![Screenshot 2024-04-14 143235](https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/edfab88e-2f9c-4ea3-843c-9825aa911219)

The above .vcd generated is about the size of 16GB. By bypassing the Uart (by commenting the assembly instructions in the testbench) and then simulating it resutls in a .vcd file in 16Mb.

![Screenshot 2024-04-15 100516](https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/c56fb165-e917-4d4f-a4c6-4cc1a12b6e0e)

Waveform of the RTL functional simulation 

![Screenshot 2024-04-15 144732](https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/0134acd0-2221-4284-a150-8112c74801b5)
