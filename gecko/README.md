Place holder for gecko source.

Gecko and Gaia are automatically fetched while configure B2G.

Or you can manually [Building against a custom Gecko](https://developer.mozilla.org/en-US/Firefox_OS/Preparing_for_your_first_B2G_build#Building_against_a_custom_Gecko) to here or to other place and specify the `GECKO_PATH` while calling `vagrant` command. ex (in *nux/Mac):

    $ GECKO_PATH=${PWD}/gecko vagrant up
    
Please delete this file first if you want clone gecko to this folder in host OS.
Because git can only clone to an empty folder.
