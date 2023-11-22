# Providentia Library

Welcome to the Providentia library! 
This library serves as a centralized repository for various documents related to this project. 

The Providentia Project is designed to receive data from multiple sensors and from a DAQ board (Valkyrie), process it using a microcontroller, and store the results on a micro SD card. 

## Project Overview

Our Providentia Project encompasses the following key components:

### Sensors

- **Wheel Speed:**
- **Brake Position:**
- **Throttle Position:**
- **Accelerometer BOSH**
- - All sensors have a internal temperature sensor for drift correction.  

### Microcontroller

The "master" microcontroller receives data from the sensors using ?? communication protocols and from the and communicates with the "slave" microcontroller on the Valkyrie Board using CANbus (to avoid long distances disturbances). The "master" microcontroller then send the data to the microSD reader/writer.

### Micro SD Card Reader/Writer

To facilitate data storage, the Providentia board is equipped with a microSD card reader/writer. This component allows for efficient and convenient storage of acquired data.

## Library Structure

Explore the subfolders to access relevant documentation for different aspects of the DAQ project:

- **USB:** [File](./Eletronics/USB.md)
- **Buck Converter:** [File](./Eletronics/buckConverter.md)
- **microSD:** [File](./Eletronics/microSD.md)
- **EKF:** [File](./Sensor_Fusion/nonLinearKalmanFilter.md)

Feel free to contribute to the library by adding new documents or updating existing ones.

## Getting Started

For information on setting up and using the DAQ board, please refer to the relevant documentation in the subfolders.

## Contact

For questions or collaboration opportunities, please reach out to [RobertoERT or NotPentium] at [re.teixeira@campus.fct.unl.pt or pav.fernandes@campus.fct.unl.pt].

We hope this library proves valuable in understanding the DAQ project!
