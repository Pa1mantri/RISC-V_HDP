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

![Screenshot 2024-04-17 213049](https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/211d808f-ba1e-4201-bc28-7e16bf494cc3)


The above .vcd generated is about the size of 16GB. By bypassing the Uart (by commenting the assembly instructions in the testbench) and then simulating it resutls in a .vcd file in 16Mb.


![Screenshot 2024-04-17 215158](https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/a8e1edf0-cffd-467f-a0b6-d92e31f18de4)


Waveform of the RTL functional simulation 


![Screenshot 2024-04-17 215140](https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/52c2517d-19b3-4a67-91c8-fe78e94ee70d)

