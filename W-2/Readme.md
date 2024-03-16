## Understandin how to measure CPU Performance

An important aspect of designing a CPU is its performance. CPU performance does not just depend on one factor like clock frequency. There are multiple aspects to consider when measuring the performance of a CPU.

If computer 'A' completes a task in 25 seconds and computer 'B' completes the same task in 30 seconds, before we draw conclusions about the speed of computer 'A,' we need to determine whether the given time refers to execution time or response time. If it is the execution time, then computer 'A' is 1.2 times faster than computer 'B'.

<img width="503" alt="1" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/2eac410f-c539-4633-88f1-8b0b19acbdaf">

Execution Time: It is the time taken for data to be transferred from memory to the CPU and then from the CPU back to memory.

<img width="500" alt="2" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/a762797e-589c-48c5-b391-ef8617f0823b">


Again the CPU execution time is divided into two types.
1. User CPU time
2. System CPU time

<img width="484" alt="3" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/dfe78b69-c278-4c71-9314-4364d9694b11">

Finally, the user CPU time is what is taken into consideration when measuring CPU performance. We do not include the time taken by the operating system when measuring performance.

The speed of your program is determined by the number of clock cycles it takes to complete the task, and the clock period is also important.

<img width="472" alt="4 1" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/0d97a1a1-4d14-48d7-bc6a-b6f72fa29f21">

Test case:1 

CPU 1 which runs at 1GHz executes a program in 20sec. CPU 2 runs the same programs in 10sec. Also given no.of.clock_cycles of CPU2 = 1.5 times of CPU1.

<img width="551" alt="5" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/f43dfbb1-bca5-4f97-9796-decb625c4423">

For every processor, **average clock cycles per instruction** is defined. That is called **CPI** (Clock cycles per instruction)

<img width="469" alt="6" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/9256f837-6e25-456e-ae17-001b0accd460">

No.of.clock cycles = CPI * no.of.instructions for a program. 

The above equation is used to find the number of clock cycles. CPI is defined at the hardware level. Instruction count can be found from the assembly program.

Test Case:2

CPU1 has a clock cycle time of 200ps and CPI of 2.5, CPU2 has a clock cycle time of 400ps and CPI of 1.5. Which one is the fastest. Both CPU running the same program (same number of instrucitons)

<img width="465" alt="7" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/1df368c1-dbc1-4f07-9795-ff3ab6718a04">

CPU1 has a clock frequency of 5MHz, while CPU2 has a clock frequency of 2.5MHz. If we measure performance solely by clock frequency, CPU1 appears to be faster. However, CPU1 has a CPU time of 500ps, whereas CPU2 has a CPU time of 600ps

CPU1 = 5/6 CPU2 = 0.833CPU2.

<img width="479" alt="8" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/a3d04499-14c6-4e9f-81c3-3971b9ecb5f1">

The higher the CPI, the lower the CPU performance.

Test Case:3

A single CPU is executing two different programs, each with a different number of instructions. 

<img width="466" alt="Screenshot 2024-03-14 181254" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/37078918-76f3-4bd6-98a4-549d9cea2efe">

The total number of CPU clock cycles is 19 for blue and 18 for red. Since the clock cycle time is the same, the red one is faster, despite having more instructions (10) compared to the blue side (9).

<img width="471" alt="Screenshot 2024-03-14 182110" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/2eadf2b9-5120-41c5-9b9f-8e18ff648106">

## RISC-V micro architecture implementation

There are different instruction classes for processor implementation.

Memory-reference instructions - ld,sd

Arithmetic logic instructions - add,sub,and,or

Conditional branch instructions - beq

Similarly there are 47 instructions in the base instruction set of a risc-v isa.

**Program Counter**: It contains the address of the current instruction. Size of the program counter depends upon the number of locations in the instruction memory.

**Instruction Memory**: It is a memory module made of SRAM. Alternatively, it can be made of registers, but that would require a lot of space.

1.png

Every instruction reads at least two registers and writes to one register. Therefore, a **register file** is needed. In RISC-V, we have 32 32-bit registers in the register bank.

2.png

In addition to the above elements, arithmetic and logical operations are also performed on the data from the registers using an **ALU**.

Load and store instructions require memory access, i.e., accessing **data memory**.

Normally, the PC is incremented by 4, as instructions are 32-bit in size and stored in four 8-bit locations. In the case of branch instructions, the PC has to jump to a certain specified location. The microarchitecture must account for both of these cases.

3.png

Multiplexers are introduced at every stage where more than one signal is driving. Apart from the **control unit**, the entire microarchitecture is defined based on the instructions.





