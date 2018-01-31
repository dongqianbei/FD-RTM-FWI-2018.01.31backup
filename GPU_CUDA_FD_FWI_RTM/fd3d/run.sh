#!/bin/sh


ns=1

nt=1001
kt=600
n1=200
npd=50 
mm=4

# Complie
nvcc -o fd3d -lcublas -lcufft -lcusparse gpufd3d.cu -L/home/leonvel/software/madagascar/madagascar-1.7/lib -L/usr/lib64/atlas -lrsf++ -llapack -lcblas -lumfpack -lcholmod -lamd -lcamd -lcolamd -lccolamd -lrsfpwd -lrsf -lm -lf77blas -lcblas -latlas -llapack -lcblas -lgomp -lfftw3f -lfftw3f_threads -I /home/leonvel/software/madagascar/madagascar-1.7/include
# Run 
./fd3d < vel.rsf   snap=Fw.rsf shot=shot.rsf verb=n nt=$nt kt=$kt dt=0.001 fm=30 ns=$ns szbeg=1 sxbeg=100 sybeg=100 jsz=0 jsx=50 jsy=50 

#show
#sfbyte < Fw.rsf bar=gbar.rsf gainpanel=all allpos=y |sfgrey3 bar=gbar.rsf scalebar=y color=j movie=1 frame1=100 frame2=100 frame3=100 flat=n |sfpen&
ximage < Fw.rsf@ n1=200 perc=99&
ximage < shot.rsf@ n1=$nt perc=99&
