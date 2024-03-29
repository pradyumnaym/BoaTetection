#!/bin/bash
#SBATCH --job-name=DL23
#SBATCH --cpus-per-task=16
#SBATCH --partition=week
#SBATCH --mem-per-cpu=8G
#SBATCH --gres=gpu:4
#SBATCH --time=3-23:0:0
#SBATCH --output=runs/job.%J.out
#SBATCH --mail-type=ALL

WANDB_MODE=disabled
YOLO_MODEL=yolov7-e6
DATA_YAML=data/BoaTetection_v22.yaml
EPOCHS=300

# if the model is not downloaded, download it
# if [ ! -f "$YOLO_MODEL.pt" ]; then
#     wget 

singularity exec --nv  /common/singularityImages/DL23.sif python -m torch.distributed.launch --nproc_per_node 4 --master_port 9527 train_aux.py --workers 16 --device 0,1,2,3 --sync-bn --batch-size 48 --epochs $EPOCHS --data $DATA_YAML --img 640 640 --cfg cfg/training/$YOLO_MODEL.yaml --weights "runs/train/yolov7-e6-640_v22_ft_60_epochs/weights/best.pt" --name $YOLO_MODEL-640_v23_ft_300_epochs_restore_from_ft_model --hyp data/hyp.scratch.p6.yaml
echo DONE!
