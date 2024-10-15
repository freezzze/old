#!/bin/bash
#скрипт настраивает работу от имени пользователя ubuntu без ввода пароля и правит ip-адрес и имя хоста (запрашивает)
#запускать так (передаём значения напрямую) 'curl https://raw.githubusercontent.com/freezzze/old/main/lil_config.sh | sudo bash -s 10.221.12.182 node2'

# Запрос ввода у пользователя
read -p "Введите IP-адрес: " ip_address
read -p "Введите имя хоста: " host_name

# Проверка наличия аргументов
if [ -z "$ip_address" ] || [ -z "$host_name" ]; then
    echo "Usage: $0 <ip_address> <host_name>"
    exit 1
fi

echo "ubuntu ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/ubuntu
sudo hostnamectl hostname $host_name
sudo sed -i "s/10.221.12.181\/24/$ip_address\/24/" /etc/netplan/00-installer-config.yaml
sudo netplan apply
