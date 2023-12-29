#!/bin/bash
#SBATCH --job-name=DL23
#SBATCH --cpus-per-task=16
#SBATCH --partition=week
#SBATCH --mem-per-cpu=8G
#SBATCH --gres=gpu:A4000:4
#SBATCH --time=3-23:0:0
#SBATCH --output=runs/job.%J.out
#SBATCH --mail-type=ALL

WANDB_MODE=disabled
singularity exec --nv  /common/singularityImages/DL23.sif python -m torch.distributed.launch --nproc_per_node 4 --master_port 9527 train_aux.py --workers 16 --device 0,1,2,3 --sync-bn --batch-size 16 --data data/BoaTetection.yaml --img 1280 1280 --cfg cfg/training/yolov7-e6.yaml --weights 'yolov7-e6.pt' --name yolov7-e6 --hyp data/hyp.scratch.p6.yaml
echo DONE!
