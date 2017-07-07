#!/bin/bash
cd semaphore/vote && sudo docker build -t semaphore/vote .
if [ "$(sudo docker ps -a | grep vote)" ]; then
  sudo docker stop vote
  sudo docker rm vote
fi
sudo docker run --name vote -d -p 8080:80 --link redis:redis semaphore/vote