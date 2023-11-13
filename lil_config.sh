#!/bin/bash
#скрипт настраивает работу от имени пользователя ubuntu без ввода пароля и правит ip-адрес и имя хоста (запрашивает)
read -p "Введите IP-адрес: " ip_address
read -p "Введите имя хоста: " host_name
echo "ubuntu ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ubuntu
sudo sed -i "s/10.221.12.181\/24/$ip_address\/24/" /etc/netplan/00-installer-config.yaml
sudo sed -i "s/master1/$host_name/" /etc/hosts
