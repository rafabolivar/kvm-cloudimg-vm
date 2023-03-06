#!/bin/bash

THIS_DIR="$( cd "$( dirname "$0" )" && pwd )"
BASEDIR=`cat $THIS_DIR/variables.var | grep BASEDIR | awk -F= {'print $2'} | awk -F\' {'print $2'}`
VM_NAME=`cat $THIS_DIR/variables.var | grep VM_NAME | awk -F= {'print $2'} | awk -F\' {'print $2'}`
PASSWORD=`cat $THIS_DIR/variables.var | grep PASSWORD | awk -F= {'print $2'} | awk -F\' {'print $2'}`

sed -i "s/password.*/password: $PASSWORD/" $THIS_DIR/user-data
sudo genisoimage -output $BASEDIR/$VM_NAME.iso -volid cidata -joliet -rock user-data meta-data network-config
