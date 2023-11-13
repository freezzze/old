#!/bin/bash
#скрипт настраивает работу от имени пользователя ubuntu без ввода пароля и правит ip-адрес и имя хоста (запрашивает)
#запускать так (передаём значения напрямую) 'curl https://raw.githubusercontent.com/freezzze/old/main/lil_config.sh | sudo bash -s 10.221.12.182 master2'

ip_address=$1
host_name=$2

echo "ubuntu ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ubuntu
sudo sed -i "s/127.0.1.1 master1/127.0.1.1 $host_name/" /etc/hosts
sudo sed -i "s/10.221.12.181\/24/$ip_address\/24/" /etc/netplan/00-installer-config.yaml
sudo netplan apply
