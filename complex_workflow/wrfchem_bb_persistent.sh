#!/bin/bash

#SBATCH --partition=workq
#SBATCH -t 60
#SBATCH -A k01
#SBATCH  --ntasks=1280
#SBATCH --ntasks-per-node=32
#SBATCH --ntasks-per-socket=16
#SBATCH   -J WRF_CHEM_PERSISTENT
#SBATCH -o out_%j
#SBATCH -e err_%j

#DW persistentdw name=george_test

#DW stage_in type=directory source=/project/k01/markomg/burst_buffer_early_access/wrfchem/wrfchem-3.7.1_burst/test/em_real/forburst  destination=$DW_PERSISTENT_STRIPED_george_test
##DW stage_out type=directory destination=/project/k01/markomg/wrfchem_stage_out source=$DW_PERSISTENT_STRIPED_george_test


ulimit -s unlimited

export MPICH_ENV_DISPLAY=1
export MPICH_VERSION_DISPLAY=1
export MPICH_MPIIO_HINTS_DISPLAY=1
export MPICH_STATS_DISPLAY=1
export MPICH_MPIIO_HINTS="$DW_PERSISTENT_STRIPED_george_test/wrfinput*:cb_nodes=40:striping_unit=131072,$DW_PERSISTENT_STRIPED_george_test/wrfout*:cb_nodes=40:striping_unit=65536"

export MPICH_MPIIO_AGGREGATOR_PLACEMENT_DISPLAY=1
export MPICH_MPIIO_STATS=2
cd $DW_PERSISTENT_STRIPED_george_test

chmod +x wrf.exe
time srun -n 1280 --hint=nomultithread wrf.exe


exit 0

