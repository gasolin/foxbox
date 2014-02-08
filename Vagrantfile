# -*- mode: ruby -*-
# vi: set ft=ruby :

# To use this script and prepare your build environment, run the following
# command in the same directory as the Vagrantfile.
# B2G_PATH={path to your B2G directory} vagrant up

VAGRANTFILE_API_VERSION = "2"

# This script will be run on the first start and it will set up the build
# environment.
# All you need to do afterwards is:
# * vagrant ssh
# * Unplug/Plug the phone; run `adb devices` to make sure that the phone is
# listed.
# * cd B2G
# * ./configure.sh {your device}
# * ./build.sh

$bootstrap = <<SCRIPT

echo "███████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗  ██╗"
echo "██╔════╝██╔═══██╗╚██╗██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝"
echo "█████╗  ██║   ██║ ╚███╔╝ ██████╔╝██║   ██║ ╚███╔╝ "
echo "██╔══╝  ██║   ██║ ██╔██╗ ██╔══██╗██║   ██║ ██╔██╗ "
echo "██║     ╚██████╔╝██╔╝ ██╗██████╔╝╚██████╔╝██╔╝ ██╗"
echo "╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
echo "       Installing all build prerequisites         "
apt-get update
# add firefox nightly repo
apt-get install python-software-properties -y
add-apt-repository ppa:ubuntu-mozilla-daily/ppa -y
apt-get update

echo "███████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗  ██╗"
echo "██╔════╝██╔═══██╗╚██╗██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝"
echo "█████╗  ██║   ██║ ╚███╔╝ ██████╔╝██║   ██║ ╚███╔╝ "
echo "██╔══╝  ██║   ██║ ██╔██╗ ██╔══██╗██║   ██║ ██╔██╗ "
echo "██║     ╚██████╔╝██╔╝ ██╗██████╔╝╚██████╔╝██╔╝ ██╗"
echo "╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
echo "             Install git and repo                 "
apt-get install -y git-core
if [ -f /bin/repo ]
then
    curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /bin/repo
    chmod a+x /bin/repo
fi

echo "        Install prerequisite libraries            "
add-apt-repository -y ppa:nilarimogard/webupd8
apt-get update
apt-get install -y autoconf2.13 bison bzip2 ccache curl flex gawk gcc g++ g++-multilib git ia32-libs lib32ncurses5-dev lib32z1-dev libgl1-mesa-dev libx11-dev libasound2 make zip android-tools-adb

# Set ccache max size to 3GB
ccache --max-size 3GB

echo "███████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗  ██╗"
echo "██╔════╝██╔═══██╗╚██╗██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝"
echo "█████╗  ██║   ██║ ╚███╔╝ ██████╔╝██║   ██║ ╚███╔╝ "
echo "██╔══╝  ██║   ██║ ██╔██╗ ██╔══██╗██║   ██║ ██╔██╗ "
echo "██║     ╚██████╔╝██╔╝ ██╗██████╔╝╚██████╔╝██╔╝ ██╗"
echo "╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
echo "  Set the permission filters to the right devices "

# Source http://developer.android.com/tools/device.html
if [ -f /etc/udev/rules.d/51-android.rules ]
then
    rm /etc/udev/rules.d/51-android.rules
fi

cat <<EOF >> /etc/udev/rules.d/51-android.rules
#Acer
SUBSYSTEM=="usb", ATTR{idVendor}=="0502", MODE="0666", GROUP="vagrant"
#ASUS
SUBSYSTEM=="usb", ATTR{idVendor}=="0b05", MODE="0666", GROUP="vagrant"
#Dell
SUBSYSTEM=="usb", ATTR{idVendor}=="413c", MODE="0666", GROUP="vagrant"
#Foxconn
SUBSYSTEM=="usb", ATTR{idVendor}=="0489", MODE="0666", GROUP="vagrant"
#Garmin-Asus
SUBSYSTEM=="usb", ATTR{idVendor}=="091e", MODE="0666", GROUP="vagrant"
#Google
SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="vagrant"
#HTC
SUBSYSTEM=="usb", ATTR{idVendor}=="0bb4", MODE="0666", GROUP="vagrant"
#Huawei
SUBSYSTEM=="usb", ATTR{idVendor}=="12d1", MODE="0666", GROUP="vagrant"
#K-Touch
SUBSYSTEM=="usb", ATTR{idVendor}=="24e3", MODE="0666", GROUP="vagrant"
#KT Tech
SUBSYSTEM=="usb", ATTR{idVendor}=="2116", MODE="0666", GROUP="vagrant"
#Kyocera
SUBSYSTEM=="usb", ATTR{idVendor}=="0482", MODE="0666", GROUP="vagrant"
#Lenevo
SUBSYSTEM=="usb", ATTR{idVendor}=="17EF", MODE="0666", GROUP="vagrant"
#LG
SUBSYSTEM=="usb", ATTR{idVendor}=="1004", MODE="0666", GROUP="vagrant"
#Motorola
SUBSYSTEM=="usb", ATTR{idVendor}=="22b8", MODE="0666", GROUP="vagrant"
#NEC
SUBSYSTEM=="usb", ATTR{idVendor}=="0409", MODE="0666", GROUP="vagrant"
#Nvidia
SUBSYSTEM=="usb", ATTR{idVendor}=="0955", MODE="0666", GROUP="vagrant"
#OTGV
SUBSYSTEM=="usb", ATTR{idVendor}=="2257", MODE="0666", GROUP="vagrant"
#Pantech
SUBSYSTEM=="usb", ATTR{idVendor}=="10A9", MODE="0666", GROUP="vagrant"
#Philips
SUBSYSTEM=="usb", ATTR{idVendor}=="10A9", MODE="0666", GROUP="vagrant"
#PMC-Sierra
SUBSYSTEM=="usb", ATTR{idVendor}=="04da", MODE="0666", GROUP="vagrant"
#Qualcomm
SUBSYSTEM=="usb", ATTR{idVendor}=="05c6", MODE="0666", GROUP="vagrant"
#SK Telesys
SUBSYSTEM=="usb", ATTR{idVendor}=="1f53", MODE="0666", GROUP="vagrant"
#Samsung
SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666", GROUP="vagrant"
#Sharp
SUBSYSTEM=="usb", ATTR{idVendor}=="04dd", MODE="0666", GROUP="vagrant"
#Sony Ericsson
SUBSYSTEM=="usb", ATTR{idVendor}=="0fce", MODE="0666", GROUP="vagrant"
#Toshiba
SUBSYSTEM=="usb", ATTR{idVendor}=="0930", MODE="0666", GROUP="vagrant"
#ZTE
SUBSYSTEM=="usb", ATTR{idVendor}=="19d2", MODE="0666", GROUP="vagrant"
EOF
chmod a+r /etc/udev/rules.d/51-android.rules
service udev restart

echo "███████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗  ██╗"
echo "██╔════╝██╔═══██╗╚██╗██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝"
echo "█████╗  ██║   ██║ ╚███╔╝ ██████╔╝██║   ██║ ╚███╔╝ "
echo "██╔══╝  ██║   ██║ ██╔██╗ ██╔══██╗██║   ██║ ██╔██╗ "
echo "██║     ╚██████╔╝██╔╝ ██╗██████╔╝╚██████╔╝██╔╝ ██╗"
echo "╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
echo "                Install Java                      "
# Not sure if it's necessary but the build complaints about the Java version.
apt-get purge -y openjdk*
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get install -y oracle-java7-installer

echo "███████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗  ██╗"
echo "██╔════╝██╔═══██╗╚██╗██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝"
echo "█████╗  ██║   ██║ ╚███╔╝ ██████╔╝██║   ██║ ╚███╔╝ "
echo "██╔══╝  ██║   ██║ ██╔██╗ ██╔══██╗██║   ██║ ██╔██╗ "
echo "██║     ╚██████╔╝██╔╝ ██╗██████╔╝╚██████╔╝██╔╝ ██╗"
echo "╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
echo "                Enable GUI                        "
#apt-get install -y x-window-system gnome-core
# xorg xfce4 menu
apt-get install -y x-window-system xfce4
# get firefox nightly
apt-get install -y firefox-trunk

# clean all unrequired packages
apt-get autoremove -y

echo "███████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗  ██╗"
echo "██╔════╝██╔═══██╗╚██╗██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝"
echo "█████╗  ██║   ██║ ╚███╔╝ ██████╔╝██║   ██║ ╚███╔╝ "
echo "██╔══╝  ██║   ██║ ██╔██╗ ██╔══██╗██║   ██║ ██╔██╗ "
echo "██║     ╚██████╔╝██╔╝ ██╗██████╔╝╚██████╔╝██╔╝ ██╗"
echo "╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
echo "              Create helper scripts               "

echo "   Create 'gui.sh' to start GUI                   "
echo "sudo startxfce4&" > gui.sh
chmod a+x gui.sh

echo "   Create 'init_B2G.sh to fetch B2G repository    "
echo "#!/bin/bash
if [ -d B2G/.git ]
then
    echo "The git directory exists."
    echo "update B2G repository"
    cd B2G
    git pull
    cd ..
else
    rm B2G/README.md
    # purge mac temp
    rm B2G/.DS_Store
    echo "clone B2G repository"
    git clone https://github.com/mozilla-b2g/B2G.git B2G
fi" > init_B2G.sh
chmod a+x init_B2G.sh

echo "   Create 'init_gaia.sh' to fetch gaia source    "
echo "#!/bin/bash
if [ -d gaia/.git ]
then
    echo "The git directory exists."
    echo "update gaia repository"
    cd gaia
    gaia pull
    cd ..
else
    rm gaia/README.md
    # purge mac temp
    rm gaia/.DS_Store
    echo "clone gaia repository"
    git clone https://github.com/mozilla-b2g/gaia.git gaia
fi" > init_gaia.sh
chmod a+x init_gaia.sh


# Vagrant script
SCRIPT

# Detect if B2G_PATH is exist
if (defined?(ENV['B2G_PATH'])).nil?
  B2G_PATH = nil
else
  B2G_PATH = ENV['B2G_PATH']
end

# Detect if GECKO_PATH is exist
if (defined?(ENV['GECKO_PATH'])).nil?
  GECKO_PATH = nil
else
  GECKO_PATH = ENV['GECKO_PATH']
end

# Detect if GAIA_PATH is exist
if (defined?(ENV['GAIA_PATH'])).nil?
  GAIA_PATH = nil
else
  GAIA_PATH = ENV['GAIA_PATH']
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"

  # Run the bootsrap script on start.
  config.vm.provision "shell", inline: $bootstrap

  # Use ubuntu 12.04
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Assign static IP to be able to use nfs option (if you have a conflict,
  # change it to something else).
  config.vm.network "private_network", ip: "192.168.50.4"

  # Use *_PATH environment variable to sync with vm's /home/vagrant/*
  # directory.
  if (B2G_PATH != nil)
    config.vm.synced_folder B2G_PATH, "/home/vagrant/B2G", nfs: true
  end
  if (GECKO_PATH != nil)
    config.vm.synced_folder GECKO_PATH, "/home/vagrant/gecko", nfs: true
  end
  if (GAIA_PATH != nil)
    config.vm.synced_folder GAIA_PATH, "/home/vagrant/gaia", nfs: true
  end

  config.vm.provider "virtualbox" do |v|
    # Enable GUI
    v.gui = true
    # Enable 4GB of RAM
    v.customize ["modifyvm", :id, "--memory", "4096"]
    # Enable usb
    v.customize ["modifyvm", :id, "--usb", "on"]
    # Filter the following devices: inari, keon, android
    v.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'android', '--vendorid', '0x18d1']
    v.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'foxconn', '--vendorid', '0x0489']
    v.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'hwawei', '--vendorid', '0x12d1']
    v.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'lg', '--vendorid', '0x1004']
    v.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'qualcomm', '--vendorid', '0x05c6']
    v.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'zte', '--vendorid', '0x19d2']
  end

end
