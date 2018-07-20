# Run ISEE Platform Using docker

## 1. Prerequisites
1). docker-ce: https://docs.docker.com/install/linux/docker-ce/centos/ <br>
2). nvidia-docker: https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0) <br>
3). cuda8.0 <br>
4). Nvidia Driver > 361.77 <br>

## 2. Generate ISEE Images
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
I. Set the number of slave nodes (it will generate the cofiguration files - slaves - for hadoop and spark) <br>
```
sh set_slaves.sh [#slaves]
```
II. Modify the configuration files (hadoop, spark, neo4j, kafka) in directory of configs as necessary. <br>
III. Set the server.properties and zookeeper.properties used by kafka (they are based on slaves). <br>
```
sh set_kafka.sh
```
IV. Set ansible (it is also based on the configuration file of slaves).
```
sh set_ansible.sh
```
V. Build Images (the Dockerfiles for master and worker locate in dockerfiles) <br>
```
sh build_isee_images.sh [master/slave]
```
Note: to build the images, aforementioned "Dependent Images" in Sec.2 are needed. <br>

## 3. Start Containers
1). Create Network <br>
```
docker network create --driver=bridge isee
```
2). Start <br>
```
sh start_isee_containers.sh [#slaves]
```
Note: the number of slaves here must be the same with that in Sec.2-2)-I

## 4. Prepare the Environments Using by ISEE
```
cd ./scripts
sh start-all.sh
``` 
One can valid the environment by provided examples: <br>
```
sh run-wordcount.sh
sh run-spark-py.sh
```
One can also check the node states using:
```
sh check-nodes.sh
```

## 5. Launch ISEE
One can try the ISEE platform under the illustration shown in: https://github.com/dli2016/LaS-VPE-Platform/tree/dli <br>
Note: one should configure specific evironments on slave nodes to satisfy the necessary for a specific vision module. <br>

## Acknowledgements
I. We generate the basic images based on nvidia-docker (https://github.com/NVIDIA/nvidia-docker) and centos (https://hub.docker.com/r/_/centos/). <br>
II. To build the ISEE image we refer the methods provided by kiwenlau (https://github.com/kiwenlau/hadoop-cluster-docker). <br>
III. Thanks Kai Yu for his contribution on the underlying codes of ISEE platform. <br>
