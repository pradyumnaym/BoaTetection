from pycocotools.coco import COCO
from pycocotools.cocoeval import COCOeval
import json

def coco_evaluation(gt_file, pred_file):
    # Initialize COCO ground truth API
    coco_gt = COCO(gt_file)

    # Load results in COCO prediction format
    with open(pred_file, 'r') as f:
        coco_pred = coco_gt.loadRes(json.load(f))

    #Run COCO evaluation
    coco_eval = COCOeval(coco_gt, coco_pred, 'bbox')
    coco_eval.evaluate()
    coco_eval.accumulate()
    coco_eval.summarize()

# File paths
gt_file = 'BoaTetection_val_annotations.json'
pred_file = 'onnx_json_prediction.json'

# Evaluate
coco_evaluation(gt_file, pred_file)
