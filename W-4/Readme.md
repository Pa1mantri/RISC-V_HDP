The inline assembly C code is converted into an Optimised RTL specific to the instruction set, after debugging the C code using spike.

After making some changes in the JSON file, the assembly file and the .json file are uploaded into the chicpcron tool, which generates the processor and testbench files. Here are the [Processor](https://github.com/Pa1mantri/RISC-V_HDP/blob/main/W-4/processor.v) and [testbench](https://github.com/Pa1mantri/RISC-V_HDP/blob/main/W-4/testbench.v) files. 


Before performing simulation of processor and testbench using iverilog simulator, some GPIO pins need to be edited in the verilog file.

In the module wrapper, depenging upon the number of input and output pins, intialization of the ``input_gpio_pins`` and ``output_gpio_pins`` is modified. In this example, one input_gpio_pins and [1:0]output_gpio_pins.

Similarly at the end 

```
output_pins = {29'b0, top_gpio_pins[2:1], input_gpio_pins}
output_gpio_pins = top_gpio_pins[2:1];

```

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
