
sed -i 's/CUDNN=0/CUDNN=1/' Makefile
sed -i 's/DNN=0/DNN=1/' Makefile

# # Vanilla
# # YOLO
sed -i 's/V4L2=1/V4L2=0/' Makefile
sed -i 's/ON_DEMAND=1/ON_DEMAND=0/' Makefile
sed -i 's/ZERO_SLACK=1/ZERO_SLACK=0/' Makefile
sed -i 's/CONTENTION_FREE=1/CONTENTION_FREE=0/' Makefile
sed -i 's/INSTANT=1/INSTANT=0/' Makefile

make -j8

./darknet detector demo cfg/coco.data cfg/yolov4-p6.cfg weights/yolov4-p6.weights


## On-Demand
## YOLO
sed -i 's/V4L2=0/V4L2=1/' Makefile
sed -i 's/ON_DEMAND=0/ON_DEMAND=1/' Makefile
sed -i 's/ZERO_SLACK=0/ZERO_SLACK=1/' Makefile

make -j8

./darknet detector rtod cfg/coco.data cfg/yolov4-p6.cfg weights/yolov4-p6.weights



## Zero-Slack
## YOLO
sed -i 's/ON_DEMAND=1/ON_DEMAND=0/' Makefile
sed -i 's/ZERO_SLACK=0/ZERO_SLACK=1/' Makefile

make -j8

./darknet detector rtod cfg/coco.data cfg/yolov4-p6.cfg weights/yolov4-p6.weights

## Instant-Fetch + On_demand
## YOLO
sed -i 's/ON_DEMAND=0/ON_DEMAND=1/' Makefile
sed -i 's/ZERO_SLACK=0/ZERO_SLACK=1/' Makefile
sed -i 's/INSTANT=0/INSTANT=1/' Makefile
make -j8

./darknet detector rtod cfg/coco.data cfg/yolov4-p6.cfg weights/yolov4-p6.weights



## Contention-Free
## YOLO
sed -i 's/ZERO_SLACK=1/ZERO_SLACK=0/' Makefile
sed -i 's/CONTENTION_FREE=0/CONTENTION_FREE=1/' Makefile
sed -i 's/INSTANT=1/INSTANT=0/' Makefile
make -j8

./darknet detector rtod cfg/coco.data cfg/yolov4-p6.cfg weights/yolov4-p6.weights


## Instant-Fetch + Contention-Free
## YOLO
sed -i 's/INSTANT=0/INSTANT=1/' Makefile

make -j8

./darknet detector rtod cfg/coco.data cfg/yolov4-p6.cfg weights/yolov4-p6.weights


