#!/bin/bash
# Propagate environment variable to the compute node
#SBATCH --export=ALL
# Run in the standard partition (queue)
#SBATCH --partition=teaching
# Specify project account
#SBATCH --account=teaching
# Distribute processes in a round-robin fashion
#SBATCH --distribution=cyclic
# Number of cores required
#SBATCH --ntasks=2 --nodes=1
# Runtime (hard)
#SBATCH --time=00:20:00
# Job name
#SBATCH --job-name=PENCEN
# Output file
#SBATCH --output=PENCEN_slurm-%j.out

module load gaussian/g16
/opt/software/scripts/job_prologue.sh

export GAUSS_SCRDIR=$SLURM_SUBMIT_DIR

g16 Molecule_PENCEN.com

/opt/software/scripts/job_epilogue.sh


