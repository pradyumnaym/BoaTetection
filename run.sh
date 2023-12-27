#!/bin/bash
#SBATCH --job-name=DL23
#SBATCH --cpus-per-task=4
#SBATCH --partition=week
#SBATCH --mem-per-cpu=12G
#SBATCH --gres=gpu:A4000:4
#SBATCH --time=3-23:0:0
#SBATCH --output=runs/job.%J.out
#SBATCH --mail-type=ALL

WANDB_API_KEY=a3e66938bb695d3dea4bd75b92b5abe155c7759a 
singularity exec --nv  /common/singularityImages/DL23.sif python -m torch.distributed.launch --nproc_per_node 4 --master_port 9527 train.py --workers 8 --device 0,1,2,3 --sync-bn --batch-size 64 --data data/BoaTetection.yaml --img 640 640 --cfg cfg/training/yolov7x.yaml --weights 'yolov7x.pt' --name yolov7 --hyp data/hyp.scratch.p5.yaml
echo DONE!
