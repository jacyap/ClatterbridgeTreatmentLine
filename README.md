# ClatterbridgeTreatmentLine
### TOPAS model of the 60 MeV Ocular Proton Therapy Beamline at the Clatterbridge Cancer Centre (CCC), Wirral, United Kingdom 

Developed by Jacinta Yap in 2019 as part of my PhD with the University of Liverpool & Cockcroft Institute, UK (jacinta.yap@liverpool.ac.uk).
Updated March 2021 for compatibility with TOPAS v3.6.1.

This repository contains the following:

- **Parameter files**
  - Beam source, materials, scoring, run, visualiser etc.
- **Geometry files**
  - Geometry parameter file, component files (contains STL files of each component, grouped by material, imported from geometries built in CAD).
- **Analysis scripts**
  - Written in Matlab to plot comparisons of dose, LET curves and tranverse beam profiles. Located in *Data* folder.

The simulation itself can be run immediately (with 100,000 histories) using the default settings defined in the parameter files. An input PhaseSpace file (PhaseSpaceSource_100k.phsp) has also been provided to generate a beam at the origin. When *MyViewer* and *Qt* is initiated, the following should be generated:

![Beamline in TOPAS](https://github.com/jacyap/ClatterbridgeTreatmentLine/blob/master/Beamline_def.png)\
*The beam source (purple box at far left), an abitrary phase space scorer (red box) and a water phantom (blue box) are also included and shown.*

## To run:

1. Clone this repository: *git clone https://github.com/jacyap/ClatterbridgeTreatmentLine.git*
2. Set up environment: *source startup.sh* (this may differ according to your OS) 
3. Run from the ClatterbridgeTreatmentLine directory (this depends on where your topas directory is): 
\
i.e. *../bin/topas Run.txt*

*Scorers (Dose, LETt & LETd profiles) are turned on by default, PhysicsLists have been pre-selected, warning messages relate to the (complex) dose monitor geometry & can be ignored

### Note:
- TOPAS is a MC wrap around/extension of Geant4 specifically for Proton Therapy applications. The accessibility of the code depends on licensing conditions. To download, check the website: https://sites.google.com/a/topasmc.org/home/home
- Documentation on how to use TOPAS can be found on: https://topas.readthedocs.io/en/latest/getting-started/intro.html
- Simulations were performed with TOPAS version 3.2.p1 for this PhD work

### Additional information and documentation about the model is available on: http://www.hep.ucl.ac.uk/pbt/wiki/Clatterbridge/TOPAS

**For further description and information about the facility:**
1. A. Kacperek, “Protontherapy of eye tumours in the UK: A review of treatment at
Clatterbridge,” Applied Radiation and Isotopes, vol. 67, no. 3, pp. 378–386, 2009. https://doi.org/10.1016/j.apradiso.2008.06.012
2. J. Yap et al., “Beam characterisation studies of the 62 MeV proton therapy beamline at the Clatterbridge Cancer Centre,” Physica Medica, vol. 77, no. January, pp. 108– 120, 2020. https://doi.org/10.1016/j.ejmp.2020.08.002

#### *Code development for this model will cease following the completion of my PhD however sufficient information will be provided on the UCL wiki. User support will be on a minimal basis - please email if you have any questions.
