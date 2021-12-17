# Docker_configuration

## Docker Container Build

### Docker Container image Search
Nvidia NGC (searching image)
```
https://catalog.ngc.nvidia.com/
```
Considering Factor:
1. CUDA version
```
sudo watch nvidia-smi
```
2. TensorFlow / PyTorch version
3. Required Python version



## Docker information

### Display Docker Container
Only started
```
sudo docker ps
```

All
```
sudo docker ps -a
```

### Display Docker Image
```
sudo docker image ls
```

### 1.Commit docker image
**Create Docker Hub repo first!!!!!!!!**

Input containerID, imageName, imageTag
```
sudo docker commit {containerID} {imageName}:{imageTag}
```
Example: (from docker hub repos)
```
docker push summerlo/gaytest:tagname
```

### 2.Tag Docker Image
Input imageName, imageTag, dockerHubUserName, imageName
```
sudo docker tag {imageName:imageTag} {dockerHubUsername/imageName}
```
Example:
```
sudo docker tag summer:test summerlo/test
```

### 3.Push Docker Image
Input imageName, imageTag
```
sudo docker push {imageName}:{imageTag}
```
Example:
```
sudo docker push summer:beta
```

### Remove Docker Image
1.
```
sudo docker rmi summer:beta
```
```
sudo docker rmi {imageName}:{imageTag}
```
2.
```
sudo docker image rm summer:beta
```
```
sudo docker image rm {imageName}:{imageTag}
```

## Docker Account 

### Docker login
```
sudo docker login
```
Enter account and password
