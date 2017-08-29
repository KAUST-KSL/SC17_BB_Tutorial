# SC17 Burst Buffer Tutorial

## Welcome to SC17 BB Tutorial

Download material:

git clone https://github.com/KAUST-KSL/SC17_BB_Tutorial.git


### Complex Workflow

cd complex_workflow

#### Instructions

* Adjust each of the following scripts accroding to your needs

* Create BB persistent space

sbatch create_persistent.sh

* Execute your application (create your own scripts for your own application)

For this example: sbatch wrfchem_bb_persistent.sh   (check job id, WRF-CHEM is not provided fromthis repository)

* Execute the tool which creates an image from WRF-CHEM NetCDF file and stage-out the image only, it will start only when the main application starts
 
 sbatch --dependency=after:application_job_id plot_stage_out.sh
 
 * Wait for the files to be arrived and visualize them
 
 ./wait.sh number_of_images /path_to_Lustre_stage_out_folder/
 
 * Delete the BB persistent allocation
 
 sbatch delete_persistent.sh
 
 [WRF-CHEM demo video](https://www.youtube.com/watch?v=C2g9SCX5fBo)

For any question contact georgios.markomanolis@kaust.edu.sa
