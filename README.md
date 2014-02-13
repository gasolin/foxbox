FoxBox
===========

Version: 0.5

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

### In Ubuntu 12.04

If you have a device with Ubuntu version 12.04 (Long term support),
you could run auto-setup script `setup_ubuntu_12_04.sh` within the script folder directly without VM.

### In VM
On linux or mac, run `configure.sh`. The script will download basic ubuntu 12.04 image to your Host OS and start vagrant to setup the VM for you.

On other platform, start the setup process

    $ B2G_PATH=<local path> vagrant up

You have to enter password in Linux/Mac to proceed share the NFS folders.

It will take time to download and setup the environment. Go have a cup of coffee.

(If foxbox is stablized, we'd like to ship a preconfigured box to save your time and bandwidth)

### Step 1: Use your VM

Connect to VM

    $ B2G_PATH=<local path> vagrant up

In linux/mac you could use `${PWD}/B2G` instead of real `<local path>`.

Log in with `the account 'vagrant', password 'vagrant'` in VM's console.

Disconnect to VM

    $ exit
    $ vagrant halt

Though the VM already popup a separate window. You can still remote access to VM via command:

    $ vagrant ssh

### Step 2: Build FirefoxOS

#### Build whole FirefoxOS (B2G)

Make sure you've synced local `B2G` folder to VM via command

    $ B2G_PATH=<local path> vagrant up

Then FoxBox provide an init script to help you fetch B2G source:

    $ ./B2G_init.sh

It will clone B2G source to `B2G` folder.
Refer to https://developer.mozilla.org/en-US/Firefox_OS/Preparing_for_your_first_B2G_build
Go to B2G folder and type

    $ cd B2G
    $ ./configure.sh emulator
    $ ./build.sh

The above instruction takes several hours.
Once the compile process is done, go to step 3 to launch emulator in GUI.

Basically the above instruction can build all FirefoxOS for you including gecko and gaia. But you could build gaia or gecko independently to debug specific part of FirefoxOS.

All B2G related helper scripts are prefixed by `B2G_`.

#### Build Gaia only

Make sure you've synced local `gaia` folder to VM via command

    $ GAIA_PATH=<local path> vagrant up

Then FoxBox provide an init script to help you fetch gaia source:

    $ ./gaia_init.sh

It will clone gaia source to `gaia` folder.
Then go to gaia folder and type

    $ cd gaia
    $ make DEBUG=1

refer to https://developer.mozilla.org/en-US/Firefox_OS/Platform/Gaia/Hacking

All gaia related helper scripts are prefixed by `gaia_`.

#### Build Gecko only

Make sure you've synced local `gecko` folder to VM via command

    $ GECKO_PATH=<local path> vagrant up

Then FoxBox provide an init script to help you fetch gecko source:

    $ ./gecko_init.sh

It will install mercurial, clone gecko source  to `gecko` folder, and put the b2g client build config in `gecko/.mozconfig`.

Then go to gecko folder and type

    $ cd gecko
    $ ./mach build

If you saw 'please rerun mach' message, run the command again:

    $ ./mach build

All gecko related helper scripts are prefixed by `gecko_`.

You can refer to [the full build guide](https://developer.mozilla.org/en-US/Firefox_OS/Using_the_B2G_desktop_client)

### Step 3: Test in GUI

To test Firefox OS, you'll need the graphical display of VM. ssh does not support GUI.
Run the command To start the GUI (powered by [xfce](http://www.xfce.org/)):

    $ ./gui.sh


The `firefox nightly` is located in the top left `Applications Menu > internet > Nightly Web Browser`.

![Imgur](http://i.imgur.com/7nhNUC3.png)

To start emulator, press `Application Menu > Terminal Emulator` from left top and run command:

    $ B2G/run-emulator.sh

![Imgur](http://i.imgur.com/NRuv7DK.png)


## Trouble Shooting

### GUI Usage

If you found [no prompt in Terminal Emulator](http://askubuntu.com/questions/280896/why-do-i-have-no-prompt-in-terminal-on-xfce-in-ubuntu-12-04). The reason is a color setting found in Edit->Profile Preferences where it said "Colors" and defaulted to "Use colors from system theme". Uncheck it and everything runs fine.

![Imgur](http://i.imgur.com/iQyztVf.png)

### Delete the VM

You can run following command to delete the VM anytime.

    $ B2G_PATH=<local path> vagrant destroy

The shared folders will be detached and the VM will be deleted. The basic vagrant box and the fetched source code will still exist so you don't have to fetch again.

### Rerun the configure process

If there's any issue that make the setup process fail. You can rerun the configure process by following command:

    $ B2G_PATH=${PWD}/B2G vagrant reload --provision

### Repo sync failed

According to [StackOverflow](http://stackoverflow.com/questions/16085722/when-running-repo-sync-error-exited-sync-due-to-fetch-errors), invoking following command did the trick:

    $ repo sync -f -j10

As it seems `-f` or `--force-broken` flag allows it to recover from network error and more important recover on broken/missing objects.

# Goal

## Short term

- enable developer jump into B2G development without pain
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

Foxbox is based on the [gist](https://gist.github.com/yzen/7723421) by Yura Zenevich.

## License

FoxBox follow [MPL](http://www.mozilla.org/MPL/) 2.0 License.
