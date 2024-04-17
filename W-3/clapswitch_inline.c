//#include<stdio.h>


int main()
{

int switchh=0;


while(1)
{

unsigned int mask=0xFFFFFFFE;

int data;
int sensor_input=1;
//Read sensor data "1" into x30[0]

asm volatile(
	"and x30,x30, %0\n\t"
	"or x30,x30, %1\n\t"
	:
	:"r"(mask),"r"(sensor_input)
	:"x30"
	);

asm volatile(
	"andi %0,x30,0x0001\n\t"
	: "=r"(data)
	:
	:
	);
//printf("data value after sensor input is intialized into the data is %d\n",data);


if(data == 1)
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
//printf("sensor input detected, LED is ON\n");


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
//printf("switch is off\n");

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


//printf("switch is on\n");
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
//printf("resetting LED after a delay\n");

}

}

return (0);

}





