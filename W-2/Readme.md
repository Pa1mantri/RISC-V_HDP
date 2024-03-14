## Understandin how to measure CPU Performance

An important aspect of designing a CPU is its performance. CPU performance does not just depend on one factor like clock frequency. There are multiple aspects to consider when measuring the performance of a CPU.

If computer 'A' completes a task in 25 seconds and computer 'B' completes the same task in 30 seconds, before we draw conclusions about the speed of computer 'A,' we need to determine whether the given time refers to execution time or response time. If it is the execution time, then computer 'A' is 1.2 times faster than computer 'B'.

1.png

Execution Time: It is the time taken for data to be transferred from memory to the CPU and then from the CPU back to memory.

2.png

Again the CPU execution time is divided into two types.
1. User CPU time
2. System CPU time

3.png

Finally, the user CPU time is what is taken into consideration when measuring CPU performance. We do not include the time taken by the operating system when measuring performance.

The speed of your program is determined by the number of clock cycles it takes to complete the task, and the clock period is also important.

4.png

Test case:1 CPU 1 which runs at 1GHz executes a program in 20sec. CPU 2 runs the same programs in 10sec. Also given no.of.clock_cycles of CPU2 = 1.5 times of CPU1.

5.png

For every processor, **average clock cycles per instruction** is defined. That is called **CPI** (Clock cycles per instruction)

6.png

No.of.clock cycles = CPI * no.of.instructions for a program. 

The above equation is used to find the number of clock cycles. CPI is defined at the hardware level. Instruction count can be found from the assembly program.

7.png

The higher the CPI, the lower the CPU performance.

8.png



