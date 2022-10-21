#! /bin/bash
xmldir=$SIXTE/share/sixte/instruments/athena-wfi/wfi_wo_filter_B4C

simnam=testsim_with_back
# input=testinput.simput
# input=p13test_with_back.simput
input=ROSAT_fullextended.simput.gz
expt=10000 

xml0=${xmldir}/ld_wfi_ff_chip0.xml
xml1=${xmldir}/ld_wfi_ff_chip1.xml
xml2=${xmldir}/ld_wfi_ff_chip2.xml
xml3=${xmldir}/ld_wfi_ff_chip3.xml

# RA=359.4604754
# DEC=-32.6241784
RA=359.6704754
DEC=-32.7341784

${SIXTE}/bin/athenawfisim \
XMLFile0=${xml0} XMLFile1=${xml1} XMLFile2=${xml2} XMLFile3=${xml3} \
RA=${RA} Dec=${DEC} \
Prefix=${simnam}_ \
Simput=${input} \
Exposure=${expt} \
clobber=yes

ftmerge \
${simnam}_chip0_evt.fits,${simnam}_chip1_evt.fits,${simnam}_chip2_evt.fits,${simnam}_chip3_evt.fits \
${simnam}_combined_evt.fits clobber=yes

imgev \
EvtFile=${simnam}_combined_evt.fits \
Image=${simnam}_combined_img.fits \
CoordinateSystem=0 Projection=TAN \
NAXIS1=1063 NAXIS2=1063 CUNIT1=deg CUNIT2=deg \
CRVAL1=${RA} CRVAL2=${DEC} CRPIX1=532 CRPIX2=532 \
CDELT1=-6.207043e-04 CDELT2=6.207043e-04 history=true \
clobber=yes

$SIXTE/bin/makespec \
EvtFile=${simnam}_combined_evt.fits \
Spectrum=${simnam}_p13_det.pha \
EventFilter="(RA>359.455 || RA<359.465) && Dec>-32.628 && Dec<-32.62" \
RSPPath=${xmldir} clobber=yes


# EventFilter="regfilter(\"simp13_15as.reg\",RA,DEC)" \
