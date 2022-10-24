# simnewsats

A simple collection of tools to simulate new X-ray detectors. The
simulations are largely based on SIXTE.

cat2simput.ipynb will turn a VOTable catalogue into a SIMPUT source
cataloge, as long as a spectrum is associated with it.

There are three simulations scripts to run SXITE with the catalog, one for NGC 5907 (ngc5907sim_wfi.sh), one for NGC 7793 (wfisim.sh) and one using 'runsixt' instead of 'athenawfisim' (sixtesim.sh), which only simulate one quadrant of WFI. 

Additionally some auxiliary files are available to reproduce the catalog and simulations.
