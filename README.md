# Digital-Design-Counter-FSM
This repository contains digital design projects focused on the implementation of Counters and Finite State Machines (FSM). These designs are written in Verilog, a hardware description language, and are simulated and verified using open-source tools.


## Overview

This project contains Verilog code for simulating and synthesizing different types of digital counters, FSM . The simulation process involves using open-source tools like **Iverilog**, **Yosys**, and **GTKWave**.

## Prerequisites

Before you start, ensure you have the following tools installed on your system:

1. **Iverilog**: A Verilog simulation and synthesis tool.
2. **Yosys**: An open-source framework for Verilog RTL synthesis.
3. **GTKWave**: A waveform viewer for displaying simulation results.
4. **Sky130 PDK**: A process design kit required for synthesis with Yosys.

### Installing Iverilog

To install Iverilog, you can use the following command on Ubuntu:

```bash
sudo apt-get install iverilog
```

For other platforms, please refer to the [Iverilog installation guide](http://iverilog.icarus.com/).

### Installing Yosys

To install Yosys, use the following command on Ubuntu:

```bash
sudo apt-get install yosys
```

For other platforms, please refer to the [Yosys installation guide](http://www.clifford.at/yosys/).

### Installing GTKWave

To install GTKWave, use the following command on Ubuntu:

```bash
sudo apt-get install gtkwave
```

For other platforms, please refer to the [GTKWave installation guide](http://gtkwave.sourceforge.net/).

### Sky130 PDK

You need to have the Sky130 PDK (Process Design Kit) available to use the sky130_fd_sc_hd library for synthesis. Ensure that the library files are accessible at the specified path.

## Usage

### 1. Compiling the Verilog Code with Iverilog

Iverilog is used to compile Verilog code into a format that can be simulated. To compile the Verilog files in this project, use the following command:

```bash
iverilog fileName.v tb_fileName.v
```

This command compiles the module file `fileName.v` and the testbench file `tb_fileName`, generating an executable file named `a.out`.

### 2. Running the Simulation

To run the simulation and generate a waveform file (`.vcd` file), use the following command:

```bash
./a.out
```

This will produce a file called `tb_fileName.vcd`, which contains the simulation waveform data.

### 3. Viewing the Simulation with GTKWave

GTKWave is used to visualize the waveform generated during simulation. To open the waveform file in GTKWave, use the following command:

```bash
gtkwave tb_fileName.vcd
```

This will open the GTKWave interface, where you can view the signals over time and analyze the behavior of the counters.

### 4. Synthesizing the Verilog Code with Yosys

Yosys is used for the synthesis of Verilog RTL designs. Follow these steps to synthesize the Module:

1. **Invoke Yosys**: Start Yosys by running:

    ```bash
    yosys
    ```

2. **Read the Liberty File**: Load the technology library required for synthesis:

    ```bash
    read_liberty -lib ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    ```

    This command reads the `sky130_fd_sc_hd` library, which contains the standard cell definitions necessary for mapping the design during synthesis.

3. **Read the Verilog File**: Load the Verilog file that defines the counter:

    ```bash
    read_verilog fileName.v
    ```

    This command reads the `fileName.v` file into Yosys, making it ready for synthesis.

4. **Synthesize the Design**: Perform logic synthesis on the top module of the Verilog design:

    ```bash
    synth -top fileName
    ```

    The `synth -top fileName` command performs logic synthesis targeting the top-level module named `fileName`.

5. **Technology Mapping with ABC**: Map the synthesized design to the standard cells defined in the liberty file:

    ```bash
    abc -liberty ../my_lib/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
    ```

    This command uses ABC, a technology mapper, to map the synthesized logic to the standard cells provided in the `sky130_fd_sc_hd` library.

6. **View the Synthesized Design**: Optionally, you can visualize the synthesized design using:

    ```bash
    show
    ```

    This command opens a graphical viewer showing the synthesized netlist, which provides insights into the synthesized logic structure.



## Conclusion

This project demonstrates how to simulate and synthesize digital counters using Iverilog, Yosys, and GTKWave. By following the steps outlined in this README, you should be able to successfully simulate, synthesize, and analyze  Verilog designs.

