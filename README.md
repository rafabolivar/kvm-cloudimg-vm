# kvm-cloudimg-vm

This article explains how to easily create VMs from command line, in 3 steps, using Ubuntu Cloud Images on KVM.

First step is to clone this repo in your KVM Host:

    you@yourhost$ git clone https://github.com/rafabolivar/kvm-cloudimg-vm ~/test
    you@yourhost$ cd ~/test
    you@yourhost$ chmod u+x *.sh

Then you have to modify the `ubuntu` user password to fit your needs:

    you@yourhost$ vi ~/test/user-data

Find the line `password: <your_password_goes_here>`  and change to your desired password, for instance:
 `password: Password123`

There are other parameters that you can modify, regarding the network in the `~/test/network-config`
and the `~/test/meta-data` files.

Once you're OK with the config, just execute the scripts in order:

    you@yourhost$ ./1-ubuntu-image-get.sh
    you@yourhost$ ./2-generate-cloud-init-isoimg.sh
    you@yourhost$ ./3-create-vm.sh

Your brand new Virtual Machine will be up and running in a matter of seconds, without having to take care of the installation. Enjoy!
