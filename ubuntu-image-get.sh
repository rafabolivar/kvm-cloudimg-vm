#!/bin/bash

sudo mkdir -p /opt/kvm/datastore1/imgs
sudo wget https://cloud-images.ubuntu.com/releases/22.10/release/ubuntu-22.10-server-cloudimg-amd64.img -O /opt/kvm/datastore1/imgs/ubuntu-22.10-server.img

echo "Resizing Ubuntu Image to 30GB"
echo "-----------------------------"

sudo qemu-img resize /opt/kvm/datastore1/imgs/ubuntu-22.10-server.img 30G
sudo qemu-img info /opt/kvm/datastore1/imgs/ubuntu-22.10-server.img

echo "Customizing Ubuntu Image"
echo "------------------------"

sudo virt-customize -a /opt/kvm/datastore1/imgs/ubuntu-22.10-server.img --install qemu-guest-agent
sudo virt-customize -a /opt/kvm/datastore1/imgs/ubuntu-22.10-server.img --run-command "sed -i 's/.*PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config"
