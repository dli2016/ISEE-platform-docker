# Run ISEE platform using docker

## 1. Prerequisites
1). docker-ce: https://docs.docker.com/install/linux/docker-ce/centos/ <br>
2). nvidia-docker: https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0) <br>
3). cuda8.0 <br>
4). Nvidia Driver > 361.77 <br>

## 2. Generate ISEE images
1). Dependent Images <br>
I. master image <br> 
```
docker pull cripac/centos7-isee-basic-master:0.1.4
```
II. worker image <br>
```
docker pull cripac/centos7-isee-basic-worker:0.1.3
```
2). Build ISEE Image <br>
I. Set the number of slave nodes <br>
```
sh set_slaves.sh [#slaves]
```
