# ClatterbridgeTreatmentLine
### TOPAS model of the Clatterbridge Cancer Centre, UK 60 MeV Ocular Proton Therapy Beamline

Developed by Jacinta Yap in 2019 as part of my PhD with the University of Liverpool & Cockcroft Institute, UK (jacinta.yap@liverpool.ac.uk)

This repository contains the following:

- **Parameter files**
  - Beam source, materials, scoring, run, visualiser etc.
- **Geometry files**
  - Geometry parameter file, component files (contains STL files of each component, grouped by material, imported from geometries built in CAD).
- **Analysis scripts**
  - Written in Matlab to plot comparisons of dose, LET curves and tranverse beam profiles.

The model itself can be run immediately (with 100,000 histories) using the default settings defined in the parameter files. The visualiser is automatically turned off in this case however when *MyViewer* is initiated, should generate the following:

![Beamline in TOPAS](https://github.com/jacyap/ClatterbridgeTreatmentLine/blob/master/Beamline_def.png)
The beam source (purple box at far left), an abitrary phase space scorer (red box) and a water phantom (blue box) are also included and shown.

### Note:
- TOPAS is a MC wrap around/extension of Geant4 specifically for Proton Therapy applications. The accessibility of the code depends on licensing conditions, to download, check the website: https://sites.google.com/a/topasmc.org/home/home
- Documentation on how to use TOPAS can be found on: https://topas.readthedocs.io/en/latest/getting-started/intro.html

Further information and documentation about the model itself will soon be available on: http://www.hep.ucl.ac.uk/pbt/wiki/Clatterbridge/TOPAS

For now, more details can be found about a previous Geant4 model on: http://www.hep.ucl.ac.uk/pbt/wiki/Clatterbridge/Geant4
