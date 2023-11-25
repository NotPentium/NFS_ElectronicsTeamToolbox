

# Introduction to Pierce Oscillators

>Load Capacitance
The load capacitance is the terminal capacitance of the circuit connected to the crystal oscillator. This value is determined by the external capacitors CL1 and CL2, and the stray capacitance of the printed circuit board and connections (Cs). For the frequency to be accurate, the oscillator circuit must show the same load capacitance to the crystal as the one the crystal was adjusted for. Frequency stability requires that the load capacitance be constant. The external capacitors CL1 and CL2 are used to tune the desired value of CL. The following equation give the expression of CL [insert equation here].

>Oscillator Transconductance

To make the oscillation start and reach a stable phase, the oscillator must 
provide sufficient gain to compensate for the loop losses and to provide the energy for the oscillation buildup. When the oscillation becomes stable, the power provided to the oscillator and the one it dissipates in the loop are equal. Due to the tolerances on passive components, the ratio between oscillator gain and oscillation loop critical gain cannot just exceed 1. This would induce a too long oscillator startup time, and even prevent the oscillator from starting up.

	>If the oscillation loop maximal critical crystal transconductance parameter (Gm_crit_max) is specified, ensure that it is greater than the oscillation loop critical gain (gmcrit).
	>If the oscillator transconductance parameter (gm) is specified, make sure that the gain margin ratio (gainmargin) is bigger than 5.

The gain margin ratio is determined by the formula gainmargin = gm / gmcrit, where :
	>gm is the oscillator transconductance specified in the STM32 datasheet.
	>gmcrit is defined as the minimal transconductance required to maintain a stable oscillation.gmcrit is computed from oscillation loop passive components parameters. 
Assuming CL1=CL2, [insert equation].

#Drive Level

The drive level is the power dissipated in the crystal. It must be limited, otherwise the quartz crystal can fail, because of excessive mechanical vibrations. The maximum drive level is specified by the crystal manufacturer. The drive level is given by [ins EQ] , IQ is the current flowing through the crystal in RMS

#External Resistor

The role of this resistor is to limit the drive level of the crystal. With CL2, it forms a low-pass filter that forces the oscillator to start at the fundamental frequency and not at overtones. If the power dissipated in the crystal is higher than the value specified by the crystal manufacturer, the external resistor RExt becomes mandatory. If the power dissipated in the selected quartz is lower than the drive level specified by the crystal manufacturer, the insertion of RExt is not recommended. 

An initial estimation of RExt is obtained by considering the voltage divider formed by RExt and CL2. Thus, the value of RExt is equal to the reactance of CL2, [ins EQ].

After calculating RExt, it is recommended to recalculate the gain margin, [ins EQ].


#Startup Time

This is the time required by the oscillation to start and then build up, until it reaches a stable oscillation phase. If the oscillator is paired with a quartz-crystal resonator characterized by its high Q-factor, the startup time is higher when ceramic resonators are used. The higher the crystal nominal frequency, the lower the startup time. 

Startup problems usually arise because the gain margin is not properly dimensioned, either by CL1 and CL2 being too small or too large, or by the ESR being too high.





