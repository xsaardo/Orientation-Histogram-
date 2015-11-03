# Orientation-Histogram-
Calculates orientation values per pixel and adds them to a histogram according to their coherency and energy values.
First argument is minimum coherency from 0 to 1. 
Second argument is minimum energy from 0 to 1.
Source image is selected from within ImageJ after executing the function.

*MIJ must be installed

Installing MIJ
Download mij.jar and ij.jar from this link http://bigwww.epfl.ch/sage/soft/mij/ and place them within the java directory of MATLAB (e.g 'C:\Program Files\MATLAB\R2015a\java)

Copy your OrientationJ_.jar to your MATLAB\R2015a\java\plugins folder

Extend the java classpath to mij.jar and ij.jar in MATLAB using 
javaaddpath('C:\...\MATLAB\R2015a\java\mij.jar');
javaaddpath('C:\...\MATLAB\R2015a\java\ij.jar');

Initialize ImageJ in MATLAB using
MIJ.start('Your ImageJ directory'); e.g. '...\ImageJ' before executing this function
