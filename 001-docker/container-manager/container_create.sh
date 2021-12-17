xhost +
sudo docker run --gpus all -it -v /home/deep-learning/docker-workspace/pytorch-test/:/workspace -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --env QT_X11_NO_MITSHM=1 -p 1001:8888 nvcr.io/nvidia/pytorch:20.01-py3
