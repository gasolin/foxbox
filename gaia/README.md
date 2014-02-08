Place holder for gaia source.

Gecko and Gaia are automatically fetched while configure B2G.

Or you can manually clone gaia from https://github.com/mozilla-b2g/gaia.git to here or to other place and specify the `GAIA_PATH` while calling `vagrant` command. ex (in *nux/Mac):

    $ GAIA_PATH=${PWD}/gaia vagrant up

Please delete this file first if you want clone gaia to this folder in host OS.
Because git can only clone to an empty folder.
