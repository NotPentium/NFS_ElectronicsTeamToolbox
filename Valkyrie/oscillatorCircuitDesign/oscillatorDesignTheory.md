# Negative Resistance Oscillator 

A Negative Resistance Oscillator is an electronic circuit that generates oscillations using a component with negative resistance. This negative resistance compensates for circuit losses, allowing sustained oscillations. 

## Negative-resistance oscillator principles

An oscillation loop consists of two branches:

- The active branch, composed of the oscillator, initiates and builds up the oscillation until it reaches a stable phase. It compensates for losses in the passive branch.
- The passive branch is mainly composed of the resonator, two load capacitors, and all parasitic capacitances.

When the active branch (oscillator part) is correctly biased, maintaining a stable oscillation around the oscillator biasing voltage requires its transconductance to equal the passive branch conductance. During startup, the oscillator transconductance must be higher than a multiple of the conductance of the passive part to maximize the possibility of building up the oscillation from the inherent noise of the loop. An excessive oscillator transconductance compared to the oscillation loop passive branch conductance can saturate the oscillation loop, causing a startup failure.

To ensure a successful oscillator start, the ratio between the negative resistance of the loop and the crystal maximal equivalent series resistance must be greater than 5 for the HSE oscillators and greater than 3 for the LSE oscillators.

## Pierce Oscillator Circuit Design 
A Pierce oscillator is an electronic circuit used for generating stable and accurate sinusoidal signals, commonly in crystal oscillator applications. It relies on a crystal resonator and a feedback network with load capacitance to achieve precise frequency generation. 

## Load Capacitor

The load capacitance ($CL$) is the terminal capacitance of the circuit connected to the crystal oscillator. It is determined by the external capacitors $C_{L1}$ and $C_{L2}$, and the stray capacitance of the printed circuit board and connections ($C_S$). 

The $C_L$ value is specified by the crystal manufacturer. For accurate frequency, the oscillator circuit must exhibit the same load capacitance as adjusted for the crystal. The external capacitors $C_{L1}$ and $C_{L2}$ are used to tune the desired value of $C_L$, and the following equation gives the expression of $C_L$:

  $$C_L = \frac{C_{L1} + C_{L2}}{C_{L1} + C_{L2}} + C_S$$

## Oscillator Transconductance

To initiate and stabilize the oscillation, the oscillator must provide sufficient gain to compensate for loop losses and support oscillation buildup. When the oscillation becomes stable, the power provided to the oscillator and the power dissipated in the loop are equal.

Due to tolerances on passive component values and their dependency upon environmental parameters, the ratio between oscillator gain and oscillation loop critical gain cannot exceed 1. This would induce a too long oscillator startup time and even prevent the oscillator from starting up.

- If the oscillation loop maximal critical crystal transconductance parameter ($Gm_{crit_{MAX}}$) is specified, ensure that it is greater than the oscillation loop critical gain ($gm_{crit}$).
- If the oscillator transconductance parameter ($gm$) is specified, make sure that the gain margin ratio ($gain_{margin}$) is greater than 5.

The gain margin ratio is determined by the formula: $gain_{margin} = \frac{gm}{gm_{crit}}$, where gm is the oscillator transconductance specified in the microcontroller datasheet. gmcrit is defined as the minimal transconductance required to maintain a stable oscillation, computed from oscillation loop passive components parameters, assuming $C_{L1}=C_{L2}$.

$$g_{mcrit} = 4 \cdot ESR \cdot (2 \pi f_{osc})^2 \cdot (C_0 + C_L)^2$$

## Drive Level

The drive level is the power dissipated in the crystal and must be limited to prevent quartz crystal failure due to excessive mechanical vibrations. The maximum drive level is specified by the crystal manufacturer, and the drive level is given by $DL = ESR \cdot I_Q^2$, where $I_Q$ is the current flowing through the crystal in RMS.

## External Resistor

The role of the external resistor ($R_{Ext}$) is to limit the drive level of the crystal. With $C_{L2}$, it forms a low-pass filter that forces the oscillator to start at the fundamental frequency and not at overtones. If the power dissipated in the crystal is higher than the value specified by the crystal manufacturer, the external resistor RExt becomes mandatory. If the power dissipated in the selected quartz is lower than the drive level specified by the crystal manufacturer, the insertion of RExt is not recommended. 

An initial estimation of $R_{Ext}$ is obtained by considering the voltage divider formed by $R_{Ext}$ and $C_{L2}$. Thus, the value of $R_{Ext}$ is equal to the reactance of $C_{L2}$, $$R_{ext} = \frac{1}{2 \pi f_{osc} C_{L2}}$$ 

After calculating $R_{Ext}$, it is recommended to recalculate the gain margin, $$g_{mcrit} = 4 \cdot (ESR + R_{ext}) \cdot (2 \pi f_{osc})^2 \cdot (C_0 + C_L)^2$$

## Startup Time

The startup time is the duration required for the oscillation to start and build up until it reaches a stable oscillation phase. If the oscillator is paired with a quartz-crystal resonator characterized by a high Q-factor, the startup time is higher when ceramic resonators are used. The higher the crystal nominal frequency, the lower the startup time.

Startup problems usually arise because the gain margin is not properly dimensioned, either by CL1 and CL2 being too small or too large, or by the $ESR$ being too high.



