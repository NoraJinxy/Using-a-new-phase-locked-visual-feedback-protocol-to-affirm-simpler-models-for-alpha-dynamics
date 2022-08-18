# Using-a-new-phase-locked-visual-feedback-protocol-to-affirm-simpler-models-for-alpha-dynamics

Using neural dynamic models (Neural mass model, Fixed-point attractor, Limit-cycle attractor, Chaotic strange attractor) to explain the dynamic mechanism of phase-locked visual feedback (PLVF) for closed-loop alpha rhythm modulation.

Foces on 3 questions:

​	(1) What kind of dynamic model exhibits a modulation phenomenon of PLVF?

​	(2) What is the dynamic mechanism of PLVF for alpha modulation?

​	(3) Which factors affect the modulation effects in PLVF?



## The Phase-locked Visual Feedbake (PLVF) System

![](E:\Files\EEG\MyPaper\MyGithubCode\Dynamic_Model\Figure\fig1.jpg)

Schema of PLVF system and modulation results of PLVF in real EEG data: (a) Schema of PLVF system; Raw EEG signals are firstly recorded and filtered, and then the phase of the alpha wave is detected which is used for the generation of visual stimulation sequence (i.e., the exact time to deliver visual stimuli). Finally, visual stimuli were delivered by LED to provide feedback to users. (b) The modulation effect of power shows a sinusoidal-like shape at 11Hz of the real EEG data, in which the dash line indicates the power of alpha rhythm in resting state with eyes open without modulation, the dots line indicates the power of the SSVEP at 10 Hz. The valley and peak of the modulation function are marked by blue and red circles. (c) Joint amplitude-frequency modulation effect of PLVF in real EEG data (online EEG modulation). As the phase index Φ varies, the modulation effect at the peak frequency has clear periodicity, in which the peak frequency indicates the frequency with the biggest power in the alpha band. 

## Simulation results in different models (Q1)

![](E:\Files\EEG\MyPaper\MyGithubCode\Dynamic_Model\Figure\fig2.jpg)

!(E:\Files\EEG\MyPaper\MyGithubCode\Dynamic_Model\Figure\fig3.jpg)

(a) The neural mass model, (b) the fixed-point attractor, and (c) the limit-cycle attractor. Phase portraits at the top raw are modulation trajectories with stimuli at the two different phase indexes (indicated by black triangles at x-coordinates of lower plots). The black curve indicates the resting state of the system from 38 to 40s before the stimulus. And the blue curve indicates the modulated state of the system from 40 to 48s after the stimulus. The results in the middle raw show the power changed with time with 10 different initial values and stimuli at the two different phase indexes. Considering a 10s window is used for smoothing, all the results are shown from                                 to   . Modulation results at the bottom show the joint amplitude and frequency modulation effect and are the average of the results of 10 different initial values. The black dots indicate the peak of the power modulation effect.

![](E:\Files\EEG\MyPaper\MyGithubCode\Dynamic_Model\Figure\fig3.jpg)

Modulation results of Lorenz attractor: (a) Phase portrait of Lorenz attractor with phase index  Φ=25, 40, 55, 70, 85, 100 ms. Black curves in phase portraits indicate trajectories without stimulation from 38 to 40s before the stimulus. And blue curves indicate modulated trajectories from 40 to 48s after the stimulus. Meanwhile, the black dots indicate two equilibrium points and the red circles indicate stimulation points; (b) The power response changes over time with 10 different initial values and stimuli at the phase index Φ = 70, 100 ms  ; (c) The joint amplitude and frequency modulation effect against phase index (time lag) Φ = 0-150 ms.

## Dynamic mechanism of PLVF modulation (Q2)

![](E:\Files\EEG\MyPaper\MyGithubCode\Dynamic_Model\Figure\fig4.jpg)

As Limit-cycle attractor for example, simulation results of PLVF system with external stimuli at phase index (time lag) Φ = 10 ms (a) and at phase index (time lag) Φ = 80 ms (b). Upper left in both (a) and (b): schema of output signal modulation. Black dots indicate the positive zero-crossing points. Red dots indicate the actual stimulation points. Upper right in both (a) and (b): modulation effect of the system in the phase space. Red dots indicate stimulation points. Angles of black arrows indicate angle changes of the system. Lower in both (a) and (b): output signals (simulated EEG signals).

![](E:\Files\EEG\MyPaper\MyGithubCode\Dynamic_Model\Figure\fig5.jpg)

Simulation results of the PLVF system with external stimuli as phase index (time lag) Φ increases from 0 to 200 ms. (a) Modulation effect of the system in the phase space, with phase index Φ of 10 ms, 45 ms, 80 ms, 115 ms, 150 ms, and 185 ms, respectively (left to right); (b) Power spectra of the system modulated by external stimuli delivered at different phases of Φ; (c) Power modulation function against phase index Φ. Black-dashed lines indicate the frequency (b) or the power (c) without external stimuli.

## Modulation result with different parameters (Q3)

Four different parameters:

 	1. Stimulation Intensity
 	2. Bandwidth of Bandpass Filter
 	3. Center Frequency of Bandpass Filter
 	4. Accuracy of Phase Estimation

![](E:\Files\EEG\MyPaper\MyGithubCode\Dynamic_Model\Figure\fig6.jpg)

Modulation results are affected by different factors: (a) stimulation intensity, (b) bandwidth of the bandpass filter, (c) center frequency of the bandpass filter, and (d) accuracy of phase estimation. (a) Upper: the result of modulation depth with the increase of stimulation intensity; Lower: frequency modulation results against phase index Φ with a stimulation intensity of 1000 or 3000. (b) Upper: the result of frequency modulation with the decrease of bandwidth of the bandpass filter (center frequency fixed at 11 Hz); Lower: frequency modulation result against phase index Φ with filter bandwidth of 6-16 Hz or 10-12 Hz. (c) Upper: the result of frequency modulation with the change of center frequency of the bandpass filter (bandwidth fixed at 2 Hz); Lower: frequency modulation result against phase index Φ with filter bandwidth of 7-9 Hz or 11-13 Hz. (d) Upper: attenuation index of amplitude modulation with the increase of error of phase estimation; Lower: frequency modulation result against phase index Φ with error index of 0 or 1.



## Results

​	(1) What kind of dynamic model exhibits a modulation phenomenon of PLVF?

​		The simulation results show that the fixed-point attractor and the limit-cycle attractor are more 		consistent with the characteristics of real-world alpha dynamics. Both models have good global 		consistency, in that all points at different phases with the same radius have similar dynamic 		characteristics. 

​	(2) What is the dynamic mechanism of PLVF for alpha modulation?

​		The simultaneous modulation of trajectory radius and instantaneous phase angle leads to the 		joint amplitude-frequency modulation of the alpha rhythm.

​	(3) Which factors affect the modulation effects in PLVF?

​		The modulation effect of the simulated alpha rhythm is affected by the stimulus intensity and the 		filter bandwidth.



