## Application 

**Clap Switch**

A switch that can be controlled using a sound sensor module. Initially, the threshold of the sound can be adjusted by the screw on the sensor module. Anything above the threshold is detected as high, and this signal is sent to the customized RISC-V processor. The processor checks the previous state of the switch and decides whether to turn the switch on or off based on its previous value. It turns the switch on if the previous value is low or turns the switch off if the previous value is high. A delay between two sensor read operations is incorporated. An LED flashes whenever sound is detected.

## Block diagram

<img width="561" alt="Screenshot 2024-03-27 162505" src="https://github.com/Pa1mantri/RISC-V_HDP/assets/114488271/aea480b7-c72a-4620-8d8e-97cc9c0c2b73">

## Flow chart of the code


