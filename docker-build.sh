# building images
docker build -t ansible-ubuntu-base ./build/ubuntu-base
docker build -t ansible-ubuntu-controller ./build/ubuntu-controller
docker build -t ansible-ubuntu-minion ./build/ubuntu-minion
docker build -t ansible-centos-minion ./build/centos-minion
