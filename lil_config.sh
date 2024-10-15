#!/bin/bash
# Скрипт настраивает работу системы от имени пользователя 'ubuntu' без ввода пароля и правит ip-адрес и имя хоста (запрашивает)
# Внимание: в этом скрипте файл конфигурации netplan называется 00-installer-config.yaml и заменяется 10.221.12.181 на введённый

echo "Введите ip адрес:"
read ip_address
#ip_address=$1
echo "Введите hostname:"
read host_name
#host_name=$2

echo "ubuntu ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ubuntu
sudo hostnamectl hostname $host_name
sudo sed -i "s/10.221.12.181\/24/$ip_address\/24/" /etc/netplan/00-installer-config.yaml
sudo netplan apply
