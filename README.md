# 4-Bit ALU with Hardware-in-the-Loop (HIL) Verification

## Overview
This project involves the design and implementation of a synthesizable **4-Bit Arithmetic Logic Unit (ALU)** targeting a **Intel Cyclone IV FPGA**. Beyond basic logic design, this project focuses on solving real-world hardware constraints, specifically managing limited I/O resources and interfacing with active-low peripheral circuitry.

## Key Features
* **Supported Operations:** Implemented 6 core functions: `ADD`, `SUB`, `AND`, `OR`, `XOR`, and `NOT`.
* **Synchronous Heartbeat:** Integrated a 25-bit synchronous counter to drive a "beat" LED, providing a visual confirmation of the 50MHz onboard clock stability.
* **Active-Low Interfacing:** Designed a logical-to-physical inversion layer in RTL to ensure compatibility with the development board's active-low LED architecture.
* **Resource Management:** Successfully mapped 6+ internal signals to only 4 available physical LEDs using a prioritized signal mapping strategy.

## Hardware Mapping & Pin Configuration
To verify the design with limited resources, the following pin assignments were implemented:

| Signal | FPGA Pin | Component | Logic Type |
| :--- | :--- | :--- | :--- |
| `clk` | Pin 23 | 50MHz Oscillator | - |
| `opcode[0]` | Pin 88 | Push Button 1 | Active-Low |
| `opcode[1]` | Pin 89 | Push Button 2 | Active-Low |
| `led_out[0]` | Pin 1 | LED 1 (Bit 0) | Active-Low |
| `led_out[1]` | Pin 2 | LED 2 (Bit 1) | Active-Low |
| `led_out[2]` | Pin 3 | LED 3 (Bit 2) | Active-Low |
| `beat` | Pin 11 | SMD LED | Active-Low (Heartbeat) |

## Verification Strategy
The design was verified through a three-tier verification process to ensure industry-standard reliability:

1. **Functional Verification (ModelSim):**
    * Developed a self-checking testbench to automate result validation.
    * Verified arithmetic accuracy for edge cases (e.g., `5 + 3 = 8`, `5 & 3 = 1`).
2. **Structural Verification (Quartus RTL Viewer):**
    * Analyzed the synthesized gate-level netlist to confirm correct inference of multiplexers and adders from the RTL code.
3. **Physical Verification (Hardware-in-the-Loop):**
    * Deployed the bitstream to the Cyclone IV FPGA.
    * Validated real-time operation by toggling hardware switches and observing physical LED responses.

## Project Structure
* `/rtl`: Core Verilog source code for the ALU logic.
* `/tb`: Self-checking testbench for ModelSim simulation.
* `/docs`: Includes the RTL Schematic, Pin Assignment CSV, and Simulation Logs.

## How to Run
1. Open the project in **Intel Quartus Prime**.
2. Compile the design to generate the `.sof` file.
3. Use the **Programmer** tool to load the design onto the Cyclone IV board via JTAG.
4. Alternatively, run the testbench in **ModelSim** using `vlog` and `vsim` to view functional waveforms.
