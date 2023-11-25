# Negative-Resistance Oscillator Principles

An oscillation loop consists of two branches:

- The active branch, composed of the oscillator, initiates and builds up the oscillation until it reaches a stable phase. It compensates for losses in the passive branch.
- The passive branch is mainly composed of the resonator, two load capacitors, and parasitic capacitances.

When the oscillator part is correctly biased, maintaining a stable oscillation requires its transconductance to equal the passive branch conductance.

During startup, the oscillator transconductance must be higher than a multiple of the conductance of the passive part to maximize the possibility of building up oscillation. Excessive oscillator transconductance can saturate the loop, causing startup failure.

To ensure successful startup:
- The ratio between negative resistance and the crystal maximal equivalent series resistance must be > 5 for HSE oscillators and > 3 for LSE oscillators.

# Introduction to Pierce Oscillators

A Pierce oscillator is an electronic circuit used for generating stable and accurate sinusoidal signals, commonly in crystal oscillator applications. Named after physicist George W. Pierce, it relies on a crystal resonator and a feedback network with load capacitance to achieve precise frequency generation. 
## Load Capacitance

Load capacitance (C_L) is the terminal capacitance of the crystal oscillator circuit, determined by external capacitors CL1 and CL2 and stray capacitance (Cs). Frequency accuracy requires the oscillator circuit to exhibit the same load capacitance as adjusted for the crystal. Frequency stability mandates constant load capacitance. External capacitors CL1 and CL2 tune the desired value of C_L.

## Oscillator Transconductance

For oscillation to start and reach a stable phase, the oscillator must provide sufficient gain to compensate for loop losses and support oscillation buildup. The ratio between oscillator gain and oscillation loop critical gain must not exceed 1 due to passive component tolerances, as it would result in a prolonged startup time or prevent startup.

- If the oscillation loop maximal critical crystal transconductance parameter (Gm_crit_max) is specified, ensure it is greater than the oscillation loop critical gain (gmcrit).
- If the oscillator transconductance parameter (gm) is specified, ensure the gain margin ratio (gainmargin) is > 5.

The gain margin ratio is determined by the formula: gainmargin = gm / gmcrit, where gm is the oscillator transconductance specified in the STM32 datasheet, and gmcrit is the minimal transconductance required for stable oscillation, computed from oscillation loop passive components parameters, assuming CL1=CL2.

# Drive Level

The drive level is the power dissipated in the crystal, and it must be limited to prevent quartz crystal failure due to excessive mechanical vibrations. The maximum drive level is specified by the crystal manufacturer and is given by [insert equation], with IQ being the current flowing through the crystal in RMS.

# External Resistor

The external resistor (RExt) limits the crystal's drive level, forming a low-pass filter with CL2 to start the oscillator at the fundamental frequency. RExt becomes mandatory if the power dissipated in the crystal exceeds the specified value by the crystal manufacturer. If the power dissipated in the selected quartz is lower than the specified drive level, the insertion of RExt is not recommended.

An initial estimation of RExt is obtained by considering the voltage divider formed by RExt and CL2, equal to the reactance of CL2 [insert equation]. After calculating RExt, it is recommended to recalculate the gain margin [insert equation].

# Startup Time

The startup time is the duration required for the oscillation to start and build up until reaching a stable phase. If the oscillator is paired with a quartz-crystal resonator characterized by a high Q-factor, startup time is higher when ceramic resonators are used. The crystal's nominal frequency inversely affects startup time.

Startup problems usually arise due to improperly dimensioned
