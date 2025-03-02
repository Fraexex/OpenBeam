# Beamforming Research & Implementation Project

## Current Status
**IN PROGRESS**

## Project Overview

This project aims to make **beamforming research and implementation more accessible** by developing both simulation and hardware solutions. The team will work on **FDTD-based simulations** and **hardware development of a beamformer**, starting with phased array elements. Each phased array element will consist of a custom **Software Defined Radio (SDR)** shown below. 


![image](https://github.com/user-attachments/assets/cfbac92b-7dc3-4aab-b908-bf5a2831948e)

Here is how it works. The above pcb is a prototype sheild to the Raspberry PI PICO board. The Pico board connects via serial to the main command system and recives the individual antenna element gain and phase shift defined by beamforming simulation team in addition to the actual transmit data. This data then gets parsed and put into the uC's Direct Memory Address (DMA). Upon some clock cycle the DMA then loads this value into the PICO's Programmable Input Output (PIO) TX FIFO which gets outputed to 8 pins on the pico which are connected to the MAX586X Digital to Analog Converter (DAC). The DAC then creates a baseband Intermediate Frequency (IF) which gets connected to the input of the MAX2822. The MAX2822 will then upconvert this IF to 2.5GHz, this goes into a Balun which makes the differential RF single ended to interface with the RF amplfier which then transmits. 
On the RX chain, we have the opposite process happen. The RF block applies a gain to the received signal, is converted to a differntial pair and inputted into the MAX2822 which downconverts the signal back down to IF. This IF is then connected to the ADC in the MAX586X and digitized. The PIOs then read this 8-bit word outputted form the ADC and load them into the RX FIFO. The DMA then gets this 8-bit word from the RX-FIFO.



### **Simulation Engineers**
Your job is to develop **FDTD (Finite-Difference Time-Domain) simulations** for beamformers of different shapes and configurations. You will:
- Implement an FDTD-based simulation framework.
- Optimize algorithms for **high accuracy and efficiency**.
- Work with the hardware team to **validate** simulations against real-world results.
- Provide visualizations and reports on simulated beam patterns.
- **Develop standard power spectral distriution simulations** (Hence not FDTD)
  ![image](https://github.com/user-attachments/assets/7831237f-9bcf-46e8-bf48-c05373335627)

 ** Resources:**
    - https://medium.com/@itberrios6/introduction-to-beamforming-part-2-68db43c073b6
    - Van Trees: Optimal Array Processing (txtbook)
    - Matlab Antenna Array Toolkit

### **Embedded Engineers**
Your role is to develop the **firmware for the Raspberry Pi Pico** to control the beamformer. You will:
- Implement SPI/I2C communication to interface with:
  - **MAX2822** for up/down-converting RF signals.
  - **MAX5864** for ADC/DAC conversion.
- Develop software to **synchronize** signals across phased array elements.
- Ensure **real-time data handling** and signal processing.
- Work closely with the **RF and PCB teams** to integrate the firmware with the hardware.
- Use the RP2040/RP2350 microcontroller's dedicated programmable state machine hardware (PIO) for 8-bit read/write to **MAX5863**

### **RF Circuit Designers**
You are responsible for designing the **RF circuitry** for the beamformer. Your tasks include:
- Determine the gain needed for each antenna element
- Select an antenna and create impedance matching circuitry/RF stubs to interface with max2822
- Define design criteria such as Noise Figure, SNR, Bandwidth, Insertion Loss, and VSWR that are optimal for the application
- Test RF circuitry by analyzing S-Parameters and comparing against simulation and design criteria
- Insure RF Front End isnt causing phase coherence issues
- Design Voltage regulation circuits for Power Supply of RF Amplfiers

### **PCB Designers**
Your job is to design the **beamformer motherboard** that integrates all components. You will:
- Create a PCB that connects **MAX2822, MAX5864, and the Raspberry Pi Pico**.
- Design Voltage regulation circuits for Power Supply of RF Amplfiers
- Optimize signal routing to **maximize phase coherence between differential pairs and IQ signals**
- Prepare **Gerber files** and oversee the PCB manufacturing process.
- Work closely with **RF engineers** to ensure proper grounding, RF isolation,  and Impedance Matching
- Design an analog phase shifter using op amps (the beamformer is digital, but wed like to offer analog solutions as well)
- Test PCBS

### **Networking Engineers**
Your job is to take the digital output of the beamformer and turn that into useable WIFI.
- Use wireshark for packet capture
- Research best tools for implementing OSI model
- Research GR-GSM Github library
- Looking for subteam lead to beter define requirements

## Design Decisions

- Engineers should document design choices, including **trade-offs** and **justifications**.
- The **simulation team** will provide feedback to optimize antenna element placement.
- PCB layouts must be reviewed by both **RF and embedded engineers** before fabrication.

## Steps for Documenting Your Design Process

1. Keep a **running log** of design iterations.
2. Provide **diagrams and schematics** where applicable.
3. Submit updates to the repository with **detailed commit messages**.
4. Write **clear documentation** for any custom software or hardware decisions.


## Useful Links

- **Documentation for MAX2822**: https://rocelec.widen.net/view/pdf/ybgjsvttkr/MAXMS12737-1.pdf?t.download=true&u=5oefqw
- **Documentation for MAX5864**: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX5864.pdf
- **Raspberry Pi Pico SDK and HW manual**: google it
- **FDTD Simulation Resources**: https://fdtd.readthedocs.io/en/latest/


