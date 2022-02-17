## Analysis of Neuronal Spike Trains in Macaque Motor Cortex During an Instructed Delayed Reach-to-Grasp Task

Final Project of **Foundations of Neuroscience** course (EE-25647) @ Sharif University of Technology.

Instructor: Dr. Ali Ghazizadeh; Fall 2021

Authors: Amirhossein Asadian, Alireza Khosaparast, Mahdi Babaei

----

Despite wide studies concerning the motor cortex, there are still uncertainties about how neuron activities are related to different aspects of a specific task. Fortunately, using massively parallel recordings, we can investigate the effects of different events in neuron firings of
small areas with high temporal and spatial resolution. In this project, we used electrophysiological recordings data from one macaque monkey during an instructed delayed reach-to-grasp task to compare M1 and PMd neuronal spike trains during different tasks. The tasks consist of four classes that differ in force or gesture of Macaque’s grasp. Our analysis reveals that the SR-ON events affect neurons in M1 and PMd more than other events. In addition, M1 neurons’ firing rates are much more than PMd after this particular event. Moreover, low force (LF) trials have higher neuron firing rates than high force (HF) trials. Furthermore, Neuron firing rates’ peaks in side-grip (SG) trials occur earlier than precision-grip trials.


<p align="center">
  <img src="/figures/Macq.jpg" alt>
</p>
<p align="center">
  <em>Fig. 1. Chronological order of task and events during the reach-to-grasp</em>
</p>

Previous studies suggest that the activity of neurons is a function of different properties of a particular task (1). In this regard, (5) developed a deep learning method to decode kinematics precisely. They combined ESA and QRNN algorithms, claiming their result is accurate. However, they did not use various test data. (6) observed heterogeneous and complex patterns in the response of rapid arm reach. They claimed that a single-neuron recording might clarify the properties of movement. On the other hand, some other studies imply that neuron activities form a dynamical system responsible for generating and controlling muscle movements. In this state, (7) suggested methods that use neuron population responses and their correlation with Electromyography (EMG) signal. They concluded that for evaluating the single-neuron response, representational models contain parameters of different aspects of movement, and dynamical models should contain underlying dynamics of movement. Also, they could not extract much information about movement properties for population-level recordings, and responses depended only on the initial state. Using dataset acquired by (4), we obtain observations regarding the relationship between neural activities and the subject's actions. Also (9) used this dataset to clarify how each task coded or translated for movement system.

During a reach-to-grasp experiment, a macaque monkey was instructed to do motor tasks. Electrophysiological data were recorded in the motor cortex using 10-by-10 Utah electrode arrays. By analyzing the neuronal spike trains for each event, we discovered which event makes neurons spike more. Moreover, we compared neuron firing rate differences between M1 and PMd in four different tasks and declared the result. In addition, we inspected some hints about how each characteristics is interpreted by different neurons, but comprehensive disquisition was postponed to the future.

## Dataset
A massively parallel recording conducted in motor cortex of a male macaque is used in this project (4). A 10-by-10 Utah electrode array is chronically implanted on an area between the primary motor cortex (M1) and dorsal premotor cortex (PMd). Because the given tasks are evaluating left hand, the electrodes were implemented in the right hemisphere.

Raw neural signals were sampled at 30kHz. Afterward, the Local Field Potential (LFP) signal was sampled at 1kHz, and the spikes were sorted using the Offline Spike Sorter into the single-unit spike activity.
## Experiment
As shown in Figure 1 a macaque was charged to do a delayed reach-to-gasp task. He was required to focus on a display with 5-LEDs. Each combination of LEDs is led to a unique instruction. 400ms after the TS-ON signal, he received a WS-ON signal, and 400ms after, he received instruction about the gesture of grasp. There are only two defined gestures marked as SG and PG. He should remain motionless until he receives the SR-ON signal. After 300ms, the instruction goes off, giving macaque time to memorize the instruction. A second after, he will receive instruction about how much force he should use during the grasp. And then, he should start the action and stop it after the RW-ON signal.
## Data preprocessing
The dataset contains recordings from 271 neurons in 161 trials. Among them, 19 trials failed because the subject did not act as instructed during the experiment. In four failures, the 'Error' event was displayed on LEDs. We rejected those four trials and used the other 157 trials. Then we classified trials into four classes (SGLF, PGLF, SGHF, PGHF) plus a rejected class for the other 15 failures. Each group had two specifications:

* Gesture of the monkey while grabbing the switch (SG or PG).
* Amount of force, which the monkey instructed to pull the switch with (HF or LF).

Then all remaining trials were categorized into four previously mentioned classes. Moreover, raster plots for each neuron and trials of these four classes were sketched. So we can analyze data based on which class the trials belong to or when an event happened.

## PETH
We used pre-event time histogram (PETH) for analyzing neural activity during each event for neurons. The increase in activity may be seen from the raster plots
but is more apparent from the comparison of the PETHs. All of the spike trains are aligned with the onset of TS-ON. Then, by choosing the window size of 1000 samples, we count the number of spikes in each window and divide it by the window size. In addition, a Gaussian kernel is convolved to get a better result. Visual comparison of raster plots and PETHs helps us form our hypothesis

## Bootstrap
The bootstrap is a simple way to obtain standard errors and confidence intervals. Because we do not want to make any assumptions about neurons' firing rate distributions before and after an event, we use non-parametric bootstrap in this project. The bootstrap operates by resampling the data to generate pseudo-data, and then applies propagation of uncertainty. In this method, we assign probability n<sub>1</sub> to each observation in the sample x<sub>1</sub>, x<sub>2</sub>, . . . , x<sub>n</sub>. Thus, in order to draw a single observation from the distribution Fˆn, we randomly select one of the values x<sub>1</sub>, x<sub>2</sub>, . . . , x<sub>n</sub>. In order to draw a set of pseudo-data, we simply repeat this process n times. Note that in doing so, it is very likely to get repeats: we are sampling the values x<sub>1</sub>, x<sub>2</sub>, . . . , x<sub>n</sub> each time; this is called sampling with replacement (10). After making the pseudo-data distribution, we can test our hypothesis. In our case, we make the distribution of the difference between before and after an event firing rate averages. Then, by dividing the number of samples less than zero from this distribution to n, we get the p-value.

## Results
### **SR-ON has the most effect on neural activities:**
In figure 2, the raster plot for two neurons with different densities of spikes are shown. Over all of 271 neurons, it is observable that neurons have a different amount of response to particular events; however, most of them are responsive and sensitive to the "SR-ON" event. 

<p align="center">
  <img width="500" src="/figures/N1-SGLF.jpg" alt>
</p>
<p align="center">
  <img width="500" src="/figures/N135-SGLF.jpg" alt>
</p>
<p align="center">
  <em>Fig. 2. Each class is labeled on top of its plot. Different events are observable as a vertical line.</em>
</p>

We define sensitivity to events as how many spikes fired after a particular event. Also, the amount of sensitivity is various among different neurons. From the raster plot, we plotted the PETH diagram, which helped us improve our observation (Figure 3). 

<p align="center">
  <img width="500" src="/figures/p_N135_SGLFjpg.jpg" alt>
</p>
<p align="center">
  <img width="500" src="/figures/p_N1_SGLFjpg.jpg" alt>
</p>
<p align="center">
  <em>Fig. 3. PETH diagrams for Neuron-135 and Neuron-1 in SLGF class calculated by raster plots.</em>
</p>

Based on general observation,  all raster plots and PETH diagrams were observed. According to (11), the delay between receiving a signal by a visionary system and its interpretation toward motor reaction is around 150ms. So the neural responses are observed in this window after the events. From this observation we make this hypothesis that most neurons have intensive responses to SR-ON and HS-ON events. Mostly SR-ON (Figure 4).

<p align="center">
  <img width="500" src="/figures/PETH_all_2.jpg" alt>
</p>
<p align="center">
  <img width="500" src="/figures/PETH_all_types.jpg" alt>
</p>
<p align="center">
  <em>Fig. 4. Average of all PETH diagrams. The maximum peak between SR-ON and HS-ON.</em>
</p>

In order to verify this hypothesis, a statistical test was applied on motor and premotor recordings separately. The null hypothesis was that the 'SR-ON' event does not have any impact on the firing of the neurons. The statistical test includes a One-Tail Bootstrap test. According to (11), there is a delay of about 150 ms after the subject reacts to the particular event. In this regard, we considered a window size of 150 ms before and after the "SR-ON" event. Then the mean for both sides for each neuron was computed. And then, we calculate the p-value to check our hypothesis. The calculated p-value was 0.013 for the premotor cortex and 0.001 for the motor cortex. So the null hypothesis was rejected. So we can conclude that the "SR-ON" event has the most effect on the firing of the neurons.
 
Moreover, we found the Fano Factor distribution on each side of the event. The difference between the right side of the event bar and the left side of the event bar is observable in Figure 5. 


<p align="center">
  <img width="500" src="/figures/FanoMotor.jpg" alt>
</p>
<p align="center">
  <img width="500" src="/figures/FanoPremotor.jpg" alt>
</p>
<p align="center">
  <em>Fig. 5. The difference between the right and left sides of the SR-ON.</em>
</p>

We applied the bootstrap algorithm for mean, variance, skewness, and kurtosis, and the p-value of each one has been shown in Table 1:

<p align="center">
  <em>Table 1. Fano Factor distribution p-values in different conditions.</em>
</p>
<p align="center">
  <img width="250" src="/figures/table.jpg" alt>
</p>

### **Interspike Interval has a Gamma distribution in responsive neurons**

From the PETH diagram, Interspike Interval (ISI) diagram is achievable. To distinguish the adequate distribution, different distributions were fitted, and the result was (Fig. 6):

* responsive neurons, the "Gamma" distribution was the adequate distribution to fit.
* For some neurons that are not much sensitive to events, "Exponential" distribution was the adequate distribution to fit.

<p align="center">
  <img width="500" src="/figures/ISI_N135_SGLF.jpg" alt>
</p>
<p align="center">
  <img width="500" src="/figures/ISI_N1_SGLF.jpg" alt>
</p>
<p align="center">
  <em>Fig. 6. Interspike Interval diagram for two neurons. Most neurons had the "Gamma" distribution, especially the ones with a high firing rate. The others have an "Exponential" distribution.</em>
</p>

### **M1 neurons respond more strongly than PMd neurons to SR-ON**
Visual comparison of PETHs for M1 neurons and PMd neurons tells us that M1 neurons fire significantly stronger than PMd neurons after the onset of SR-ON. GO-On is the start of rising, but SR-ON has a more significant effect on neurons firing.

### **LF and HF change PETH maxima while SG and PG shift the peak**
Raster-plot, PETH diagram, and ISI were plotted for each class (SGLF, PGLF, SGHF, PGHF) for each neuron. No significant parameter was realized in individual-unit observation. So population-level observations were applied. The average of all PETH diagrams was calculated. In figure 7 Average of all PETH diagrams has been shown. We can see: 

* For the motor cortex, Low Force (LF) diagrams have lower maxima (both same height), and High Force (HF) diagrams have higher maxima (both same height).
* For the motor cortex, PG diagrams are lagging, and SG diagrams are leading. (both same difference).

<p align="center">
  <img width="500" src="/figures/motor_all_PETH.jpg" alt>
</p>
<p align="center">
  <img width="500" src="/figures/premotor_all_peth.jpg" alt>
</p>
<p align="center">
  <em>Fig. 7. Average of all PETH diagrams for M1 and PMd.</em>
</p>

These findings may lead us to a better understanding of how each motor instruction is coded or translated. For the definite conclusion, it needs further experiments. Also, for the premotor cortex in figure 7, we see:

* PG and SG diagrams (especially maximum points) differ in amplitude and delay.
* No significant parameter was observed to distinguish LF from HF.

## Discussion
In this project, we examined the effects of different events on neural activities in the macaque motor cortex. Massively parallel recordings were conducted during an instructed delayed reach-to-grasp task. We used raster plots and PETH diagrams to visualize neurons' firing rates. We examined different hypothesized using bootstrap that showed the SR-ON event has the most substantial effect on neurons' firing rates. We also found a significant difference between M1 and PMd neurons' responses to this event.Moreover, we examined the difference between the distributions of fano factors for neurons before and after SR-ON (mean, variance, skewness, and kurtosis). This difference was more significant in M1 neurons than PMd neurons. In addition, we found the interspike interval distribution using the histogram. We figured out that some neurons (responsive neurons in this experiment) have Gamma distribution while others have Exponential distribution.

By figuring out that the SR-ON event has the most effect on neuron firing rate, we can also check the response time after the SR-ON event. Firing rate maxima occur about 200 ms after the SR-ON, which is close to what (11) reported for the delay between visual stimulus and motor reaction. As the recordings were conducted in the motor cortex, we first considered events that made the monkey perform a motor action. GO-ON and SR-ON events were considered and tested. The results were better for SR-ON events.

For comparing the differences between GO-ON and SR-ON events, a new experiment should be designed with a different interval between these two events.
Additionally, More efforts are needed to find the difference in neuron' activities between four different trial types (SGHF, SGLF, PGHF, PGLF). Future studies can also investigate force and gesture encoding in M1 and PMd neurons.

## References

1. Alessandra Stella, Peter Bouss, Günther Palm, and Sonja Grün. Comparing surrogates to evaluate precisely timed higher-order spike correlations. 2021.
2. Manuel Zaepffel and Thomas Brochier. Planning of visually guided reach-to-grasp movements: Inference from reaction time and contingent negative variation (cnv). Psychophysiology, 49(1): 17–30, 2011.
3. David Dahmen, Sonja Grün, Markus Diesmann, and Moritz Helias. Second type of criticality in the brain uncovers rich multiple-neuron dynamics. Proceedings of the National Academy of Sciences, 116(26):13051–13060, 2019.
4. Alexa Riehle, Thomas Brochier, Martin Nawrot, and Sonja Grün. Behavioral context determines network state and variability dynamics in monkey motor cortex. Frontiers in Neural Circuits, 12, 2018.
5. Nur Ahmadi, Timothy G. Constandinou, and Christos-Savvas Bouganis. Robust and accurate decoding of hand kinematics from entire spiking activity using deep learning. 2020.
6. Mark M. Churchland and Krishna V. Shenoy. Temporal complexity and heterogeneity of singleneuron activity in premotor and motor cortex. Journal of Neurophysiology, 97(6):4235–4257, 2007. 
7. Mark M. Churchland, John P. Cunningham, Matthew T. Kaufman, Justin D. Foster, Paul Nuyujukian, Stephen I. Ryu, and Krishna V. Shenoy. Neural population dynamics during
reaching. Nature, 487(7405):51–56, 2012.
8. Thomas Brochier, Lyuba Zehl, Yaoyao Hao, Margaux Duret, Julia Sprenger, Michael Denker, Sonja Grün, and Alexa Riehle. Massively parallel recordings in macaque motor cortex during an instructed delayed reach-to-grasp task. Scientific Data, 5(1), 2018.
9. Michael Denker, Lyuba Zehl, Bjørg E. Kilavik, Markus Diesmann, Thomas Brochier, Alexa Riehle, and Sonja Grün. Lfp beta amplitude is linked to mesoscopic spatio-temporal phase
patterns. Scientific Reports, 8(1), 2018.
10. Robert E. Kass, Uri T. Eden, and Emery N. Brown. Analysis of Neural Data. Springer New York, 2014.
11. Simon Thorpe, Denis Fize, and Catherine Marlot. Speed of processing in the human visual system. Nature, 381(6582):520–522, 1996.
