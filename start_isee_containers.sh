#!/bin/bash

N=${1:-3}
MASTER_IMG=cripac/isee-master:0.1.0
SLAVE_IMG=cripac/isee-slave:0.1.0

#start master container.
echo "start isee-master container..."
docker rm -f isee-master &> /dev/null
docker run -itd \
           --net=isee \
           -p 50070:50070 \
           -p 8088:8088 \
           --name isee-master \
           --hostname isee-master \
           $MASTER_IMG &> /dev/null

#start slave container.
i=1
while [ $i -le $N ]
do
    echo "start isee-task-slave$i container..."
    dokcer rm -f isee-task-nod$i &> /dev/null
    docker run --runtime=nvidia -itd \
               -e NVIDIA_VISIBLE_DEVICES=$(( $i - 1 )) \
               --net=isee \
               --name isee-task-nod$i \
               --hostname isee-task-nod$i \
               $SLAVE_IMG &> /dev/null
    i=$(( $i + 1 ))
done

# get into hadoop master container
docker exec -it isee-master bash
