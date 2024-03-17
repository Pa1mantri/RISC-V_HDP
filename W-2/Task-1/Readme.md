
## Introduction to RISC-V ISA and Compiler toolchain

Each computer has a fixed set of instructions in the form of binary patterns called a machine language. Since it is difficult for people to communicate with computers in the language of 0s and 1s, the binary instructions are given abbreviated names, called mnemonics, which form the assembly language.

The C-code that you write is being implemented in a Layout. In between there are many abstraction layers which helps the C-code being implemented on the cpu core(which has got that particular layout shown below).

First the C-program is compiled in its assembly language program. Here it is being compiled using RISC-V architecture.

![Screenshot 2023-11-17 100918.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/2a93c1a9-af21-459a-9f69-6f78e913144b/891a7069-cc50-4a3d-a8e1-979f7faf17bb/Screenshot_2023-11-17_100918.png)

Second the assembly language program is converted into machine language which comprises of 1’s and 0’s(below it is in Hexadecimal).

![Screenshot 2023-11-17 101536.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/2a93c1a9-af21-459a-9f69-6f78e913144b/0330d993-c017-4b83-888b-b2b472e476eb/Screenshot_2023-11-17_101536.png)

The above bits in the binary format( in the image above they are in hexadecimal format). There is another interface that needs to be present between architecture and layout that is **HARDWARE DESCRIPTION LANGUAGE**. The RISC-V architecture is implemented using some RTL. Here picorv32 is used to implement the RISC-V architecture.

![Screenshot 2023-11-17 171105.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/2a93c1a9-af21-459a-9f69-6f78e913144b/d7417c72-ef18-4d1a-a537-409ea35e71b3/Screenshot_2023-11-17_171105.png)

What are the steps/interfaces present between an APP and HARDWARE. These APP’s run on the hardware.

![Screenshot 2023-11-18 101851.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/2a93c1a9-af21-459a-9f69-6f78e913144b/f66e1fe0-3305-45a6-b2ae-08d55ff7732b/Screenshot_2023-11-18_101851.png)

These APP’s enter into a block called System Software. This System Software converts the app into binary language understandable by the hardware. System Software consists of 

**OS :** Operating system handles IO operations, Allocate Memory , Low level System Functions**.** **Output of OS**: Turning the APP into small functions of C/C++, Java

**Compiler :**  These C/C++ functions are converted into instructions using **respective compilers.** Syntax of the instructions depends upon the kind of hardware that it is going to be implemented in. **Output of Compiler:** **.exe file** (which has got the instructions compatible to the hardware it is going to be executed by)

**Assembler :** Converts the instructions into respective binary numbers.

![Screenshot 2023-11-18 103731.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/2a93c1a9-af21-459a-9f69-6f78e913144b/cfd9a1a4-2c4c-4d14-a9d9-af93e5eb67a7/Screenshot_2023-11-18_103731.png)

Example of a stopwatch app. Where OS converts into C functions and the output of compiler and assembler.(Assembler output (in the image it is in Hexa-decimal format) is adjacent to compiler output). **When you run an application**, parts of its code and data are loaded into the computer's **RAM for faster access**. This includes the **instructions** that the processor needs to execute.

![Screenshot 2023-11-18 105324.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/2a93c1a9-af21-459a-9f69-6f78e913144b/32cbf466-b720-45e4-b211-61b7df054522/Screenshot_2023-11-18_105324.png)

Instructions (compiler output) acts as an abstract interface between C program and Hardware. This abstract interface is called **Instruction Set Architecture or architecture of computer.** This compiler output (instructions) acts as an architecture of the Laptop. This architecture represents the hardware. This is the language with which a user speaks to the computer.

The architecture of a CPU refers to its fundamental design principles and **the way it executes instructions.** Designing your own CPU core may involve defining a new architecture or **customizing an existing one** to suit specific requirements.

**Control unit:** The control unit manages the execution of instructions. Designing a CPU core includes defining **how the control unit will decode and execute instructions.**

As mentioned above, there is an interface between the instruction set architecture and the hardware(Chip Layout) that is Hardware Description Language. The add x6, x10, x6 is instruction which is implemented in the RTL snippet. Then the hardware understands the instruction as written in the RTL snippet.(where to store the output of that instruction, what values to add ; everything is implemented as mentioned in the RTL). That RTL is synthesized into a netlist. Netlist to hardware comes under Physical Implementation (RTL 2 GDSII)

![Screenshot 2023-11-18 110422.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/2a93c1a9-af21-459a-9f69-6f78e913144b/11aeeb61-635b-4bb0-bac0-942f965438f6/Screenshot_2023-11-18_110422.png)

![Screenshot 2023-11-18 112955.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/2a93c1a9-af21-459a-9f69-6f78e913144b/8de66585-73ed-4f11-920e-6b5ad9e18501/Screenshot_2023-11-18_112955.png)