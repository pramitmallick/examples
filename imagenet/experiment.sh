#!/bin/bash

#SBATCH --verbose
#SBATCH --job-name=expCloudML
#SBATCH --mem=100GB
#SBATCH --output=out.expCloudML.%j

#SBATCH --time=100:00:00
#SBATCH--gres=gpu:1

#SBATCH --mem=250GB
#SBATCH --nodes=1
#SBATCH --cpus-per-task=28
#SBATCH --exclusive
##SBATCH --time=00:60:00
#SBATCH --gres=gpu:k80:4
##SBATCH --gres=gpu:p40:4
#SBATCH --reservation=chung

# module load pytorch/python2.7/0.3.0_4
# module load pytorch/python3.6/0.3.0_4

# conda activate base
module load python3/intel/3.6.3 cuda/9.0.176 nccl/cuda9.0/2.4.2

source ~/pytorch_env/py3.6.3/bin/activate
# nvprof --output-profile alexnet_16_0.005_%p --print-summary --csv python main.py --arch alexnet -b 16 --epochs 1 --lr 0.001 /beegfs/work/courses/2019-CSCI-GA-3033-025/imagenet_pytorch_small
nvprof --output-profile alexnet_16_0.005_%p.nvvp --print-summary --csv python main.py --arch alexnet -b 16 --epochs 1 --lr 0.001 /beegfs/work/courses/2019-CSCI-GA-3033-025/imagenet_pytorch
