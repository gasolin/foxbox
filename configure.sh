# get repo
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ./repo
chmod a+x ./repo

# get B2G
mkdir B2G
cd B2G
./repo init -u https://github.com/mozilla-b2g/B2G.git
./repo sync

# start vagrant
B2G_PATH=${PWD}/B2G vagrant up
