#!/bin/bash
# Скрипт настраивает работу системы от имени пользователя 'ubuntu' без ввода пароля и правит ip-адрес и имя хоста (запрашивает)

# Проверка наличия аргументов
if [ $# -eq 2 ]; then
    ip_address=$1
    host_name=$2
else
    # Запрос ввода у пользователя
    read -p "Введите IP-адрес: " ip_address
    read -p "Введите имя хоста: " host_name
fi

# Убедитесь, что переменные не пустые
if [ -z "$ip_address" ] || [ -z "$host_name" ]; then
    echo "IP-адрес и имя хоста не могут быть пустыми."
    exit 1
fi

# Настройка системы
sudo hostnamectl set-hostname "$host_name"
sudo sed -i "s/10.221.12.181\/24/$ip_address\/24/" /etc/netplan/00-installer-config.yaml
sudo netplan apply
