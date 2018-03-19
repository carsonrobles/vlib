# lib
collection of potentially useful code blocks for hardware design

## structure
* currently, most directories simply contain the one module they are named after (with the exception of the led directory), as more modules are added they will be grouped in a more organized fashion
* each module has a Makefile that can be used to simulate the module using icarus verilog and gtkwave
* each module will have a directory name 'ex' which contains example top level modules to show simple uses of the module

## in development:
* servo driver
* a sim directory for each module
* an example directory for each module

## future additions:
* SPI master module
* I2C master module
* VGA driver module
