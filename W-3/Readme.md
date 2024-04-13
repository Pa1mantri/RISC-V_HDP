## Application 

**Clap Switch**

A switch that can be controlled using a sound sensor module. Initially, the threshold of the sound can be adjusted by the screw on the sensor module. Anything above the threshold is detected as high, and this signal is sent to the customized RISC-V processor. The processor checks the previous state of the switch and decides whether to turn the switch on or off based on its previous value. It turns the switch on if the previous value is low or turns the switch off if the previous value is high. A delay between two sensor read operations is incorporated. An LED flashes whenever sound is detected.

## Block diagram

<img width="561" alt="Screenshot 2024-03-27 162505" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/aea480b7-c72a-4620-8d8e-97cc9c0c2b73">

## Basic C code

```
#include<stdio.h>

void delay(int seconds);


int main()
{
int LED=0;
int switchh=0;
int sensor=0;
int i=0,j=0;


while (j < 100)
{
if(i==10)
sensor =1;
printf("sensor value is %d\n",sensor);

if(sensor)
{
LED=1;
printf("Switchh and LED values are %d %d\n",switchh,LED);

if(switchh==0)
{
switchh=1;
printf("setting output switchh value to %d\n",switchh);
}
else
{
switchh=0;
printf("setting output switchh value to %d\n",switchh);
}
delay(1000);
LED=0;  //sound is only detected when LED goes low
printf("setting LED value back to %d after a delay to sense the sound again\n",LED);
}

if(i==10)
{
sensor=0;
i=0;
}
i++;
j++;

}
return 0;
}


void delay(int seconds) {
int i,j;
for(i=0;i<seconds;i=i+1) {
for(j=0;j<1000000;j=j+1) {
//Adding a loop
}
}
}

```
## Observing the output using gcc compiler 

![Screenshot 2024-04-09 114829](https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/3d89787e-9490-4db0-b0f7-313d1d1fe905)

## Observing the output using RISC-V compiler 

commands used 
```
riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o clapswitch.o clapswitch.c
spike pk clapswitch.o
```

![Screenshot 2024-04-09 115146](https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/fc6fae3f-c03c-4745-84a9-9189581c0247)


## Register architecture of X30 for GPIOs:

X30[0] - input data from sensor
x30[1] - output to LED
x30[2] - output to switchh

## C code with inline assembly

```
//#include<stdio.h>


int main()
{
int LED=0;
int switchh=0;


while(1)
{

unsigned int mask=0xFFFFFFFE;


int data;
//Read sensor data "1" into x30[0]
asm volatile(
	"andi %0,x30,0x0001\n\t"
	: "=r"(data)
	:
	:
	);
//printf("data value after sensor input is intialized into the data is %d\n",data);

int sensor_input = data;

if(sensor_input == 1)
{


unsigned int mask =0xFFFFFFFD;
int value1 = 2;
//Setting the LED value to x30[1]
asm volatile(
	"and x30,x30, %1\n\t"
	"or x30,x30, %0\n\t"
	:
	:"r"(value1),"r"(mask)
	:"x30"
	);


if(switchh ==1)
{
switchh =0;

mask =0xFFFFFFFB;
int value2 = 0;
//setting the switch off(0) to x30[2]
asm volatile(
	"and x30,x30, %1\n\t"
	"or x30,x30, %0\n\t"
	:
	:"r"(value2),"r"(mask)
	:"x30"
	);
//printf("switch is off");

}

else
{
switchh =1;

mask=0xFFFFFFB;
int value2 = 4;
//setting the switch on(1) to x30[2]
asm volatile(
	"and x30,x30, %1\n\t"
	"or x30,x30, %0\n\t"
	:
	:"r"(value2),"r"(mask)
	:"x30"
	);
//printf("switch is on");
}

int i,j;
for(i=0;i <10; i++) {
for(j=0; j <10; j++) {
}

}

mask=0xFFFFFFFD;
value1=0;
//Resetting the LED x30[1] to zero after a delay
asm volatile(
	"and x30,x30,%1\n\t"
	"or x30,x30,%0\n\t"
	:
	:"r"(value1),"r"(mask)
	:"x30"
	);
//printf("resetting LED");

}

}

return (0);

}


```

## Assembly Code Conversion

Compile the inline assembly C program with RISCV 32 bit architecture and dump the assembly program into clapswitch_assembly.txt file. 

```
riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -o out clapswitch_inline.c
riscv64-unknown-elf-objdump -d -r out >clapswitch_assembly.txt

```

## Assembly Code

```

out:     file format elf32-littleriscv


Disassembly of section .text:

00010054 <main>:
   10054:	fc010113          	addi	sp,sp,-64
   10058:	02812e23          	sw	s0,60(sp)
   1005c:	04010413          	addi	s0,sp,64
   10060:	fe042023          	sw	zero,-32(s0)
   10064:	fe042623          	sw	zero,-20(s0)
   10068:	ffe00793          	li	a5,-2
   1006c:	fcf42e23          	sw	a5,-36(s0)
   10070:	001f7793          	andi	a5,t5,1
   10074:	fcf42c23          	sw	a5,-40(s0)
   10078:	fd842783          	lw	a5,-40(s0)
   1007c:	fcf42a23          	sw	a5,-44(s0)
   10080:	fd442703          	lw	a4,-44(s0)
   10084:	00100793          	li	a5,1
   10088:	fef710e3          	bne	a4,a5,10068 <main+0x14>
   1008c:	ffd00793          	li	a5,-3
   10090:	fcf42823          	sw	a5,-48(s0)
   10094:	00200793          	li	a5,2
   10098:	fcf42623          	sw	a5,-52(s0)
   1009c:	fcc42783          	lw	a5,-52(s0)
   100a0:	fd042703          	lw	a4,-48(s0)
   100a4:	00ef7f33          	and	t5,t5,a4
   100a8:	00ff6f33          	or	t5,t5,a5
   100ac:	fec42703          	lw	a4,-20(s0)
   100b0:	00100793          	li	a5,1
   100b4:	02f71463          	bne	a4,a5,100dc <main+0x88>
   100b8:	fe042623          	sw	zero,-20(s0)
   100bc:	ffb00793          	li	a5,-5
   100c0:	fcf42823          	sw	a5,-48(s0)
   100c4:	fc042423          	sw	zero,-56(s0)
   100c8:	fc842783          	lw	a5,-56(s0)
   100cc:	fd042703          	lw	a4,-48(s0)
   100d0:	00ef7f33          	and	t5,t5,a4
   100d4:	00ff6f33          	or	t5,t5,a5
   100d8:	0300006f          	j	10108 <main+0xb4>
   100dc:	00100793          	li	a5,1
   100e0:	fef42623          	sw	a5,-20(s0)
   100e4:	100007b7          	lui	a5,0x10000
   100e8:	ffb78793          	addi	a5,a5,-5 # ffffffb <__global_pointer$+0xffee693>
   100ec:	fcf42823          	sw	a5,-48(s0)
   100f0:	00400793          	li	a5,4
   100f4:	fcf42223          	sw	a5,-60(s0)
   100f8:	fc442783          	lw	a5,-60(s0)
   100fc:	fd042703          	lw	a4,-48(s0)
   10100:	00ef7f33          	and	t5,t5,a4
   10104:	00ff6f33          	or	t5,t5,a5
   10108:	fe042423          	sw	zero,-24(s0)
   1010c:	0300006f          	j	1013c <main+0xe8>
   10110:	fe042223          	sw	zero,-28(s0)
   10114:	0100006f          	j	10124 <main+0xd0>
   10118:	fe442783          	lw	a5,-28(s0)
   1011c:	00178793          	addi	a5,a5,1
   10120:	fef42223          	sw	a5,-28(s0)
   10124:	fe442703          	lw	a4,-28(s0)
   10128:	00900793          	li	a5,9
   1012c:	fee7d6e3          	bge	a5,a4,10118 <main+0xc4>
   10130:	fe842783          	lw	a5,-24(s0)
   10134:	00178793          	addi	a5,a5,1
   10138:	fef42423          	sw	a5,-24(s0)
   1013c:	fe842703          	lw	a4,-24(s0)
   10140:	00900793          	li	a5,9
   10144:	fce7d6e3          	bge	a5,a4,10110 <main+0xbc>
   10148:	ffd00793          	li	a5,-3
   1014c:	fcf42823          	sw	a5,-48(s0)
   10150:	fc042623          	sw	zero,-52(s0)
   10154:	fcc42783          	lw	a5,-52(s0)
   10158:	fd042703          	lw	a4,-48(s0)
   1015c:	00ef7f33          	and	t5,t5,a4
   10160:	00ff6f33          	or	t5,t5,a5
   10164:	f05ff06f          	j	10068 <main+0x14>

```

## Unique instructions in assembly code

To calculate the unique instructions in the above generated assembly code, a [python script](https://github.com/Pa1mantri/RISC-V_HDP/blob/main/W-3/script.py) is used.
Running the python script using the command  ``python3 script.py``

```
Number of different instructions: 11
List of unique instructions:
and
j
bge
andi
or
lui
addi
lw
sw
li
bne

```

