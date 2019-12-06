#!/bin/bash
#SBATCH --mail-user=zxu444@stat.wisc.edu
#SBATCH --mail-type=ALL
#SBATCH -p short
#SBATCH -t 2-00:00:00
#SBATCH -n 4
#SBATCH --array=0-21
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=2600M
#SBATCH --output="slurm_out/slurm-%A_%a.out"
n=$SLURM_ARRAY_TASK_ID
module load R/R-3.6.1
# R CMD BATCH --no-save 605.r $n
Rscript 605.r $n
