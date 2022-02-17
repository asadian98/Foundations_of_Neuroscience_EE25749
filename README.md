# Foundations of Neuroscience Course

Final Project of **Foundations of Neuroscience** course (EE-25647) @ Sharif University of Technology.

Instructor: Dr. Ali Ghazizadeh; Fall 2021

## Analysis of Neuronal Spike Trains in Macaque Motor Cortex During an Instructed Delayed Reach-to-Grasp Task

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
