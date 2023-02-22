#!/bin/bash
sudo genisoimage -output /opt/kvm/datastore1/imgs/ubuntu.iso -volid cidata -joliet -rock user-data meta-data network-config
