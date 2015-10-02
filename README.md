FoxBox
===========

Version: 1.2

 With foxbox, new contributor just take about one hour to auto setup (depends on network download speed) a Firefox OS (Gaia) build environment in VM. You will got a ubuntu VM and can be accessed via browser console.

![Imgur](http://i.imgur.com/F3dlEgl.png?1)

## Features

- Work on Windows, Mac OSX, linux
- (Relative automaticly) Setup environment and required libraries
- Edit source code in your host machine with any editor.
- Run commands via web console
- Source folder is shared with your host machine
- Plug USB to debug or flash device

## How to Run

For [Windows user, check here for through instructions](https://github.com/gasolin/foxbox/wiki/RunOnWindows).

### Prepare:

Install vagrant 1.5 or above (Some distro like Ubuntu now provides 1.4 via apt-get, please download the `.deb` from the [officail download page](https://www.vagrantup.com/downloads.html) instead.

Virtual Machine is also required, the free option is VirtualBox, downlaod it from the [officail download page](https://www.virtualbox.org/wiki/Downloads).

Then [Download](http://github.com/gasolin/foxbox/releases) or Clone http://github.com/gasolin/foxbox.git via `git clone` command to local computer (we call it Host OS).

### Install

Enter the foxbox folder, the `configure.sh` script will detect the environment, install required library and run `vagrant up` command.

```
$ git clone https://github.com/gasolin/foxbox.git
$ cd foxbox
$ ./configure.sh
```

Follow instructions on screen to specify internet connection and the root permission password. Now the environment is settled for you. (the default vagrant box username/password is `vagrant/vagrant`)

Open your browser with `127.0.0.1:9000`, the magic happens!

Inside of guest machine or web console, run command:

```
$ gaia_init.sh
$ cd gaia
$ make
```

'gaia_init.sh' script can help you clone gaia source code. Or you could use normal way to git clone [gaia](https://github.com/mozilla-b2g/gaia). Then you should able to compile gaia without any problem.


If you need more support, read [wiki](https://github.com/gasolin/foxbox/wiki) for more instructions.

To learn more about Firefox OS development, check [Hacking Gaia](https://developer.mozilla.org/en-US/Firefox_OS/Developing_Gaia) on MDN as an online reference, or check the ebook [Gaia from above](https://leanpub.com/gaiafromabove) (co-authored by foxbox creator).

## Community

FoxBox project's goal is to try any approach that make new user can do as less as possible to start the FirefoxOS development.

Welcome to update instructions or promote foxbox to other contributors.

* [Issue list](https://github.com/gasolin/foxbox/issues?state=open)

## Credit

Foxbox is originally based on the [gist](http://gist.github.com/yzen/7723421) by Yura Zenevich (yzen) and is heavily rewriten by Fred Lin (gasolin).

## License

FoxBox follow [MPL](http://www.mozilla.org/MPL/) 2.0 License.
