FoxBox
=========

FirefoxOS Build Environment in a VM (Virtual Machine).
Powered by vagrant and virtualbox.

## Features

- Edit source code in your host machine with any editor and have the files sync into the guest machine.
- Compile in VM without setup environment and required libraries

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


### Step 3 (TBD):

To test Firefox, you'll need the graphical display of VirtualBox,
so power up the machine, and log in with the account "vagrant", password "vagrant".

    $ startx
    $ cd mozilla-central
    $ obj-x86-64-unknown-linux-gnu/dist/bin/firefox


# Goal

## Short term

- enable developer jump into gaia development without pain
  - get firefox nightly

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
