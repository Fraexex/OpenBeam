
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
