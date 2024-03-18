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

Every instruction reads at least two registers and writes to one register. Therefore, a **register file** is needed. In RISC-V, we have 32 32-bit registers in the register bank.

<img width="491" alt="Screenshot 2024-03-16 092638" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/dd83a90f-c673-4ac6-b4f2-1b298b44cedd">

In addition to the above elements, arithmetic and logical operations are also performed on the data from the registers using an **ALU**.

<img width="486" alt="Screenshot 2024-03-16 093807" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/33a4e252-f95d-4841-a4a1-015b9f32037b">

Load and store instructions require memory access, i.e., accessing **data memory**.

Normally, the PC is incremented by 4, as instructions are 32-bit in size and stored in four 8-bit locations. In the case of branch instructions, the PC has to jump to a certain specified location. The microarchitecture must account for both of these cases.

Multiplexers are introduced at every stage where more than one signal is driving. Apart from the **control unit**, the entire microarchitecture is defined based on the instructions.


<img width="488" alt="Screenshot 2024-03-16 100834" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/bc6d9cad-28ea-4fed-8f2f-01bd662acef8">

After the control unit is introduced 

<img width="469" alt="Screenshot 2024-03-16 101216" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/5c0b7d5e-56cb-4dfe-9f19-1c5b4e96bc83">

## Measuring CPU Performance of C programs 

Compilation of C code using RISC-V compiler 

commands used to compile the C program with riscv and generate the output using spike simulator

```
riscv64-unknown-elf-gcc -march=rv64i -mabi=lp64 -ffreestanding -o ./filename.o filename.c
spike pk filename.o
```

Command to disassemble the assembly code
```
riscv64-unknown-elf-objdump -d filename.o
```

After compilation, the same C program is compiled again without including libraries such as printf, scanf, and all the other included libraries.

The below image shows the difference in the file size of the assembly code between the programs with libraries included and those without libraries."

<img width="927" alt="Screenshot 2024-03-17 113416" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/6f89b3a8-1390-4d07-b294-12c61a6b31e1">

Assume the number of clock cycles for each instruction in RISC-V 

Arithmetic and logic instructions (add,sub,mul,div) - 2 cycles

Memory Reference instrucitons (ld,sd,mv)            - 4 cycles 

Branch instructions   (beq,bltu,jal)                - 3 cycles

other instructions                                  - 2 cycles

**Counter**

Assembly code of the counter program without libraries generated by godbolt

```
display(int):
        addi    sp,sp,-32
        sd      ra,24(sp)
        sd      s0,16(sp)
        addi    s0,sp,32
        mv      a5,a0
        sw      a5,-20(s0)
        nop
        ld      ra,24(sp)
        ld      s0,16(sp)
        addi    sp,sp,32
        jr      ra
main:
        addi    sp,sp,-32
        sd      ra,24(sp)
        sd      s0,16(sp)
        addi    s0,sp,32
        sw      zero,-20(s0)
.L4:
        lw      a5,-20(s0)
        mv      a0,a5
        call    display(int)
        lw      a5,-20(s0)
        addiw   a5,a5,1
        sw      a5,-20(s0)
        lw      a5,-20(s0)
        sext.w  a4,a5
        li      a5,16
        bne     a4,a5,.L4
        sw      zero,-20(s0)
        j       .L4

```
Total instructions are 28. As per the above assumption of number of cycles per each instruction, total clock cycle count is 89.

**clock cycles per instruction** = **Total no.of clock cycles/number of instructions**

CPI = 89/28 = 3.17

**CPU time = CPI * number of instructions per program * clock time**

Assume clock Time = 200ps (5MHz clock frequency)

CPU time = 3.17 * 28 * 200ps = 17752 ps = 17.752ns


**ALU**

Assembly code of the ALU program without libraries generated by godbolt 

```
main:
        addi    sp,sp,-32       
        sd      ra,24(sp)
        sd      s0,16(sp)
        addi    s0,sp,32
        sw      zero,-20(s0)
        lw      a5,-24(s0)
        sext.w  a4,a5
        li      a5,47
        beq     a4,a5,.L2
        lw      a5,-24(s0)
        sext.w  a4,a5
        li      a5,47
        bgt     a4,a5,.L8
        lw      a5,-24(s0)
        sext.w  a4,a5
        li      a5,45
        beq     a4,a5,.L4
        lw      a5,-24(s0)
        sext.w  a4,a5
        li      a5,45
        bgt     a4,a5,.L8
        lw      a5,-24(s0)
        sext.w  a4,a5
        li      a5,42
        beq     a4,a5,.L5
        lw      a5,-24(s0)
        sext.w  a4,a5
        li      a5,43
        bne     a4,a5,.L8
        lw      a5,-28(s0)
        mv      a4,a5
        lw      a5,-32(s0)
        addw    a5,a4,a5
        sw      a5,-20(s0)
        j       .L6
.L4:
        lw      a5,-28(s0)
        mv      a4,a5
        lw      a5,-32(s0)
        subw    a5,a4,a5
        sw      a5,-20(s0)
        j       .L6
.L5:
        lw      a5,-28(s0)
        mv      a4,a5
        lw      a5,-32(s0)
        mulw    a5,a4,a5
        sw      a5,-20(s0)
        j       .L6
.L2:
        lw      a5,-28(s0)
        mv      a4,a5
        lw      a5,-32(s0)
        divw    a5,a4,a5
        sw      a5,-20(s0)
        j       .L6
.L8:
        nop
.L6:
        li      a5,0
        mv      a0,a5
        ld      ra,24(sp)
        ld      s0,16(sp)
        addi    sp,sp,32
        jr      ra

```
Total instructions are 60. As per the above assumption of number of cycles per each instruction, total clock cycle count is 196.

**clock cycles per instruction** = **Total no.of clock cycles/number of instructions**

CPI = 196/60 = 3.266

**CPU time = CPI * number of instructions per program * clock time**

Assume clock Time = 200ps (5MHz clock frequency)

CPU time = 3.26 * 60 * 200ps = 39120 ps = 39.120ns

**Matrix Multiplicatoin**

Assembly code of the Matrix multiplication program without libraries generated by godbolt 

```
mulMat(int (*) [2], int (*) [2]):
        addi    sp,sp,-64
        sd      ra,56(sp)
        sd      s0,48(sp)
        addi    s0,sp,64
        sd      a0,-56(s0)
        sd      a1,-64(s0)
        sw      zero,-20(s0)
        j       .L2
.L7:
        sw      zero,-24(s0)
        j       .L3
.L6:
        lw      a5,-24(s0)
        lw      a4,-20(s0)
        slli    a4,a4,1
        add     a4,a4,a5
        addi    a5,s0,-48
        slli    a4,a4,2
        add     a5,a4,a5
        sw      zero,0(a5)
        sw      zero,-28(s0)
        j       .L4
.L5:
        lw      a5,-24(s0)
        lw      a4,-20(s0)
        slli    a4,a4,1
        add     a4,a4,a5
        addi    a5,s0,-48
        slli    a4,a4,2
        add     a5,a4,a5
        lw      a4,0(a5)
        lw      a5,-20(s0)
        slli    a5,a5,3
        ld      a3,-56(s0)
        add     a3,a3,a5
        lw      a5,-28(s0)
        slli    a5,a5,2
        add     a5,a3,a5
        lw      a3,0(a5)
        lw      a5,-28(s0)
        slli    a5,a5,3
        ld      a2,-64(s0)
        add     a2,a2,a5
        lw      a5,-24(s0)
        slli    a5,a5,2
        add     a5,a2,a5
        lw      a5,0(a5)
        mulw    a5,a3,a5
        sext.w  a5,a5
        addw    a5,a4,a5
        sext.w  a4,a5
        lw      a5,-24(s0)
        lw      a3,-20(s0)
        slli    a3,a3,1
        add     a3,a3,a5
        addi    a5,s0,-48
        slli    a3,a3,2
        add     a5,a3,a5
        sw      a4,0(a5)
        lw      a5,-28(s0)
        addiw   a5,a5,1
        sw      a5,-28(s0)
.L4:
        lw      a5,-28(s0)
        sext.w  a4,a5
        li      a5,1
        ble     a4,a5,.L5
        lw      a5,-24(s0)
        addiw   a5,a5,1
        sw      a5,-24(s0)
.L3:
        lw      a5,-24(s0)
        sext.w  a4,a5
        li      a5,1
        ble     a4,a5,.L6
        lw      a5,-20(s0)
        addiw   a5,a5,1
        sw      a5,-20(s0)
.L2:
        lw      a5,-20(s0)
        sext.w  a4,a5
        li      a5,1
        ble     a4,a5,.L7
        nop
        nop
        ld      ra,56(sp)
        ld      s0,48(sp)
        addi    sp,sp,64
        jr      ra
.LC0:
        .word   1
        .word   1
        .word   2
        .word   2
main:
        addi    sp,sp,-48
        sd      ra,40(sp)
        sd      s0,32(sp)
        addi    s0,sp,48
        lui     a5,%hi(.LC0)
        addi    a5,a5,%lo(.LC0)
        ld      a4,0(a5)
        sd      a4,-32(s0)
        ld      a5,8(a5)
        sd      a5,-24(s0)
        lui     a5,%hi(.LC0)
        addi    a5,a5,%lo(.LC0)
        ld      a4,0(a5)
        sd      a4,-48(s0)
        ld      a5,8(a5)
        sd      a5,-40(s0)
        addi    a4,s0,-48
        addi    a5,s0,-32
        mv      a1,a4
        mv      a0,a5
        call    mulMat(int (*) [2], int (*) [2])
        li      a5,0
        mv      a0,a5
        ld      ra,40(sp)
        ld      s0,32(sp)
        addi    sp,sp,48
        jr      ra
```
Total instructions are 110. As per the above assumption of number of cycles per each instruction, total clock cycle count is 355.

**clock cycles per instruction** = **Total no.of clock cycles/number of instructions**

CPI = 355/110 = 3.227

**CPU time = CPI * number of instructions per program * clock time**

Assume clock Time = 200ps (5MHz clock frequency)

CPU time = 3.227 * 110 * 200ps = 70994 ps = 70.994ns

