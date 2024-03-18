
## Introduction to RISC-V ISA and Compiler toolchain

Each computer has a fixed set of instructions in the form of binary patterns called a machine language. Since it is difficult for people to communicate with computers in the language of 0s and 1s, the binary instructions are given abbreviated names, called mnemonics, which form the assembly language.

The C-code that you write is being implemented in a Layout. In between there are many abstraction layers which helps the C-code being implemented on the cpu core(which has got that particular layout shown below).

First the C-program is compiled in its assembly language program. Here it is being compiled using RISC-V architecture.

<img width="893" alt="Screenshot 2023-11-17 100918" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/38a0ae5a-90fa-4526-9d9b-94d0017092d5">

Second the assembly language program is converted into machine language which comprises of 1’s and 0’s(below it is in Hexadecimal).

<img width="893" alt="Screenshot 2023-11-17 101536" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/cb5383ac-548e-4da1-8968-2ada90badb43">

The above bits in the binary format( in the image above they are in hexadecimal format). There is another interface that needs to be present between architecture and layout that is **HARDWARE DESCRIPTION LANGUAGE**. The RISC-V architecture is implemented using some RTL. Here picorv32 is used to implement the RISC-V architecture.

<img width="959" alt="Screenshot 2023-11-17 171105" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/3d13e7c5-61c7-4909-bb1c-f948bd343f4c">

What are the steps/interfaces present between an APP and HARDWARE. These APP’s run on the hardware.

<img width="960" alt="Screenshot 2023-11-18 101851" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/60635e2b-ebdd-409a-ac0f-f8f6b73e2ec6">

These APP’s enter into a block called System Software. This System Software converts the app into binary language understandable by the hardware. System Software consists of 

**OS :** Operating system handles IO operations, Allocate Memory , Low level System Functions**.** **Output of OS**: Turning the APP into small functions of C/C++, Java

**Compiler :**  These C/C++ functions are converted into instructions using **respective compilers.** Syntax of the instructions depends upon the kind of hardware that it is going to be implemented in. **Output of Compiler:** **.exe file** (which has got the instructions compatible to the hardware it is going to be executed by)

**Assembler :** Converts the instructions into respective binary numbers.

<img width="960" alt="Screenshot 2023-11-18 103731" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/b25a7324-37f2-4a6f-a8a5-da077a1fa14c">

Example of a stopwatch app. Where OS converts into C functions and the output of compiler and assembler.(Assembler output (in the image it is in Hexa-decimal format) is adjacent to compiler output). **When you run an application**, parts of its code and data are loaded into the computer's **RAM for faster access**. This includes the **instructions** that the processor needs to execute.

<img width="601" alt="Screenshot 2024-03-18 175934" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/314d1844-179b-48fd-9d4a-1c2e0db1e08b">

Instructions (compiler output) acts as an abstract interface between C program and Hardware. This abstract interface is called **Instruction Set Architecture or architecture of computer.** This compiler output (instructions) acts as an architecture of the Laptop. This architecture represents the hardware. This is the language with which a user speaks to the computer.

The architecture of a CPU refers to its fundamental design principles and **the way it executes instructions.** Designing your own CPU core may involve defining a new architecture or **customizing an existing one** to suit specific requirements.

**Control unit:** The control unit manages the execution of instructions. Designing a CPU core includes defining **how the control unit will decode and execute instructions.**

As mentioned above, there is an interface between the instruction set architecture and the hardware(Chip Layout) that is Hardware Description Language. The add x6, x10, x6 is instruction which is implemented in the RTL snippet. Then the hardware understands the instruction as written in the RTL snippet.(where to store the output of that instruction, what values to add ; everything is implemented as mentioned in the RTL). That RTL is synthesized into a netlist. Netlist to hardware comes under Physical Implementation (RTL 2 GDSII)

<img width="607" alt="Screenshot 2024-03-18 175529" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/520f9aae-395a-4736-a10e-a8f5127edaac">

<img width="600" alt="Screenshot 2024-03-18 175613" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/7d128adf-96ed-4d99-bee0-091d68a6909f">





## RISC-V gcc compile and disassemble

C program to calculate the sum of first n numbers

```
#include<stdio.h>

int main()
{
	int i, sum=0 , n=100;
	for(i=0;i<=n;i=i+1) {
		sum +=i;
	}
	printf("Sum of the numbers from 1 to n is %d\n", sum);
return 0;
}

```

Output of C program compiled using gcc compiler 

<img width="928" alt="Screenshot 2024-03-18 152135" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/2b8fc3dc-c6ce-4bcb-a2e0-9d12910971c2">

Now the same C program is compiled using the RISC-V compiler

Commands used to compile using RISC-V and Spike simulator 

``` 
riscv64-unknown-elf-gcc -O1 -march=rv64i -mabi=lp64 -o sum1ton.o sum1ton.c
spike pk sum1ton.o
```

Command to disassemble the code
```
riscv64-unknown-elf-objdump -d sum1ton.o | less
```

<img width="928" alt="Screenshot 2024-03-18 152327" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/c7fcf1e0-4548-410f-a536-4130019fef3c">

<img width="925" alt="Screenshot 2024-03-18 151904" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/d49affc9-f184-4719-9a23-3086fc404ee4">

-O flag in the above command is used to specify the optimisation level. 

-O1 is the first level of Optimisation
-Ofast is the higher level of Optimisation

Differences in the optimization of assembly code using these keys can be found in the images below.

<img width="929" alt="Screenshot 2024-03-18 151844" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/30e47439-271a-45bd-93ab-e02a662844b7">

<img width="929" alt="Screenshot 2024-03-18 152040" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/ec101628-c518-4a69-916f-59e8c952189f">

To debug the generated object file, Spike simulator is used. Command used is 

```
spike -d pk sum1ton.o
```
To run the program until a specific PC value 

```
unitl pc 0 to <specific_address_in_the_assembly_code>
```
<img width="929" alt="Screenshot 2024-03-18 152929" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/7b1043c6-ae83-4045-b79a-2b39abb906b2">


## Application Binary Interface

The interface through which application programmers and the operating system access the hardware resources of the processor (registers) is called ABI."

The blue line in the image below denotes that

<img width="598" alt="Screenshot 2024-03-18 171439" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/db05b413-47bb-4e32-b331-00f95ddf13cd">

ABI register names

<img width="599" alt="Screenshot 2024-03-18 171852" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/43731fb9-df8d-49ef-9274-b6faaa073c1e">

The same C program (sum1ton.c) is now being implemented using ABI

First, modify the C program to pass a few parameters to the assembly language program written in RISC-V ISA, compute the result, and then return it to the C program.

<img width="603" alt="Screenshot 2024-03-18 172458" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/5b13bbb5-abd7-427c-a888-5f1eb38bb24c">

The arguments are passed to the a0,a1 registers and the result is returned in the a0 register

<img width="587" alt="Screenshot 2024-03-18 172930" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/3127b062-7da5-4d88-9543-a0f84c65c07a">

Compiling the c code and assembly code using RISC-V 

<img width="930" alt="Screenshot 2024-03-18 174513" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/5638e90b-e224-48a7-ad50-01e09a22c60b">

After disassembling the assembly code, one can observe the a0 and a1 registers being used.

<img width="929" alt="Screenshot 2024-03-18 174501" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/e55aed8e-0d38-4ce9-9eb7-b8ecbece653c">









