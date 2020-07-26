<p align="center">
  <a href="https://www.tutorialspoint.com"><img src="https://www.tutorialspoint.com/basics_of_computers/images/microprocessor.jpg" title="Microprocessor" ></a>
</p>

# DeLuXe RISC processor project 

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Build Status](http://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=flat-square)](https://travis-ci.org/badges/badgerbadgerbadger) 

RISC processor architecture designed by John L. Hennessy and David A. Patterson.

Microelectronic System course (MsC in Embedded Systems Engineering)  @ Polythecnic of Turin, Italy


## Table of Contents 


- [Installation](#installation)
- [Setup](#setup)
- [Features](#features)
- [Architecture](#architecture)
- [Software](#software)
- [Tests](#tests)
- [Documentation](#documentation)
- [License](#license)


### Clone
 Clone this repo to your local machine using and feel free to contribute!
  ```shell
  $ git clone https://github.com/franout/Cogitantium.git
  ```
  
## Installation
For using the accelerator you only need to install tensorflow wheel and python according to   <a href="https://github.com/franout/tensorflow_for_pynqz2" target="_blank">`Tensorflow for Pynq-Z2 `</a>


The following command are used for loading and using the accelerator into the Tensorflow Lite environment:
```python
DTPU_lib=tflite.load_delegate("./DTPU_delegate.so",options=[])
interpreter = tflite.Interpreter(model_path=tflite_model_file,experimental_delegates=[DTPU_lib])
```
The shared library is created with the following command :
  ```shell
  $ python3.5 ./dtpu/software/create_library.py
  ```
Note: in the same folder there must be present the DTPU_delegate.cpp and DTPU_delegate.py used for building the library.

### Setup
 For editing, simulating and synthesizing the verilog code you can use whatever IDE and tools you prefer.
  In this project Xilinx Vivado Tools have been used
  
  

## Features
The hardware accelerator is capable of tensor convolution, generally speaking matrix multiplication and accumulation.
## Architecture

The DLX is essentially a cleaned up (and modernized) simplified MIPS CPU. The DLX has a simple 32-bit load/store architecture, somewhat unlike the modern MIPS CPU.

- General architecture
  * Logical view
  
  ![image](documentation/chalmers_template/figure/logical_view.png)
  
  * Real Implementation 
  
  ![image](documentation/chalmers_template/figure/accelerator_schematic.png)
  
  * Datapath of dtpu core
  
  ![image](documentation/chalmers_template/figure/datapath_dtpu_core.png)

- Customizable hardware parameters (pre-synthesis)
    * ROWS, rows in the matrix multiplication unit (MXU)
    * COLUMNS, columns in the matrix multiplication unit (MXU)
    * SIZE WMEMORY, size of weight memory
    * ADDRESS SIZE WMEMORY
    * ADDRESS SIZE CSR
    * SIZE CSR, size of control and status register memor
    * DATA WIDTH CSR
    * DATA WIDTH WMEMORY
    * DATA WIDTH FIFO IN
    * DATA DIDTH FIFO OUT
    * MAX BOARD DSP, max dsp entities on the board

## Software
For creating models:
```shell
  $ python3.5 ./dtpu/software/create_models.py
  ```

Other models can be found at  <a href="https://www.tensorflow.org/lite/guide/hosted_models" target="_blank">`Hosted Models `</a>
  
For executing a models is necessary to run:
  ```shell
  $ sudo python3.5 ./dtpu/software/run_model.py
  ```
The already quantized model must be present in the same folder of the previous script. Moreover, sudo is necessary for being able to program the FPGA witht the pynq python package.

The shared library for using the accelerator has been created according to <a href="https://www.tensorflow.org/lite/performance/delegates" target="_blank">`Tensorflow Delegate `</a> . The API can be checked into the /dtpu/software/create_library.py (a more detailed explanation will be done).
## Documentation 
- IN PROGRESS

## Tests 
For testing the solo accelerator you can use:
  ```shell
  $ sudo python3.5 ./dtpu/run_dtpu.py
  ```

## Useful Link 

Reach out to me at one of the following places!

-  <a href="https://pynq.readthedocs.io/en/v2.5/getting_started/pynq_z2_setup.html" target="_blank">`Pynq Tutorial `</a>
-  <a href="https://www.tensorflow.org/">`Tensorflow `</a>
-  <a href="https://xilinx-wiki.atlassian.net/wiki/spaces/A/overview" target="_blank">`Zynq wiki `</a>
-  <a href="https://cffi.readthedocs.io/en/latest/" target="_blank">`C  function foreign interface `</a>



## License
GNU General Public License v3.0



