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
