# 4-Bit-ALU-with-Hardware-in-the-Loop-Verification
- Designed and implemented a synthesizable 4-bit Arithmetic Logic Unit (ALU) on a Cyclone IV FPGA.
- This project demonstrates the bridge between high-level RTL design and physical hardware constraints.
# Key Features
- Supported Operations: ADD, SUB, AND, OR, XOR, and NOT.
- Synchronous Heartbeat: Integrated a 25-bit counter to drive a "beat" LED, verifying the 50MHz onboard clock.
- Active-Low Interfacing: Implemented a logical-to-physical inversion layer to support the board's active-low LED architecture.
- Hardware Mapping & Resource Management: Due to limited I/O (4 LEDs), I implemented a specific signal mapping strategy: Pins 1, 2, 3: Lower 3 bits of the ALU result ($y[2:0]$).
- Pin 11: System Heartbeat (Clock verification).Buttons 88, 89: 2-bit Opcode selection.
- Verification ResultsFunctional (ModelSim): Automated testbench verified arithmetic and logic accuracy (e.g., $5+3=8, 5\&3=1$).Physical (Silicon): Validated on-chip behavior using local LEDs, accounting for hardware polarity.Structural: Verified gate-level synthesis using the Quartus RTL Viewer.
