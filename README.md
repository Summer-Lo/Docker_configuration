# Docker_configuration

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

### Commit docker image
Input containerID, imageName, imageTag
```
sudo docker commit {containerID} {imageName}:{imageTag}
```
Example:
```
sudo docker commit 57da2f55c4db summer:beta
```

### Push Docker Image
Input imageName, imageTag
```
sudo docker push {imageName}:{imageTag}
```
Example:
```
sudo docker push summer:beta
```

### Remove Docker Image
```
sudo docker rmi summer:beta
```
```
sudo docker rmi {imageName}:{imageTag}
```

## Docker Account 

### Docker login
```
sudo docker login
```
Enter account and password
