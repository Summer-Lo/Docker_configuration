# File used for creating, starting, extending the docker container

## Create Docker Container
### Container_create.sh
```
sudo docker run --gpus all -it -v /home/deep-learning/docker-workspace/pytorch-test/:/workspace -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY --env QT_X11_NO_MITSHM=1 -p 1001:8888 nvcr.io/nvidia/pytorch:20.01-py3
```
### Configurate the GPUs for the container
```
--gpus all
```

### Configurate Docker Container Path
{computer path}:{container workspace}
```
/home/deep-learning/docker-workspace/pytorch-test/:/workspace
```

### Configurate the container monitor
```
DISPLAY=$DISPLAY
```

### Configurate the port between computer and container
{self defined port}:{container workspace}
```
-p 1001:8888
```

### Configurate the pull tag of image
Found from nvidia NGC
```
nvcr.io/nvidia/pytorch:20.01-py3
```

### ReName
```
docker rename {my_container} {my_new_container}
```

## Container_extend.sh
Open one more terminal to connect into docker container (syn with other terminal)
pytorch-test == {container Name}
```
sudo docker exec -it pytorch-test /bin/bash
```

## Container_start.sh
Start docker container if it is closed
(If close and stop the docker container, press CTRL+D)
pytorch-test == {container Name}
```
sudo docker start pytorch-test
```
```
sudo docker attach pytorch-test
```
