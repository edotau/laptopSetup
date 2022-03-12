#!/bin/bash
set -e

sudo apt-get update -y \
	&& sudo apt-get install -y apt-transport-https \
	&& sudo apt-get install -y gnupg2 pass

if /usr/bin/docker; then
	echo "docker is installed..."
else
	curl https://get.docker.com | sh \
		&& sudo systemctl --now enable docker
fi

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
	&& curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
	&& curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update \
	&& sudo apt-get install -y nvidia-docker2

sudo systemctl restart docker \
	&& sudo usermod -aG docker $USER && sudo chmod 777 /var/run/docker.sock

curl https://raw.githubusercontent.com/GoogleCloudPlatform/compute-gpu-installation/main/linux/install_gpu_driver.py --output install_gpu_driver.py && sudo python3 install_gpu_driver.py && sudo rm install_gpu_driver.py

docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi

gcloud config set disable_usage_reporting false

# gcloud auth configure-docker
# docker pull us.gcr.io/bcr-3-264801/bli-alphafold2:latest
# docker run us.gcr.io/bcr-3-264801/bli-alphafold2:latest gcloud auth activate-service-account --key-file=/var/lib/apt/lists/bcr-storage-key.json
# sudo rm *NVIDIA-Linux-*.run

