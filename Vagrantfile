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

# $bootstrap = <<SCRIPT
#SCRIPT

#
# Vagrant script
#
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
  # config.vm.provision "shell", inline: $bootstrap
  config.vm.provision "shell", path: "scripts/setup_ubuntu_12_04.sh"

  # Use ubuntu 12.04
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Assign static IP to be able to use nfs option (if you have a conflict,
  # change it to something else).
  # Configure as host-only ip
  config.vm.network "private_network", ip: "192.168.50.4"
  # Configure as public DHCP, to make repo sync works
  config.vm.network "public_network"
  # Configure as DHCP with default bridge
  # config.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'

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
    v.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'spreadtrum', '--vendorid', '0x1782']
  end

end
