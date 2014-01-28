foxbox
=========

FirefoxOS Build Environment in a VM.
Powered by vagrant and virtualbox.


## Prerequisite

You have to download and install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) & [Vagrant](http://www.vagrantup.com/downloads) before you start using foxbox.

## How to Run

Prepare. Clone https://github.com/gasolin/foxbox.git via `git clone` command to local computer (we call it Host OS):

  $ git clone https://github.com/gasolin/foxbox.git

Enter the foxbox folder and start the setup process

  $ cd foxbox
  $ vagrant up

It will take time to download and setup the environment. Go have a cup of coffee.

(If foxbox is stablized, we'd like to ship a preconfigured box to save your time and bandwidth)

Step 1: Use your VM

  $ vagrant ssh

Go Out

  $ exit
  $ vagrant halt


Step 2: Build gecko

  $ cd mozilla-central
  $ make -f client.mk build

Build Gaia

  $ cd gaia
  $ make DEBUG=1

Step 3:

To test Firefox, you'll need the graphical display of VirtualBox,
so power up the machine, and log in with the account "vagrant", password "vagrant".

  $ startx
  $ cd mozilla-central
  $ obj-x86-64-unknown-linux-gnu/dist/bin/firefox


# Goal

## Short term

- share source with NFS
- enable developer jump into gaia development without pain
  - get source
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
