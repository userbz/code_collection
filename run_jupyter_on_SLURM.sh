#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 10
#SBATCH --time 7-00:00:00
#SBATCH --mem 60G
#SBATCH --job-name jupyter
#SBATCH --output jupyter-%J.txt

## get tunneling info
XDG_RUNTIME_DIR=""
ipnport=8008
ipnip=$(hostname -i)

## print tunneling instructions to jupyter-log-{jobid}.txt
echo -e "ssh -N -L $ipnport:$ipnip:$ipnport <ServerIP>"

## start an ipcluster instance and launch jupyter server
jupyter notebook --no-browser --port=$ipnport --ip=$ipnip
