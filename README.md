<p align="center">
  <a href="https://www.tutorialspoint.com"><img src="https://www.tutorialspoint.com/basics_of_computers/images/microprocessor.jpg" title="Microprocessor" ></a>
</p>

# DeLuXe RISC processor project 

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Build Status](http://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=flat-square)](https://travis-ci.org/badges/badgerbadgerbadger) 

RISC processor architecture designed by John L. Hennessy and David A. Patterson.

Microelectronic System course (MsC in Embedded Systems Engineering)  @ Polythecnic of Turin, Italy


## Table of Contents 


- [Setup](#setup)
- [Architecture](#architecture)
- [Software](#software)
- [Simulation](#simulation)
- [Synthesis](#synthesis)
- [Layout](#layout)
- [Tests](#tests)
- [Documentation](#documentation)
- [License](#license)


### Clone
 Clone this repo to your local machine using and feel free to contribute!
  ```shell
  $ git clone https://github.com/franout/DLX_project.git
  ```
  

### Setup
You need to have installed a HDL simulator tool (for the simulation) and a synthesis tool (in case you want to synthesize the design).
In this project Questa Sim 10.7 and Design Compiler have been used.
  
  
## Architecture

The DLX is essentially a cleaned up (and modernized) simplified MIPS CPU. The DLX has a simple Big Endian 32-bit load/store pipelined architecture, somewhat unlike the modern MIPS CPU.


- DLX top level entity 
   ![architecture](./report/chapters/figures/dlx_top.png)
 
  
- Customizable hardware parameters (pre-synthesis)
    * IR size, bitwidth of Instruction Register 
    * PC size, bitwidth of Program Counter

## Software

For creating creating the hex dump file to be used in the simulation (loaded in the Instruction Data Ram):
```shell
  $ ./software/assembler.sh {ASM_FILE_PATH}
  ```
The produced hexadecimal file should be copied in the memories folder.

Moreover, in the memories folder it is present also a python script for generating random data suitable for the DRAM.
```shell
  $ ./hardware/dlx/test_bench/memories/generate_random_values_dram.py
  ```
## Simulation  
For exectuting the simulation of the DLX, it is necessary to execute:
```shell
  $ ./scripts/simulation.sh
  ```
  It will compile the needed files for executing the simulation. Moreover, there are two types of simulations, one with the Universal Verification Methodology architecture and the other one with the normal configuration (IRAM-DLX-DRAM).
  
  ![Simulation](https://www.chipverify.com/images/uvm/uvm-tb.gif)
  
  
## Synthesis 
For executing the synthesis of the DLX:
```shell
  $ ./scripts/synthesis.sh
  ```
  It will execute different synthesis with different clocks (starting from unconstrained design) and area footprint. Moreover, it will be synthesized taking into account a possible Scan chain (DfT) for a further production phase.
## Layout
For executing the physical design of the synthesized DLX:
```shell
  $ ./scripts/physical_design.sh gui/no_gui
  ```
It will execute the physical desing of differt design point ( for different clock values and area).
   
<p align="center">
  <img width="500" height="500" src="./project/physical_design/images_nopt/DLX_IR_SIZE32_PC_SIZE32_nopt_place_prerouting.gif">
</p>

## Tests 
For functionally verify the microprocessor refers to the testbench in System Verilog. 
They are divided for each stage and control unit for regression test
```shell
  $ ./scripts/regression_test.sh
  ```
  
## Documentation
For a more detailed information see <a href="https://github.com/franout/DLX_project/wiki" target="_blank">`Wiki's project`</a>.


## Useful Link 

Reach out to me at one of the following places!

-  <a href="https://www.chipverify.com/systemverilog/systemverilog-tutorial" target="_blank">`System Verilog Tutorial`</a>
-  <a href="http://www.asic-world.com/systemverilog/index.html">`System Verilog Tutorial 2 `</a>
-  <a href="https://www.cc.gatech.edu/~hadi/teaching/cs3220/doc/modelsim/ModelSim_Users_Manual_v10.1c.pdf" target="_blank">`Model Sim User Manual `</a>
-  <a href="https://www.doc.ic.ac.uk/~eedwards/compsys/arithmetic/index.html" target="_blank">`Overflow of binary numbers`</a>
-  <a href="https://www.chipverify.com/uvm/uvm-tutorial" target="_blank">`Universal Verification Methodology tutorial`</a>

## License
GNU General Public License v3.0



