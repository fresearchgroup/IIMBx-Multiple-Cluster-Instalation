#install nfs client

sudo -S <<< "123456" apt-get update
sudo -S <<< "123456" apt-get install nfs-common

#and mount the directory
sudo -S <<< "123456" mount $1:/var/www/html/iimbx/sites/default/files /var/www/iimbx/sites/default/files