#!/bin/bash 

#SBATCH --partition=workq
#SBATCH -t 10
#SBATCH -A k01
#SBATCH --nodes=1


#DW persistentdw name=george_test
#DW stage_in type=directory source=/path/  destination=$DW_PERSISTENT_STRIPED_george_test

mkdir $DW_PERSISTENT_STRIPED_george_test/test1

cd $DW_PERSISTENT_STRIPED_george_test/test1

pwd


exit 0
