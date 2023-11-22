# Valkyrie Library

The Valkyrie board is a meticulously crafted sensor module tailored to capture and analyze the dynamic experiences of our FS car. This versatile board excels in recording data from a variety of sensors, seamlessly transmitting it via CAN communication to the data acquisition board. The Valkyrie diligently captures information from surface-mounted accelerometers, gyroscopes, GPS receivers, and magnetometers.

By harnessing the collective power of these sensors and employing robust sensor fusion techniques, the Valkyrie enables precise measurements of the car's position, velocity, acceleration, and heading across all three axes. This sophisticated integration of sensors and fusion technologies enhances our ability to gain accurate insights into the vehicle's dynamic behavior.

## Project Overview

Our Valkyrie board project encompasses the following key components:

### Sensors

- **Accelerometer:** Measures acceleration forces, providing crucial data for motion and orientation analysis.
- **Gyroscope:** Captures angular velocity, aiding in tracking rotation and orientation changes.
- **Magmetometer:** 
- **GPS receiver:**
- - All sensors have a internal temperature sensor for drift correction.  

### Microcontroller

The "slave" microcontroller receives data from the sensors using the I2C communication protocol and communicates with the "master" microcontroller on the Providentia Board using CANbus (to avoid long distances disturbances). The "slave" microcontroller plays a central role in the functionality of the DAQ board.

## Library Structure

Explore the subfolders to access relevant documentation for different aspects of the DAQ project:

- **Accelerometer:** [File](./USB.md)
- **Gyroscope** [File](./EKF.md)
- **Magnetometer:** [File](./USB.md)
- **GPS receiver** [File](./EKF.md)

Feel free to contribute to the library by adding new documents or updating existing ones.

## Getting Started

For information on setting up and using the DAQ board, please refer to the relevant documentation in the subfolders.

## Contact

For questions or collaboration opportunities, please reach out to [RobertoERT or NotPentium] at [re.teixeira@campus.fct.unl.pt or pav.fernandes@campus.fct.unl.pt].

We hope this library proves valuable in understanding the Providentia Project!
