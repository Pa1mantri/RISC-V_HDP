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


## Register architecture of X30

X30 register is used for GPIO pins.

X30[0] - input data from sensor
x30[1] - output to LED
x30[2] - output to switchh

## C code with inline assembly

```

```