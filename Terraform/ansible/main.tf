terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.74.0"
    }
  }

  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "tbucket-yc"
    region                      = "ru-central1-a"
    key                         = "sfler/lemp.tfstate"
    access_key                  = "you key"
    secret_key                  = "you key"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token     = "you token"
  cloud_id  = "you id"
  folder_id = "you id"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "warframe" {
  name = "warframe"
  hostname= "warframe"
  resources {
    core_fraction = 20  #указываем гарантированную долю CPU в %
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81hgrcv6lsnkremf32" #yc compute image list --folder-id standard-images
      size = 15
      type = "network-ssd"
    }
  }

  scheduling_policy {
    preemptible = true  #указываем, что машина прерываемая
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "warframe1" {
  name = "warframe1"
  hostname= "warframe1"
  resources {
    core_fraction = 20
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd82re2tpfl4chaupeuf"
      size = 15
      type = "network-ssd"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "warframe2" {
  name = "warframe2"
  hostname= "warframe2"
  resources {
    core_fraction = 20
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82re2tpfl4chaupeuf"
    size = 15
      type = "network-ssd"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "warframe3" {
  name = "warframe3"
  hostname= "warframe3"
  resources {
    core_fraction = 20
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82re2tpfl4chaupeuf"
    size = 15
      type = "network-ssd"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "warframe4" {
  name = "warframe4"
  hostname= "warframe4"
  resources {
    core_fraction = 20
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80hlqju12ugj85cqhh"
    size = 15
      type = "network-ssd"
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}


resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "internal_ip_address_warframe" {
  value = yandex_compute_instance.warframe.network_interface.0.ip_address
}

output "internal_ip_address_warframe1" {
  value = yandex_compute_instance.warframe1.network_interface.0.ip_address
}

output "internal_ip_address_warframe2" {
  value = yandex_compute_instance.warframe2.network_interface.0.ip_address
}

output "internal_ip_address_warframe3" {
  value = yandex_compute_instance.warframe3.network_interface.0.ip_address
}

output "internal_ip_address_warframe4" {
  value = yandex_compute_instance.warframe4.network_interface.0.ip_address
}

output "external_ip_address_warframe" {
  value = yandex_compute_instance.warframe.network_interface.0.nat_ip_address
}

output "external_ip_address_warframe1" {
  value = yandex_compute_instance.warframe1.network_interface.0.nat_ip_address
}

output "external_ip_address_warframe2" {
  value = yandex_compute_instance.warframe2.network_interface.0.nat_ip_address
}

output "external_ip_address_warframe3" {
  value = yandex_compute_instance.warframe3.network_interface.0.nat_ip_address
}

output "external_ip_address_warframe4" {
  value = yandex_compute_instance.warframe4.network_interface.0.nat_ip_address
}

output "subnet-1" {
  value = yandex_vpc_subnet.subnet-1.id
}
