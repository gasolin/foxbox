#
# foxbox auto setup script
#
# author: fred lin (gasolin@gmail.com)
#
echo "███████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗  ██╗"
echo "██╔════╝██╔═══██╗╚██╗██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝"
echo "█████╗  ██║   ██║ ╚███╔╝ ██████╔╝██║   ██║ ╚███╔╝ "
echo "██╔══╝  ██║   ██║ ██╔██╗ ██╔══██╗██║   ██║ ██╔██╗ "
echo "██║     ╚██████╔╝██╔╝ ██╗██████╔╝╚██████╔╝██╔╝ ██╗"
echo "╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
echo "      FirefoxOS Build Environment in a VM         "

echo "get repo"
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ./repo
chmod a+x ./repo

echo "get B2G"
mkdir B2G
cd B2G
../repo init -u https://github.com/mozilla-b2g/B2G.git
../repo sync
cd ..

echo "start vagrant with ${PWD}/B2G"
B2G_PATH=${PWD}/B2G vagrant up
