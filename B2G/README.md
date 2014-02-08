Place holder for B2G source.

Let `foxbox` clone B2G for you.

Or you can manually clone B2G from https://github.com/mozilla-b2g/B2G.git to other place and specify the `B2G_PATH` while calling `vagrant` command. ex (in *nux/Mac):

    $ B2G_PATH=${PWD}/B2G vagrant up

Please delete this file first if you want clone B2G to this folder in host OS.
Because git can only clone to an empty folder.
