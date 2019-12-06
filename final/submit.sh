#!/bin/bash

rm -rf slurm_out; mkdir slurm_out

# I can't move previous line into cleanUpMakeDirs.sh (next line)
# because (I think) "slurm_out" directory has to exist as sbatch
# starts, in light of my "--output=..." specification.

# The following code enforces this order of running jobs:
#
#                     pre.sh
#              /        |        \
#   jobArray.sh    jobArray.sh    jobArray.sh
#   (SLURM_ARRAY_TASK_ID is set to 1, 2, 3 in these three jobs)
#              \        |        /
#                 \     |     /
#                    \  |  /
#                     echo.sh

jobId1=$(sbatch --output="slurm_out/slurm-%A_%a.out" pre.sh)
# Strip off "Submitted batch job " from $jobId1. It has the form
# "Submitted batch job 6768660" (where the number changes from job to job).
jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')

# jobId2=$(sbatch --array=0-5 --output="slurm_out/slurm-%A_%a.out" --dependency=afterany:$jobId1 jobArray.sh --mem-per-cpu=2600M -n 4 -p short -t 24:00:00)
jobId2=$(sbatch jobArray1.sh --dependency=afterany:$jobId1)

jobId2=$(echo $jobId2 | sed 's/Submitted batch job //') # Strip off "Submitted batch job ".

jobId3=$(sbatch --output="slurm_out/slurm-%A_%a.out" --dependency=afterany:$jobId2 echo.sh)
