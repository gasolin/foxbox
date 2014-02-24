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

#echo "get repo in host os"
#curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ./repo
#chmod a+x ./repo

sudo apt-get install -y virtualbox nfs-kernel-server nfs-common
echo "start vagrant with ${PWD}/B2G"
B2G_PATH=${PWD}/B2G vagrant up
