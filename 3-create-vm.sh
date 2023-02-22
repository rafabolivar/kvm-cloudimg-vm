#!/bin/bash
sudo virt-install --import --name ubuntu01 --memory 2048 --vcpus 2 --disk /opt/kvm/datastore1/imgs/ubuntu-22.10-server-cloudimg-amd64.img,format=qcow2,bus=virtio --cdrom=/opt/kvm/datastore1/imgs/ubuntu.iso --network bridge=br0 --osinfo=ubuntu22.10 --graphics vnc  &
