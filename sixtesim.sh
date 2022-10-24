#! /bin/bash
xmldir=$SIXTE/share/sixte/instruments/athena-wfi/wfi_wo_filter_B4C

simnam=ngc7793_4k
input=ngc7793_csc2.simput

expt=4000 

xmltot=${xmldir}/ld_wfi_ff_large.xml

RA=359.4604754
DEC=-32.6241784

${SIXTE}/bin/runsixt \
XMLFile=${xmltot} \
RA=${RA} Dec=${DEC} \
Prefix=${simnam}_tot_ \
Simput=${input} \
Exposure=${expt} \
clobber=yes

imgev \
EvtFile=${simnam}_tot_evt.fits \
Image=${simnam}_tot_img.fits \
CoordinateSystem=0 Projection=TAN \
NAXIS1=1063 NAXIS2=1063 CUNIT1=deg CUNIT2=deg \
CRVAL1=${RA} CRVAL2=${DEC} CRPIX1=532 CRPIX2=532 \
CDELT1=-6.207043e-04 CDELT2=6.207043e-04 history=true \
clobber=yes

$SIXTE/bin/makespec \
EvtFile=${simnam}_tot_evt.fits \
Spectrum=${simnam}_p13.pha \
EventFilter="regfilter(\"simp13_15as_new.reg\",RA,DEC)" \
RSPPath=${xmldir} clobber=yes

