#!/bin/bash

/usr/sbin/sshd -D &
sh /root/scripts/set-zookeeper-id.sh
bash
