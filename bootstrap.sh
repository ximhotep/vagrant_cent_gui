#catch up to patches
sudo yum update -y

# add a graphical desktop, make it the default
sudo yum groupinstall -y "GNOME Desktop" "Graphical Administration Tools"
sudo systemctl set-default graphical.target

# for installing Virtual Box Additions
# do this second so Xwindows is there before the additions run
sudo yum install -y bzip2
#sudo mount /dev/sr0 /mnt
#sudo sh /mnt/VBoxLinuxAdditions.run
#sudo umount /dev/sr0 /mnt


sudo yum -y update
sudo yum -y install wget kernel-headers-$(uname -r) kernel-devel gcc*
cd /opt
sudo wget -c http://download.virtualbox.org/virtualbox/5.2.12/VBoxGuestAdditions_5.2.12.iso -O VBoxGuestAdditions_5.2.12.iso

cd /opt
sudo mount VBoxGuestAdditions_5.2.12.iso -o loop /mnt
cd /mnt
sudo sh VBoxLinuxAdditions.run

# at this point, you should be able to login as vagrant and startx
# and have full VirtualBox Additions functionality

# on the next reboot, the system will be running the graphical.target


# uncomment to automate the reboot after provisioning
sudo /sbin/reboot
