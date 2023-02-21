#!/bin/bash

sudo mkdir -p /datastore1/imgs
sudo wget https://cloud-images.ubuntu.com/releases/22.10/release/ubuntu-22.10-server-cloudimg-amd64.img -O /datastore1/imgs/ubuntu-22.10-server.img

echo "Resizing Ubuntu Image to 30GB"
echo "-----------------------------"

sudo qemu-img resize /datastore1/imgs/ubuntu-22.10-server.img 30G
sudo qemu-img info /datastore1/imgs/ubuntu-22.10-server.img
