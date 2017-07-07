# bash
cd ~/semaphore/vote && sudo docker build -t semaphore/vote .
if [ "$(docker ps -a | grep vote)" ]; then
	sudo docker stop vote
fi
sudo docker run --name vote -d -p 8080:80 --link redis:redis semaphore/vote