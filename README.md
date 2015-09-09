FoxBox
===========

Version: 1.0

FoxBox project's goal is to try any approach that make new user can do as less as possible to start the FirefoxOS development. Currently foxbox take about one hour to auto setup (depends on net speed) a Firefox OS (Gaia) build environment in VM.

## Features

- (Relative automaticly) Setup environment and required libraries
- Edit source code in your host machine with any editor.
- Run commands in Virtual box (guest machine)
- Source folder is shared
- Plug USB to flash device directly

## How to Run

Prepare:
Install vagrant 1.5 or above (Some distro like Ubuntu now provides 1.4 via apt-get, please download the `.deb` from the [officail download page](https://www.vagrantup.com/downloads.html) instead.

Virtual Machine is also required, the free option is VirtualBox, downlaod it from the [officail download page](https://www.virtualbox.org/wiki/Downloads).

```
$ git clone https://github.com/gasolin/foxbox.git
$ cd foxbox
$ ./configure.sh
```

[Download](http://github.com/gasolin/foxbox/releases) or Clone http://github.com/gasolin/foxbox.git via `git clone` command to local computer (we call it Host OS). Enter the foxbox folder, the `configure.sh` script will detect the environment, install required library and run `vagrant up` command.

Follow instructions on screen to specify internet connection and the root permission password. Now the environment is settled for you. (the default vagrant box username/password is `vagrant/vagrant`)

Inside of virtualbox, run command:

```
$ gaia_init.sh
$ cd gaia
$ make
```

'gaia_init.sh' script can help you clone gaia source code. Or you could use normal way to git clone [gaia](https://github.com/mozilla-b2g/gaia). Then you should able to compile gaia without any problem.


If you need more support, read [wiki](https://github.com/gasolin/foxbox/wiki) for more instructions.

## Community

* [Issue list](https://github.com/gasolin/foxbox/issues?state=open)

## Credit

Foxbox is based on the [gist](http://gist.github.com/yzen/7723421) by Yura Zenevich (yzen) and is heavily rewriten by Fred Lin (gasolin).

## License

FoxBox follow [MPL](http://www.mozilla.org/MPL/) 2.0 License.
