FoxBox
=========

FirefoxOS Build Environment in a VM (Virtual Machine).
Powered by vagrant and virtualbox.

## Features

- Edit source code in your host machine with any editor and have the files sync into the guest machine.
- Compile in VM without setup environment and required libraries
- Can test Firefox Nightly or B2G Desktop in bundled GUI environment

## Prerequisite

You have to download and install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) & [Vagrant](http://www.vagrantup.com/downloads) before you start using foxbox.

## How to Run

Prepare:

[Download](https://github.com/gasolin/foxbox/archive/master.zip) or Clone https://github.com/gasolin/foxbox.git via `git clone` command to local computer (we call it Host OS). Then enter the foxbox folder:

    $ git clone https://github.com/gasolin/foxbox.git
    $ cd foxbox

On linux or mac, run `configure.sh`. The script will download B2G repository to your Host OS and start vagrant to setup VM for you.

On other platform, start the setup process

    $ B2G_PATH=<local path> vagrant up

It will take time to download and setup the environment. Go have a cup of coffee.

(If foxbox is stablized, we'd like to ship a preconfigured box to save your time and bandwidth)

### Step 1: Use your VM

Connect to VM

    $ B2G_PATH=<local path> vagrant up
    $ vagrant ssh

In linux/mac you could use `${PWD}/B2G` instead of real `<local path>`.

Disconnect to VM

    $ exit
    $ vagrant halt


### Step 2: Build FirefoxOS

#### Build whole FirefoxOS (B2G)

    $ cd B2G
    $ ./configure.sh {your device}
    $ ./build.sh

refer to https://developer.mozilla.org/en-US/Firefox_OS/Preparing_for_your_first_B2G_build

Basically the above instruction can build all FirefoxOS for you including gecko and gaia. But you could build gaia or gecko independently to debug specific part of FirefoxOS.

#### Build Gaia

    $ cd gaia
    $ make DEBUG=1

refer to https://developer.mozilla.org/en-US/Firefox_OS/Platform/Gaia/Hacking

#### Build gecko

    $ cd mozilla-central
    $ make -f client.mk build


### Step 3: Test in GUI

To test Firefox, you'll need the graphical display of `VirtualBox`. ssh does not support GUI.
Log in with the account "vagrant", password "vagrant" in VM's console.

Then run the command To start the GUI (powered by [xfce](http://www.xfce.org/)):

    $ ./gui.sh


The `firefox nightly` is located in the top left `Applications Menu > internet > Nightly Web Browser`.

![Imgur](http://i.imgur.com/7nhNUC3.png)

#### GUI Usage Trouble Shooting

If you found [no prompt in Terminal Emulator](http://askubuntu.com/questions/280896/why-do-i-have-no-prompt-in-terminal-on-xfce-in-ubuntu-12-04). The reason is a color setting found in Edit->Profile Preferences where it said "Colors" and defaulted to "Use colors from system theme". Uncheck it and everything runs fine.

![Imgur](http://i.imgur.com/iQyztVf.png)

### To delete the VM

You can run following command to delete the VM anytime.

    $ B2G_PATH=<local path> vagrant destroy


# Goal

## Short term

- enable developer jump into gaia development without pain

## Mid term

- Utils
  - backup/restore tool by dietrich
  - easy switch between versions
- ship a preconfigured box with b2g source
- l10n and keyboard layout settings
- customization

## Long term

- able to compile all Firefox projects (for those can be done in linux)
  - Firefox Desktop
  - Firefox for Android

## Credit

Foxbox is based on https://gist.github.com/yzen/7723421 and https://github.com/jdm/foxinabox
