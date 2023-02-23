#ZERO SLACK 

sed -i 's/CONTENTION_FREE=1/CONTENTION_FREE=0/g' Makefile
sed -i 's/ZERO_SLACK=0/ZERO_SLACK=1/g' Makefile
make -j8

./darknet detector rtod cfg/coco.data cfg/yolov2.cfg ~/yolov2.weights -c 0
cd measure/
mv measure.csv v2_ZS.csv
cd ..

./darknet detector rtod cfg/coco.data cfg/yolov3.cfg ~/yolov3.weights -c 0
cd measure/
mv measure.csv v3_ZS.csv
cd ..

./darknet detector rtod cfg/coco.data cfg/yolov4.cfg ~/yolov4.weights -c 0
cd measure/
mv measure.csv v4_ZS.csv
cd ..


# CONTENTION FREE
sed -i 's/CONTENTION_FREE=0/CONTENTION_FREE=1/g' Makefile
sed -i 's/ZERO_SLACK=1/ZERO_SLACK=0/g' Makefile
make -j8
./darknet detector rtod cfg/coco.data cfg/yolov2.cfg ~/yolov2.weights -c 0
cd measure/
mv measure.csv v2_CF.csv
cd ..

./darknet detector rtod cfg/coco.data cfg/yolov3.cfg ~/yolov3.weights -c 0
cd measure/
mv measure.csv v3_CF.csv
cd ..

./darknet detector rtod cfg/coco.data cfg/yolov4.cfg ~/yolov4.weights -c 0
cd measure/
mv measure.csv v4_CF.csv
cd ..
