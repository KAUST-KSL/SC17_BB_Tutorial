#!/bin/bash 

#SBATCH --partition=workq
#SBATCH -t 30
##SBATCH -A k01
#SBATCH  --ntasks=32
#SBATCH --ntasks-per-node=32

#SBATCH   -J PLOT_AND_STAGE_OUT
#SBATCH -o out_%j
#SBATCH -e err_%j

#DW persistentdw name=george_test

#DW stage_in type=directory source=/project/k01/markomg/burstbuffer/complex/stage_in_bb/  destination=$DW_PERSISTENT_STRIPED_george_test

module load python/2.7.11
cd $DW_PERSISTENT_STRIPED_george_test

chmod +x plot_persistent.sh
chmod +x stage_out

let i=0
while [ $i -lt 24 ]

do
#for (( i=0; i<24; i++ )) do
k=$(printf %02d $i)

if [ -f wrfout_d01_2007-04-03_${k}_00_00 ]; then
    check_lsof=`lsof wrfout_d01_2007-04-03_${k}_00_00 | wc -l`
	while [ $check_lsof -eq 2 ] 
	do 
		sleep 30
	    check_lsof=`lsof wrfout_d01_2007-04-03_${k}_00_00 | wc -l`
	done
    ./plot_persistent.sh wrfout_d01_2007-04-03_${k}_00_00 
	srun -n 1 stage_out $DW_PERSISTENT_STRIPED_george_test/wrfout_d01_2007-04-03_${k}_00_00.png /project/k01/markomg/wrfchem_stage_out/wrfout_d01_2007-04-03_${k}_00_00.png
	let i=$i+1

else
	sleep 30
fi

done

exit 0

