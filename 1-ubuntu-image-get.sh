#!/bin/bash

THIS_DIR="$( cd "$( dirname "$0" )" && pwd )"
BASEDIR=`cat $THIS_DIR/variables.var | grep BASEDIR | awk -F= {'print $2'} | awk -F\' {'print $2'}`
VM_NAME=`cat $THIS_DIR/variables.var | grep VM_NAME | awk -F= {'print $2'} | awk -F\' {'print $2'}`
PASSWORD=`cat $THIS_DIR/variables.var | grep PASSWORD | awk -F= {'print $2'} | awk -F\' {'print $2'}`

sudo mkdir -p $BASEDIR
sudo wget https://cloud-images.ubuntu.com/releases/22.10/release/ubuntu-22.10-server-cloudimg-amd64.img -O $BASEDIR/$VM_NAME.img

echo "Resizing Ubuntu Image to 30GB"
echo "-----------------------------"

sudo qemu-img resize $BASEDIR/$VM_NAME.img 30G
sudo qemu-img info $BASEDIR/$VM_NAME.img

#echo "Customizing Ubuntu Image"
#echo "------------------------"
#
#sudo virt-customize -a /opt/kvm/datastore1/imgs/ubuntu-22.10-server.img --install qemu-guest-agent
#sudo virt-customize -a /opt/kvm/datastore1/imgs/ubuntu-22.10-server.img --run-command "sed -i 's/.*PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config"
