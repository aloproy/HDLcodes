
# UART Transmission on Zynq-7000 FPGA

This repository contains Verilog code for implementing UART (Universal Asynchronous Receiver/Transmitter) transmission using the Zynq-7000 evaluation and development board. The design generates UART transmission at a baud rate of 9600, driven by a 100 MHz clock.

Design Details
The design follows a state machine approach with three main states:

Ready (rdy): Waits for the send signal and initializes the UART transmission frame.
Load Bit: Loads the next bit from the transmission data (txData).

## Features
### Baud Rate Generation: 
Produces a baud rate of 9600 using clock division.
### Transmission States:
#### Ready (rdy): 
Prepares for transmission when send signal is asserted. 
#### Load Bit:
Loads the next bit to be transmitted.
#### Send Bit:
Transmits bits serially based on the baud rate clock.
### Stop and Start Bits:
 Implements standard UART framing with start and stop bits.
##  Input/output
### Inputs
send: Signal to initiate the transmission.
clk: 100 MHz clock input.
### Output
uart_tx: UART transmission signal.
## Design Details
The design follows a state machine approach with three main states:

### Ready (rdy):
 Waits for the send signal and initializes the UART transmission frame.
### Load Bit:
 Loads the next bit from the transmission data (txData).
### Send Bit:
Transmits the bits serially at the specified baud rate.
## Baud Rate Calculation

The baud rate divider is calculated as follows:

```bash
 Clock Frequency / Baud Rate = 100 MHz / 9600 ≈ 10416 
```


## Transmission Frame
The transmitted data includes a start bit (0), 8 data bits, and a stop bit (1).
## How to Use
#### 1. Clone the repository:
``` bash
git clone <repository-url>  
cd <repository-folder>  
```
#### 2. Load the Verilog code onto your FPGA development environment (e.g., Vivado).
#### 3. Configure the Zynq-7000 board with a 100 MHz clock source.
#### 4. Connect the UART Tx line (uart_tx) to a UART receiver for testing.
## Simulation and Testing
The design can be simulated using tools like Vivado or ModelSim to verify functionality. Connect the uart_tx line to a UART receiver or terminal to observe the transmitted data.
## Contributions
Contributions are welcome! Feel free to fork the repository and submit pull requests for improvements or additional features.

