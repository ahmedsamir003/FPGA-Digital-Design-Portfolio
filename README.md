# NTI Digital Design using FPGA - Labs & Final Project

This repository contains all the labs and the final project submitted for the **Digital Design using FPGA** course provided by the **National Telecommunication Institute (NTI)**. It demonstrates a progressive learning journey from basic combinational logic circuits to complex, multi-module synchronous and asynchronous systems.

## 🚀 Repository Structure

The repository is organized into individual folders for each lab and project assignment. Each directory contains the source code (RTL), testbenches, and relevant design files for the respective module.

### 🔬 Basic Logic & Combinational Circuits
* **`Full_Adder`**: Implementation of a standard full adder circuit.
* **`Decoder`** & **`Encoder`**: Basic combinational logic circuits for encoding and decoding data.
* **`Gray_2_Seven_Seg`**: A converter that translates Gray code inputs to a 7-segment display output format.

### ⏱️ Sequential Logic & State Machines
* **`Debouncer`**: A digital debouncing circuit designed to eliminate mechanical switch bounce, providing clean digital signal transitions.
* **`Edge counter on a seven segment display`**: A system that detects signal edges (rising/falling) and increments a counter outputted to a 7-segment display.
* **`Sequence_Detector`**: A Finite State Machine (FSM) designed to detect specific bit sequences from a serial input stream.
* **`FSM`**: General Finite State Machine implementations demonstrating state transitions and control logic.
* **`Light_Chaser`**: An FPGA-based light chasing effect for LEDs demonstrating shift registers and timer logic.

### 📡 Data Routing & Error Checking
* **`Data_Router`**: A module designed for routing data packets from a source to specific destinations based on control signals.
* **`Grid_Memory_Router`**: Advanced memory routing mechanism for data handling.
* **`Stream_Parity_Generator`**: Computes parity bits for continuous data streams to enable error detection.

### 💻 Advanced Architectures
* **`RiscV`**: Sub-modules and structural design components for a RISC-V processor architecture, including components like the ALU, Controller, Register File, and Memory interfaces.

## 🏆 Final Project: Multi-Clock UART System with Asynchronous FIFO

The capstone project of this course is a robust **Multi-Clock UART System with Asynchronous FIFO**. This project highlights advanced digital design concepts, particularly dealing with **Clock Domain Crossing (CDC)** and safe asynchronous data transfer.

**Key Components:**
* **`UART_TX`**: UART Transmitter module with configurable baud rate and frame formatting.
* **`UART_RX`**: UART Receiver module with oversampling and error detection.
* **`Async_FIFO`**: An Asynchronous FIFO buffer ensuring reliable data transfer between independent clock domains using Gray code read/write pointers to prevent metastability.
* **`System_Top`**: The top-level wrapper integrating the TX, RX, and FIFO modules into a complete communication system.
* **`Synthesis` & `SpyGlass`**: Includes synthesis scripts and advanced linting/CDC analysis setups using Synopsys SpyGlass.

## 🛠️ Tools & Technologies Used
* **Hardware Description Language**: Verilog / SystemVerilog
* **Simulation & Verification**: ModelSim / QuestaSim
* **Synthesis & Implementation**: Synopsys Design Compiler / Intel Quartus Prime / Xilinx Vivado
* **Linting & CDC Analysis**: Synopsys SpyGlass

## 📜 How to Use
Navigate to any specific lab directory to view its source code. Most folders include a testbench file (`*_tb.v` or similar) which can be compiled and simulated using standard HDL simulators to observe the waveforms and verify functionality.

---
*Developed as part of the NTI Digital Design using FPGA Program.*
