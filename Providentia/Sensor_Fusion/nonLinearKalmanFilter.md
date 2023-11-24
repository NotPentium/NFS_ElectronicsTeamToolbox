## 🚧 In Construction 🚧

# Non-linear Kalman Filter Research Repository for the Providentia Project

Welcome to our Non-linear Kalman Filter research repository for the Data Acquisition (DAQ) project for the NOVA FS team. 
This repository serves as a centralized resource to share and document all links explored during our research phase. 
Our goal is to provide transparency and understanding of the work conducted by our team.

## Report

I will start this report with an introduction to the concept of the Kalman filter, which I will later expand to the concept of nonlinear Kalman filters (EKF), possible upgrades to the EKF and, finally, the implementation of this technique for the application in question.

At its core, a Kalman Filter is an algorithm used for the estimation and prediction of systems in the presence of uncertainties, noise, and inaccuracies. Kalman filters, for their prediction/estimation, rely on a series of measurements that result in an estimate with a more accurate value than if only a single measurement were used. This mechanism allows for the creation of an output that is closer to the real value and, at the same time, more robust to errors caused by uncertainties in the system at hand.

Delving more deeply into the Kalman Filters (KF), these filters consist of two phases: one for prediction and the other for updating. During the prediction phase, the joint estimates of the system's state variables and their uncertainties are generated. In the subsequent measurement, these values are updated using a weighted average, where greater weight is assigned to estimates with higher certainty. In terms of KF implementation, they operate recursively, facilitating real-time functionality. This is achieved by utilizing sensor output values (state variables), the state calculated in the previous iteration, and its corresponding uncertainty matrix to compute new system estimates.

Kalman Filters assume that the error follows a Gaussian Distribution, meaning that the error is constituted by independent random variables with zero mean and covariance. This type of error is characteristic of linear dynamic systems, which, unfortunately, is not our case. Therefore, applying a standard Kalman Filter is not feasible for our nonlinear system. Consequently, Kalman Filters have been extended to be applicable to dynamic systems with nonlinear behavior. Examples of these extensions include the Extended Kalman Filter or its improvements such as the Unscented Kalman Filter. In the rest of the report, our focus will be on these two types of Kalman filters.

Starting with the mathematics behind the Extended Kalman Filter, it utilizes the multivariable Taylor series expansion to linearize the operating point of the system. These functions are not linear but differentiable, as demonstrated below:\
$x_k = f(x_{k-1}, u_{k-1}) + w_{k-1}$\
$z_k = h(x_k) + v_k$\
In these equations, $w_k$ and $v_k$ represent the process and observation noise, where both are assumed to be multivariate Gaussian noise with zero mean and covariance $Q_k$ and $R_k$, respectively.
Regarding the first equation, $x_k$ represents the system predictions, and $u_k$ represents the control vector. In this equation, the function $f$ is used to calculate the actual predicted state based on the previous state estimate.
As for the second equation, $z_k$ represents the measurement prediction, and the function $h$ is used to obtain the system measurement prediction based on the current state predicted in the first equation.

## Published Links and Descriptions

### 1. Extended Kalman Filter Theory: 
- [Wikipedia: ](https://en.wikipedia.org/wiki/Extended_Kalman_filter) -> Theory, Advantages/Disadvantages, Formulas, etc.
- [Mathworks: MATLAB](https://www.mathworks.com/help/driving/ug/extended-kalman-filters.html) -> Small Theory Introduction, Formulas and Implementation on MATLAB.
- [Mathworks: Simulink](https://www.mathworks.com/help/control/ref/ekf_block.html) -> Implementation on Simulink and Examples: [EKF/UKF Implementation for Multiple Sensors](https://www.mathworks.com/help/control/ug/multirate-nonlinear-state-estimation-in-simulink.html)

### 2. Extended Kalman Filter Possible Improvements:
- [Wikipedia - List of EKV Variations](https://en.wikipedia.org/wiki/Extended_Kalman_filter#Modifications)
- [Iterative EKF Implementation](https://www.mathworks.com/matlabcentral/fileexchange/42156-object-tracking-with-an-iterative-extended-kalman-filter-iekf)
- - Upon some research we concluded that the best improvements for the EFK are the Iterated EKF, Unscented KF
- [Wikipedia: Unscented KF](https://en.wikipedia.org/wiki/Kalman_filter#Unscented_Kalman_filter) -> Theory and Formulas
- [Overview of KF|EKF|UKF|ParticleF](https://github.com/jameseoconnor/localisation-and-tracking-algorithms) -> !!!

### 3. "X" Kalman Filter Implementation:
- [EKF on a Robot](https://ieeexplore.ieee.org/document/9039855)
- [EKF | UKF | ParticleF with Multiple Sensors](https://www.mathworks.com/help/control/ug/multirate-nonlinear-state-estimation-in-simulink.html#d126e61850) -> !!!
- [Learn how to implement the UKF](https://en.wikipedia.org/wiki/Kalman_filter#Unscented_Kalman_filter)

### EXTRA. 
- [MSc Thesis Project - Systems and Control](https://github.com/DaandeKanter/IEKF-OS_Algorithm/tree/main) -> Example of a system with Raw 3D gyroscope and accelerometer measurements using Iterated EKF (information difficult to interprete)
- [Hub with multiple Information about Systems with Sensor Fusion](https://www.mathworks.com/help/driving/tracking-and-sensor-fusion.html) -> Tons of information... possibly not nedeed

## Contact

For questions or suggestions, contact [RobertoERT] at [re.teixeira@campus.fct.unl.pt].

