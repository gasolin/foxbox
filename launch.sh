#
# foxbox reload script
#
# author: fred lin (gasolin@gmail.com)
#
# update foxbox
git pull
echo "███████╗ ██████╗ ██╗  ██╗██████╗  ██████╗ ██╗  ██╗"
echo "██╔════╝██╔═══██╗╚██╗██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝"
echo "█████╗  ██║   ██║ ╚███╔╝ ██████╔╝██║   ██║ ╚███╔╝ "
echo "██╔══╝  ██║   ██║ ██╔██╗ ██╔══██╗██║   ██║ ██╔██╗ "
echo "██║     ╚██████╔╝██╔╝ ██╗██████╔╝╚██████╔╝██╔╝ ██╗"
echo "╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝"
echo "      FirefoxOS Build Environment in a VM         "

#echo "      Reload the script and provisioning again    "
#B2G_PATH=${PWD}/B2G vagrant reload --provision
#GECKO_PATH=${PWD}/gecko vagrant reload --provision
#GAIA_PATH=${PWD}/gaia vagrant reload --provision

#echo "      Launch the script                           "
#B2G_PATH=${PWD}/B2G vagrant up
#GECKO_PATH=${PWD}/gecko vagrant up
GAIA_PATH=${PWD}/gaia vagrant up
