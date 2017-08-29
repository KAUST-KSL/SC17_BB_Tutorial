#!/bin/bash 

let i=0

while [ $i -lt $1 ]
do
	if [ -f $2/wrfout_d01_2007-04-03_$(printf "%02d" $i)_00_00.png ]; then
			display  $2/wrfout_d01_2007-04-03_$(printf "%02d" $i)_00_00.png &
		let i=i+1
		sleep 15
	else
		sleep 60
	fi
done
