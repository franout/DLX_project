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

- Test Bench General architecture
  * Unit Under Test
  
  * DLX top level entity 
  
  
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

## Synthesis 

## Layout


## Tests 
For functionally verify the microprocessor refers to the testbench in System Verilog. 
They are divided for each stage and control unit for regression test
```shell
  $ ./scripts/regression_test.sh
  ```
While there will be a final testbench for the DLX top level entity
## Useful Link 

Reach out to me at one of the following places!

-  <a href="https://www.chipverify.com/systemverilog/systemverilog-tutorial" target="_blank">`System Verilog Tutorial`</a>
-  <a href="http://www.asic-world.com/systemverilog/index.html">`System Verilog Tutorial 2 `</a>
-  <a href="https://www.cc.gatech.edu/~hadi/teaching/cs3220/doc/modelsim/ModelSim_Users_Manual_v10.1c.pdf" target="_blank">`Model Sim User Manual `</a>
-  <a href="https://www.doc.ic.ac.uk/~eedwards/compsys/arithmetic/index.html" target="_blank">`Overflow of binary numbers`</a>

## License
GNU General Public License v3.0



