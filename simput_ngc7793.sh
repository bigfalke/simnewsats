#!/bin/bash

simpardiff="ISISFile=tb_cpl.par Emin=0.5 Emax=8 clobber=yes"

simparp13="ISISFile=0804670301_tb_dbb_dbb_enfl3_best.par Emin=0.3 Emax=15 clobber=yes"

p13RA=359.4604754
p13DEC=-32.6241784

chRA=359.50136179244
chDEC=-32.555894941063

# simputfile Simput="diff_and_ps.simput" \
# RA=${chRA} Dec=${chDEC} \
# srcFlux=1e-11 \
# ${simpardiff} \
# ImageFile=acisf14231N003_full_img2.fits.gz

# simputfile RA=${p13RA}  Dec=${p13DEC} srcFlux=2.2e-12 Simput="src_p13.simput" $simparp13
# simputfile RA=148.9626458  Dec=69.67915972 srcFlux=5e-12 Simput="src_01.fits" $simpar
# simputfile RA=148.963825   Dec=69.67878389 srcFlux=1e-13 Simput="src_02.fits" $simpar
# simputfile RA=148.9613167  Dec=69.67878361 srcFlux=1e-13 Simput="src_03.fits" $simpar
# simputfile RA=148.9646125  Dec=69.67661417 srcFlux=1e-13 Simput="src_04.fits" $simpar
# simputfile RA=148.9600375  Dec=69.676785   srcFlux=1e-13 Simput="src_05.fits" $simpar
# simputfile RA=148.9742542  Dec=69.68062889 srcFlux=1e-13 Simput="src_06.fits" $simpar
# simputfile RA=148.969975   Dec=69.67931361 srcFlux=1e-13 Simput="src_07.fits" $simpar
# simputfile RA=148.94415    Dec=69.67797917 srcFlux=8e-13 Simput="src_08.fits" $simpar
# simputfile RA=148.9447417  Dec=69.67719333 srcFlux=1e-13 Simput="src_09.fits" $simpar

opt="clobber=yes FetchExtensions=yes"
# simputmerge $opt Infile1=diff_and_ps.simput Infile2=src_p13.simput Outfile=merged_7793.simput
# simputmerge $opt Infile1=src_02.fits Infile2=m_src_01.fits Outfile=m_src_02.fits
# simputmerge $opt Infile1=src_03.fits Infile2=m_src_02.fits Outfile=m_src_03.fits
# simputmerge $opt Infile1=src_04.fits Infile2=m_src_03.fits Outfile=m_src_04.fits
# simputmerge $opt Infile1=src_05.fits Infile2=m_src_04.fits Outfile=m_src_05.fits
# simputmerge $opt Infile1=src_06.fits Infile2=m_src_05.fits Outfile=m_src_06.fits
# simputmerge $opt Infile1=src_07.fits Infile2=m_src_06.fits Outfile=m_src_07.fits
# simputmerge $opt Infile1=src_08.fits Infile2=m_src_07.fits Outfile=m_src_08.fits
# simputmerge $opt Infile1=src_09.fits Infile2=m_src_08.fits Outfile=merged_simput.fits

## adding diffuse background from Thomas Dausers files in Bamberg (/loft/loftusers/dauser/m82)
# simputmerge $opt Infile1=merged_src0-5.fits Infile2=m82_src.simput Outfile=merged_src0-5.fits

simputmerge $opt Infile1=testinput.simput Infile2=ROSAT_fullextended.simput.gz  Outfile=p13test_with_back.simput
