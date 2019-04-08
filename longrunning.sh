#!/bin/sh
#r=0
#swpd=0
#r="$(vmstat | awk '(NR==2){for(i=1;i<=NF;i++)if($i=="r"){getline; print $i}}')"
#swpd="$(vmstat | awk '(NR==2){for(i=1;i<=NF;i++)if($i=="swpd"){getline; print $i}}')"
#echo vmstat,tag=1 r=$r,swpd=$swpd,rh=1

count=0 
count="$(ps -eo pid,comm,pcpu,etimes| awk '{if($3>=0.6 && $4>300){printf "%s %6s \n",  $2,$4}}' | wc -l)"
echo longrunning,tag=1 lrn=$count,rcb=1
