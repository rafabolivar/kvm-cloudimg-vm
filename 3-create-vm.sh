#!/bin/bash

THIS_DIR="$( cd "$( dirname "$0" )" && pwd )"
BASEDIR=`cat $THIS_DIR/variables.var | grep BASEDIR | awk -F= {'print $2'} | awk -F\' {'print $2'}`
VM_NAME=`cat $THIS_DIR/variables.var | grep VM_NAME | awk -F= {'print $2'} | awk -F\' {'print $2'}`
PASSWORD=`cat $THIS_DIR/variables.var | grep PASSWORD | awk -F= {'print $2'} | awk -F\' {'print $2'}`
VRAM=`cat $THIS_DIR/variables.var | grep VRAM | awk -F= {'print $2'} | awk -F\' {'print $2'}`
VCPUS=`cat $THIS_DIR/variables.var | grep VCPUS | awk -F= {'print $2'} | awk -F\' {'print $2'}`

sudo virt-install --import --name $VM_NAME --memory $VRAM --vcpus $VCPUS --disk $BASEDIR/$VM_NAME.img,format=qcow2,bus=virtio --cdrom=$BASEDIR/$VM_NAME.iso --network bridge=br0 --osinfo=ubuntu22.10 --graphics vnc  &
